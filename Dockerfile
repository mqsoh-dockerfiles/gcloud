FROM python:latest

# https://cloud.google.com/sdk/docs/quickstart-linux
#
# The archive is extracted to /usr/local and the subdirectory in the archive is
# stripped so that the `bin` directory in the archive ends up somewhere already
# in the root user's PATH. That way I don't need to do any crap with the PATH.
RUN apt update && apt install -y curl && \
    curl --location --output gcloud.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-245.0.0-linux-x86_64.tar.gz && \
    tar -xvzf ./gcloud.tar.gz -C /usr/local/ --strip-components=1 && \
    rm ./gcloud.tar.gz && \
    /usr/local/install.sh --quiet --usage-reporting false --additional-components alpha beta kubectl && \
    rm -rf /var/lib/apt/lists/*

CMD [ "bash" ]
