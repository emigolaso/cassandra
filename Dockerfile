FROM cassandra:latest

# Copy your modified cassandra.yaml into the container
#COPY cassandra.yaml /etc/cassandra/cassandra.yaml

# Set conservative JVM heap limits to prevent OOM crashes
ENV JVM_OPTS="-Xms256M -Xmx512M"

# Expose Cassandra default ports
EXPOSE 9042 7000 7001 7199 9160

# Ensure Cassandra runs with the new config
CMD ["cassandra", "-f"]
