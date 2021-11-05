#!/bin/bash

sudo apt install -y pv asciinema tmux

cat << EOF > $HOME/.dive.yaml
diff:
  # You can change the default files shown in the filetree (right pane). All diff types are shown by default.
  hide:
    - unmodified

filetree:
  # The percentage of screen width the filetree should take on the screen (must be >0 and <1)
  pane-width: 0.6

  # Show the file attributes next to the filetree
  show-attributes: true
EOF


mkdir -p ~/.local/bin
export PATH=~/.local/bin:$PATH
cat <<- "EOF" > ~/.local/bin/show
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
echo "${green}--- app.py ---${reset}" && cat app.py && echo "${green}--- requirements.txt ---${reset}" && cat requirements.txt && echo "${green}--- Dockerfile ---${reset}" && cat Dockerfile
EOF

chmod +x ~/.local/bin/show

echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc
GREEN="\033[0;32m"
CYAN="\033[0;36m"
COLOR_RESET="\033[0m"
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W${COLOR_RESET} "
echo "export PS1=\"${DEMO_PROMPT}\"" >> ~/.bashrc
clear