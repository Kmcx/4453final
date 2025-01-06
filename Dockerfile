# Base Image
FROM python:3.9-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    openssh-server && \
    mkdir /var/run/sshd

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install Python dependencies
RUN pip install -r requirements.txt

# Expose required ports (SSH and Flask)
EXPOSE 5000 22

# Start SSH and Flask server
CMD ["sh", "-c", "service ssh start && python run.py"]