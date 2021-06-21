# Encrypt a file with a password
encrypt() {
	echo "Enter Password:"
	read -s temp_pass
	echo $temp_pass | openssl enc -in $1 -aes-256-cbc -pass stdin > $2
	temp_pass=""
}

# Decrypt a file with a password
decrypt() {
	echo "Enter Password:"
	read -s temp_pass
	echo $temp_pass | openssl enc -in $1 -d -aes-256-cbc -pass stdin > $2
	temp_pass=""
}
