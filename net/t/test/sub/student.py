from threading import Thread
import os
import time
import socket
import sys

teacher_ip = '127.0.0.1'
teacher_port = 9999

def send_msg(socket, group_port):
    message = 'leader'
    while True:
        socket.sendto(message.encode(), ('<broadcast>', group_port))
        time.sleep(5)

def create_leader(group_port):
    leader = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    leader.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
    leader.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
    send_messages = Thread(target=send_msg, args=(leader, group_port))
    send_messages.start()
    leader_teacher = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    leader_teacher.connect((teacher_ip, teacher_port))
    while True:
        question, stud_addr = leader.recvfrom(100)
        print("received question: {0} from student".format(question.decode()))
        leader_teacher.send(question)
        answer = leader_teacher.recv(100)
        leader.sendto(answer, ('<broadcast>', group_port))

def send_qst(student, addr):
    question = 'intrebare'
    while True:
        student.sendto(question.encode(), addr)
        time.sleep(3)

def receive_msg(student):
    while True:
        leader_message, lead_addr = student.recvfrom(100)
        leader_message = leader_message.decode()
        print("message {0} received from {1}".format(leader_message, lead_addr))

def create_student(group_port):
    student = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    student.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
    student.bind(('0.0.0.0', group_port))
    leader_message = None
    while leader_message != 'leader':
        leader_message, addr = student.recvfrom(100)
        leader_message = leader_message.decode()
    print("message {0} received from {1}".format(leader_message, addr))
    send_questions = Thread(target=send_qst, args=(student, addr))
    send_questions.start()
    received_leader_message = Thread(target=receive_msg, args=(student,))
    received_leader_message.start()

if __name__ == '__main__':
    group_port = int(sys.argv[1])
    leader = int(sys.argv[2])
    if leader == 1:
        create_leader(group_port)
    else:
        create_student(group_port)
