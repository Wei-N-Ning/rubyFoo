$description = <<TEXT
Canva Infrastructure Utilities.

TEXT

$version_manager_src = <<"SOURCECODE"
#!/usr/bin/env bash

HELP_MESSAGE=$(cat <<TEXT

infra-tools version manager

commands:

update
  - update to the next stable or HEAD (latest & experimental) version

stable
latest 
  - switch between stable and HEAD (latest & experimental) version streams
  - after switching, it automatically fetches the next version

remove
  - delete local installation

info
  - print version information

help
  - print this message
TEXT
)
THISDIR=$(perl -MCwd=abs_path -E "say abs_path '$(dirname "$0")'")
VERSION_FILE="${THISDIR}/VERSION"

version_filename() {
  echo "${VERSION_FILE}"
}

print_version_description() {
  if [[ -f "${VERSION_FILE}" ]]; then
    cat "${VERSION_FILE}"
  fi
}

print_version_stream() {
  local version_description
  version_description=$(print_version_description)
  if [[ -n "${version_description}" ]]; then
    perl -wnl -E 'say $1 if /,\\s+(\\w+)\\b/' <<<"${version_description}"
  fi
}

cannot_print_version_stream_error() {
    echo "Can not find version description. Please reinstall your local installation:"
    echo ""
    echo "brew uninstall infra-tools"
    echo "brew update"
    echo "brew install infra-tools"
    echo ""
    echo "Print the version description:"
    echo "infra -v"
    exit 1
}

action_update() {
  local version_stream
  version_stream="${1}"
  if [[ "${version_stream}" == "latest" ]]; then
    brew update >/dev/null 2>&1
    brew upgrade infra-tools --fetch-HEAD 
  else
    brew update >/dev/null 2>&1
    brew upgrade infra-tools
  fi  
  exit $?
}

action_stable() {
  local version_stream
  version_stream="${1}"
  if [[ "${version_stream}" == "stable" ]]; then
    echo "Version stream is already stable."
  else 
    echo "switch to stable version stream"
    ( brew uninstall infra-tools >/dev/null 2>&1;
    brew update >/dev/null 2>&1;
    brew install infra-tools 2>/dev/null; )
  fi
  exit $?
}

action_latest() {
  local version_stream
  version_stream="${1}"
  if [[ "${version_stream}" == "latest" ]]; then
    echo "Version stream is already HEAD (latest & experimental)."
  else 
    echo "switch to HEAD (latest & experimental) version stream"
    ( brew uninstall infra-tools >/dev/null 2>&1;
    brew update >/dev/null 2>&1;
    brew install infra-tools --HEAD 2>/dev/null; )
  fi
  exit $?
}

action_remove() {
  brew uninstall infra-tools 2>/dev/null
  exit $?
}

action_info() {
  print_version_description
  exit $?
}

action_help() {
  echo "${HELP_MESSAGE}"
  echo ""
  exit $?
}

main() {
  local action
  action="${1:-}"
  local version_stream
  version_stream=$(print_version_stream)
  if [[ -z "${version_stream}" ]]; then
    cannot_print_version_stream_error
  fi
  case "${action}" in
    update)
      action_update "${version_stream}"
    ;; 
    stable)
      action_stable "${version_stream}"
    ;;
    latest)
      action_latest "${version_stream}"
    ;;
    remove)
      action_remove
    ;;
    info)
      action_info
    ;;
    help)
      action_help
    ;;
  esac
  echo "unknown action: ${action}"
  action_help
}

main "$@"

SOURCECODE

$github_homepage = 'https://github.com/Canva/infra-tools'
$github_repository = 'git@github.com:Canva/infra-tools.git'
$release_branch_name = 'master'
$release_tag_name = 'stable'

# search for version tag from release tag
class GitRemoteTagsGetter
  def initialize(repo:)
    @repo = repo
    _init
  end

  def _init
    output = `git ls-remote --tags #{@repo}`
    raise 'fail to retrieve all tags' if $?.exitstatus != 0
    versions = []
    version_by_ref_hash = {}
    stable_ref_hash = ''
    output.each_line do |line|
      grp = line.scan(/^([a-z0-9]+)\s+refs\/tags\/(.+)\^\{\}$/)
      if grp.empty?
        next
      end
      ref_hash, tag_str = grp[0]
      ver_array = tag_str.scan(/^(\d+).(\d+).(\d+)$/)
      if ver_array.empty?
        stable_ref_hash = ref_hash if tag_str == 'stable'
      else
        versions.push [ver_array[0].map{ |x| x.to_i }, tag_str]
        version_by_ref_hash[ref_hash] = tag_str
      end
    end
    if stable_ref_hash.empty?
      raise 'missing stable tag!'
    end
    versions = versions.sort.map{| pair| pair[1] }
    @latest_version_tag = versions[-1]
    if version_by_ref_hash[stable_ref_hash].nil?
      raise 'stable tag does not point to a version!'
    end
    @stable_version_tag = version_by_ref_hash[stable_ref_hash]
  end

  def latest
    @latest_version_tag
  end

  def stable
    @stable_version_tag
  end
end

# brew reinstall infra-tools
class InfraTools < Formula
  @@repogetter = GitRemoteTagsGetter.new(repo: $github_repository)
  @@version_manager_src = $release_tag_name

  desc($description)
  homepage($github_homepage)

  url(
    $github_repository,
    :using => :git,
    :branch => $release_branch_name,
    :tag => @@repogetter.stable
  )

  head(
    $github_repository,
    :using => :git,
    :branch => $release_branch_name,
    :tag => @@repogetter.latest
  )

  bottle :unneeded

  depends_on "terminal-notifier"
  depends_on "awscli"

  def install
    if ("#{version}" =~ %r{^HEAD})
      version_desc = "#{@@repogetter.latest}, latest (#{version})"
    else
      version_desc = "#{@@repogetter.stable}, stable"
    end
    libexec.install Dir["bin/*"]

    # version description
    (prefix/"VERSION").write <<~TEXT
    #{version_desc}
    TEXT
    
    # version manager
    (prefix/"version_manager.sh").write($version_manager_src)

    # entry point
    (bin/"infra").write <<~BASH
      #!/usr/bin/env bash
      if [[ "$1" == "-v" || "$1" == "--version" ]]; then
        cat "#{prefix}/VERSION"
        exit 0
      fi
      if [[ "$1" == "tools" ]]; then
        shift
        /usr/bin/env bash "#{prefix}/version_manager.sh" "$@"
        exit $?
      fi
      exec "#{libexec}/infra.sh" "$@"
    BASH
  end

  test do
    system bin/"infra -v"
    system bin/"infra aws-token --help"
    system bin/"infra --help"
  end
end
