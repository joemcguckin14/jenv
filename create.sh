source $JENV_WORKING_DIR/logging.sh
source $JENV_WORKING_DIR/use.sh

_jenv_create () {
    if [ "" != "$1" ]; then
        _jenv_resolve_paths $1
        mkdir -p $_jenv_env_path
        mkdir $_jenv_scripts_path
        touch $_jenv_pre_use_path
        touch $_jenv_post_unuse_path
    else
        _log_line ERROR "Must provide name for environment"
    fi
}