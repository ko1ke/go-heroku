FROM golang:1.17-alpine3.15 as builder

RUN apk update && apk add --no-cache git curl 

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin

COPY . .

RUN go install --tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest

RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-w -s" -o /main ./cmd

FROM alpine:3.12

COPY --from=builder /main .

ENV PORT=${PORT}
ENTRYPOINT ["/main web"]
