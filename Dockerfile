# Use a base image with Node.js pre-installed
FROM node:alpine
# Set working directory
WORKDIR /app
RUN node -e "fs.writeFileSync('package.json', '{}')" && npm i -D -E @antora/cli@3.1 @antora/site-generator@3.1
RUN npm install -g @antora/cli
RUN npm i -g @antora/cli@3.1 @antora/site-generator@3.1
# Install git
RUN apk add --no-cache git
# Copy the Antora playbook file to the image
COPY antora-playbook.yml /app
EXPOSE 2020
# Set entrypoint to generate the documentation when the container starts
ENTRYPOINT ["antora"]
# Specify default command arguments
CMD ["generate", "/app/antora-playbook.yml"]
