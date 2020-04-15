#!/bin/bash

source $JENV_WORKING_DIR/testing.sh
source $JENV_WORKING_DIR/../create.sh

echo "Test Empty error message"
assert_equal "ERROR: Must provide name for environment" "$(_jenv_create)"