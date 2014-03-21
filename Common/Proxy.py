


import subprocess
import os
import shlex
import sys
import time




def Proxy(command):
    """
    """
    commandList = shlex.split(command)
    print(commandList)
    p = subprocess.Popen(['/usr/bin/bc'], stderr=subprocess.PIPE, stdout=subprocess.PIPE, stdin=subprocess.PIPE)

    #p.stdin.write('one\ntwo\nthree\four\nfive\n')
    #output,err = p.communicate(input='2+2\n')
    #print('[%s]'%output)
    while p.poll() is None:
    #while True:
        #p.stdin.flush()
        #output,err = p.communicate(input='2+2\n')
        try:
            p.stdin.write('3+3\n')
            output  = p.stdout.readline()
        except ValueError:
            output  = ''

        if output != '':
            print('[%s]'%output)
        else:
            time.sleep(0.2)



if __name__ == '__main__':
    """
    """

    command = ' '.join(sys.argv[1:])
    print('[%s]'%command)

    Proxy(command)


