#! /bin/sh

echo "Installing shadowsocks-libev..."
apt update
apt install shadowsocks-libev -y

echo "Configuring..."
echo -n "Input your server ip address: "
read server
echo -n "Input your server port: "
read server_port
echo -n "Input your password: "
read password

echo "{
    \"server\":\"$server\",
    \"server_port\":$server_port,
    \"local_port\":1080,
    \"password\":\"$password\",
    \"timeout\":60,
    \"method\":\"chacha20-ietf-poly1305\"
}" > /etc/shadowsocks-libev/config.json

echo "Restarting service..."
service shadowsocks-libev restart

echo "Done!"
