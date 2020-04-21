- [About](#about)
- [Installation](#installation)
- [Configuration Through Environment Variables](#configuration-through-environment-variables)
- [Environment Configuration](#environment-configuration)
  - [Directory Structure](#directory-structure)
  - [Environment Configuration Files](#environment-configuration-files)
- [Available Commands](#available-commands)

## About

JENV is a environment configuration tool written in bash and meant to have minimal dependencies. It allows developers to have more control over their development environment when switching between projects and gives the ability to run scripts in environments that you are not current in.

## Installation

First `cd` into the location you would like to install jenv (Ex: `cd ~`)

Next clone the repo with:

```bash
git clone git@github.com:joemcguckin14/jenv.git
```

or

```bash
git clone https://github.com/joemcguckin14/jenv.git
```

Then add a source command to your shells rc file (**~/.bashrc** for most people):

```bash
echo "source <path to jenv>/jenv_source" >> ~/.bashrc
```

_OPTIONAL_: If you would like to have the current environment in your shell prompt, also
add the following line to your rc file (**_NOTE: This must be called after the source command_**):

```bash
echo "jenv_prepend_to_prompt" >> ~/.bashrc
```

Ex `~/.bashrc`

```bash
source ~/jenv/jenv_source
jenv_prepend_to_prompt
```

## Configuration Through Environment Variables

ENVIRONMENT VARIABLES

| VARIABLE         | DESCRIPTION                                               | DEFAULT  |
| ---------------- | --------------------------------------------------------- | -------- |
| JENV_DEV_ENV_DIR | The directory in which all of you environments are stored | ~/.jenv/ |

## Environment Configuration

#### Directory Structure

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

- **_pre_use_** - Ran when the `jenv use` command is run to enter an environment
- **_post_unuse_** - Ran directly after tht `jenv unsuse` command is run to leave an environment
- **_scripts_** - Directory containing all the scripts that can be run with `jenv run`

## Available Commands

- `jenv create` - Creates an environment of the structure described in [Directory Structure](#directory-structure)
- `jenv use` - Starts using an environment in the current shell
- `jenv unuse` - Stops the current shell from using an environment
- `jenv run <script_name>` - Runs a specified script
- `jenv view <env_name> <script_name>` - Prints a specified script
- `jenv list` or `jenv ls` - Lists all available JENV environments
- `jenv current` - Prints out the current JENV environment
- `jenv` - Prints out usage
