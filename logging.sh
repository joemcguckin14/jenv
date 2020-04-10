_log_line () {
  if [ "$_jenv_debug" = true ]; then
    _log_timestamp="[ $(date +%T) ] "
  else
    _log_timestamp=
  fi
  type=${1:-INFO}
  if [ "ERROR" = $1 ]; then
    echo "${_log_timestamp}ERROR: $2"
  elif [ "DEBUG" = $1 ]; then
    if [ "$_jenv_debug" = true ]; then
      echo "${_log_timestamp}DEBUG: $2"
    fi
  elif [ "VERBOSE" = $1 ]; then
    if [ "$_jenv_verbose" = true ]; then
      echo "${_log_timestamp}$2"
    fi
  else
    echo ${_log_timestamp}$2
  fi
  unset _log_timestamp
}