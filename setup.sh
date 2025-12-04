#!/bin/bash

# Flask Forum Setup Script
# This script sets up the Flask forum application using uv

set -e  # Exit on error

echo "🚀 Flask Forum Setup Script"
echo "============================"
echo ""

# Check if .env file exists
if [ ! -f .env ]; then
    echo "⚠️  .env file not found. Creating from .env.example..."
    cp .env.example .env
    echo "✅ .env file created. Please edit it with your configuration."
    echo ""
    echo "Required configuration:"
    echo "  - APP_HOST (e.g., localhost)"
    echo "  - APP_NAME (e.g., Flask Forum)"
    echo "  - SECRET_KEY (generate a random string)"
    echo "  - DATABASE_URI (e.g., sqlite:///forum.db or postgresql://user:pass@localhost/dbname)"
    echo "  - MAIL_* settings for email functionality"
    echo ""
    read -p "Press Enter after you've configured .env to continue..."
fi

# Install dependencies using uv
echo "📦 Installing dependencies with uv..."
uv pip install -r requirements.txt
echo "✅ Dependencies installed"
echo ""

# Run database migrations
echo "🗄️  Running database migrations..."
uv run flask db upgrade
echo "✅ Database migrations completed"
echo ""

# Seed the database
echo "🌱 Seeding database with initial data..."
if uv run flask seed run --root="forum/database/seeds"; then
    echo "✅ Database seeded successfully"
else
    echo "⚠️  Seeding failed or already completed"
fi
echo ""

echo "✨ Setup completed successfully!"
echo ""
echo "To start the development server, run:"
echo "  ./run.sh"
echo ""
echo "Or manually with:"
echo "  uv run flask run"
