# Base Image
FROM python:3.9-slim

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    openssh-server && \
    mkdir /var/run/sshd

# Set the working directory
WORKDIR /app

# Copy project files to the working directory
COPY . /app

# Copy the startup script to the container
COPY start_services.sh /start_services.sh

# Grant execute permission to the script
RUN chmod +x /start_services.sh

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose necessary ports (Flask: 80, SSH: 22)
EXPOSE 80 22

# Start services using the script
CMD ["sh", "/start_services.sh"]