_jenv_list () {
    env_dir=${JENV_DEV_ENV_DIR:-~/.dev_envs/}
    find $env_dir* -type d -maxdepth 0 -exec basename {} \;
}