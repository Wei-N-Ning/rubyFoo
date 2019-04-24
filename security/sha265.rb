#!/usr/bin/env ruby

require 'digest'

def demo_sha256
  text = 'there is a cow'
  puts Digest::SHA256::hexdigest(text)  # the most useful
  puts Digest::SHA256::base64digest(text)
  puts Digest::SHA256::digest(text).dump

end

def demo_incremental_hash
  text = 'there is a cow'
  secret = Digest::SHA256.new
  # update allows the hash to be built incrementall, perhaps
  # because the data is coming from a streaming source
  text.each_char { |c| secret.update(c) }

  # showing the same result as the one-call version
  puts secret
  puts Digest::SHA256::hexdigest(text) 
end

demo_sha256
demo_incremental_hash

