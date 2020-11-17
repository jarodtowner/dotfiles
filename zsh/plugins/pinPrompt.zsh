if [ ! $PROMPT_POSITION ]; then
	PROMPT_POSITION="default"
fi

custom_clear() {
	if [ $PROMPT_POSITION = "bottom" ]; then
		for i in {1..$LINES}; do
			echo
		done
	elif [ $PROMPT_POSITION = "default" ]; then
		clear
	fi
}

alias clear="custom_clear"