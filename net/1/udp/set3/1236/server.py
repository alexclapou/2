import socket
import math
import pickle
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(('127.0.0.1', 5959))
data, addr = s.recvfrom(100)
numbers = pickle.loads(data)
numbers_sum = sum(numbers)#math.prod(numbers) numbers_dif = numbers[0] - numbers[1]
s.sendto(pickle.dumps(numbers_sum), addr)
