import socket
import pickle
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(('127.0.0.1', 5569))
data, addr = s.recvfrom(1000)
words = pickle.loads(data)
longest_word = max(words, key=len)
s.sendto(longest_word.encode(), addr)
