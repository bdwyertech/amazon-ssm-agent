FROM golang:1.9-alpine

RUN apk update && apk add bash git make

WORKDIR /go/src/github.com/aws/amazon-ssm-agent

COPY . .

RUN export CGO_ENABLED=0 \
    && make build-linux


# put an exit 0 in the Tools/src/checkstyle.sh script
# docker run --name ssm-agent-donor ssm-agent
# docker cp ssm-agent-donor:/go/src/github.com/aws/amazon-ssm-agent/bin/ bin
# docker rm ssm-agent-donor
