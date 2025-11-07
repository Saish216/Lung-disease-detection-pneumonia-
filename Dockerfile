# Use Python 3.11.3 (same as your local Conda environment)
FROM python:3.11.3-slim

# Prevent interactive prompts and keep image small
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory
WORKDIR /app

# Copy project files
COPY . .

# Upgrade pip and install dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8080 for Flask
EXPOSE 8080

# Run your Flask app
CMD ["python", "app.py"]
