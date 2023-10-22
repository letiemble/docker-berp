# syntax=docker/dockerfile:1.4

# The base image
ARG DOTNET_SDK_VERSION=6.0
FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_SDK_VERSION}

# Install Berp
ARG BERP_VERSION=1.4.0
RUN dotnet tool install Berp --version ${BERP_VERSION} --tool-path /usr/bin

LABEL org.opencontainers.image.title="Berp"
LABEL org.opencontainers.image.description="A Docker image to run the BERP parser generator tool."
LABEL org.opencontainers.image.version="${BERP_VERSION}"

# Expose the volumes
VOLUME ["/app"]

# Define the environment variables
ENV GRAMMAR_FILE=grammar.berp
ENV TEMPLATE_FILE=template.razor
ENV OUTPUT_FILE=output.cs
ENV BOM_FLAG=noBOM

# Invoke the Berp tool
ENTRYPOINT berp -g /app/${GRAMMAR_FILE} -t /app/${TEMPLATE_FILE} -o /app/${OUTPUT_FILE} ${BOM_FLAG}
