# Скрипт написано на Bash
#!/bin/bash

websites=("https://www.google.com" "https://www.github.com" "https://www.nonexistentwebsite.xyz" "https://www.facebook.com" "https://www.twitter.com" "https://www.edu.goit.global/uk/homepage")

log_file="website_status.log"

> "$log_file"

# Використано цикл for для обходу всіх сайтів у списку
for url in "${websites[@]}"; do
    # Використано curl для перевірки статусу HTTP, скрипт повинен опрацьовувати переадресацію (опція -L)
    http_status=$(curl -s -o /dev/null -w "%{http_code}" -L "$url" --max-time 10)

    if [ "$http_status" -eq 200 ]; then
        status="UP"
    else
        status="DOWN"
    fi

    echo "$(date '+%Y-%m-%d %H:%M:%S') - $url is $status (HTTP Status: $http_status)" >> "$log_file"
done

# Результати перевірки записані у файл логів, виведено про це повідомлення
echo "Results have been written to $log_file"

# % cd Task1
# % chmod +x website_status.sh
# % ./website_status.sh