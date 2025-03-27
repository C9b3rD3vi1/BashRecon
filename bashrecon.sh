
#!/bin/bash

# BashRecon - Simple Automated Recon Tool for Pentesters
# Author: C9b3rD3vi1
# GitHub: https://github.com/C9b3rD3vi1/BashRecon


TARGET=$1
REPORT="recon-${TARGET}.txt"

# Check if target is provided
if [ -z "$TARGET" ]; then
  echo "Usage: $0 <target-domain-or-ip>"
  exit 1
fi

mkdir -p reports
REPORT="reports/$REPORT"
echo "[*] Recon for $TARGET" | tee $REPORT

#Ping test function
ping -c 1 $TARGET &>/dev/null
if [ $? -eq 0 ]; then
  echo "[+] Host is up" | tee -a $REPORT
else
  echo "[-] Host is down or blocking ICMP" | tee -a $REPORT
fi

# DNS lookup 
echo -e "\n[*] DNS Info:" | tee -a $REPORT
host $TARGET | tee -a $REPORT


#Port scanner
echo -e "\n[*] Scanning top 1000 ports:" | tee -a $REPORT
for port in {1..1000}; do
  timeout 1 bash -c "echo >/dev/tcp/$TARGET/$port" 2>/dev/null && echo "[+] Port $port is open" | tee -a $REPORT
done


# Banner grab (HTTP)
if nc -z -w 2 $TARGET 80; then
  echo -e "\n[*] HTTP Banner:" | tee -a $REPORT
  curl -sI http://$TARGET | tee -a $REPORT
fi


# Dir bruteforce (basic)
if nc -z -w 2 $TARGET 80; then
  echo -e "\n[*] Directory brute force:" | tee -a $REPORT
  if [ -f "wordlists/dirs.txt" ]; then
    while read dir; do
      code=$(curl -o /dev/null -s -w "%{http_code}" http://$TARGET/$dir)
      if [ "$code" == "200" ]; then
        echo "[+] Found /$dir (200 OK)" | tee -a $REPORT
      fi
    done < wordlists/dirs.txt
  else
    echo "[-] wordlists/dirs.txt not found! Skipping dir brute force." | tee -a $REPORT
  fi
fi

echo -e "\n[*] Recon complete. Output saved to $REPORT"
