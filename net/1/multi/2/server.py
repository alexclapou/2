import socket
import os
import time
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(('127.0.0.1', 9909))
while True:
    data, addr = s.recvfrom(100)
    if os.fork() == 0:
        print(data)
        time.sleep(5)
        os._exit(0)
