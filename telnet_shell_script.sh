#!/usr/local/bin/expect 

set timeout 10
set host 	[lindex $argv 0];
set username 	[lindex $argv 1];
set password 	[lindex $argv 2];
send_user "host - $host\n"
send_user "username - $username\n"
#send_user "$username $password"
spawn telnet $host
expect "Password:" {send "$password\r" }
expect "login:" { send "$username\r" }
expect "Password:" { send "$password\r" }
sleep 2
send "echo Hello from testlinux12..\r"
send "regress -testbed mvltevm21 -runSuite mgExpress -runLevel express -skipSuite Sanity -useimages 7750mg/10.0/current -cvs_tag TiMOS-MG_10_0_current -physTopology lteDefault -subTopology vfp\r"
send "exit\r"
interact
