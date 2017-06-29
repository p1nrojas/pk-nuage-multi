#Create container images
echo "$(date) Downloading files..."
curl -fsS -o Dockerfile https://raw.githubusercontent.com/p1nrojas/pk-nuage-multi/master/install/Dockerfile 
curl -fsS -o vimrc https://raw.githubusercontent.com/p1nrojas/pk-nuage-multi/master/install/vimrc 
curl -fsS -o bash_profile https://raw.githubusercontent.com/p1nrojas/pk-nuage-multi/master/install/bash_profile 
curl -fsS -o setup.sh https://raw.githubusercontent.com/p1nrojas/pk-nuage-multi/master/install/setup.sh 

#Asking packet.net token
echo ">>"
echo ">>"
echo -n "Enter packet.net token (i.e MaKWKw8AxUASBTE7JKj1y7eM7qW4o9Sd ) and press [ENTER]: "
read packet_token
if [[ $packet_token =~ ^[A-Za-z0-9]{32}$ ]]; then echo $packet_token > .packet_token; else echo "Format isn't right, bye!"; exit 1; fi

#Asking packet.net project id
echo ">>"
echo ">>"
echo -n "Enter packet.net project ID (i.e. bed437ce-6ae7-6b3a-a8e0-163e13a12a32 ) and press [ENTER]: "
read project_id
if [[ $project_id =~ ^[a-z0-9]*-[a-z0-9]*-[a-z0-9]*-[a-z0-9]*-[a-z0-9]*$ ]]; then echo $project_id > .packet_project_id; else echo "Format isn't right, bye!"; exit 1; fi

echo ">>"
echo ">>"
echo -n "Enter VSD license code ( warning: remove line breaks and spaces ) and press [ENTER]: "
read nuage_license_key
if [[ $nuage_license_key =~ \ + ]]; then echo "Format isn't right, bye!"; else echo $nuage_license_key > .nuage_license_key; fi
