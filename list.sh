_jenv_list () {
    _jenv_env_dir=${JENV_DEV_ENV_DIR:-~/.dev_envs/}
    find $_jenv_env_dir* -type d -maxdepth 0 -exec basename {} \;
}