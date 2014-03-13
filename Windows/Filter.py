


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

    line    = line.replace('\\\\','/')
    line    = line.replace('c:/','/HostRoot/')
    line    = line.replace('C:/','/HostRoot/')

    return line



def enqueue_output(p, q):
    """
    """
    while True:
        line = p.read(1)
        if len(line) != 0:
            q.put(line)
            sys.stdout.write(line)
            sys.stdout.flush()





def ShowAllAvailable(q):
    """
    """
    timeout = False
    while timeout == False:
        try:  
            line = q.get_nowait()
            #print(line)
        except Queue.Empty:
            timeout = True




def handler(signum, frame):
    #sys.stdout.write('  ** Signal handler called with signal %d  ** '%(signum) )
    #sys.stdout.flush()
    #pid.send_signal(signal.SIGTERM)
    #win32api.GenerateConsoleCtrlEvent(win32con.CTRL_BREAK_EVENT, pid.pid)
    toGDB.write('%c'%(3))
    toGDB.flush()

signal.signal(signal.SIGTERM , handler)
signal.signal(signal.SIGINT , handler)


#pid     = subprocess.Popen(shlex.split("ssh -t -F vagrant_ssh_config default 'gdb' "),  stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.STDOUT, creationflags=subprocess.CREATE_NEW_PROCESS_GROUP)
pid     = subprocess.Popen(shlex.split("ssh build@localhost -p 2222 -t -t 'gdb'"),  stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.STDOUT, creationflags=512)
toGDB   = pid.stdin
fromGDB = pid.stdout
fromGDBq= Queue.Queue()
t = threading.Thread(target=enqueue_output, args=(fromGDB, fromGDBq) )
t.daemon = True
t.start()
time.sleep(1.0)

 

toGDB.write('vagrant\n')
toGDB.flush()

#toGDB.write('help\n')
#toGDB.flush()


toGDB.write('target exec /gdb/Main\n')
toGDB.flush()

#toGDB.write('symbol /gdb/Main\n')
#toGDB.flush()

toGDB.write('run\n')
toGDB.flush()

time.sleep(5.0)
#pid.send_signal(signal.SIGINT)
#ctypes.windll.kernel32.GenerateConsoleCtrlEvent(0, pid.pid) 
#win32api.GenerateConsoleCtrlEvent(win32con.CTRL_C_EVENT, pid.pid)
#win32api.GenerateConsoleCtrlEvent(win32con.CTRL_BREAK_EVENT, pid.pid)

#time.sleep(1.0)
#toGDB.write('%c\n'%(3))
#toGDB.flush()




#outfile=open(sys.argv[1],'w')
line    = ''
while pid.returncode == None:

    data    = sys.stdin.read(1)
    line    = line + data
    #if data == '\n' or data == '\r':

    line    = FilterLine(line)

    #outfile.write('[%s]\n'%(line))
    #outfile.flush()

    toGDB.write(line)
    toGDB.flush()

    ShowAllAvailable(fromGDBq)

    line    = ''


