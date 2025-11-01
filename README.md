# playwright-pnpm

[![Build and Push Docker Image](https://github.com/deW1/playwright-pnpm/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/deW1/playwright-pnpm/actions/workflows/docker-publish.yml)
[![Check for Playwright Updates](https://github.com/deW1/playwright-pnpm/actions/workflows/check-playwright-updates.yml/badge.svg)](https://github.com/deW1/playwright-pnpm/actions/workflows/check-playwright-updates.yml)

Adds pnpm support to Microsoft's Playwright Docker container.

## Docker Image

The Docker image extends the official Playwright image and includes pnpm globally installed via corepack.

### Usage

Pull and use the pre-built image from GitHub Container Registry:

```bash
docker pull ghcr.io/dew1/playwright-pnpm:latest
```

Run a container:

```bash
docker run -it ghcr.io/dew1/playwright-pnpm:latest /bin/bash
```

### Use in Your Dockerfile

```dockerfile
FROM ghcr.io/dew1/playwright-pnpm:latest

WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

COPY . .

CMD ["pnpm", "test"]
```

## Building Locally

Build the image yourself (uses the `PLAYWRIGHT_VERSION` defined in the Dockerfile by default):

```bash
# Build using the PLAYWRIGHT_VERSION defined in Dockerfile (default)
docker build -t playwright-pnpm .

# Or override the Playwright version at build time:
# (useful for testing a different Playwright base image locally)
# Replace 1.56.1 with the desired vX.Y.Z
docker build --build-arg PLAYWRIGHT_VERSION=1.56.1 -t playwright-pnpm:pw-1.56.1 .
```

Notes about CI and automation

- The repository Dockerfile is now parameterized with an `ARG PLAYWRIGHT_VERSION` so you can control which Playwright base image to use at build time.
- The `check-playwright-updates.yml` workflow scans the registry for newer Playwright releases and updates the `ARG PLAYWRIGHT_VERSION` in the Dockerfile when appropriate (creating a PR).
- The `docker-publish.yml` workflow reads the `PLAYWRIGHT_VERSION` from the Dockerfile and passes it to the build action as a build-arg so the CI build uses the same Playwright version referenced in the Dockerfile.

## Available Tags

- `latest` - Latest build from main branch
- `pw-X.Y.Z` - Specific Playwright version (e.g., `pw-1.56.1`)

## Features

- Based on official Playwright image (v1.56.1)
- pnpm installed globally via corepack
- Ready for use in CI/CD pipelines
- Published to GitHub Container Registry
- Automatically checks for new Playwright versions daily
- Auto-creates PRs when new Playwright versions are available

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
