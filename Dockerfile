# ===============================
# Stage 1: Base Image
# ===============================
FROM python:3.10-slim

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# ===============================
# Stage 2: System Dependencies
# ===============================
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    libgl1 \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    awscli \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ===============================
# Stage 3: Setup App
# ===============================
WORKDIR /app

# Copy everything
COPY . /app

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# ===============================
# Stage 4: Expose Port and Run
# ===============================
EXPOSE 8080
CMD ["python3", "app.py"]
