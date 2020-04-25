FROM rust:1.43 as builder
WORKDIR /var/rustacean
COPY . .
RUN cargo build --release

FROM alpine
WORKDIR /opt/rustacean
COPY --from=builder /var/rustacean/target/release/rustacean .
CMD ["./rustacean"]
