import socket
import random

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('127.0.0.1', 4445))
random_number = random.randrange(100)
s.send(str(random_number).encode())
