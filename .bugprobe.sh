#!/bin/bash

by="\033[1;33m"
bye="\033[1;00m"
br="\033[1;31m"
bre="\033[1;00m"
blink="\e[5m"

printf ""$by"
██████╗ ██╗   ██╗ ██████╗       ██████╗ ██████╗  ██████╗ ██████╗ ███████╗
██╔══██╗██║   ██║██╔════╝       ██╔══██╗██╔══██╗██╔═══██╗██╔══██╗██╔════╝
██████╔╝██║   ██║██║  ███╗█████╗██████╔╝██████╔╝██║   ██║██████╔╝█████╗  
██╔══██╗██║   ██║██║   ██║╚════╝██╔═══╝ ██╔══██╗██║   ██║██╔══██╗██╔══╝  
██████╔╝╚██████╔╝╚██████╔╝      ██║     ██║  ██║╚██████╔╝██████╔╝███████╗
╚═════╝  ╚═════╝  ╚═════╝       ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝
										V3.0
										Coded By Neh Patel with ❤️
                                                                         
                                                                                     
"$bye""


printf ""$br"
Twitter :-   https://twitter.com/thecyberneh
Instagram :- https://www.instagram.com/thecyberneh/
Linkedin :-  https://www.linkedin.com/in/thenehpatel/
"$bre""




read -p "Enter Domain name without Https/www:  " DOMAIN 
echo -e "$by"  "$bye"
echo -e "$by" Domain is $DOMAIN "$bye"
mkdir "$DOMAIN"
cd "$DOMAIN"

echo -e "$by" ALL FILES WILL SAVE IN FOLDER : $DOMAIN "$bye"

echo -e "$by"  "$bye"
echo -e "$blink" "$br"EXECUTION OF THIS TOOL MAY TAKE SOME TIME BECAUSE IT GRAPS ALL URLS FROM ALL SUBDOMAIN SO BE PATIENT AND HAVE A COFFEE "$bre" "$blink"
subfinder -nW -d ${DOMAIN} &> /dev/null > .subdomain.txt


cat .subdomain.txt | httpx -mc 200 302 &> /dev/null > activeDomain.txt 
echo -e "$by"  "$bye"
echo -e "$by" Dead or Deactive subdomains are removed from file "subdomain.txt" and new results are saved in file activeDomain.txt  "$bye"


cat activeDomain.txt | gau &> /dev/null > .endpoints.txt
echo -e "$by"  "$bye"
echo -e "$by" Endpoints are collected from all active subdomain and saved in endpoints.txt "$bye"

cat .endpoints.txt | httpx -mc 200 302 &> /dev/null > activeEndpoints.txt
echo -e "$by"  "$bye"
echo -e "$by" Dead or Deactive endpoints are removed from file "endpoints.txt" and new results are saved in file activeEndpoints.txt  "$bye"
echo -e "$by"  "$bye"



