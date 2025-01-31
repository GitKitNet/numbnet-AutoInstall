#!/bin/bash

# set +x

# bash <(curl -L -fSs raw.githubusercontent.com/numbnet/AutoInstall/master/bash/ssh/sshtoolkit.sh)
# bash -c "$(curl -L -fSs raw.githubusercontent.com/numbnet/AutoInstall/master/bash/ssh/sshtoolkit.sh || wget -O - raw.githubusercontent.com/numbnet/AutoInstall/master/bash/ssh/sshtoolkit.sh)"

title="EXAMPLE MAIN MENU";

#  - - - - - - - - - - - - - - - - -
#            COLOR
#  - - - - - - - - - - - - - - - - -
GREEN="\033[32m";
RED="\033[1;31m";
BLUE="\033[1;34m";
YELOW="\033[1;33m";
PURPLE='\033[0;4;35m';
CYAN='\033[4;36m';
BLACK="\033[40m";
NC="\033[0m";

Black="`tput setaf 0`"
Red="`tput setaf 1`"
Green="`tput setaf 2`"
Yellow="`tput setaf 3`"
Blue="`tput setaf 4`"
Cyan="`tput setaf 5`"
Purple="`tput setaf 6`"
White="`tput setaf 7`"

BGBlack="`tput setab 0`"
BGRed="`tput setab 1`"
BGGreen="`tput setab 2`"
BGYellow="`tput setab 3`"
BGBlue="`tput setab 4`"
BGCyan="`tput setab 5`"
BGPurple="`tput setab 6`"
BGWhite="`tput setab 7`"

RC="`tput sgr0`"

TEXTCOLOR=$White;
BGCOLOR=$BLACK;

function C2() {
  for (( i = 0; i < 16; i++ )); do
    echo -e "`tput setaf $i`(C$i=\"\`tput setaf $i\`\"`tput sgr0`; `tput setab $i`(BC$i=\"\`tput setab $i\`\")`tput sgr0`";
done;
sleep 3
for (( i = 16; i < 256; i++ )); do
    echo -e "`tput setaf $i`(C$i=\"\`tput setaf $i\`\"`tput sgr0`; `tput setab $i`(BC$i=\"\`tput setab $i\`\")`tput sgr0`";
done;

}


#  - - - - - - - - - - - - - - - - -
#      VARIABLE & function
#  - - - - - - - - - - - - - - - - -

function THIS() {
 while true; do
  echo -e "${Yellow}Do you want Run $THIS script [y/N] .? ${RC}"
  read -e syn
  case $syn in
  [Yy]* ) break ;;
  [Nn]* ) echo -e "${RED}Cancel..${NC}"; exit 0 ;;
  esac
 done
}; THIS



function F1() {
 while true; do
  read -e -p "Do you want RUN test [y/N] .? " syn
  case $syn in
  [Yy]* ) echo -en "\n${GREEN}=========";pause && break ;;
  [Nn]* ) break ;;
  esac
 done
}
function title() { clear; echo "${title} ${TKEY}"; }
function pause() { read -p "Press [Enter] key to continue..." fackEnterKey; }
function wait() { read -p "Press [ANY] key to continue..? " -s -n 1; }
function TIMER() { if [[ "$1" =~ ^[[:digit:]]+$ ]]; then T="$1"; else T="5"; fi; SE="\033[0K\r"; E="$((1 * ${T}))"; while [ $E -gt 0 ]; do echo -en " Please wait: ${RED}$E$SE${NC}" && sleep 1 && : $((E--)); done; }

