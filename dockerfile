# Use an official Python image
FROM python:3.9-slim

# Install dependencies
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Install SSH server
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd

# Expose required ports
EXPOSE 22 5000

# Copy project files
COPY . .

# Start SSH and Flask application
CMD service ssh start && flask run --host=0.0.0.0 --port=5000
