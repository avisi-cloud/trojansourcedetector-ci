# Docker trojansourcedetector

Docker image build for [trojansourcedetector](https://github.com/haveyoudebuggedit/trojansourcedetector), with examples for Gitlab CI.

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/avisi-cloud/trojansourcedetector/release)

## Table of Contents

- [Usage](#usage)
- [Contribute](#contribute)
- [License](#license)

## Usage

### Images

- docker pull ghcr.io/avisi-cloud/trojansourcedetector:1.0.1

### Configuration

See the [trojansourcedetector documentation](https://github.com/haveyoudebuggedit/trojansourcedetector).

```bash
Usage of /usr/local/bin/trojansourcedetector:
  -config string
        JSON file containing the configuration. (default ".trojansourcedetector.json")
```

### Examples

#### Gitlab CI

```yaml
trojansource-detector:
   image: ghcr.io/avisi-cloud/trojansourcedetector:1.0.1
   script:
     - trojansourcedetector
```

#### Docker run

```shell
docker run -v $(pwd):/build ghcr.io/avisi-cloud/trojansourcedetector:1.0.1 
```

## Automated build

This image is build at least once a month automatically.

## Contribute

PRs accepted. All issues should be reported in the [Github issue tracker](https://github.com/avisi-cloud/trojansourcedetector/issues).

## License

[MIT © Avisi Cloud](LICENSE)
