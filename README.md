# Distributed System Backend (DSW Backend)

This project contains the backend services for the Distributed System Wayfinding (DSW) application. Each microservice is organized as a submodule within this main repository. These microservices include the following:

- `reward-service`: Manages rewards for users based on system usage.
- `environmental-data-service`: Provides environmental data relevant to route calculations.
- `route-calculation-service`: Calculates optimal routes based on various data sources.
- `real-time-incident-notification-service`: Notifies users about incidents that may affect their routes.
- `user-profile-information-store`: Manages user profile data and preferences.

## Getting Started

### Prerequisites

- Ensure you have Git installed.
- Ensure you have a Java Development Kit (JDK) installed (version 11 or higher).
- You may also need Maven installed to build and run each microservice.

### Cloning the Repository

To clone this repository along with all submodules, use the following command:

```bash
git clone --recurse-submodules git@github.com:ASE-group10/dsw-backend.git
cd dsw-backend
```

If you've already cloned the repository without submodules, you can initialize and update the submodules separately as follows.

### Initializing and Updating Submodules

If you need to set up submodules after cloning, or if submodules have been updated, use these commands:

1. **Initialize and update all submodules** (for the first time setup):

   ```bash
   git submodule init
   git submodule update
   ```

2. **Updating all submodules** (if there are changes to the submodules):

   ```bash
   git submodule update --remote
   ```

### Running the Microservices

Each microservice is a standalone Spring Boot application. To run a specific microservice:

1. **Navigate to the microservice directory**, e.g., `reward-service`:

   ```bash
   cd reward-service
   ```

2. **Build and run** the microservice using Maven:

   ```bash
   ./mvnw spring-boot:run
   ```

Repeat these steps for each microservice as needed.

### Updating Submodules

When changes are made to the submodules, pull the latest updates using:

```bash
git submodule update --remote
```

This command will fetch the latest changes from each submodule's respective repository.

