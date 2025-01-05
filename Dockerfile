# Use an official Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt && \
    apt-get update && apt-get install -y --no-install-recommends openssh-server && \
    mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd

# Expose required ports
EXPOSE 22 5000

# Copy project files
COPY . .

# Start SSH and Flask application
CMD ["sh", "-c", "service ssh start && flask run --host=0.0.0.0 --port=5000"]
