# sovcoin wallet update script
# Edited by Robbowz
VERSION="0.1"
NODEPORT='11888'
RPCPORT='3322'

function print_greeting() {
	echo -e "[0;35m sov wallet update script[0m\n"
}

function stop_services() {
	echo "Stopping services..."
	sudo killall sovd
	echo "Done..."
}


function download_wallet() {
	echo "Downloading wallet..."
	mkdir /root/sov
    	cd sov
	mkdir /root/.sovcore
	wget https://github.com/SovCoinX/SovCoin/releases/download/1.3.1/sovcore-1.3.1-linux64.tar.gz
	tar -xvf sovcore-1.3.1-linux64.tar.gz
	rm /root/sov/sovcore-1.3.1-linux64.tar.gz
	cp sovcore-1.3.1/bin/sovd /root/sov/sovd
	cp sovcore-1.3.1/bin/sov-cli /root/sov/sov-cli
	rm -rf sovcore-1.3.1/bin/
	chmod +x /root/sov/
	chmod +x /root/sov/sovd
	chmod +x /root/sov/sov-cli
	/root/sov/sovd -daemon
	echo "Done..."
}


# main routine
print_greeting
stop_services
download_wallet

echo "All done!"
cd ~/
sudo rm /root/sov_wallet_update.sh