function RUNING() {


# figlet -f smslant SSH Toolkit;
# -------------------------------
function showBanner() {
clear;
echo -e "
${BLUE}____________________${NC}${GREEN}__________________________${NC}
${BLUE}    ____ __ __ __  ${NC}${GREEN}______        ____   _ __  ${NC}
${BLUE}   / __/ __/ // / ${NC}${GREEN}/_  __/_ ___  / / /__(_) /_ ${NC}
${BLUE}  _\ \_\ \/ _  / ${NC}${GREEN}  / // _ \ _ \/ /  '_/ / __/ ${NC}
${BLUE} /___/___/_//_/ ${NC}${GREEN}  /_/ \___/___/_/_/\_\_/\__/  ${NC}
${BLUE}_______________${NC}${GREEN}_______________________________${NC}
";
}


#================================
#           Main MENU
#================================

function MAINMENU() {
 echo -e -n "\n\t${GREEN}==== MENU OPTIONS ====${NC}\n"
 echo -e -n "${BLUE}
\t1. Create SSH key ${NC}
\t2. Select 2
\t2. Select 3      ${RED}\n
\tq. Quit...       ${NC} ";
}


##   subMENU 1
function SUBMENUONE() {
M="= = = = =";
echo -e -n "\n\t${GREEN}${M} SSH KeyGen ${M}${NC}\n"
echo -e -n "
\t1. $title ${CYAN}ED25519${NC}
\t2. $title ${PURPLE}RSA${NC}
\t3. $title ${BLUE}DSA${NC}
\t4. $title ${GREEN}ECDSA${NC}
\t5. $title ${RED}EdDSA${RED} - [OFF]${NC}
${RED}\n\t0. Back ${NC}\n";
}

##   subMENU 2
function SUBMENUTWO() {
    echo -e -n "\n\t ${GREEN}SubMENU 2 OPTIONS:${NC} \n"
    echo -e -n "
\t1. MENU 2 SubMenu 1
\t2. MENU 2 SubMenu 2
\t3. MENU 2 SubMenu 3    ${RED}
\n\t0. Back              ${NC}\n";
} 

##   subMENU 3
function SUBMENUTHREE() {
  echo -e "\n\t ${GREEN}SubMENU 3 OPTIONS:${NC} \n"
  echo -e -n "
\t1. MENU 3 SubMenu 1
\t2. MENU 3 SubMenu 2
\t3. MENU 3 SubMenu 3
${RED}\n\t0. Back ${NC}\n";
} 

#--------------------------
while :
do
showBanner

MAINMENU
echo -n -e "\n\tSelection: "
read -n1 opt
a=true;
case $opt in

# 1 ----------------------------
1) echo -e "==== Create SSH key ===="
while :
do
showBanner

SUBMENUONE
echo -n -e "\n\tSelection: "
read -n1 opt;
case $opt in
      1) TKEY="ed25519" && OnRUN ;;
      2) TKEY="rsa" && OnRUN ;;
      3) TKEY="dsa" && OnRUN ;;
      4) TKEY="ecdsa" && OnRUN ;;
      5) TKEY="eddsa" && OffRUN ;;
      /q | q | 0) echo -en "${RED}Quit..${NC}"; break ;;
      *) ;;
esac
done
;;

# 2 ----------------------------
2) echo -e "# submenu: MENU 2"
while :
do
showBanner
SUBMENUTWO
echo -n -e "\n\tSelection: "
read -n1 opt;
case $opt in
      1) echo -e "MENU 2 - SUBmenu 1" ;;
      2) echo -e "MENU 2 - SUBmenu 2" ;;
      3) echo -e "MENU 2 - SUBmenu 3" ;;
      /q | q | 0)break;;
      *) ;;
esac
done
;;


# 3 ----------------------------
3) echo -e "# submenu: MEMU 3"
while :
do
showBanner
SUBMENUTHREE
echo -n -e "\n\tSelection: "
read -n1 opt;
case $opt in
      1) echo -e "MENU 3 - SUBmenu 1" ;;
      2) echo -e "MENU 3 - SUBmenu 2" ;;
      3) echo -e "MENU 3 - SUBmenu 3" ;;
      /q | q | 0) break ;;
      *) ;;
esac
done
;;
      /q | q | 0) echo; break ;;
      *) ;;
esac
done
echo "Quit...";
clear;



};
RUNING

# exit 1
