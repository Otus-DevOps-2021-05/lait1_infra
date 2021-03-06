cat <<EOF> setupvpn.sh
#!/bin/bash
echo "deb http://repo.pritunl.com/stable/apt focal main" | sudo tee /etc/apt/sources.list.d/pritunl.list
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
 apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
apt-get --assume-yes update
apt-get --assume-yes upgrade
apt-get --assume-yes install pritunl mongodb-server
systemctl start pritunl mongodb-server
systemctl enable pritunl mongodb-server
EOF
