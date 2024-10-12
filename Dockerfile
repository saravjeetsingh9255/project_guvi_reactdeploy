# Use Nginx to serve the application
FROM nginx:alpine

# Copy built assets from previous stage to Nginx's html folder
COPY . /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Command to run Nginx server
CMD ["nginx", "-g", "daemon off;"]
