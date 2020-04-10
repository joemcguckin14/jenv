### root usage
_jenv_usage () {
  echo "\\nUsage: jenv <command> [arguments]\n"
  echo "    create <environment_name> [options]              Create a new environment"
  echo "    use <environment_name> [options]                 Switch current shell to use the specified environment"
  echo "    unuse [options]                                  Switch the current shell to stop using the current environment"
  echo "    ls | list [options]                              List all environments"
  echo "    run <environment_name> <script_name> [options]   Run a script in a specified environment"
  echo "    view <environment_name> <script_name> [options]  View a script in a specified environment"
    echo "\n"
}

### run usage
_jenv_usage_run_script () {
    echo "\nUsage: jenv run <script> [-vl] [-e env_name]\n"
    echo "    -v             Print out verbose messaging"
    echo "    -e <env_name>  Use specified environment instead of the current one"
    echo "    -l             Script will be run using the 'source' command"
    echo "\n"
}