# playwright-pnpm

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

## Features

- Based on official Playwright image (v1.56.1)
- pnpm installed globally via corepack
- Ready for use in CI/CD pipelines
- Published to GitHub Container Registry
