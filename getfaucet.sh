#!/usr/bin/expect

set email [lindex $argv 0]

if {[string length $email] == 0} {
    puts "Error: Email address is required."
    exit 1
}

if {![regexp {^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$} $email]} {
    puts "Error: Invalid email address."
    exit 1
}

spawn sudo docker exec -it ironfish ironfish faucet
expect "Enter your email to stay updated with Iron Fish: "
send "$email\r"
expect eof
