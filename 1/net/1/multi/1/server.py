import socket
import os
import time

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(('127.0.0.1', 4445))
while True:
    s.listen(5)
    conn, addr = s.accept()
    if os.fork()  == 0:
        data = int(conn.recv(5).decode())
        print(data)
        time.sleep(5)
        os._exit(0)
