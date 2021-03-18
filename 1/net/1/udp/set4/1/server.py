import socket
import pickle
def digit_sum(number):
    s = 0
    while number > 0:
        s += number % 10
        number //= 10
    return s
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(('127.0.0.1', 9999))
data, addr = s.recvfrom(100)
print(data.decode(), addr[1])
port_sum = digit_sum(addr[1])
s.sendto(str(port_sum).encode(), addr)
