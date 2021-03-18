import socket
from threading import Thread
import os
import time

def work(data):
    print(data)
    time.sleep(5)



ip = '127.0.0.1'
port = 9999
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(('127.0.0.1', 9999))
while True:
    data, addr = s.recvfrom(100)
    new_thread = Thread(target=work, args=(data,))
    new_thread.start()
