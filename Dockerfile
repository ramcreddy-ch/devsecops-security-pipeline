# Build stage
FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

# Final secure stage
FROM scratch
COPY --from=builder /app/main /main
USER 10001
ENTRYPOINT ["/main"]
