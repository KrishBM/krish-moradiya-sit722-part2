# Start with an official Python runtime image as the base
FROM python:3.11-alpine

# Define the working directory inside the container
WORKDIR /app/

# Copy the requirements.txt file from the host machine into the container
COPY book_catalog/requirements.txt .

# Install the required dependencies from the requirements.txt file
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application's source code from the host to the /app directory in the container
COPY book_catalog/ .

# Run the FastAPI application using Uvicorn with specified host and port
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
