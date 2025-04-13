# Distributed System Backend (DSW Backend)

This repository contains all backend microservices for the **Distributed System Wayfinding (DSW)** application. Each microservice is organized as a Git submodule.

## 🧩 Microservices Included

- `reward-service`
- `environmental-data-service`
- `route-calculation-service`
- `real-time-incident-notification-service`
- `user-profile-information-store`

---

## 🚀 Getting Started

### 1. Clone the Repository (with Submodules)

```bash
git clone --recurse-submodules git@github.com:ASE-group10/dsw-backend.git
cd dsw-backend
```

> 🛠 If you cloned it without `--recurse-submodules`, run:
>
> ```bash
> git submodule init
> git submodule update
> ```

To update all submodules later:

```bash
git submodule update --remote
```

---

### 2. Environment Setup

Create a `.env` file in the root directory with all required configuration. **This is mandatory** before running the services.

Here’s a partial `.env` sample (trim or replace as needed):

```env
# ---------------------------------------
# Route Calculation Service Configuration
# ---------------------------------------
ROUTE_SERVICE_NAME=route-calculation-service
ROUTE_SERVICE_PORT=8080
USER_PROFILE_SERVICE_URL=http://user-profile-service:8083
INCIDENT_SERVICE_URL=http://notification-service:8080
ENVIRONMENTAL_DATA_SERVICE_URL=http://environmental-data-service:8081
LOGGING_LEVEL_SPRING=INFO

# ---------------------------------------
# Environmental Data Service Configuration
# ---------------------------------------
ENV_SERVICE_NAME=environmental-data-service
ENV_SERVICE_PORT=8081
ENV_DATASOURCE_URL=jdbc:postgresql://environmental-database:5432/environmental_data
ENV_DATASOURCE_USERNAME=admin
ENV_DATASOURCE_PASSWORD=admin
GEOJSON_URL=https://data.smartdublin.ie/dataset/4976e11e-a015-4ef9-9179-dc7c27fb5a81/resource/ec7f3108-c12b-4e07-b482-470f28f52aca/download/airview_dublincity_roaddata_ugm3

# ---------------------------------------
# Notification Service Configuration
# ---------------------------------------
NOTIF_SERVICE_NAME=notification-service
NOTIF_SERVICE_PORT=8082
NOTIF_DATASOURCE_URL=jdbc:postgresql://notification-database:5432/real-time-notification-service
NOTIF_DATASOURCE_USERNAME=admin
NOTIF_DATASOURCE_PASSWORD=admin

# Twilio Configuration
TWILIO_ACCOUNT_SID=your_twilio_account_sid_here
TWILIO_AUTH_TOKEN=your_twilio_auth_token_here
TWILIO_PHONE_NUMBER=+17753685417
DEMO_PHONE_NUMBER=+1234567890

# ---------------------------------------
# User Profile Service Configuration
# ---------------------------------------
USER_SERVICE_NAME=user-profile-service
USER_SERVICE_PORT=8083
USER_DATASOURCE_URL=jdbc:postgresql://user-profile-database:5432/user-profile-database
USER_DATASOURCE_USERNAME=admin
USER_DATASOURCE_PASSWORD=admin

# Auth0 Configuration
AUTH0_CLIENT_ID=your_auth0_client_id_here
AUTH0_CLIENT_SECRET=your_auth0_client_secret_here
AUTH0_DOMAIN=https://your-auth0-domain/
AUTH0_AUDIENCE=https://your-auth0-domain/api/v2

# ---------------------------------------
# Reward Service Configuration
# ---------------------------------------
REWARD_SERVICE_NAME=reward-service
REWARD_SERVICE_PORT=8084
REWARD_DATASOURCE_URL=jdbc:postgresql://reward-database:5432/reward_service_db
REWARD_DATASOURCE_USERNAME=admin
REWARD_DATASOURCE_PASSWORD=admin

# ---------------------------------------
# Databases Configuration
# ---------------------------------------

# Environmental Database
ENV_DB_NAME=environmental_data
ENV_DB_USER=admin
ENV_DB_PASSWORD=admin
ENV_DB_PORT=6543

# Notification Database
NOTIF_DB_NAME=real-time-notification-service
NOTIF_DB_USER=admin
NOTIF_DB_PASSWORD=admin
NOTIF_DB_PORT=7543

# User Profile Database
USER_DB_NAME=user-profile-database
USER_DB_USER=admin
USER_DB_PASSWORD=admin
USER_DB_PORT=8543

# Reward Database
REWARD_DB_NAME=reward_service_db
REWARD_DB_USER=admin
REWARD_DB_PASSWORD=admin
REWARD_DB_PORT=9543

# ---------------------------------------
# Common Configuration
# ---------------------------------------
SPRING_JPA_HIBERNATE_DDL_AUTO=update

PYROSCOPE_SERVER_ADDR=http://pyroscope:4040
PYROSCOPE_USER=admin
PYROSCOPE_PASSWORD=admin123

# Open Weather Map Configuration
OPEN_WEATHER_API_KEY=your_open_weather_api_key_here

PGADMIN_DEFAULT_EMAIL=admin@admin.com
PGADMIN_DEFAULT_PASSWORD=your_pgadmin_password_here
```

---

### 3. Run with Docker

Ensure Docker is installed and running on your system.

#### To start all services:

```bash
docker compose up --build -d
```

#### To stop services:

```bash
docker compose down
```
