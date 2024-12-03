FROM ubuntu:20.04

# Set up environment
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y curl sudo tzdata && apt-get clean

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
