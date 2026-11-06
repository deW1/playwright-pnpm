ARG PLAYWRIGHT_VERSION=1.65.0
FROM mcr.microsoft.com/playwright:v${PLAYWRIGHT_VERSION}

# Re-declare ARGs after FROM so they are available during the rest of the build
ARG PLAYWRIGHT_VERSION
ARG IMAGE_SOURCE="https://github.com/deW1/playwright-pnpm"

# Install pnpm directly. Installing Corepack conflicts with the existing /usr/bin/yarn
# provided by the base image, and Corepack is not needed just to use pnpm.
RUN npm install --global pnpm@latest

# Use build args in labels (avoid undefined-var warnings by passing IMAGE_SOURCE and redeclaring PLAYWRIGHT_VERSION)
LABEL org.opencontainers.image.source="${IMAGE_SOURCE}"
LABEL org.opencontainers.image.version="${PLAYWRIGHT_VERSION}"

# Optional: Set working directory
WORKDIR /app

# Optional: Copy your project files
# COPY . .

# Optional: Install dependencies
# RUN pnpm install

# Optional: Default command
# CMD ["pnpm", "start"]
