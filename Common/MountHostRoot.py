#!/usr/bin/python


import re
import subprocess






outText = subprocess.check_output(['VBoxControl','sharedfolder','list'])
print(outText)

drives  = re.compile('[0-9]+ - HOSTROOT_([A-Z]).*').findall(outText)
for drive in drives:
    try:
        outText = subprocess.check_output(['mkdir','/HostRoot/%c'%drive])
    except:
        pass
    print('>>> Mounting /HostRoot/%c'%drive)
    outText = subprocess.check_output(['mount','-t','vboxsf','HOSTROOT_%c'%drive,'/HostRoot/%c'%drive])
    print(outText)
    print(drive)



if len(drives) > 0:
    print('>>> Mounting /HostRoot')
    outText = subprocess.check_output(['mount','-t','vboxsf','HOSTROOT','/HostRoot'])
    print(outText)

