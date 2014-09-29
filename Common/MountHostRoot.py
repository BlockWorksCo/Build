
import re
import subprocess


outText = subprocess.check_output(['VBoxControl','sharedfolder','list'])
drives  = re.compile('[0-9]+ - HOSTROOT_([A-Z]).*').findall(outText)

for drive in drives:
    try:
        outText = subprocess.check_output(['mkdir','/HostRoot/%c'%drive])
    except:
        pass
    outText = subprocess.check_output(['mount','-t','vboxsf','HOSTROOT_%c'%drive,'/HostRoot/%c'%drive])
    print(outText)
    print(drive)


