import socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.sendto(b"asd", ('127.0.0.1', 9909))

