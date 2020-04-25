FROM rust:1.43 as builder
WORKDIR /var/rustacean
COPY . .
RUN apt-get update  && apt-get install musl-tools -y
RUN rustup target add x86_64-unknown-linux-musl
RUN cargo build --release --target x86_64-unknown-linux-musl

FROM alpine
COPY --from=builder /var/rustacean/target/x86_64-unknown-linux-musl/release/rustacean /usr/local/bin/rustacean
CMD ["rustacean"]

