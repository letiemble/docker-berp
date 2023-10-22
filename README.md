# BERP Docker Image

A Docker image to execute the BERP parser inside a container without needing to install a [.NET runtime][dotnet] and the [BERP parser][berp] on your machine.

## Usage

To use the image, run the following command:

```bash
docker run --rm -it \
    -v $(pwd):/app \
    -e "GRAMMAR_FILE=grammar.berp" \
    -e "TEMPLATE_FILE=template.razor" \
    -e "OUTPUT_FILE=output.cs" \
    letiemble/berp:1.4.0
```

The `/app` volume is used as the base mount point for the container.
The `GRAMMAR_FILE`, `TEMPLATE_FILE` and `OUTPUT_FILE` environment variables are used to set the paths to the grammar file, the template file and the output file respectively, relative to the base mount point.

## Build

To build the image, run the following command:

```bash
docker buildx build -t letiemble/berp:1.4.0 .
```

To build the multi-architecture image, run the following command:

```bash
docker buildx create --name BUILDER --use
docker buildx build --platform linux/amd64,linux/arm64 -t letiemble/berp:1.4.0 --push .
docker buildx rm BUILDER
```

[berp]: https://github.com/gasparnagy/berp
[dotnet]: https://dotnet.microsoft.com/download
