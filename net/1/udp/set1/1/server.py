import socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(("0.0.0.0", 3333))
while True:
    data, addr = s.recvfrom(100)
    data *= 2
    print(data)
    s.sendto(data, addr)
