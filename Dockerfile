# An HTML file is not an executable: Docker's CMD must start a running process. 
# Just putting index.html in the image and trying to run it fails because there's nothing to "execute".
# You need an HTTP server process inside the container to listen on a port and 
# serve the file(s). nginx and python:http.server are examples of such processes.

# Why nginx?
# Production-ready: efficient, fast static file serving, caching, TLS/HTTP tuning, request buffering, 
# and configuration for SPA history fallback.
# Default document root is /usr/share/nginx/html so you COPY files there and run nginx as the foreground process 
# (nginx -g 'daemon off;').

FROM nginx:alpine

COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]