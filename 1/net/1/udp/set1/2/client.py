import socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
word = "cuvant"
s.sendto(word.encode(), ('127.0.0.1', 3333))
length, address = s.recvfrom(100)
print(int(length.decode()))
