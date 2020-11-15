import socket
import select

server_ip = '127.0.0.1'
server_port = 9997

srv = (server_ip, server_port)

server = socket.create_server(srv, family=socket.AF_INET, backlog=10, reuse_port = True)
inputs = [server]
outputs = []

sockets = []
while True:
    readable, writable, _ = select.select(inputs, outputs, [])
    for s in readable:
        if s is server:
            conn, addr = server.accept()
            sockets.append(conn)
            print("client with address {0} connected".format(addr))
            inputs.append(conn)
        else:
            data = s.recv(100)
            if data:
                for i in sockets:
                    if i is not s:
                        i.send(data)
            else:
                inputs.remove(s)
                sockets.remove(s)
