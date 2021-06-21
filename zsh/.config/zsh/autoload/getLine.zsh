function getLine() {
    if [ $2 ]; then
        head -n $2 | tail -n $(( $2 - $1 + 1 ))
    fi
    if [ $1 ]; then
        head -n $1 | tail -n 1
    fi
}
