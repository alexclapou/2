import socket
import pickle
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
IP_ADDR = '192.168.43.55'
PORT = 55554
input_command = input("input command: ").split(" ")
s.connect((IP_ADDR, PORT))
s.send(pickle.dumps(input_command))
