import os
import re
import chardet

# Старое имя проекта
old_name = 'Jinjer'

# Новое имя проекта
new_name = 'Jinjer'

# Папка проекта
project_dir = os.path.dirname(os.path.abspath(__file__))

# Регулярное выражение для замены имени проекта
pattern = re.compile(r'\b' + old_name + r'\b')

# Проверка, является ли файл текстовым
def is_text_file(file_path):
    try:
        with open(file_path, 'rb') as f:
            rawdata = f.read(1024)  # Проверка первых 1024 байтов
            result = chardet.detect(rawdata)
            return result['encoding'] is not None  # Если удалось определить кодировку, файл — текстовый
    except:
        return False  # Если произошла ошибка, файл, вероятно, не текстовый

# Функция для замены имени проекта в файлах
def replace_name_in_file(file_path):
    if os.path.exists(file_path) and is_text_file(file_path):
        with open(file_path, 'rb') as f:
            rawdata = f.read()
            result = chardet.detect(rawdata)
            charenc = result['encoding']

        with open(file_path, 'r', encoding=charenc) as f:
            content = f.read()

        content = pattern.sub(new_name, content)

        with open(file_path, 'w', encoding=charenc) as f:
            f.write(content)
    else:
        print(f"Пропуск бинарного или несуществующего файла: {file_path}")

# Функция для замены имени проекта в папках
def replace_name_in_dir(dir_path):
    for root, dirs, files in os.walk(dir_path):
        for file in files:
            file_path = os.path.join(root, file)

            # Пропускаем файлы с расширениями, которые не требуют изменений (например, .pyc, .jpg, .png и т.д.)
            if file.endswith(('.pyc', '.jpg', '.png', '.gif', '.pdf')) or '__pycache__' in file_path:
                continue

            replace_name_in_file(file_path)

# Запуск замены имени проекта в корневой папке
replace_name_in_dir(project_dir)
