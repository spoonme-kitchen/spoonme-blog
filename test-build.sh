#!/bin/bash

# Test script to verify the build process works locally
# This mimics what the GitHub Actions workflow does

set -e  # Exit on error

echo "🧪 Testing build process..."
echo ""

# Check if dependencies are installed
echo "📦 Checking dependencies..."
if ! command -v bundle &> /dev/null; then
    echo "❌ Bundler not found. Please install Ruby and run: gem install bundler"
    exit 1
fi

if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Please install Node.js"
    exit 1
fi

# Install Ruby dependencies
echo "📦 Installing Ruby dependencies..."
bundle install

# Install Node dependencies
echo "📦 Installing Node dependencies..."
npm ci

# Build the site
echo "🔨 Building Jekyll site..."
JEKYLL_ENV=production bundle exec jekyll build

# Check if build was successful
if [ ! -d "_site" ]; then
    echo "❌ Build failed: _site directory not found"
    exit 1
fi

# Check if CSS was compiled
if [ ! -f "_site/assets/css/main.css" ]; then
    echo "❌ Build failed: CSS file not found"
    exit 1
fi

# Check if CSS contains Tailwind classes (basic check)
if ! grep -q "\.bg-primary" "_site/assets/css/main.css"; then
    echo "⚠️  Warning: CSS file exists but may not contain Tailwind classes"
    echo "   This might be okay if you're not using those classes, but worth checking"
else
    echo "✅ Tailwind CSS classes found in compiled CSS"
fi

echo ""
echo "✅ Build successful!"
echo "📁 Built site is in: _site/"
echo "🌐 You can preview it with: bundle exec jekyll serve"
