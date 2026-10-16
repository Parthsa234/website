FROM nginx:1.28-alpine

# Render provides PORT for web services. The official NGINX image expands
# environment variables in templates under /etc/nginx/templates at startup.
ENV PORT=10000

COPY index.html /usr/share/nginx/html/index.html
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

EXPOSE 10000
