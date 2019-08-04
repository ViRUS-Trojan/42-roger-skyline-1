#!/bin/bash

# You must create a non-root user to connect to the machine and work.

# Вы должны создать пользователя без полномочий root для подключения
# и работы.

# ----------------------------
# Во время установки уже был создан не-root пользователь (со своим логином
# и паролем). Но прижелании можно создать еще (в данном примере слоздаем
# пользователя с ником 'web'):

# --ЧАСТЬ B-------root--------

echo "---- Устанавливаем пакет sudo";
apt-get -y install sudo
echo "---- Создаём пользователя 'web' и включаем в группу adm (4) и sudo (27)";
sudo useradd -m -c 'User4WebServer' -G 4,27 web
echo "---- Задаём пароль пользователя 'web'";
sudo passwd web
echo "---- Списиок групп в которые входит пользователь 'web'";
echo "";
groups web
echo "";
echo " _._     _,-'\"\"\`-._";
echo "(,-.\`._,'(       |\\\`-/|";
echo "    \`-.-' \\ )-\`( , o o)";
echo "          \`-    \\\`_\`\"'-  Mi-mi-mi... Ok!";
echo "";
echo "---- Выходим из root-режима";
echo "---- Ведите в команду 'exit' для выхода из root.";
echo "---- Из скрипта эта команда не сработает!";
exit
