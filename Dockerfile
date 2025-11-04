FROM python:3.12

# Set the working directory in the container
WORKDIR /weather-ml-app

# Install dependencies
COPY requirements.txt .
RUN python3 -m pip install --upgrade pip wheel && \
    python3 -m pip install -r requirements.txt

# Copy the rest of the application code
COPY . .
EXPOSE 5000

# Run the app
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
