npm_scripts() {
	if [ -f package.json ]; then
		list=$(cat package.json | jq '.scripts' | jq -r 'keys[]') 
		if [ $1 ]; then
			if [ $1 = '-h' ] || [ $1 = '--help' ]; then
				echo "Usage: npm_scripts [filter]\n\n	filter	Only show scripts that contain this string"
				return 0
			fi
			list=$(echo $list | grep $1)
		fi
		if [ ! $list ]; then
			echo "No Results"
			return 0
		fi
		if [ $(echo $list | wc -l) = '1' ]; then
			selection="1"
		else
			echo $list | grep -n '^' | sed 's/:/:	/'
			echo "\nType the number of the selected script (Leave blank to quit):"
			read selection
		fi
		if [ $selection ]; then
			command=$(echo $list | sed "${selection}q;d")
			echo "> npm run ${command}"
			echo $command | xargs npm run
		else
			echo "No Selection. Quitting"
		fi
	else
		echo "Cannot find package.json"
	fi
}
