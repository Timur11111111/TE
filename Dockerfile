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

# Prepare the application
RUN python manage.py makemigrations --noinput
RUN python manage.py migrate --noinput
RUN python manage.py collectstatic --noinput
RUN python manage.py loaddata mysite_data.json

# Start Stripe CLI for listening to webhooks in the background
CMD stripe listen --forward-to http://web:8000/payment/webhook/ &
