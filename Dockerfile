FROM cassandra:latest

# Copy your modified cassandra.yaml into the container
#COPY cassandra.yaml /etc/cassandra/cassandra.yaml

EXPOSE 9042

# Ensure Cassandra runs with the new config
CMD ["cassandra", "-f"]
