#Create container images
echo "$(date) Downloading files..."
curl -fsS -o Dockerfile https://raw.githubusercontent.com/p1nrojas/pk-sdnlab-stdalone/master/install/Dockerfile 
curl -fsS -o vimrc https://raw.githubusercontent.com/p1nrojas/pk-sdnlab-stdalone/master/install/vimrc 
curl -fsS -o bash_profile https://raw.githubusercontent.com/p1nrojas/pk-sdnlab-stdalone/master/install/bash_profile 
curl -fsS -o setup.sh https://raw.githubusercontent.com/p1nrojas/pk-sdnlab-stdalone/master/install/setup.sh 
