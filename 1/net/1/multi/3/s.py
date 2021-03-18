import socket
import select

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(('127.0.0.1', 9998))
while True:
    conn, addr = s.recvfrom(100)
    print(conn)
    s.sendto(conn, addr)
