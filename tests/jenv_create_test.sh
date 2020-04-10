#!/bin/bash

working_dir=$(dirname $0)
source $working_dir/testing.sh
source $working_dir/../create.sh

echo "Test Empty error message"
assert_equal "ERROR: Must provide name for environment" "$(_jenv_create)"