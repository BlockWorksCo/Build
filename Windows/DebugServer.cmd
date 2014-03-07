


vagrant ssh-config > vagrant_ssh_config && ssh -t -F vagrant_ssh_config default 'gdbserver --debug %*' | tee o1

