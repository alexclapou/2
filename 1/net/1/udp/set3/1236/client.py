import socket
import pickle
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
n0 = 995
n1 = 5
numbers = [n1, n0]
s.sendto(pickle.dumps(numbers), ('127.0.0.1', 5959))
data, addr = s.recvfrom(100)
print(pickle.loads(data))
