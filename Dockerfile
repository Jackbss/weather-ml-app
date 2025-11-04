FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /weather-ml-app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


# Copy the rest of the application code
COPY . .

# Run the app
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
CMD ["gunicorn", "-b". "0.0.0.0:5000", "app:app"]
