source $JENV_WORKING_DIR/use.sh
source $JENV_WORKING_DIR/usage.sh
source $JENV_WORKING_DIR/options.sh

_jenv_run_script () {
  _jenv_env_dir=${JENV_DEV_ENV_DIR:-~/.dev_envs/}
  if [ "" = "$1" ]; then
    _jenv_usage_run_script
    return
  fi
  _jenv_run_script_options ${@:2}
  if [ "$_jenv_attempting_env" = true ] && [ "" = "$_jenv_dev_environment" ]; then
    _log_line ERROR "No environment specified"
    _log_line DEBUG "No environment specified because (_jenv_attmepting_env=$_jenv_attempting_env, _jenv_dev_environment=$_jenv_dev_environment)"
    _jenv_usage_run_script
  elif [ "" != "$_jenv_dev_environment" ]; then
    _log_line DEBUG "Using environment specified by '-e': $_jenv_dev_environment"
  elif [ "" != "$CURRENT_DEV_VIRTUAL_ENVIRONMENT" ]; then
    _log_line DEBUG "Using current virtual environment from env: $CURRENT_DEV_VIRTUAL_ENVIRONMENT"
    _jenv_dev_environment=$CURRENT_DEV_VIRTUAL_ENVIRONMENT
  else
    _log_line ERROR "No environment specified"
    _jenv_usage_run_script
    return
  fi
  _jenv_resolve_paths $_jenv_dev_environment
  if [[ -d $_jenv_env_path ]]; then
    if [[ -d $_jenv_scripts_path ]] && [ "" != "$(ls $_jenv_scripts_path)" ]; then
        if [ "" != "$1" ]; then
            script_path=$_jenv_scripts_path/$1
            _log_line DEBUG "Looking for script at: $script_path"
            if [[ -f $script_path ]]; then
                if [ "$_jenv_use_local_shell" = true ]; then
                    _log_line DEBUG "Running script in local shell"
                    _jenv_use $_jenv_dev_environment
                    if [ $? = 39 ]; then
                        _log_line DEBUG "Successfully used environment: $_jenv_dev_environment"
                        source $script_path
                    else
                        _log_line ERROR "Failed to use environment: $_jenv_dev_environment"
                    fi
                else
                    _log_line DEBUG "Running script as bash script"
                    bash $JENV_WORKING_DIR/runner.sh $_jenv_pre_use_path $script_path $_jenv_post_unuse_path
                fi
            else
                _log_line ERROR "$1 is not a valid script in $_jenv_dev_environment"
                _log_line INFO "[Try]"
                find $_jenv_scripts_path/* -type f -maxdepth 0 -exec basename {} \;
            fi
        else
            _log_line ERROR "Must supply an a script to run"
            _log_line INFO "$_jenv_dev_environment has the following scripts available:"
            _log_line INFO "-------------------"
            find $_jenv_scripts_path* -type d -maxdepth 0 -exec echo "    $(basename {})" \;
            _log_line INFO "-------------------"
        fi
    else
        _log_line ERROR "$_jenv_dev_environment has no scripts available to run"
    fi
  else
    _log_line ERROR "Environment does not exist: $_jenv_dev_environment"
    _log_line INFO "[Try]"
    find $_jenv_env_dir* -type d -maxdepth 0 -exec basename {} \;
  fi
}

_jenv_view_script () {
  _jenv_env_dir=${JENV_DEV_ENV_DIR:-~/.dev_envs/}
  jenv use $1
  if [ $? = 39 ]; then
    script_dir=$_jenv_env_dir$1/scripts/
    if [[ -d $script_dir ]] && [ "" != "$(ls $script_dir)" ]; then
        if [ "" != "$2" ]; then
            script_path=$script_dir$2
            if [[ -f $script_path ]]; then
                cat $script_path
            else
                _log_line ERROR "$2 is not a valid script in $2"
            fi
        else
            _log_line ERROR "Must supply an a script to view"
            _log_line INFO "$1 has the following scripts available:"
            _log_line INFO "-------------------"
            find $script_dir* -type d -maxdepth 0 -exec basename {} \;
            _log_line INFO "-------------------"
        fi
    else
        _log_line ERROR "$1 has no scripts available to view"
    fi
  fi
}