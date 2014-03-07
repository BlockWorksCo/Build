


import sys
import subprocess
import shlex
import threading
import time
import Queue
import signal
import os
import ctypes
import win32api
import win32con





def FilterLine(line):
    """
    """

    line    = line.replace('\\','/')
    line    = line.replace('\\\\','/')
    line    = line.replace('c:/','/HostRoot/')
    line    = line.replace('C:/','/HostRoot/')

    return line


print(sys.argv[1:])
gdbArguments=' '.join(sys.argv[1:])
gdbArguments=FilterLine(gdbArguments)
print('gdbArguments=%s'%(gdbArguments))
commandToRun    = shlex.split("ssh build@localhost -p 2222 -t -t 'gdb %s'"%(gdbArguments)) 
print(commandToRun)


fromStdinFile = open('c:\\temp\\fromStdin.txt','w')
toStdoutFile = open('c:\\temp\\toStdout.txt','w')

def enqueue_output(p, q, l):
    """
    """
    while True:
        line = p.read(1)
        if len(line) != 0:
            q.put(line)
            sys.stdout.write(line)
            sys.stdout.flush()

            l.write(line)
            l.flush()





def handler(signum, frame):
    toGDB.write('%c'%(3))
    toGDB.flush()
    toGDB.write('info threads\n')
    toGDB.flush()

signal.signal(signal.SIGTERM , handler)
signal.signal(signal.SIGINT , handler)


pid     = subprocess.Popen(commandToRun,  stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.STDOUT, creationflags=512)
fromGDB = pid.stdout
toGDB   = pid.stdin



fromGDBq= Queue.Queue()
t = threading.Thread(target=enqueue_output, args=(fromGDB, fromGDBq, toStdoutFile) )
t.daemon = True
t.start()

toGDB   = pid.stdin
fromStdinq = Queue.Queue()
t = threading.Thread(target=enqueue_output, args=(sys.stdin, fromStdinq, fromStdinFile) )
t.daemon = True
t.start()

line    = ''
while pid.returncode == None:

    try:
        data = fromStdinq.get(block=True, timeout=1.0)
    except:
        data = ''

    line    = line + data
    if data == '\n' or data == '\r' or data == '':

        line    = FilterLine(line)

        toGDB.write(line)
        toGDB.flush()

        line    = ''


