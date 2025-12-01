FROM node:20-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

EXPOSE 3000

# Use node to run next dev
CMD ["npm", "run", "dev"]