import socket
import pickle
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
numbers = [0, 1, 2, 15,  3, 4]
s.sendto(pickle.dumps(numbers), ('127.0.0.1', 5839))
data, addr = s.recvfrom(100)
print(pickle.loads(data))
