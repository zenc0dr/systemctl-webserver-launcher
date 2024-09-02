#!/bin/bash

# Проверяем количество переданных параметров
if [ $# -ne 1 ]; then
  echo "Использование: $0 {start|status|stop}"
  exit 1
fi

# Определяем действие в зависимости от переданного параметра
case "$1" in
  start)
    echo "Запуск Apache2 и MySQL..."
    sudo systemctl enable --now apache2
    echo "Apache2:"
    systemctl status apache2
    sudo systemctl enable --now mysql
    echo "MySQL:"
    systemctl status mysql
    ;;
  status)
    echo "Статус Apache2:"
    systemctl status apache2
    echo "Статус MySQL:"
    systemctl status mysql
    ;;
  stop)
    echo "Остановка Apache2 и MySQL..."
    sudo systemctl disable --now apache2
    echo "Apache2:"
    systemctl status apache2
    sudo systemctl disable --now mysql
    echo "MySQL:"
    systemctl status mysql
    ;;
  *)
    echo "Неверный параметр. Используйте: start, status или stop."
    exit 1
    ;;
esac