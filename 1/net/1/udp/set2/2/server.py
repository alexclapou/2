import socket
import pickle
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(('127.0.0.1', 5556))
data, addr = s.recvfrom(1000)
number_of_words = [len(pickle.loads(data))]
s.sendto(bytes(number_of_words), addr)
