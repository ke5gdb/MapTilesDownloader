# -------------------------
# The application container
# -------------------------
FROM python:3.11-bookworm
EXPOSE 5002/tcp

# Upgrade base packages and install application dependencies.
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    libopenjp2-7-dev \
    libtiff6 \
    tini && \
    rm -rf /var/lib/apt/lists/*

# Install libraries
RUN pip install pillow requests

# Copy in chasemapper.
COPY ./src /opt/MapTilesDownloader

# Set the working directory.
WORKDIR /opt/MapTilesDownloader

# Ensure scripts from Python packages are in PATH.
ENV PATH=/root/.local/bin:$PATH

# Use tini as init.
ENTRYPOINT ["/usr/bin/tini", "--"]

# Run server.py.
CMD ["python3", "/opt/MapTilesDownloader/server.py"]