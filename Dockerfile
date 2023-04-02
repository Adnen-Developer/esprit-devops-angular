# Use the official Node.js runtime as a parent image
FROM node:10.16.0-alpine

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install -f

# Copy the rest of the application code to the container
COPY . .

# Expose port 4200 for the application
EXPOSE 4200

# Set the command to run when the container starts
CMD ["npm", "start"]
