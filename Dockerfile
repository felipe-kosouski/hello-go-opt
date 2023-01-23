from golang:1.19-alpine as builder

WORKDIR /app

COPY go.* ./

RUN go mod download

COPY *.go ./

RUN go build -o /hello-go-opt

FROM scratch

WORKDIR /

COPY --from=builder /hello-go-opt /hello-go-opt

CMD ["./hello-go-opt"]