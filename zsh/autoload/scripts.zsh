function scripts() {
  OPTIONS=""
  if [ -f Makefile ]; then
    for f in $(cat Makefile | grep -e "^[a-zA-Z0-9-]*:" | sed "s/:.*//g"); do
      OPTIONS="${OPTIONS}make ${f}\n"
    done
  fi
  for f in $(find . -maxdepth 1 | grep -E ".+\.(zsh|bash|sh)(\n|$)"); do
    OPTIONS="${OPTIONS}${f}\n"
  done
  if [ -f package.json ]; then
    if [ -f yarn.lock ]; then
      for f in $(cat package.json | jq '.scripts | keys | .[]' -r); do
        OPTIONS="${OPTIONS}yarn run ${f}\n"
      done
    else
      for f in $(cat package.json | jq '.scripts | keys | .[]' -r); do
        OPTIONS="${OPTIONS}npm run ${f}\n"
      done
    fi
  fi

  if [ $1 ]; then
    SCRIPT=$(echo $OPTIONS | grep -ve "^$" | fzf -1 --query $1)
  else
    SCRIPT=$(echo $OPTIONS | grep -ve "^$" | fzf)
  fi

  if [ $SCRIPT ]; then
    echo "> $SCRIPT"
    print -s $SCRIPT
    eval $SCRIPT
  else
    echo "No script selected. Exiting"
  fi
}
