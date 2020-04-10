- [Installation](#installation)
- [Configuration through environment variables](#configuration-through-environment-variables)
- [Environment Configuration](#environment-configuration)
    - [DIRECTORY STRUCTURE](#directory-structure)
    - [Environment Configuration Files](#environment-configuration-files)
- [Available Commands](#available-commands)

## Installation

First `cd` into the location you would like to install jenv

Ex:
```bash
cd ~
```

Next clone the repo with:
```bash
git clone git@github.com:joemcguckin14/jenv.git
```
or
```bash
git clone https://github.com/joemcguckin14/jenv.git
```

Then add a source command to your shells rc folder (**~/.bashrc** for most people):

`~.bashrc`
```bash
echo "source <path to jenv>/jenv_source"
```

*OPTIONAL*: If you would like to have the current environment on your shell, also
add the following line to your rc file:

`~.bashrc`
```bash
jenv_prepend_to_prompt
```

## Configuration through environment variables

ENVIRONMENT VARIABLES

| VARIABLE         | DESCRIPTION                                               | DEFAULT     |
|------------------|-----------------------------------------------------------|-------------|
| JENV_DEV_ENV_DIR | The directory in which all of you environments are stored | ~/.dev_envs/|

## Environment Configuration

#### DIRECTORY STRUCTURE

```
<enviornment_directory>
    |_ <environment_name>
        |_ pre_use
        |_ post_unuse
        |_ scripts
            |_ <script_name>
            |_ <script_name>
    |_ <environment_name>
        |_ pre_use
        |_ post_unuse
        |_ scripts
            |_ <script_name>
            |_ <script_name>
```

#### Environment Configuration Files

*pre_use* - Ran when the `jenv use` command is run to enter an environment
*post_unuse* - Ran directly after tht `jenv unsuse` command is run to leave an environment


## Available Commands

`jenv create` - Creates an environment of the structure described in [Directory Structure](#directory-structure)
`jenv use` - Starts using an environment in the current shell
`jenv unuse` - Stops the current shell from using an environment
`jenv run <script_name>` - Runs a specified script
`jenv view <script_name>` - Prints a specified script
`jenv list` or `jenv ls` - Lists all available JENV environments
`jenv current` - Prints out the current JENV environment