#!/bin/bash

# You have to set the rules of your firewall on your server only with the
# services used outside the VM.

# Вы должны установить правила брандмауэра на своем сервере только
# с сервисами, используемыми вне виртуальной машины.

echo "   ------------------------------------------------------------------";
echo "Проверять порты открытые на сервере позволяет пакет 'net-tools'.";
echo "Установить его можно командой:";
echo "";
echo "    sudo -S apt-get install net-tools";
echo "";
echo "Теперь с помощью команды 'netstat' можно просмотреть открытые порты";
echo "и сокеты, а так же использующие их приложения. Например, открытые";
echo "порты проверяются так:";
echo "";
    netstat -nlp
echo "";
Если вы все делали праивильно, то на данный момент у вас открыт только
один порт 2002 (это перенастроенный нами SSH):
echo "";
tcp        0      0 0.0.0.0:2002            0.0.0.0:*               LISTEN      -
tcp6       0      0 :::2002                 :::*                    LISTEN      -
echo "";
В дальнейшем, все устанавливаемые пакеты и запущенные демоны сами
откроют для себя нужные порты, будут менять их при измении настроек,
и всё побудет хорошо.
echo "";
При желании, можно дополнительно настроить блокировки с помощью
команд route. Но это наименее оптимальный способ блокировок, т.к.
работает только для TCP-атак, но не защиает от UDP-атак и не
предупреждает о UDP- и stealth-сканирований, которые обычно предшествуют
реальным атакам.

Для определения и ответа на сканирование портов предназначен пакет
PortSentry (от ранее назависимых разработчов, а сейчас Cisco).
PortSentry позволяет в реальном времени обнаружить сканирование
и в дальнейшем среагировать на него одним из следующих образов:

-- занесение информации об инциденте в системный журнал через syslog();
-- хост, замеченный в сканировании, автоматически заносится в файл "/etc/host.deny" для TCP Wrappers;
-- автоматически перенастроиться и направлять весь трафик от атакующего на несуществующий компьютер;
-- автоматически перенастроиться и блокировать все пакеты атакующего фильтром.

Цель PortSentry -- дать администратору информацию о том, что сервер исследуется.

Установим его:

sudo -S apt-get install portsentry





# Я всегда рекомендую вам использовать пакетный фильтр, потому что это

 PortSentry по умолчанию ничего не блокирует.                                                                        │
    │                                                                                                                     │
    │ Заметим, что по умолчанию PortSentry не предпринимает никаких действий против возможных атак. Производится только   │
    │ запись сообщений в /var/log/syslog. Чтобы изменить такое поведение, отредактируйте файл                             │
    │ /etc/portsentry/portsentry.conf.                                                                                    │
    │                                                                                                                     │
    │  Вероятно, также вы захотите посмотреть:                                                                            │
    │  /etc/default/portsentry (параметры запуска демона) и                                                               │
    │  /etc/portsentry/portsentry.ignore.static (игнорируемые хосты/интерфейсы)                                           │
    │                                                                                                                     │
    │                                                                                                                     │
    │ Подробней об этом описано на страницах руководств portsentry(8) и portsentry.conf(5).



apt-get install iptables
/usr/sbin/iptables -?

echo "";
echo " _._     _,-'\"\"\`-._";
echo "(,-.\`._,'(       |\\\`-/|";
echo "    \`-.-' \\ )-\`( , o o)";
echo "          \`-    \\\`_\`\"'-  Mi-mi-mi... Ok!";
echo "";