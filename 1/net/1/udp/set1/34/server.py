import socket
def get_number_of_vowels(string):
    vowels = "aeiou"
    count = 0
    for char in string:
        if char in vowels:
            count += 1
    return count

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(('127.0.0.1', 3333))
data, addr = s.recvfrom(100)
s.sendto(str(get_number_of_vowels(data.decode())).encode(), addr)
