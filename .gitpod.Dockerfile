# Use the official Python image from Docker Hub as the base image
FROM python:latest

# Install sudo and other system dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    git \
    && apt-get clean

# Create the sudoers file if it doesn't exist
RUN touch /etc/sudoers && chmod 0440 /etc/sudoers

# Install Python packages globally if needed
RUN pip install --no-cache-dir numpy pandas

# Set environment variables if needed
ENV MY_CUSTOM_VARIABLE=example_value

# Set the working directory
WORKDIR /workspace

# Copy the current directory contents into the container at /workspace
COPY . /workspace

# Install any Python dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
