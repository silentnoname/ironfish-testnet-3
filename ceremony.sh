#!/usr/bin/expect
set name [lindex $argv 0]
spawn sh -c "sudo docker exec -it ironfish ironfish ceremony | tee -a ~/ceremony_output.log"
expect "If you'd like to contribute your own randomness to the ceremony, type it here, then press Enter. For more information on where this should come from and its importance, please read https://setup.ironfish.network. If you'd like the command to generate some randomness for you, just press Enter:"
send "\r"
expect "If you'd like to associate a name with this contribution, type it here, then press Enter. Otherwise, to contribute anonymously, just press Enter:"
send "$name\r"
interact