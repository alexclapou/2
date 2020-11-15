import socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(('0.0.0.0', 3333))
word, address = s.recvfrom(100)
length = len(word.decode())
s.sendto(str(length).encode(), address)
