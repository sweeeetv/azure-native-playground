#!/bin/bash

# 1. Define variables for the registry, image name, tag, and app directory
REGISTRY_NAME="plygrndsharedacr"
IMAGE_NAME="header-parser"
TAG="v1"
APP_DIR="../items/fcc-backend-header-parser"
echo "⛔️ starting build for $IMAGE_NAME..."

# 2. Move to the directory where the code lives
cd $APP_DIR

# 3. Use Azure's 'Remote Build' 
# This tells Azure to build the image in the cloud so your Mac doesn't get hot
az acr build --registry $REGISTRY_NAME --image $IMAGE_NAME:$TAG .

echo "✅ Build and Push complete!"