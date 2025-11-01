ARG PLAYWRIGHT_VERSION=1.56.1
FROM mcr.microsoft.com/playwright:v${PLAYWRIGHT_VERSION}

# Install pnpm globally
RUN corepack enable && corepack prepare pnpm@latest --activate

LABEL org.opencontainers.image.source="https://github.com/${GITHUB_REPOSITORY:-deW1/playwright-pnpm}"
LABEL org.opencontainers.image.version="${PLAYWRIGHT_VERSION}"

# Optional: Set working directory
WORKDIR /app

# Optional: Copy your project files
# COPY . .

# Optional: Install dependencies
# RUN pnpm install

# Optional: Default command
# CMD ["pnpm", "start"]
