#!/bin/bash

# Fetch the latest SecLists common.txt wordlist
WORDLIST_DIR="wordlists"
WORDLIST_FILE="${WORDLIST_DIR}/dirs.txt"
URL="https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/common.txt"

echo "[*] Updating wordlist from SecLists GitHub..."
mkdir -p $WORDLIST_DIR

curl -sSL $URL -o $WORDLIST_FILE

if [ $? -eq 0 ]; then
  echo "[+] Wordlist updated successfully: $WORDLIST_FILE"
else
  echo "[-] Failed to download wordlist."
fi
