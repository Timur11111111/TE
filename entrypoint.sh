# #!/bin/bash

# # Выполнение миграций
# python manage.py makemigrations --noinput

# # Применение миграций
# python manage.py migrate --noinput

# # Сбор статических файлов
# python manage.py collectstatic --noinput

# # Запуск сервера Django
# python manage.py runserver 0.0.0.0:8000



#!/bin/bash

# Выполнение миграций, сборка статических файлов и загрузка данных
python manage.py makemigrations --noinput
python manage.py migrate --noinput
python manage.py collectstatic --noinput

# Загрузка данных из JSON файла
python manage.py loaddata mysite_data.json

# Запуск Stripe CLI для прослушивания вебхуков в фоновом режиме
stripe listen --forward-to localhost:8000/payment/webhook/ &

# Запуск Django сервера
python manage.py runserver 0.0.0.0:8000

