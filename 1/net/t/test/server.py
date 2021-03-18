import os
import random
import time
import socket
class Teacher(object):
    def __init__(self):
        self.port = 4200
        self.teacher = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.teacher.bind(('127.0.0.1', self.port))

    def recieve_questions(self):
        while True:
            self.teacher.listen(5)
            conn, addr = self.teacher.accept()
            '''
                random_number = random.random()
                if random_number > 0.5:
                    length = random.randint(7,12)
                    number = random.randint(0,100000)
                    question = ""
                    while length > 0:
                        letter = random.randint(97,122)
                        question += chr(letter)
                        length -= 1
            '''
            print(conn.recv(100))
            print("AICI")

a = Teacher()
a.recieve_questions()
