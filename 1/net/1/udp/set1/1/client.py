import socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
letter = 'x'
while True:
    s.sendto(letter.encode(), ("127.0.0.1", 3333))
    data, addr = s.recvfrom(100)
    print(data.decode())
