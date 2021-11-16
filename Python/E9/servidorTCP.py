# /bin/python3

import socket
from cryptography.fernet import Fernet

TCP_IP = '127.0.0.1'
TCP_PORT = 5005
BUFFER_SIZE = 2048

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.bind((TCP_IP, TCP_PORT))
