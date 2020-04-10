working_dir=$(dirname $0)
source $working_dir/logging.sh

_jenv_create () {
    if [ "" != "$1" ]; then
        env_dir=${JENV_DEV_ENV_DIR:-~/.dev_envs/}
        new_env_dir=$env_dir$1
        mkdir $new_env_dir
        mkdir $new_env_dir/scripts
        touch $new_env_dir/pre_use
        touch $new_env_dir/post_unuse
    else
        _log_line ERROR "Must provide name for environment"
    fi
}