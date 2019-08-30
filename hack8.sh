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
printf  "\e[32m[Coded by]: ${RED}https://vk.com/hack8\n\e[35m"

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

nslookup_all() {
	print_banner
	echo -e '\e[96m 00:[back]\n 01:dns\n 02:mail\e[0m'
	read -p $'\e[35m шо нужно? ' site
	if [ $site == '1' ] || [ $site == '01' ]
	then
	print_banner
	echo -e '\e[31m DNS\e[0m'
	 read -p $'\e[32mGive me target(example:  target.com):' site
	nslookup -query=ns $site
	elif [ $site == '2' ] || [ $site == '02' ]
	then 
	echo 'nslookup2'	
	 read -p $'\e[32mGive me target(example:  target.com):' site
	print_banner
	echo -e '\e[31m Mail\e[0m'
		nslookup -query=mx $site
	
	elif [ $site == '0' ] || [ $site == '00' ]
	then	
		bash hack8.sh
	else 
	  echo 'gg'
	fi
}

echo -e "${CYAN} 01:Use\n 02:Install"

read -p $'\e[35mchoose the number: \e[0m' choose
if [ $choose == '1' ] || [ $choose == '01' ]
then
	print_banner	
	echo -e "\e[96m 00:[back]\n 01:nmap                 проверить открытые порты\n 02:wpscan               посмотрит уязвимости если сайт стоит на вп\n 03:nikto                сканирует сайт на наличие уязвимостей\n 04:dirb                 ищет дирректории на сайте\n 05:sqlmap               тут все понятно "
	echo -e "\e[96m 06:change mac-adres     поменяет твой мак адресс на рандомный\n 07:crunch               создать словарь для брута\n 08:update               обновись\n 09:uniscan              сканер на наличие уязвимостей\n 10:check Cms            посмотришь о сайте там информацию\n 11:find mail            найдет емайлы на сайте\n 12:ping                 узнает ip сайта\n 13:info Bankcard        найдет самую базовую информацию о банк карте\n 14:nslookup             найдет  днс ip адреса и почтовые"
	
	 read -p $'\e[35mchoose the number: \e[0m' use
	if [ $use == '0'  ] || [ $use == '00' ]
	then 
	bash hack8.sh
	elif  [ $use == '1'  ] || [ $use == '01'  ]
	then 
	  print_banner
	 echo 'Nmap'
	 echo -e '\e[32mGive me target(example:  target.com): '
	  read site
	  nmap -A $site
	elif [ $use == '2'  ] || [ $use == '02'  ]
	then
	 print_banner
	 echo 'Wpscan'
	 echo -e '\e[32mGive me target(example:  target.com): '
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
	elif [ $use == '9'  ] || [ $use == '09'  ]
	then 
	echo 'Crunch'
	echo -e '\e[32mGive me target(example:  target.com): '
	read site 
	uniscan -u $site -qweds
	elif [ $use == '10'  ]
	then 
	read -p $'\e[32mGive me target(example:  target.com): ' site
	firefox http://whois.domaintools.com/$site
	elif [ $use == '11'  ] 
	then 
	read -p $'\e[31mGive me target: \e[0m' site
	theharvester -d $site -b all -l 800
	elif [ $use == '12'  ]
	then
	read -p $'\e[32mGive me target(example:  target.com): ' site
	ping $site
	elif [ $use == '13'  ] 
	then
	rm -rf card.txt
	read -p $'\e[35mGive me Card: \e[0m' card
	curl "https://lookup.binlist.net/$card" | jq '.type, .brand, .bank' > card.txt
	print_banner	
	cat card.txt	
	elif [ $use == '14'  ]
	then
	nslookup_all 
	else
	   echo -e '\e[32mНе то написал попробуй еще'
	fi
elif [ $choose == '2' ] || [ $choose == '02' ]
then	
	print_banner
	echo -e '\e[96m 00:[back]\n 01:install Vuln nmap               будешь сканировать nmap и сразу увидишь уязвимости \n 02:install Wifite2                 установишь и проверяй на безопасность соседей\n 03:install rapid scan              достаточно мощьный пентест сайтов  советую)\n 04:install Infoga find email       иноврмация по емайл\n 05:install Phone infoga            пробив телефона\n 06:install sherlock                пробив по логинам\n 07:install ngrok                 стартанет ngrok'	
	read -p $'\e[95mchoose the number:' ins
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
	echo -e '\e[95mGive me target(example:  target.com): '
	read $site
	python rapidscan.py $site
		
	elif [ $ins == '4'  ] || [ $ins == '04' ]
	then
	echo -e "\e[91mInfoga \e[0m" 
	git clone https://github.com/m4ll0k/Infoga.git
	cd Infoga
	python setup.py install
	python infoga.py
	echo -e "\e[33m success \e[0m"
	
	elif [ $ins == '5'  ] || [ $ins == '05' ]
	then 
	git clone https://github.com/sundowndev/PhoneInfoga.git
	cd PhoneInfoga
	python3 -m pip install -r requirements.txt
	chmod +x phoneinfoga,py	
	python3 phoneinfoga,py
	elif [ $ins == '6'  ] || [ $ins == '06' ]
	then
	git clone https://github.com/sherlock-project/sherlock.git
	cd sherlock
	python3 -m pip install -r requirements.txt
	python3 sherlock.py --help
	elif [ $ins == '7'  ] || [ $ins == '07' ]
	then
	print_banner
	echo 'неволнуйся токен я уже тебе выдам'
	service apache2 start
	cd /usr/bin/
	wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
	unzip ngrok-stable-linux-amd64.zip	
	ngrok authtoken 1Q8zWq3BMaNJLQmDY1yKDCTWtro_EMzcfc62c8MwCiQywcP3
	ngrok http 80	
	firefox http://127.0.0.1:4040/inspect/http	
	else
	 echo -e '\e[32mWrite normalno'
	fi
else
  echo -e '\e[32mWrite normalno'
fi
