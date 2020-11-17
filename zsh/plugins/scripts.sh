function scripts() {
  if [ -f package.json ]; then
    SCRIPT=$(cat package.json | jq '.scripts | keys | .[]' -r | fzf)
    echo "> npm run $SCRIPT"
    npm run $SCRIPT
  elif [ -f Makefile ]; then
    SCRIPT=$(cat Makefile | grep -e "^[a-zA-Z0-9]*:" | sed "s/:.*//g" | fzf)
    echo "> make $SCRIPT"
    make $SCRIPT
  fi
}
