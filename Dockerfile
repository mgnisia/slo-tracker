FROM golang:1.21 as build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /app/slo-tracker .
EXPOSE 8080
CMD /app/slo-tracker

FROM scratch
COPY --from=build /app/slo-tracker /bin/slo-tracker
CMD ["/bin/slo-tracker"]