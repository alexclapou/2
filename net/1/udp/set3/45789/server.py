import socket
import pickle
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(('127.0.0.1', 5839))
data, addr = s.recvfrom(100)
maximum_value = max(pickle.loads(data))
s.sendto(pickle.dumps(maximum_value), addr)
