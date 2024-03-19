FROM antora/antora:latest
WORKDIR /app1
RUN apk add --no-cache git
COPY antora-playbook.yml .
ENTRYPOINT ["antora"]
CMD ["--stacktrace", "antora-playbook.yml"]
