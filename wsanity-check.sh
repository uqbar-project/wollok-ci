#!/bin/bash
#
# Sanity check for Wollok CLI project
# Author: Dodain
#

# Setting relative folder to this script file
CLI_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function testFailingFile() {
    echo "=========================================================================================="
    echo "Testeando archivo $1"
    if [ ! -s $CLI_DIR/examples/$1 ] ; then
        echo "Archivo $1 no existe"
        return 1
    fi
    $CLI_DIR/winterpreter.sh $CLI_DIR/examples/$1
    if [ $? -ne 1 ] ; then
        echo "$1 no debería haber compilado"
        return 1
    fi
    return 0
}

testFailingFile "pepita.notCompiling.wlk" \
    && testFailingFile "pepita.missingImport.wtest" \
    && testFailingFile "pepita.validationError.wlk" \
    && testFailingFile "pepita.assertionError.wtest" \
    && testFailingFile "pepita.runtimeError.wtest" \
    && testFailingFile "pepitaRuntimeError.wtest"
if [ $? -ne 0 ] ; then
    exit 1
fi

echo "=========================================================================================="
echo "Testing happy path for pepita test and program"
$CLI_DIR/winterpreter.sh $CLI_DIR/examples/pepita.warnings.wlk \
    && $CLI_DIR/winterpreter.sh $CLI_DIR/examples/pepita.wtest \
    && $CLI_DIR/winterpreter.sh $CLI_DIR/examples/pepita.wpgm
exit $?
