#!/bin/bash
#
# Wollok Checker script
#
#

CLI_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $CLI_DIR/includes/prepareFile.sh

java -cp "$(echo `find $CLI_DIR/jars/ -name "*.jar"` | sed 's# #:#g')" org.uqbar.project.wollok.launch.WollokChecker $@
