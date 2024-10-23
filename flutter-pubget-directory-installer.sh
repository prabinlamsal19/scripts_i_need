mv flutter-pubget-directory.sh ~/bin/
chmod +x ~/bin/flutter-pubget-directory.sh 

if ! echo "$PATH" | grep -q "$HOME/bin"; then 
	echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
	echo 'Please run 'source ~/.bashrc' to update your PATH."
fi

echo "Installation complete! You can run the script using 'flutter-pub-get-all'"

