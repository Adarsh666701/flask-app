FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the rest of the app code
COPY . /app/

# Expose the port Flask will run on
EXPOSE 5000

# Set environment variable for Flask
ENV FLASK_APP=app.py

# Run Flask app
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
