# Use an LTS Node base image
FROM node:20-alpine

# Workdir
WORKDIR /app

# Copy package files and install
COPY package*.json ./
RUN npm ci --omit=dev

# Copy source
COPY . .

# The app listens on 3000 (per your compose), expose for clarity
EXPOSE 3000

# Start the app
CMD ["node", "src/index.js"]
