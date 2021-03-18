
import socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
message = "mesaj cu vocale"
s.sendto(message.encode(), ('127.0.0.1', 3333))
data, addr = s.recvfrom(100)
print(int(data.decode()))
