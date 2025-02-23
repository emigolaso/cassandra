FROM cassandra:latest

# Copy your modified cassandra.yaml into the container
#COPY cassandra.yaml /etc/cassandra/cassandra.yaml

# Modify cassandra.yaml using sed
RUN sed -i 's/^rpc_address:.*/rpc_address: 0.0.0.0/' /etc/cassandra/cassandra.yaml && \
    sed -i 's/^broadcast_rpc_address:.*/broadcast_rpc_address: "cassandra-production-7814.up.railway.app"/' /etc/cassandra/cassandra.yaml

# Set conservative JVM heap limits to prevent OOM crashes
ENV JVM_OPTS="-Xms256M -Xmx512M"

# Expose Cassandra default ports
EXPOSE 9042 7000 7001 7199 9160

# Ensure Cassandra runs with the new config
CMD ["cassandra", "-f"]
