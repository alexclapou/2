import socket
import os
import time

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
msg = "mesaj"
s.sendto(msg.encode(),('127.0.0.1', 9999))
