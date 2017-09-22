#Create container images
echo "$(date) Downloading files..."
curl -fsS -o Dockerfile https://raw.githubusercontent.com/p1nrojas/pk-nuage-multi/master/install/Dockerfile 
curl -fsS -o vimrc https://raw.githubusercontent.com/p1nrojas/pk-nuage-multi/master/install/vimrc 
curl -fsS -o bash_profile https://raw.githubusercontent.com/p1nrojas/pk-nuage-multi/master/install/bash_profile 
curl -fsS -o setup.sh https://raw.githubusercontent.com/p1nrojas/pk-nuage-multi/master/install/setup.sh 

