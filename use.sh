working_dir=$(dirname $0)
source $working_dir/logging.sh
source $working_dir/options.sh

_jenv_resolve_paths () {
  env_dir=${JENV_DEV_ENV_DIR:-~/.dev_envs/}
  _jenv_env_path=$env_dir$1
  _log_line DEBUG "Resolved env path: $_jenv_env_path"
  _jenv_pre_use_path="$_jenv_env_path/pre_use"
  _log_line DEBUG "Resolved pre_use path: $_jenv_pre_use_path"
  _jenv_scripts_path="$_jenv_env_path/scripts"
  _log_line DEBUG "Resolved scripts path: $_jenv_scripts_path"
  _jenv_post_unuse_path="$_jenv_env_path/post_unuse"
  _log_line DEBUG "Resolved post_unuse path: $_jenv_post_unuse_path"
}

_jenv_use () {
  _jenv_run_script_options ${@:2}
  if [ "" != "$1" ]; then
    _jenv_resolve_paths $1
    if [[ -d $_jenv_env_path ]]; then
      _log_line DEBUG "Found env file: $_jenv_env_path"
      if [[ -f $_jenv_pre_use_path ]]; then
        _log_line DEBUG "Found pre_use file: $_jenv_pre_use_path"
        source $_jenv_pre_use_path
      else
        _log_line INFO "No pre_use script supplied: $_jenv_pre_use_path"
      fi
      export CURRENT_DEV_VIRTUAL_ENVIRONMENT=$1
      return 39
    else
      _log_line ERROR "Unable to find env: $1"
    fi
  else
    _log_line ERROR "Must supply an environment name as an argument"
    _log_line INFO "-------------------"
    find $env_dir* -type d -maxdepth 0 -exec basename {} \;
    _log_line INFO "-------------------"
  fi
}

_jenv_unuse () {
  env_dir=${JENV_DEV_ENV_DIR:-~/.dev_envs/}
  full_file_path=$env_dir$CURRENT_DEV_VIRTUAL_ENVIRONMENT
  if [[ -d $full_file_path ]] && [ "" != "$CURRENT_DEV_VIRTUAL_ENVIRONMENT" ]; then
    full_file_path="$full_file_path/post_unuse"
    if [[ -f $full_file_path ]]; then
      _log_line DEBUG "Found env file: $full_file_path"
      source $full_file_path
    else
      _log_line INFO "No post_unuse script supplied: $full_file_path"
    fi
    export CURRENT_DEV_VIRTUAL_ENVIRONMENT=""
  else
    _log_line ERROR "Unable to find env: $1"
  fi
}