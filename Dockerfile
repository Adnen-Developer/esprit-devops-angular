# Use an official Node.js runtime as a parent image
FROM node:14.18.1-alpine

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the application
RUN npm run build --prod

# Use an official nginx image as a parent image
FROM nginx:1.21.3-alpine

# Copy the build output from the previous stage to the default nginx public directory
COPY /app/dist/crudtuto-Front /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]
