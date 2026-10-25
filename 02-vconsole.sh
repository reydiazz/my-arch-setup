#!/bin/bash
set -e

echo "==> (Proceso) Configurando la consola del sistema (TTY).."
for package in kbd terminus-font; do
    if ! pacman -Q "$package"; then
        echo "==> (Error) $package no esta instalado."
        exit 1
    fi
done

cat <<EOF > /etc/vconsole.conf
FONT="ter-124b"
KEYMAP="us"
EOF

echo "==> (Exito) Configuracion de TTY aplicada con exito."
