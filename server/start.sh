#/usr/bin/bash

SERVER_DIRECTORY="${HOME}/server"
PLUGIN_DIRECTORY="${SERVER_DIRECTORY}/plugins"

# Delete server.pipe
cd $SERVER_DIRECTORY
rm server.pipe
mkfifo server.pipe

# Download & Enable Latest Plugin
cd $PLUGIN_DIRECTORY
sudo rm *.jar *.jar.*
curl -s https://api.github.com/repos/cookie-jar-smp/tpa-home-plugin/releases/latest | grep "browser_download_url.*jar" | cut -d : -f 2,3 | tr -d \" | sudo wget -qi -

# Start Server
cd $SERVER_DIRECTORY
sudo java -Xms7500M -Xmx7500M -jar server.jar --nogui < server.pipe > ../out 2>&1 &
sleep infinity > server.pipe &