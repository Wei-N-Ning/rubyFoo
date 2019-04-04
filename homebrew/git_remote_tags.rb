#!/usr/bin/env ruby

# retrieve tags from remote git repo
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
      # 1dbdf2b3d73e8bd2d05db184f435c4c04003fc71	refs/tags/3.9.8
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

def main
  getter = GitRemoteTagsGetter.new(
    repo: 'git@github.com:Canva/infra-tools.git'
  )
  p getter.latest
  p getter.stable
end

main
