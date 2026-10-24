#!/bin/bash

if["$#" -ne 3]; then
   echo "Error": Faltan parametros."
   echo "Uso: $0 <interfaz> <ip/mascara> <gateway>"
   echo "Ejemplo: $0 enp0s3 192.168.18.150/24 192.168.18.1"
   exit 1
fi

INTERFACE=$1
IP=$2
GATEWAY=$3

systemctl stop NetworkManager
ip addr flush dev $INTERFACE
ip link set $INTERFACE up
ip addr add $IP dev $INTERFACE
ip route add default via $GATEWAY

rm -f /etc/resolv.conf
echo "nameserver 1.1.1.1" > /etc/resolv.conf

echo "Red levantada manualmente en $INTERFACE"
