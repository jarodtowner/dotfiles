function note() {
  if [ $1 ]
  then
    notefile=$XDG_DATA_HOME/notes/$1
    mkdir -p "${notefile%/*}" && touch "$notefile"
  else
    notefile="$XDG_DATA_HOME/notes/Note-$(date +%F).md"
    if [ ! -f $notefile ]; then
      echo "# $(date +"%a %d %b %Y")" > $notefile
    fi
  fi
  nvim -c "norm G" $notefile "+cd ${XDG_DATA_HOME}/notes"
}

function notes() {
  nvim $XDG_DATA_HOME/notes "+cd ${XDG_DATA_HOME}/notes"
}
