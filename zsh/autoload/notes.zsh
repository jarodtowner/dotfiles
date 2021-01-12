function note() {
  notefile="$XDG_DATA_HOME/notes/Note-$(date +%F).md"
  if [ ! -f $notefile ]; then
    echo "# $(date +"%a %d %b %Y")" > $notefile
  fi
  nvim -c "norm G" $notefile
}
