FROM golang:1.23-alpine AS termsvg
RUN go install github.com/mrmarble/termsvg/cmd/termsvg@latest

FROM python:3.11-alpine AS terminal-demo-root
COPY --from=termsvg /go/bin/termsvg /usr/local/bin/termsvg

RUN apk add --no-cache zsh procps curl
RUN curl -sS https://starship.rs/install.sh > /tmp/install.sh \
    && chmod +x /tmp/install.sh \
    && /tmp/install.sh -y

COPY script/terminal-demo /usr/local/bin/terminal-demo
COPY script/terminal-replay /usr/local/bin/terminal-replay
ENTRYPOINT ["/usr/local/bin/terminal-demo"]

WORKDIR /demo
RUN adduser -D -h /home/demo demo
USER demo

RUN echo 'eval "$(starship init zsh)"' > /home/demo/.zshrc
RUN mkdir /home/demo/.config/
COPY demo/starship.toml /home/demo/.config/starship.toml
ENV STARSHIP_CONFIG=/home/demo/.config/starship.toml
ENV PROMPT_START="❯"

