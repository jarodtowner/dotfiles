function scripts() {
  if [ -f package.json ]; then
    SCRIPT=$(cat package.json | jq '.scripts | keys | .[]' -r | fzf)
    if [ -f yarn.lock ]; then
      COMMAND="yarn run $SCRIPT"
    else
      COMMAND="npm run $SCRIPT"
    fi
  elif [ -f Makefile ]; then
    SCRIPT=$(cat Makefile | grep -e "^[a-zA-Z0-9]*:" | sed "s/:.*//g" | fzf)
    COMMAND="make $SCRIPT"
  fi
  if [ $SCRIPT ]; then
    echo "> $COMMAND"
    print -s $COMMAND
    eval $COMMAND
  else
    echo "No script selected. Exited."
  fi
}
