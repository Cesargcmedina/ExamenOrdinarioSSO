#!bin/bash

a=$(grep '^NAME' /etc/*release | cut -d '=' -f 2)
echo 'Distribution:' $a


if [[ $a == *"CentOS"* ]]; then
        sudo yum -y install epel-release > /dev/null
        var=$(sudo yum -y install clamav | tail -n 1)
        if [[ $var == *"Nothing"* ]]; then
                echo "Clamad ya se encuentra instalado"
                echo "Eliminando clamav..."
                sudo yum -y remove clam* > /dev/null
                echo "Reinstalando..."
                sudo yum -y install clamav > /dev/null
                echo "Ahora Clamav se encuentra instalado"
        else
                echo "Ahora Clamav se encuentra instalado"
        fi
        echo "Actualizando paquetes..."
        sudo yum -y upgrade > /dev/null
        echo "Paquetes actualizados"

else
        var=$(sudo apt -y install clamav | tail -n 1 | cut -d "," -f 2 | awk '{>
        if [ $var = 0 ];then
                echo "Clamav ya se encuentra instalado"
                echo "Eliminando clamav..."
                sudo apt -y remove clam* > /dev/null 2>&1
                echo "Reinstalando..."
                sudo apt -y install clamav > /dev/null 2>&1
                echo "Ahora Clamav se encuentra instalado"
        else
                echo "Ahora Clamav se encuentra instalado"
        fi
        echo "Actualizando paquetes..."
        sudo apt -y upgrade > /dev/null 2>&1
        echo "Paquetes actualizados"

fi

