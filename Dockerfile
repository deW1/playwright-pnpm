# Extend the official Playwright image
FROM mcr.microsoft.com/playwright:v1.56.1

# Install pnpm globally
RUN corepack enable && corepack prepare pnpm@latest --activate

# Optional: Set working directory
WORKDIR /app

# Optional: Copy your project files
# COPY . .

# Optional: Install dependencies
# RUN pnpm install

# Optional: Default command
# CMD ["pnpm", "start"]
