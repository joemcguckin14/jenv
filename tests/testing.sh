assert_equal () {
    if [ "$1" = "$2" ]; then
        echo "ASSERTION PASSED: $1 == $2"
    else
        echo "FAILED: expected ($1) to equal ($2)"
    fi
}