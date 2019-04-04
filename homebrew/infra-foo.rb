# install latest
# (brew ls --versions infra-foo && brew uninstall --force infra-foo >/dev/null 2>&1); brew install --build-from-source --HEAD ./infra-foo.rb

# install stable
# (brew ls --versions infra-foo && brew uninstall --force infra-foo >/dev/null 2>&1); brew install --build-from-source ./infra-foo.rb

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
      next if grp.empty?
      ref_hash, tag_str = grp[0]
      ver_array = tag_str.scan(/^(\d+).(\d+).(\d+)$/)
      if ver_array.empty?
        stable_ref_hash = ref_hash if tag_str == 'stable'
      else
        versions.push [ver_array[0].map{ |x| x.to_i }, tag_str]
        version_by_ref_hash[ref_hash] = tag_str
      end
    end
    raise 'missing stable tag!' if stable_ref_hash.empty?
    versions = versions.sort.map{| pair| pair[1] }
    @latest_version_tag = versions[-1]
    raise 'stable tag does not point to a version!' if version_by_ref_hash[stable_ref_hash].nil?
    @stable_version_tag = version_by_ref_hash[stable_ref_hash]
  end

  def latest
    @latest_version_tag
  end

  def stable
    @stable_version_tag
  end
end

class InfraFoo < Formula

  @@GIT_REPOSITORY = 'git@github.com:Canva/infra-tools.git'
  @@GIT_RELEASE_BRANCH = 'master'
  @@GITHUB_HOMEPAGE = 'https://github.com/Canva/infra-tools'
  @@PROJECT_DESCRIPTION =<<~TEXT
      CA 
    infrastructure 
      foobar
  TEXT

  desc(@@PROJECT_DESCRIPTION)
  homepage(@@GITHUB_HOMEPAGE)
  
  url(
    @@GIT_REPOSITORY, 
    :using => :git, 
    :branch => @@GIT_RELEASE_BRANCH, 
    :tag => GitRemoteTagsGetter.new(repo: @@GIT_REPOSITORY).stable
  )

  head(
    @@GIT_REPOSITORY, 
    :using => :git, 
    :branch => @@GIT_RELEASE_BRANCH, 
    :tag => GitRemoteTagsGetter.new(repo: @@GIT_REPOSITORY).latest
  )

  def install
    prefix.install Dir['*']
    (prefix/'VERSION').write <<~TEXT
    #{version}
    TEXT
    (bin/'infrafoo').write <<~BASH
        #!/usr/bin/env bash
        if [[ "$1" == "--version" || "$1" == "-v" ]]; then
          echo '#{version}' && exit 0
        fi
        echo "YOU SHALL NOT PASS!"
    BASH
  end
end
