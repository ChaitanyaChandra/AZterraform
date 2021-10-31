#!/bin/bash
# Purpose: Password automation .
# Author: Chaitanya Chandra (Email@chaitu.net)
# -----------------------------------------------------------

expect -c '
spawn sudo sh -c "sed  -i \"s/#PermitRootLogin yes/PermitRootLogin without-password/\" /etc/ssh/sshd_config"
expect "*assword*"
send "@123Chaitu@123Chaitu\r"
interact '

expect -c '
spawn sudo sh -c "echo \"chaitanya ALL=(ALL) NOPASSWD: ALL\" >> /etc/sudoers"
expect "*assword*"
send "@123Chaitu@123Chaitu\r"
interact '

cat >> ~/.bashrc <<END
PS1="\w -> "
export PS1
END
