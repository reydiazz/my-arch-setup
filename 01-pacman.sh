#!/bin/bash

PACKAGE_LIST="packages.txt"

if [ ! -f "$PACKAGE_LIST" ]; then
   echo "Error: No existe el archivo $PACKAGE_LIST"
   exit 1
fi

if ! ping -c 1 -W 3 1.1.1.1 &>/dev/null; then
   echo "Error: No hay conexion a internet."
   exit 1
fi

mapfile -t PACKAGES < <(grep -vE '^[[:space:]]*#' "$PACKAGE_LIST" | grep -v '^[[:space:]]*$')

if [ "${#PACKAGES[@]}" -eq 0 ]; then
   echo "Error: No hay paquetes para instalar en $PACKAGE_LIST"
   exit 1
fi

echo "==> Instalando paquetes oficiales..."
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

if [ $? -eq 0 ]; then
   echo "==> Instalacion completada correctamente."
else
   echo "Error: No se pudieron instalar todos los paquetes."
   exit 1
fi

