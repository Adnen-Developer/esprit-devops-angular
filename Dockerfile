# Use the official Node.js image as the base image
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy the source code to the working directory
COPY . /app

# Install the dependencies
RUN npm install

# Install the Angular CLI
RUN npm install -g @angular/cli

# Build the application
RUN ng build --prod --output-path=dist

# Expose the port
EXPOSE 4200

# Start the application
CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "4200"]


# Set the image build version
ARG BUILD_VERSION
ENV BUILD_VERSION ${BUILD_VERSION:-unknown}