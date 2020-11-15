import pickle
import socket
def digit_sum(number):
    s = 0
    while number > 0:
        s += number%10
        number //= 10
    return s

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(('127.0.0.1', 9999))
data, addr = s.recvfrom(100)
dig_s = digit_sum(addr[1]) + int(data.decode())
print(addr[1])
s.sendto(str(dig_s).encode(), addr)
