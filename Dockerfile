FROM python:3.10.5

WORKDIR /app/

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

COPY ./requirements.txt /app/

RUN pip install -r requirements.txt

COPY . /app/




# # Use an official Python runtime as a parent image
# FROM python:3.10.5

# # Set the working directory in the container
# WORKDIR /app/

# # Upgrade pip
# RUN pip install --upgrade pip

# # Copy the requirements file into the container at /app
# COPY ./requirements.txt /app/

# # Install any needed packages specified in requirements.txt
# RUN pip install -r requirements.txt

# # Copy the current directory contents into the container at /app
# COPY . /app/


