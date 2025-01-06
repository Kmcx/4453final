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

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose necessary ports (Flask: 5000, SSH: 22)
EXPOSE 5000 22

# Start SSH and Flask server
CMD ["sh", "-c", "service ssh start && python run.py"]