set -e 

. ./includes/commons.sh

echo "Compilando archivos Wollok..."
interpret "*.wlk"
if [ $? -gt 0 ] ; then
    exit 1
fi
echo "********************************************"
echo "Ejecutando tests..."
interpret "*.wtest"
if [ $? -gt 0 ] ; then
    exit 1
fi
