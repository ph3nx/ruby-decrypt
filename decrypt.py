
import base64
import mcrypt

f = open('encrypted_data', 'r')
encrypted_data = f.read()

key = base64.b64decode("6vYJkO5beHNlwOm+aMqUTTzSpRw9jR3faHqu0wVoAG0=")
iv = base64.b64decode("EbuuKuVF4+DzDbWsvQi/ZA==")

m = mcrypt.MCRYPT("rijndael-128", "cbc")
m.init(key, iv)
decrypted_data = m.decrypt(encrypted_data)

f2 = open('python.jpg', 'w')
f2.write(decrypted_data)