import socket
from datetime import date, datetime
import time
import os
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(('', 9997))
while True:
    s.listen(1)
    conn, addr = s.accept()
    today = datetime.now()
    prev_date = today.strftime("%H:%M:%S seconds")
    if os.fork() == 0:
        print(conn.recv(1000))
        conn.send(prev_date.encode())
        time.sleep(5)
        os._exit(0)
