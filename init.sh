#!/bin/bash

# List of submodule names and repository SSH URLs
submodule_names=("reward-service" "environmental-data-service" "route-calculation-service" "real-time-incident-notification-service" "user-profile-information-store")
submodule_repos=("git@github.com:ASE-group10/reward-service.git" "git@github.com:ASE-group10/environmental-data-service.git" "git@github.com:ASE-group10/route-calculation-service.git" "git@github.com:ASE-group10/real-time-incident-notification-service.git" "git@github.com:ASE-group10/user-profile-information-store.git")

# Function to initialize a Maven-based Spring Boot project using Spring Initializr
initialize_spring_boot_project() {
  local module_name=$1
  local module_repo=$2

  echo "Initializing Spring Boot project for $module_name..."

  # Use Spring Initializr to create a basic Spring Boot project with Maven
  curl https://start.spring.io/starter.zip \
    -d groupId=com.example \
    -d artifactId=$module_name \
    -d name=$module_name \
    -d description="Spring Boot microservice for $module_name" \
    -d packageName=com.example.$module_name \
    -d dependencies=web,data-jpa,h2 \
    -d type=maven-project \
    -o $module_name.zip

  # Unzip and move the project to the submodule directory, overwriting without prompt
  unzip -o $module_name.zip -d $module_name
  rm $module_name.zip

  # Remove existing .git folder to avoid conflicts
  rm -rf $module_name/.git

  # Initialize the submodule as a Git repository and add remote
  cd $module_name
  git init
  git remote add origin "$module_repo"

  # Fetch the latest changes if the repository already exists
  git fetch origin main || true
  git reset --soft origin/main || true

  git add .
  git commit -m "Initial Maven Spring Boot setup for $module_name"
  git branch -M main

  # Attempt to push changes, handling non-fast-forward errors by rebasing
  git pull --rebase origin main || true
  git push -u origin main

  cd ..
}

# Add and initialize each submodule
for i in "${!submodule_names[@]}"; do
  module_name=${submodule_names[$i]}
  module_repo=${submodule_repos[$i]}

  echo "Adding submodule $module_name..."
  git submodule add "$module_repo" "$module_name" || true  # Skip if already exists

  # Initialize Maven-based Spring Boot project for each submodule
  initialize_spring_boot_project "$module_name" "$module_repo"
done

# Commit the submodule additions in the main repository
git add .
git commit -m "Added and initialized Maven-based Spring Boot projects for all microservices as submodules"
git push origin main

