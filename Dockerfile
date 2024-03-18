# Use a base image with Node.js pre-installed
FROM node:alpine

# Set working directory
WORKDIR /app

# Install git
RUN apk add --no-cache git

# Clone the Antora playbook from the specified repository
RUN git clone https://github.com/shrvan-5/antora.git /app
WORKDIR /app/antora
# Install Antora globally
RUN npm install -g @antora/cli @antora/site-generator-default

# Expose default Antora port
EXPOSE 2020

# Set entrypoint to generate the documentation when the container starts
ENTRYPOINT ["antora", "generate", "antora-playbook.yml"]

# Optionally, you can specify CMD if you want to provide default options
CMD ["--fetch", "--stacktrace"]

