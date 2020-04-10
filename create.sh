working_dir=$(dirname $0)
source $working_dir/logging.sh
source $working_dir/use.sh

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