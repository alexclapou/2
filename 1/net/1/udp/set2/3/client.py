import socket
import pickle
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
words = ['word1asdac', 'word22133c', 'word3ascdsacdc', 'word4c1', 'word51230219c31283c12kdjsacd']
s.sendto(pickle.dumps(words), ('127.0.0.1', 5569))
data, addr = s.recvfrom(1000)
print(data.decode())
