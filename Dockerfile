# 1. Base Image: Using Node.js v18 as the standardized environment.
# This ensures that we and the Jenkins server run the exact same version.
FROM node:18

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copying the source code into the container image
COPY . .

# 5. إعلام دوكر بأن التطبيق يعمل على منفذ 3000 داخلياً
EXPOSE 3000

# Standardized entry point for the application. 
# Ensure the main entry file is named 'server.js' to avoid startup failures.
CMD ["node", "server.js"]