# Flask Forum - UV Setup Guide

This guide explains how to run the Flask Forum application using `uv`, a fast Python package installer and resolver.

## Prerequisites

- Python 3.9 or higher
- `uv` installed (install with: `pip install uv` or `curl -LsSf https://astral.sh/uv/install.sh | sh`)
- PostgreSQL or SQLite database

## Quick Start with UV

### 1. Clone and Navigate

```bash
git clone https://github.com/juvpengele/flask-forum.git
cd flask-forum
```

### 2. Configure Environment

The `.env` file should already exist. If not, copy from example:

```bash
cp .env.example .env
```

Edit `.env` with your configuration:

```env
APP_HOST=localhost
APP_NAME=Flask Forum
SECRET_KEY=your-secret-key-here
DATABASE_URI=sqlite:///forum.db
# Or for PostgreSQL:
# DATABASE_URI=postgresql://username:password@localhost/flask_forum

MAIL_SERVER=smtp.gmail.com
MAIL_PORT=587
MAIL_USERNAME=your-email@gmail.com
MAIL_PASSWORD=your-app-password
MAIL_DEFAULT_SENDER=your-email@gmail.com
MAIL_ENCRYPTION=tls
```

### 3. Run Setup Script

The setup script will:
- Install all dependencies using `uv`
- Run database migrations
- Seed the database with initial data

```bash
./setup.sh
```

### 4. Start the Application

```bash
./run.sh
```

Or manually:

```bash
uv run flask run
```

The application will be available at: **http://127.0.0.1:5000/**

## Manual Commands with UV

### Install Dependencies

```bash
uv pip install -r requirements.txt
```

### Database Management

```bash
# Check current migration version
uv run flask db current

# Create a new migration
uv run flask db migrate -m "description"

# Apply migrations
uv run flask db upgrade

# Rollback migration
uv run flask db downgrade
```

### Seed Database

```bash
uv run flask seed run --root="forum/database/seeds"
```

### Run Development Server

```bash
uv run flask run
```

### Run with Custom Host/Port

```bash
uv run flask run --host=0.0.0.0 --port=8000
```

## Troubleshooting

### Issue: Database Connection Error

**Solution:** Check your `DATABASE_URI` in `.env` file. For SQLite, use:
```
DATABASE_URI=sqlite:///forum.db
```

For PostgreSQL, ensure the database exists:
```bash
createdb flask_forum
```

### Issue: Migration Errors

**Solution:** Reset migrations:
```bash
uv run flask db downgrade base
uv run flask db upgrade
```

### Issue: Missing Dependencies

**Solution:** Reinstall dependencies:
```bash
uv pip install -r requirements.txt --force-reinstall
```

### Issue: pkg_resources Warning

This is a deprecation warning from setuptools and can be safely ignored. The application will still run correctly.

## Development Workflow

1. **Make code changes**
2. **Create migration** (if database schema changed):
   ```bash
   uv run flask db migrate -m "description of changes"
   ```
3. **Apply migration**:
   ```bash
   uv run flask db upgrade
   ```
4. **Test changes** - The dev server auto-reloads on file changes

## Production Deployment

For production, use gunicorn:

```bash
uv run gunicorn -w 4 -b 0.0.0.0:8000 "forum:app"
```

## Why UV?

- **Faster**: 10-100x faster than pip
- **Better dependency resolution**: Resolves conflicts more reliably
- **Modern**: Built with Rust for performance
- **Compatible**: Works with existing requirements.txt and pyproject.toml

## Additional Resources

- [UV Documentation](https://github.com/astral-sh/uv)
- [Flask Documentation](https://flask.palletsprojects.com/)
- [Flask-Migrate Documentation](https://flask-migrate.readthedocs.io/)
