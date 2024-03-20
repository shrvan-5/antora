FROM antora/antora:latest
WORKDIR /app1
RUN apk add --no-cache git
COPY antora-playbook.yml .
CMD ["antora", "--stacktrace", "antora-playbook.yml"]
