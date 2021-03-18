import socket
import pickle
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
list_of_words = ['word1', 'ord2', 'word3', 'word4', 'word5']
s.sendto(pickle.dumps(list_of_words), ('127.0.0.1', 5556))
data, addr = s.recvfrom(100)
print(int.from_bytes(data, byteorder='little'))
