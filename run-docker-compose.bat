@echo off
setlocal enabledelayedexpansion

echo 🚀 Starting Maven build for all submodules...

:: Define the list of submodules
set SUBMODULES=environmental-data-service real-time-incident-notification-service reward-service route-calculation-service user-profile-information-store

:: Build each submodule
for %%M in (%SUBMODULES%) do (
    echo 📦 Building %%M...
    cd %%M
    mvn clean package -Dmaven.test.skip=true
    if %errorlevel% neq 0 (
        echo ❌ Build failed in %%M. Exiting...
        exit /b %errorlevel%
    )
    cd ..
)

echo ✅ Maven build completed!

:: Stop running containers
echo 🛑 Stopping existing Docker containers...
docker compose down

:: Start new containers
echo 🚀 Starting Docker containers...
docker compose up -d

echo ✅ All services are up and running!
docker compose ps
