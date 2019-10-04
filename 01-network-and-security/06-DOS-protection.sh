#!/bin/bash

# You have to set a DOS (Denial Of Service Attack) protection on your
# open ports of your VM.

# Вы должны установить защиту DDOS (атака отказа в обслуживании) на открытые
# порты вашей виртуальной машины.



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