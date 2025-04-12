# Step 1: Use Node base image
FROM node:18

# Step 2: Set working directory inside the container
WORKDIR /app

# Step 3: Copy all files into the container
COPY . .

# Step 4: Install dependencies
RUN npm install

# Step 5: Expose port
EXPOSE 3000

# Step 6: Define command to run the app
CMD ["npm", "start"]
