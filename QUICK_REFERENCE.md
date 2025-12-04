# Flask Forum - Quick Reference

## 🚀 Quick Start

```bash
# First time setup
./setup.sh

# Run the application
./run.sh
```

## 📝 Common Commands

### Running the App
```bash
uv run flask run                    # Start development server
uv run flask run --port=8000        # Run on custom port
```

### Database Operations
```bash
uv run flask db current             # Check migration status
uv run flask db upgrade             # Apply migrations
uv run flask db migrate -m "msg"    # Create new migration
uv run flask seed run --root="forum/database/seeds"  # Seed database
```

### Dependencies
```bash
uv pip install -r requirements.txt  # Install dependencies
uv pip list                         # List installed packages
```

## 🔧 Troubleshooting

### Database Error?
```bash
uv run flask db upgrade
uv run flask seed run --root="forum/database/seeds"
```

### Missing Dependencies?
```bash
uv pip install -r requirements.txt --force-reinstall
```

### Port Already in Use?
```bash
# Find and kill process on port 5000
lsof -ti:5000 | xargs kill -9

# Or run on different port
uv run flask run --port=8000
```

## 📂 Project Structure

```
flask-forum/
├── forum/              # Main application package
│   ├── apps/          # Application modules (auth, threads, etc.)
│   ├── database/      # Models and seeds
│   ├── templates/     # HTML templates
│   └── public/        # Static files
├── migrations/        # Database migrations
├── .env              # Environment configuration
├── setup.sh          # Setup script
├── run.sh            # Run script
└── UV_SETUP.md       # Detailed documentation
```

## 🌐 URLs

- **Homepage**: http://127.0.0.1:5000/
- **Login**: http://127.0.0.1:5000/login
- **Register**: http://127.0.0.1:5000/register

## ⚙️ Environment Variables (.env)

```env
APP_HOST=localhost
APP_NAME=Flask Forum
SECRET_KEY=your-secret-key
DATABASE_URI=sqlite:///forum.db
MAIL_SERVER=smtp.gmail.com
MAIL_PORT=587
MAIL_USERNAME=your-email@gmail.com
MAIL_PASSWORD=your-password
MAIL_DEFAULT_SENDER=your-email@gmail.com
MAIL_ENCRYPTION=tls
```

## 💡 Tips

- Use `./setup.sh` for first-time setup
- Use `./run.sh` to start the server quickly
- Check `UV_SETUP.md` for detailed documentation
- Database file: `forum.db` (SQLite) or PostgreSQL connection
