import socket
import pickle
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(('127.0.0.1', 3333))
data, addr = s.recvfrom(100)
concatenated_words = "".join(pickle.loads(data))
s.sendto(concatenated_words.encode(), addr)