while read -n1 -r -p "Do you want to scan all endpoints for specific vulnerability:   [y]es|[n]o" && [[ $REPLY != n ]]; do
  case $REPLY in
    y) echo "Yes";;
    n) echo "No";;
    *) echo "What?";;
  esac
  		echo -e "$by"SELECT VULNERABILITY "$bye"

		printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;91m xss\e[0m      \e[1;92m[\e[0m\e[1;77m08\e[0m\e[1;92m]\e[0m\e[1;91m lfi\e[0m   \n"                                
		printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;91m ssti\e[0m     \e[1;92m[\e[0m\e[1;77m09\e[0m\e[1;92m]\e[0m\e[1;91m interestingparams   \e[0m\n"
		printf "\e[1;92m[\e[0m\e[1;77m03\e[0m\e[1;92m]\e[0m\e[1;91m ssrf\e[0m     \e[1;92m[\e[0m\e[1;77m10\e[0m\e[1;92m]\e[0m\e[1;91m interestingsubs   \e[0m\n"
		printf "\e[1;92m[\e[0m\e[1;77m04\e[0m\e[1;92m]\e[0m\e[1;91m sqli\e[0m     \e[1;92m[\e[0m\e[1;77m11\e[0m\e[1;92m]\e[0m\e[1;91m interestingEXT  \e[0m\n"                
		printf "\e[1;92m[\e[0m\e[1;77m05\e[0m\e[1;92m]\e[0m\e[1;91m redirect\e[0m \e[1;92m[\e[0m\e[1;77m12\e[0m\e[1;92m]\e[0m\e[1;91m idor   \e[0m\n"                
		printf "\e[1;92m[\e[0m\e[1;77m06\e[0m\e[1;92m]\e[0m\e[1;91m rce\e[0m      \e[1;92m[\e[0m\e[1;77m13\e[0m\e[1;92m]\e[0m\e[1;91m debug_logic   \e[0m \n"
		printf "\e[1;92m[\e[0m\e[1;77m07\e[0m\e[1;92m]\e[0m\e[1;91m jsvar\e[0m \n"

		read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m\en' option

		if [[ $option == 1 || $option == 01 ]]; then
		cat activeEndpoints.txt | gf xss | kxss  &> /dev/null> xss.txt
		echo -e "$by" RESULTS SAVED IN FILE: xss.txt "$bye"




		elif [[ $option == 2 || $option == 02 ]]; then
		cat activeEndpoints.txt | gf ssti  &> /dev/null > ssti.txt
		echo -e "$by" RESULTS SAVED IN FILE:  ssti.txt "$bye"




		elif [[ $option == 3 || $option == 03 ]]; then
		cat activeEndpoints.txt | gf ssrf &> /dev/null > ssrf.txt
		echo -e "$by" RESULTS SAVED IN FILE:  ssrf.txt "$bye"




		elif [[ $option == 4 || $option == 04 ]]; then
		ccat activeEndpoints.txt | gf sqli &> /dev/null > sqli.txt
		echo -e "$by" RESULTS SAVED IN FILE:  sqli.txt "$bye"




		elif [[ $option == 5 || $option == 05 ]]; then
		cat activeEndpoints.txt | gf redirect &> /dev/null > redirect.txt
		echo -e "$by" RESULTS SAVED IN FILE:  redirect.txt "$bye"




		elif [[ $option == 6 || $option == 06 ]]; then
		cat activeEndpoints.txt | gf rce &> /dev/null > rce.txt
		echo -e "$by" RESULTS SAVED IN FILE:  rce.txt "$bye"




		elif [[ $option == 7 || $option == 07 ]]; then
		cat activeEndpoints.txt | gf jsvar &> /dev/null > jsvar.txt
		echo -e "$by" RESULTS SAVED IN FILE:  jsvar.txt "$bye"




		elif [[ $option == 8 || $option == 08 ]]; then
		cat activeEndpoints.txt | gf lfi &> /dev/null > lfi.txt
		echo -e "$by" RESULTS SAVED IN FILE:  lfi.txt "$bye"




		elif [[ $option == 9 || $option == 09 ]]; then
		cat activeEndpoints.txt | gf interestingparams &> /dev/null > interestingparams.txt
		echo -e "$by" RESULTS SAVED IN FILE:  interestingparams.txt "$bye"




		elif [[ $option == 10 ]]; then
		cat activeEndpoints.txt | gf interestingsubs &> /dev/null > interestingsubs.txt
		echo -e "$by" RESULTS SAVED IN FILE:  interestingsubs.txt "$bye"




		elif [[ $option == 11 ]]; then
		cat activeEndpoints.txt | gf interestingEXT &> /dev/null > interestingEXT.txt
		echo -e "$by" RESULTS SAVED IN FILE:  interestingEXT.txt "$bye"



		elif [[ $option == 12 ]]; then
		cat activeEndpoints.txt | gf idor &> /dev/null > idor.txt
		echo -e "$by" RESULTS SAVED IN FILE:  idor.txt "$bye"



		elif [[ $option == 13 ]]; then
		cat activeEndpoints.txt | gf debug_logic &> /dev/null > debug_logic.txt
		echo -e "$by" RESULTS SAVED IN FILE:  debug_logic.txt "$bye"


	fi

done
