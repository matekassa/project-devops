# Use an official python3-alpine image as the base image
FROM python:3-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the contents of the app directory to /app in the container
COPY app/ .

# Install the required packages
RUN pip3 install -r requirements.txt

# Specify the network ports that a container should listen on
EXPOSE 5000

# Start and run the Flask backend application 
CMD ["/bin/sh", "-c", "gunicorn app:app --bind 0.0.0.0:5000"]
