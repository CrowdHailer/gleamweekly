FROM ghcr.io/gleam-lang/gleam:v1.12.0-erlang-alpine

RUN apk update \
&& apk add git \
&& git --version

# Add project code
COPY . /build/

# Compile the project
RUN cd /build \
  && gleam export erlang-shipment \
  && mv build/erlang-shipment /app \
  && rm -r /build

# Run the server
WORKDIR /app
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["run"]
