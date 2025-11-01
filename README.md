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

Build the image yourself:

```bash
docker build -t playwright-pnpm .
```

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
