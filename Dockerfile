# ======================================
# Base Image
# ======================================
FROM python:3.11.3-slim

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# ======================================
# Install system-level dependencies
# ======================================
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    libgl1 \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    awscli \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ======================================
# Set working directory
# ======================================
WORKDIR /app

# ======================================
# Copy project files
# ======================================
COPY . /app

# ======================================
# Install Python dependencies
# ======================================
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# ======================================
# Expose port and start app
# ======================================
EXPOSE 8080
CMD ["python", "app.py"]
