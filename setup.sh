#!/bin/bash

# Ollama + OpenWebUI Setup Script

set -e

echo "🚀 Setting up Ollama + OpenWebUI..."

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "🔧 Creating .env file..."
    cp .env.example .env
    echo "⚠️  Please edit .env file and set your WEBUI_SECRET_KEY"
    echo "   You can generate a random key with: openssl rand -hex 32"
fi

# Create necessary directories
echo "📁 Creating directories..."
mkdir -p ollama_data open-webui_data

# Pull latest images
echo "📦 Pulling Docker images..."
docker-compose pull

# Start services
echo "🚀 Starting services..."
docker-compose up -d

# Wait for services to be ready
echo "⏳ Waiting for services to be ready..."
sleep 10

# Check service health
echo "🔍 Checking service health..."
if docker-compose ps | grep -q "Up"; then
    echo "✅ Services are running!"
    echo ""
    echo "🌐 Access OpenWebUI at: http://localhost:8080"
    echo "🔧 Ollama API at: http://localhost:11434"
    echo ""
    echo "📋 Next steps:"
    echo "   1. Open OpenWebUI in browser"
    echo "   2. Create admin account"
    echo "   3. Download models via Settings → Models"
    echo ""
    echo "📊 Monitor logs: docker-compose logs -f"
    echo "🛑 Stop services: docker-compose down"
else
    echo "❌ Services failed to start. Check logs with: docker-compose logs"
    exit 1
fi