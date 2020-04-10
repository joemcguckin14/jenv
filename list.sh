_jenv_list () {
    env_dir=${DEV_ENV_DIR:-~/.dev_envs/}
    find $env_dir* -type d -maxdepth 0 -exec basename {} \;
}