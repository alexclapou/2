def number_of_vowels(word):
    vowels = "aeiou"
    count = 0
    for letter in word:
        if letter in vowels:
            count += 1
    return count
import socket
import pickle
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(('127.0.0.1', 5399))
data, addr = s.recvfrom(100)
m = max(pickle.loads(data), key=number_of_vowels)
print(m)
