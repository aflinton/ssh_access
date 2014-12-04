#!/usr/bin/env bash

MY_SHELL=$( which bash )

/usr/sbin/useradd -c 'Adam Flinton <afl at ihtsdo.org>' -s ${MY_SHELL} -m adamf
cat >/etc/sudoers.d/adamf-ALL <<EOF
adamf     ALL=(ALL:ALL) NOPASSWD: ALL
EOF
chmod 0440 /etc/sudoers.d/adamf-ALL
mkdir ~adamf/.ssh
chmod 700 ~adamf/.ssh
curl https://raw.githubusercontent.com/aflinton/ssh_access/master/adamf_rsa.pub >~adamf/.ssh/authorized_keys
chmod 400 ~adamf/.ssh/authorized_keys
chown -R adamf ~adamf/.ssh