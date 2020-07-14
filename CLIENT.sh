trap fnk INT

function fnk() {
        $(kill -9 $(ps -axu | grep socat | awk '{print $2}') > /dev/null 2>&1)
}
for i in {1..10}
do
	message="{id:\"151220066\", no:\"$i\", msg:\"packet from client\", timestamp:\"$(date)\" }"
	echo $i ". TCP Gonderiliyor..."
	echo $message | socat - TCP:127.0.0.1:5001,reuseaddr
	echo $i.  "CLIENT-->TCP:" $message >> client.txt
	sleep 1
done
for i in {1..10}
do
	message="{id:\"151220066\", no:\"$i\", msg:\"packet from client\", timestamp:\"$(date)\" }"
	echo $i ". UDP Gonderiliyor..."
	echo $message | socat - UDP:127.0.0.1:5001,reuseaddr
	echo $i.  "CLIENT-->UDP:" $message >> client.txt
	sleep 1
done
fnk
