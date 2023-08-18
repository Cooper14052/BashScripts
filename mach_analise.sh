#!/bin/bash

IP="8.8.8.8"
HOST="http://example.com"
WORDLIST="/usr/share/wordlists/dirb/common.txt"

check_ping() {
  if ping -c 1 $1 > /dev/null 2>&1; then
    echo "IP-адрес $1 доступен."
    echo "Выполняется сканирование портов для IP-адреса: $IP"
    nmap -A -p- $IP
    echo "Выполняется сканирование директорий на веб-сервере: $HOST"
    gobuster dir -u $HOST -w $WORDLIST
  else
    echo "IP-адрес $1 недоступен."
    exit 1
  fi
}

check_ping $IP
