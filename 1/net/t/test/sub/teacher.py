import os
from threading import Thread
import time
import socket
import select

teacher_ip = '127.0.0.1'
teacher_port = 9999
sock = socket.create_server((teacher_ip, teacher_port), family=socket.AF_INET, backlog=10, reuse_port=True)
master = [sock]
while True:
        ready_read, _, _ = select.select(master, [], [])
        for fd in ready_read:
            if fd == sock:
                client_sock, addr = sock.accept()
                master.append(client_sock)
            else:
                    msg = fd.recv(1024)
                    msg = msg.decode('ascii')
                    print("Teacher received {0}".format(msg))
                    fd.send('raspuns'.encode('ascii'))


'''
def get_q(t, addr):
    while True:
        data = conn.recv(100)
        print(data)
        t.send(b"asdadsadsadsasd")
t = socket.create_server((teacher_ip, teacher_port), family=socket.AF_INET, backlog=10, reuse_port=True)
while True:
    conn, addr = t.accept()
    th = Thread(target=get_q, args=(conn,addr))
    th.start()


'''
