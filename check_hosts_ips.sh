if [ ! -f /etc/hosts ]; then
	echo "Fisierul /etc.hosts nu exista"
	exit 1
fi
while read -r line;do
	if [["$line" =~ ^# || -z "$line" ]]; then
		continue
	fi
	ip=$(echo "$line" | awk '{print $1}')
	host=$(echo "$line" | awk '{print $2}')
	if [[ ! "$ip" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
		echo "Adresa IP invalida:$ip pentru host $host"
	else
		echo "Adresa IP valida: $ip pentru host $host"
	fi
done < /etc/hosts
