require 'base64'
require 'mcrypt'

f = open('encrypted_data', 'rb')
encrypted_data = f.read

key = Base64.decode64("6vYJkO5beHNlwOm+aMqUTTzSpRw9jR3faHqu0wVoAG0=")
iv = Base64.decode64('EbuuKuVF4+DzDbWsvQi/ZA==')

crypto = Mcrypt.new('rijndael-128', :cbc, key, iv)
decrypted_data = crypto.decrypt(encrypted_data)

File.open('ruby.jpg', 'w') {|f| f.write(decrypted_data) }