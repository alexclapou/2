import os
import random
import time
import socket
teacher_ip = ''
teacher_port = 4200
class Student(object):
    def __init__(self):
        self.group_port = int(input("port group: "))
        self.leader = -1
        while self.leader != 0 and self.leader != 1:
            self.leader = int(input("leader: "))
        self.student = self.init_socket()
        if self.leader == 1:
            self.student_teacher = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.student_teacher.connect(('127.0.0.1', teacher_port))
            self.leader = True
            self.send_leader_message()
            self.recieve_students_messages()
        else:
            self.leader = False
            self.send_question()

    def init_socket(self):
        student = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        student.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
        student.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
        if self.leader == 1:
            student.bind(('', 9999))
        return student

    def send_leader_message(self):
        message = "leader"
        while True:
            if os.fork() == 0:
                self.student.sendto(message.encode(), ('<broadcast>', self.group_port))
                print('leader sent message: ' + message)
                time.sleep(5)
                os._exit(0)

    def recieve_students_messages(self):
        while True:
            data, addr = self.student.recvfrom(1024)
            if os.fork() == 0:
                self.student_teacher.send(data)
                os._exit(0)

    def send_question(self):
        while True:
            if os.fork() == 0:
                random_number = random.random()
                if random_number > 0.5:
                    length = random.randint(7,12)
                    question = ""
                    while length > 0:
                        letter = random.randint(97,122)
                        question += chr(letter)
                        length -= 1
                    self.student.sendto(question.encode(), ('', 9999))
                time.sleep(3)
                os._exit(0)

    def is_leader(self):
        return self.leader


g1 = []

for i in range(2):
    g1.append(Student())
    if g1[i].is_leader():
        leader = g1[i]

leader.recieve_students_messages()

