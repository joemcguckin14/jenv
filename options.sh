_jenv_reset_vars () {
    unset _jenv_attempting_env
    unset _jenv_dev_environment
    unset _jenv_verbose
    unset _jenv_debug
    unset _jenv_use_local_shell
}

_jenv_run_script_options () {
    _jenv_reset_vars
    while getopts ":vde:l" opt; do
        case ${opt} in
            e )
                _jenv_attempting_env=true
                _jenv_dev_environment=$OPTARG
                ;;
            v )
                _jenv_verbose=true
                ;;
            d )
                _jenv_debug=true
                ;;
            l )
                _jenv_use_local_shell=true
                ;;
            \? )
                echo "Invalid option: $OPTARG" 1>&2
                ;;
            : )
                echo "Invalid option: $OPTARG requires an argument" 1>&2
                ;;
            * )
                echo $opt
                ;;
        esac
    done
}