#!/bin/bash

# Cores para o terminal
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}[*] Installing STACKSMASH...${NC}"

# 1. Verificar se é root
if [ "$EUID" -ne 0 ]; then 
  echo -e "${RED}[!] Please run as root (use sudo)${NC}"
  exit 1
fi

# 2. Dar permissão de execução ao script principal
if [ -f "stacksmash.py" ]; then
    chmod +x stacksmash
    # 3. Mover para /usr/local/bin
    cp stacksmash /usr/local/bin/
    echo -e "${GREEN}[+] STACKSMASH installed successfully!${NC}"
    echo -e "[*] You can now run it by typing 'stacksmash' in any terminal."
else
    echo -e "${RED}[!] Error: 'stacksmash' file not found in current directory.${NC}"
    exit 1
fi
