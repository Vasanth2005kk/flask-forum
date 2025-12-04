#!/bin/bash

# Flask Forum Run Script
# This script runs the Flask forum application using uv

echo "🚀 Starting Flask Forum..."
echo ""

# Check if .env exists
if [ ! -f .env ]; then
    echo "❌ Error: .env file not found!"
    echo "Please run ./setup.sh first"
    exit 1
fi

# Run the Flask application
uv run flask run
