#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'
GRAY='\033[1;30m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
print_banner() {

clear

cat << "EOF"

        __  __           __   ____
       / / / /___ ______/ /__( __ )
      / /_/ / __ `/ ___/ //_/ __  |
     / __  / /_/ / /__/ ,< / /_/ /
    /_/ /_/\__,_/\___/_/|_|\____/


EOF
printf  "\e[32m[Coded by]: ${RED}https://vk.com/hack8\n"
}
print_banner


print_nmapscript() {
cat << 'EOF'

	Example
                nmap --script vulscan --script-args vulscandb=database_name -sV  youtarget.com
                nmap --script vulscan --script-args vulscandb=scipvuldb.csv -sV  youtarget.com
                nmap --script vulscan --script-args vulscandb=exploitdb.csv -sV youtarget.com
                nmap --script vulscan --script-args vulscandb=securitytracker.csv -sV  youtarget.com


EOF
}





echo -e "${CYAN} 01:Use\n 02:Install"
echo -e "\e[35mchoose the number: "
read choose
if [ $choose == '1' ] || [ $choose == '01' ]
then
	print_banner	
	echo -e "\e[96m 00:[back]\n 01:nmap\n 02:wpscan\n 03:nikto\n 04:dirb\n 05:sqlmap "
	echo -e "\e[96m 06:change mac-adres\n 07:создать словарь для брута\n 08:update"
	echo -e "${GREEN}choose the number: "
	read use
	if [ $use == '0'  ] || [ $use == '00' ]
	then 
	bash hack8.sh
	elif  [ $use == '1'  ] || [ $use == '01'  ]
	then 
	  print_banner
	 echo 'Nmap'
	 echo -e '\e[32mGive me target(example:  target.com):'
	  read site
	  nmap -A $site
	elif [ $use == '2'  ] || [ $use == '02'  ]
	then
	 print_banner
	 echo 'Wpscan'
	 echo -e '\e[32mGive me target(example:  target.com):'
	  read site
	  wpscan --update
	  wpscan -u $site -e 
	elif [ $use == '3'  ] || [ $use == '03'  ]
	then
	 print_banner
	 echo 'Nikto'
	 echo -e '\e[32mGive me target(example:  target.com): '
         read site
	nikto -h $site
	elif [ $use == '4'  ] || [ $use == '04'  ]
	then
	 print_banner
	 echo 'Dirb'
	 echo -e '\e[32mGive me target(example:  http://target.com): '
         read site
	 dirb $site
	elif [ $use == '5'  ] || [ $use == '05'  ]
	then
	 print_banner
	 echo 'Sqlmap'
	 echo -e '\e[32mGive me target(example:  http://target.com/page.php?id=1): '
         read site
	sqlmap -u $site --batch --random-agent --dbs
	elif [ $use == '6'  ] || [ $use == '06'  ]
	then
	echo -e 'работает только с вайфаем \e[1m192.168.0.1\e[21m '
	 ifconfig wlan0 down
	 macchanger -r wlan0
	 ifconfig wlan0 up
        echo -e '\e[33mSuccsess\e[21m'
	elif [ $use == '7'  ] || [ $use == '07'  ]
	then
	print_banner
	 echo 'Crunch'
	echo 'укажите минимальную длину пароля(цифру)'
	read min
	echo 'укажите максимальную длину пароля(цифру)'
	read max
	echo -e 'из каких букв или цифр должен состоять словарь?\n ( указывать без пробелов )'
	read $pass
	echo 'пароль будет сгенерирован по этому пути /root/Desktop/hack8.txt'
	crunch $min $max $pass -o /root/Desktop/hack8.txt
        elif [ $use == '8'  ] || [ $use == '08'  ]
	then
	apt update
	else
	echo -e '\e[32mWrite normalno'
	fi
elif [ $choose == '2' ] || [ $choose == '02' ]
then	
	print_banner
	echo -e '\e[96m 00:[back]\n 01:install Vuln nmap\n 02:install хак вайфай Wifite2\n 03:install rapid scan\n'	
	echo -e "${GREEN}choose the number: "
	read ins
	if [ $ins == '0'  ] || [ $ins == '00' ]
	then 
	bash hack8.sh

	elif [ $ins == '1'  ] || [ $ins == '01' ]
	then 
	 cd /usr/share/nmap/scripts/
	 git clone https://github.com/vulnersCom/nmap-vulners.git
	 git clone https://github.com/scipag/vulscan.git
	printf  "\e[32m[Coded by]: ${RED}https://vk.com/hack8\n"
	echo -e '\e[35mSuccsess'
	print_nmapscript
	elif [ $ins == '2'  ] || [ $ins == '02' ]
	then 
		git clone https://github.com/derv82/wifite2.git
		echo 'напиши cd wifite'
		echo 'напиши ./Wifite'
	elif [ $ins == '3'  ] || [ $ins == '03' ]
	then 
	print_banner
	wget -O rapidscan.py https://raw.githubusercontent.com/skavngr/rapidscan/master/rapidscan.py && chmod +x rapidscan.py
	echo -e ' \e[95mGive me target(example:  target.com):'
	read $site
	python rapidscan.py $site
	else
	echo -e '\e[32mWrite normalno'
	fi
else
  echo -e '\e[32mWrite normalno'
fi
