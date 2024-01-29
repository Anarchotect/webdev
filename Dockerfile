FROM node:20.10.0-bookworm-slim
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y ca-certificates

COPY apt/ /etc/apt/
RUN apt update && apt install -y wget curl gnupg build-essential 

RUN curl "https://sh.rustup.rs" -sSf > "rustup-init" && chmod 755 "rustup-init"
RUN ./rustup-init -y -t "wasm32-unknown-unknown"
RUN /root/.cargo/bin/cargo install wasm-pack

RUN apt update && apt install -y sudo man git vim zsh ripgrep tree make google-chrome-stable awscli terraform google-cloud-cli
