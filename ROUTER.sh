(socat TCP-LISTEN:5001,fork,reuseaddr STDOUT | \
   tee -a >(socat /dev/stdin TCP:127.0.0.1:20002,forever) | \
   xargs -d'\n' -imesaj sh -c  " echo 'ROUTE-->TCP: mesaj' >> route.txt ")  2>/dev/null &

(socat UDP-LISTEN:5001,fork,reuseaddr STDOUT | \
   tee -a >(socat /dev/stdin UDP:127.0.0.1:10001) | \
   xargs -d'\n' -imesaj sh -c  " echo 'ROUTE-->UDP: mesaj' >> route.txt " ) 2>/dev/null &

