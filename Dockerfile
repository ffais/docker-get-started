# Use an official Python runtime as a parent image
FROM python:2.7-slim

# Make port 80 available to the world outside this container
EXPOSE 8080

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser

RUN chown appuser:appuser app.py

USER appuser


# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]

