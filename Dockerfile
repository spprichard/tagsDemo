FROM golang:1.14 AS builder

WORKDIR /go/src

COPY cmd cmd/
COPY go.mod go.mod
COPY go.sum go.sum
COPY vendor vendor
COPY main.go main.go

ENV GO111MODULE=on

# Build Binary
RUN env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -mod=vendor -o /go/src/build/tags main.go

ENTRYPOINT [ "/go/src/build/tags" ]
