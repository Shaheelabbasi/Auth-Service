# Use an official Node.js runtime as a parent image
FROM node:20

# Create a working directory for your application
WORKDIR /usr/src/app/authservice

# Copy the package.json and package-lock.json files to the working directory
COPY authservice/package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the application code to the working directory
COPY authservice .

# Build the application (if there is a build step)
RUN npm run build --if-present

# Expose the port that your application runs on (adjust if necessary)
EXPOSE 9000

# Start the application
CMD [ "npm", "run", "dev" ]
