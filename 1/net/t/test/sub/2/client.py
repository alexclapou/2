import socket
import time
import pickle

server_ip = '127.0.0.1'
server_port = 9995

def create_request(number):
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.connect((server_ip, server_port))
    client.send(pickle.dumps(number))
    print(pickle.loads(client.recv(100)))


def main():
    number = int(input())
    create_request(number)
main()
