import socket
import pickle
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
words = ['word1aa', 'word2b11', 'word3aaa', 'word4bbceqr', 'word5cced']
s.sendto(pickle.dumps(words), ('127.0.0.1', 5399))
