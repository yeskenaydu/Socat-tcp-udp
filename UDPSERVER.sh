socat UDP-LISTEN:10001,fork STDOUT | xargs -d'\n' -imesaj sh -c " echo 'UDP-->mesaj' >> UDPlog.txt"
