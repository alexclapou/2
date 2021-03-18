import socket
from threading import Thread

server_ip = '127.0.0.1'
server_port = 9997

srv = (server_ip, server_port)

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(srv)

def send_message(client):
    while True:
        message = input(">")
        client.send(message.encode())

def receive_message(client):
    while True:
        print((client.recv(100)).decode())

send = Thread(target=send_message, args=(client,))
receive = Thread(target=receive_message, args=(client,))
send.start()
receive.start()
