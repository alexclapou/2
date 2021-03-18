import socket
import pickle
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
message1 = "msg1"
message2 = "msg2"
all_messages = [message1, message2]
s.sendto(pickle.dumps(all_messages), ('127.0.0.1', 3333))
data, addr = s.recvfrom(100)
final_word = data.decode()
print(final_word)
