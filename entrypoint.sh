
# # Выполнение миграций
# python manage.py makemigrations --noinput
# python manage.py migrate --noinput

# # Сборка статических файлов
# python manage.py collectstatic --noinput

# # Загрузка данных из JSON файла
# python manage.py loaddata mysite_data071024.json

# # Запуск Django сервера    
# gunicorn Jinjer.wsgi:application --bind 0.0.0.0:8000
# # python manage.py runserver 0.0.0.0:8000


# Выполнение миграций
python manage.py makemigrations --noinput
python manage.py migrate --noinput

# Сборка статических файлов
python manage.py collectstatic --noinput

# Проверка наличия базы данных
if python manage.py dbshell -c "SELECT 1 FROM pg_database WHERE datname='database';" | grep -q 1; then
    echo "База данных существует. Загрузка данных из JSON файла не требуется."
else
    echo "База данных не существует. Загружаем данные из JSON файла."
    python manage.py loaddata mysite_data071024.json
fi

# Запуск Django сервера    
gunicorn Jinjer.wsgi:application --bind 0.0.0.0:8000
# python manage.py runserver 0.0.0.0:8000
