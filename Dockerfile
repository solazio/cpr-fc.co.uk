FROM ubuntu:bionic

# Set up environment
ENV LANG C.UTF-8
WORKDIR /srv

# System dependencies
RUN apt-get update && apt-get install -y --no-install-recommends python3 python3-setuptools python3-pip

# Set git commit ID
ARG COMMIT_ID
ENV COMMIT_ID "${COMMIT_ID}"
ENV TALISKER_REVISION_ID "${COMMIT_ID}"

# Import code, install code dependencies
COPY . .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

# Setup commands to run server
ENTRYPOINT ["./entrypoint"]
CMD ["0.0.0.0:80"]
