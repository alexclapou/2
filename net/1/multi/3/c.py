import socket

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
msg = "asd"
while True:
    s.sendto(msg.encode(), ('127.0.0.1', 9998))
    print(s.recvfrom(100))
