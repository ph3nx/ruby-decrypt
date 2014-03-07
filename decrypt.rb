
require 'base64'
require 'openssl'

f = open('encrypted_data', 'r')
encrypted_data = f.read

key = Base64.decode64("6vYJkO5beHNlwOm+aMqUTTzSpRw9jR3faHqu0wVoAG0=")
iv = Base64.decode64('EbuuKuVF4+DzDbWsvQi/ZA==')


d = OpenSSL::Cipher::AES128.new :CBC
d.decrypt
d.padding = 0
d.key = key
d.iv = iv
decrypted_data = d.update(encrypted_data) << d.final

File.open('ruby.jpg', 'w') {|f| f.write(decrypted_data) }