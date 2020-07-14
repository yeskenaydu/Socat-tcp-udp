socat TCP-LISTEN:20002,fork STDOUT | xargs -d'\n' -imesaj sh -c " echo 'TCP-->mesaj' >> TCPlog.txt"
