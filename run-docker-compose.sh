#!/bin/bash

set -e  # Exit on error
set -o pipefail  # Exit on command failure in a pipeline

echo "🚀 Starting Maven build for all submodules..."

# Define the list of submodules
SUBMODULES=(
  "environmental-data-service"
  "real-time-incident-notification-service"
  "reward-service"
  "route-calculation-service"
  "user-profile-information-store"
)

# Build each submodule
for module in "${SUBMODULES[@]}"; do
  echo "📦 Building $module..."
  (cd "$module" && mvn clean package -Dmaven.test.skip=true)
done

echo "✅ Maven build completed!"

# Stop running containers
echo "🛑 Stopping existing Docker containers..."
docker compose down

# Start new containers
echo "🚀 Starting Docker containers..."
docker compose up -d

echo "✅ All services are up and running!"
docker compose ps
