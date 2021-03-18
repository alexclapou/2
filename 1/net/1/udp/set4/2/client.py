import pickle
import socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
number = int(input("number "))
s.sendto(str(number).encode(), ('127.0.0.1', 9999))
data, addr = s.recvfrom(100)
print(data.decode())
