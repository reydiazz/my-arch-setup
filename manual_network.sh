#!/bin/bash

if [ "$#" -ne 3 ]; then
   echo "==> (Error) Completar los parametros: interfaz, ip/mascara y gateway."
   exit 1
fi

INTERFACE=$1
IP=$2
GATEWAY=$3

echo "==> (Proceso) Estableciendo configuracion de red..."

systemctl stop NetworkManager
ip addr flush dev $INTERFACE
ip link set $INTERFACE up
ip addr add $IP dev $INTERFACE
ip route add default via $GATEWAY

rm -f /etc/resolv.conf
echo "nameserver 1.1.1.1" > /etc/resolv.conf

echo "==> (Exito) Red levantada manualmente en $INTERFACE"
