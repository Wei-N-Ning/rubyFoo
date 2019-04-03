require 'OpenSSL'

# example taken from
# https://docs.ruby-lang.org/en/2.4.0/OpenSSL/Cipher.html

$data = "Very, very confidential data"

def do_encryption(plaintext:)
  cipher = OpenSSL::Cipher::AES.new(128, :CBC)
  cipher.encrypt
  key = cipher.random_key
  iv = cipher.random_iv
  encrypted = cipher.update(plaintext) + cipher.final
  [encrypted, key, iv]
end

def do_decryption(enctext:, key:, iv:)
  decipher = OpenSSL::Cipher::AES.new(128, :CBC)
  decipher.decrypt
  decipher.key = key
  decipher.iv = iv
  plaintext = decipher.update(enctext) + decipher.final
  plaintext
end

def roundtrip_fixed()
  # convert byte array to string
  # https://stackoverflow.com/questions/960728/ruby-create-a-string-from-bytes
  enc = [126, 53, 111, 188, 14, 174, 226, 7, 41, 204, 12, 3, 200, 176, 102, 53, 224, 32, 230, 37, 16, 245, 158, 233, 5, 83, 107, 189, 201, 72, 144, 126].pack('c*')
  key = [236, 15, 170, 236, 121, 205, 38, 252, 74, 62, 219, 238, 94, 72, 79, 249].pack('c*')
  iv = [36, 170, 210, 202, 59, 41, 147, 42, 210, 31, 41, 73, 175, 109, 71, 105].pack('c*')
  plain = do_decryption(enctext: enc, key: key, iv: iv)
  puts $data == plain
  p plain
end

def roundtrip
  enc, key, iv = do_encryption(plaintext: $data)
  # convert string to byte array
  # https://stackoverflow.com/questions/4103895/how-to-convert-string-to-bytes-in-ruby
  p enc.bytes
  p key.bytes
  p iv.bytes
  plain = do_decryption(enctext: enc, key: key, iv: iv)
  puts $data == plain
end

roundtrip
roundtrip_fixed
