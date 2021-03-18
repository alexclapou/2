import socket
import pickle
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
username = input("username: ")
#print(username)
s.sendto(username.encode(), ('127.0.0.1', 9999))
data, addr = s.recvfrom(100)
print(data.decode())
