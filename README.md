
# Distributed System Backend (DSW Backend)

This project contains the backend services for the Distributed System Wayfinding (DSW) application. Each microservice is organized as a submodule within this main repository. These microservices include the following:

- `reward-service`: Manages rewards for users based on system usage.
- `environmental-data-service`: Provides environmental data relevant to route calculations.
- `route-calculation-service`: Calculates optimal routes based on various data sources.
- `real-time-incident-notification-service`: Notifies users about incidents that may affect their routes.
- `user-profile-information-store`: Manages user profile data and preferences.

---

## Getting Started

### Prerequisites

- Ensure you have Git installed.
- Ensure you have a Java Development Kit (JDK) installed (version 11 or higher).
- Maven should be installed to build and run each microservice.

---

## Cloning the Repository

To clone this repository along with all submodules, use the following command:

```bash
git clone --recurse-submodules git@github.com:ASE-group10/dsw-backend.git
cd dsw-backend
```

If you've already cloned the repository without submodules, you can initialize and update the submodules separately:

```bash
git submodule init
git submodule update
```

---

## Managing Submodules

### Initializing and Updating Submodules

1. **Initialize and update all submodules** (for first-time setup):

   ```bash
   git submodule init
   git submodule update
   ```

2. **Update all submodules to their latest versions** (if submodules have been updated):

   ```bash
   git submodule update --remote
   ```

---

## Making Changes in a Submodule and Pushing to the Main Repository

### Step 1: Navigate to the Submodule

To make changes to a specific submodule, navigate to its directory. For example, to work on `reward-service`:

```bash
cd reward-service
```

### Step 2: Make Changes in the Submodule

Edit files or add new ones as needed.

### Step 3: Commit Changes in the Submodule

Stage and commit the changes within the submodule repository:

```bash
git add .
git commit -m "Your message describing the changes"
```

### Step 4: Push Changes to the Submodule's Remote Repository

Push the changes to the submodule's repository:

```bash
git push origin main
```

### Step 5: Update the Submodule Reference in the Main Repository

1. Navigate back to the main project directory:

   ```bash
   cd ..
   ```

2. Stage the updated submodule reference:

   ```bash
   git add reward-service
   git commit -m "Updated submodule reward-service to the latest version"
   ```

3. Push the updated reference to the main repository:

   ```bash
   git push origin main
   ```

---

## Example Workflow for Submodule Updates

1. **Edit Code in a Submodule**:
   - Navigate to the submodule directory (e.g., `reward-service`).
   - Make changes, then commit and push them:

     ```bash
     cd reward-service
     # Make your changes...
     git add .
     git commit -m "Fixed issue in reward calculation"
     git push origin main
     ```

2. **Update Submodule Reference in the Main Repository**:
   - Navigate back to the main repository, stage the submodule changes, and commit them:

     ```bash
     cd ..
     git add reward-service
     git commit -m "Updated submodule reward-service to latest commit"
     git push origin main
     ```

3. **Collaborators Pull Updated Submodules**:
   - Other collaborators will need to run the following commands to pull the latest changes in the main project and its submodules:

     ```bash
     git pull
     git submodule update --remote
     ```

---

## Running the Microservices

Each microservice is a standalone Spring Boot application. To run a specific microservice:

1. Navigate to the microservice directory, e.g., `reward-service`:

   ```bash
   cd reward-service
   ```

2. Build and run the microservice using Maven:

   ```bash
   ./mvnw spring-boot:run
   ```

Repeat these steps for each microservice as needed.

