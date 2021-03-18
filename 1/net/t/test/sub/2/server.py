import socket
from datetime import date
import time
import pickle
import select
from threading import Thread

server_ip = '127.0.0.1'
server_port = 9995

clients = {}
def work(conn, addr, date_now):
    number = pickle.loads(conn.recv(100))
    if len(clients) == 0:
        clients[number] = date_now
        conn.send(pickle.dumps(0))
    else:
        if number in list(clients.keys()):
            keep_date = clients[number]
            clients[number] = date_now
            conn.send(pickle.dumps(keep_date))
        else:
            clients[number] = date_now
            conn.send(pickle.dumps(0))

def main():
    server = socket.create_server((server_ip, server_port), family=socket.AF_INET, backlog=10, reuse_port=True)
    while True:
        conn, addr = server.accept()
        date_now = time.strftime("%d/%m/%Y - %H:%M")
        do_something = Thread(target=work, args=(conn, addr, date_now))
        do_something.start()

main()
