# # Используем официальный образ Python 3.10.5 в качестве базового образа
# FROM python:3.10.5

# # Устанавливаем рабочую директорию внутри контейнера
# WORKDIR /app/

# # Эти переменные среды настраивают Python:
# # - PYTHONDONTWRITEBYTECODE=1: отключает создание файлов .pyc (байт-кода)
# # - PYTHONUNBUFFERED=1: вывод данных будет сразу же отображаться в консоли, а не буферизоваться
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# # Обновляем pip (управление пакетами Python) до последней версии
# RUN pip install --upgrade pip

# # Копируем файл requirements.txt в контейнер (содержит список зависимостей)
# COPY ./requirements.txt /app/

# # Устанавливаем зависимости Python, указанные в requirements.txt
# RUN pip install -r requirements.txt

# # Копируем все файлы и папки из текущей директории на локальной машине в рабочую директорию контейнера (/app/)
# COPY . /app/

# Используем официальный образ Python 3.10.5 в качестве базового образа

# Используем официальный образ Python 3.10.5 в качестве базового образа




# Dockerfile     wewe

# Use an official Python runtime as a parent image
FROM python:3.10.5

# Set the working directory in the container
WORKDIR /app/

# Upgrade pip
RUN pip install --upgrade pip

# Copy the requirements file into the container at /app
COPY ./requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app/

# Copy the Stripe CLI binary into /usr/local/bin
COPY stripe /usr/local/bin/

# Make sure the Stripe CLI binary is executable
RUN chmod +x /usr/local/bin/stripe
