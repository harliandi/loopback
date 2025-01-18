# Use a stable Node.js 12 image as the base
FROM node:12-alpine AS base

# Set the working directory inside the container
WORKDIR /usr/src/app

# Install dependencies in a separate stage for better layer caching
FROM base AS dependencies
# Copy only package.json and package-lock.json to leverage caching
COPY package*.json ./
# Install only production dependencies
RUN npm ci --only=production

# Final stage for production
FROM node:12-alpine AS production
WORKDIR /usr/src/app
# Copy production dependencies from the dependencies stage
COPY --from=dependencies /usr/src/app/node_modules ./node_modules
# Copy the rest of the application code
COPY . .

# Set the environment to production
ENV NODE_ENV=production
# Set default port for LoopBack
ENV PORT=3000
# Expose the application port
EXPOSE 3000

# Use the PORT environment variable required by Google Cloud Run
CMD ["npm", "start"]
