# Use official Python image as base
FROM python:3.9-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install necessary Python libraries
RUN pip install --upgrade pip

# Install Hugging Face libraries and AI-related packages
RUN pip install torch transformers datasets

# Download Hugging Face model
RUN python -c "from transformers import pipeline; model = pipeline('sentiment-analysis', model='distilbert-base-uncased')"

# Set the working directory
WORKDIR /app

# Set the default command
CMD ["python", "-c", "print('Build complete!')"]
