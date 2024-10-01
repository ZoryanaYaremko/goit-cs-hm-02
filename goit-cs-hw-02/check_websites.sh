#!/bin/bash

# Масив з URL вебсайтів
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Ім'я файлу для запису логів
log_file="website_status.log"

# Очищаємо файл логів перед записом нових даних
> "$log_file"

# Цикл для перевірки кожного сайту
for website in "${websites[@]}"
do
    # Виконуємо запит з використанням curl
    status_code=$(curl -o /dev/null -s -w "%{http_code}" -L "$website")
    
    # Перевірка коду відповіді
    if [ "$status_code" -eq 200 ]; then
        echo "$website is UP" | tee -a "$log_file"
    else
        echo "$website is DOWN" | tee -a "$log_file"
    fi
done

# Виводимо повідомлення про завершення та ім'я лог-файлу
echo "Результати перевірки записані у файл: $log_file"
