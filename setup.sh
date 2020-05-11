#!/bin/sh

displayHelp() {
  echo ""
  echo "Usage: $0 -t theme -p \"docker git \""
  echo "\t-t Select Oh My Zsh theme"
  echo "\t-p Select Oh My Zsh plugins (separated with a space)"
  echo "\t-u Unattended installation"
  echo ""
  echo "https://github.com/martialonline/zsh"
  echo ""
  exit 1
}

checkPrerequisites() {
  errors=false

  if [ ! -x "$(which zsh)" ]; then
    prerequisites[0]=zsh
    errors=true
  fi

  if [ ! -x "$(which wget)" ] && [ ! -x "$(which curl)" ]; then
    prerequisites[1]=wget/curl
    errors=true
  fi
  
  if [ ! -x "$(which git)" ]; then
    prerequisites[2]=git
    errors=true
  fi

  if [ "$errors" = true ]; then
    echo "The following prerequisites are missing:"
    for i in "${prerequisites[@]}"; do
      echo "$i"
    done
    exit 1
  fi
}

installOhMyZsh() {
  theme=$(echo $1 | xargs)
  plugins=$(echo $2 | xargs)

  if [ -x "$(which wget)" ]; then
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  elif [ -x "$(which curl)" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi

  sed -i '' -e 's:^ZSH_THEME=.*:ZSH_THEME="'$theme'":' ~/.zshrc
  sed -i '' -e 's:^plugins=.*:plugins=('"$plugins"'):' ~/.zshrc

  if [ "$?" -eq 0 ]; then
    zsh
  fi
}

checkPrerequisites

while getopts "t:p:u:h:" opt; do
  case "$opt" in
    t ) theme="$OPTARG" ;;
    p ) plugins="$OPTARG" ;;
    u ) unattended=true ;;
    h ) displayHelp ;;
    ? ) displayHelp ;;
  esac
done

if [ -z "$theme" ] || [ -z "$plugins" ]; then
  theme=robbyrussell
  plugins=""
fi

echo "Theme: $theme"
echo "Plugins: $plugins\n"

if [ "$unattended" = true ]; then
  installOhMyZsh "$theme" "$plugins"
else 
  while true; do
    read -p "Are the above values correct? [y/N] " yn
    case $yn in
      [Yy]* ) installOhMyZsh "$theme" "$plugins"; break;;
      [Nn]* ) exit;;
      * ) echo "Please answer yes or no.";;
    esac
  done
fi