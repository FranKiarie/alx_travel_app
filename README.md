# ALX Travel App

A Django-based travel listing platform with REST API, Swagger documentation, and MySQL database integration. This project serves as the foundation for a travel listing platform with industry-standard best practices for Django development.

## 🚀 Features

- **Django REST Framework** - Robust API development framework
- **Swagger/OpenAPI Documentation** - Interactive API documentation at `/swagger/`
- **CORS Headers** - Cross-origin resource sharing for frontend integration
- **MySQL Database** - Production-ready database with PyMySQL integration
- **Celery Integration** - Background task processing with RabbitMQ
- **Environment Management** - Secure configuration with django-environ
- **Health Check Endpoint** - API status monitoring at `/api/health/`
- **Modular Architecture** - Scalable project structure with separate apps

## 📋 Prerequisites

- **Python 3.8+** - Required for Django 5.2.6
- **MySQL 8.0+** - Database server
- **RabbitMQ** - Message broker for Celery (optional for basic setup)
- **Git** - Version control

## 🛠️ Installation

1. **Clone the repository:**
```bash
git clone https://github.com/FranKiarie/alx_travel_app.git
cd alx_travel_app
```

2. **Install dependencies:**
```bash
pip3 install -r requirements.txt
```

3. **Set up environment variables:**
```bash
cp env.example .env
# Edit .env with your configuration
```

**Required Environment Variables:**
- `SECRET_KEY`: Generate with: `python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"`
- `DEBUG`: Set to `True` for development, `False` for production
- `ALLOWED_HOSTS`: Comma-separated list (e.g., `localhost,127.0.0.1,yourdomain.com`)

**Database Options:**
- **Option A - SQLite (Quick Start)**: Leave `DB_NAME` empty in `.env` to use SQLite
- **Option B - MySQL (Production)**: Set up MySQL and configure database credentials

4. **Database Setup:**

**For MySQL (Production):**
```sql
CREATE DATABASE alx_travel_db;
GRANT ALL PRIVILEGES ON alx_travel_db.* TO 'your_username'@'localhost';
FLUSH PRIVILEGES;
```

**For SQLite (Development):**
- No setup required - database will be created automatically

5. **Run migrations:**
```bash
python3 manage.py makemigrations
python3 manage.py migrate
```

6. **Create superuser (optional):**
```bash
python3 manage.py createsuperuser
```

7. **Start the development server:**
```bash
python3 manage.py runserver
```

The server will start at `http://localhost:8000/`

## 📚 API Documentation

Once the server is running, you can access:

| Endpoint | Description | URL |
|----------|-------------|-----|
| **Swagger UI** | Interactive API documentation | http://localhost:8000/swagger/ |
| **ReDoc** | Alternative API documentation | http://localhost:8000/redoc/ |
| **Admin Panel** | Django admin interface | http://localhost:8000/admin/ |
| **Health Check** | API status endpoint | http://localhost:8000/api/health/ |
| **API Root** | Main API endpoint | http://localhost:8000/api/ |

## 📁 Project Structure

```
alx_travel_app/
├── alx_travel_app/          # Main project directory
│   ├── __init__.py         # Python package marker (empty)
│   ├── settings.py         # Django settings with environment variables
│   ├── urls.py            # Main URL configuration with Swagger
│   ├── wsgi.py            # WSGI configuration
│   └── asgi.py            # ASGI configuration
├── listings/              # Listings Django app
│   ├── __init__.py        # Python package marker (empty)
│   ├── admin.py           # Admin configuration
│   ├── apps.py            # App configuration
│   ├── models.py          # Database models
│   ├── views.py           # API views with health check
│   ├── urls.py            # App URL configuration
│   ├── tests.py           # Test cases
│   └── migrations/        # Database migrations
│       └── __init__.py    # Migrations package marker
├── requirements.txt       # Python dependencies (30 packages)
├── .env                   # Environment variables (local, gitignored)
├── env.example           # Environment variables template
├── .gitignore            # Git ignore rules
├── README.md             # Project documentation
└── manage.py             # Django management script
```

**Note**: Static files, templates, and media directories will be created as needed during development.

## ⚙️ Environment Variables

The following environment variables are required in your `.env` file:

```env
# Django Configuration
SECRET_KEY=your-secret-key-here
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1

# Database Configuration
DB_NAME=alx_travel_db
DB_USER=root
DB_PASSWORD=your-password
DB_HOST=localhost
DB_PORT=3306

# Celery Configuration (Optional)
CELERY_BROKER_URL=amqp://localhost:5672
CELERY_RESULT_BACKEND=rpc://
```

> **Note**: Copy `env.example` to `.env` and update the values according to your setup.

## 🛠️ Development

### Quick Start Commands
```bash
# Check project health
python3 manage.py check

# Run tests
python3 manage.py test

# Start development server
python3 manage.py runserver

# Access API documentation
open http://localhost:8000/swagger/
```

### Database Operations
```bash
# Create new migrations
python3 manage.py makemigrations

# Apply migrations
python3 manage.py migrate

# Show migration status
python3 manage.py showmigrations

# Create superuser
python3 manage.py createsuperuser

# Reset database (SQLite)
rm db.sqlite3 && python3 manage.py migrate

# Load sample data (if available)
python3 manage.py loaddata fixtures/sample_data.json
```

### Code Quality & Testing
```bash
# Check for Django issues
python3 manage.py check

# Run linting (if configured)
flake8 .

# Run tests with coverage
python3 manage.py test --verbosity=2

# Check for security issues
python3 manage.py check --deploy
```

### Static Files & Media
```bash
# Collect static files
python3 manage.py collectstatic

# Serve static files in development
python3 manage.py runserver --insecure
```

### Celery (Background Tasks)
```bash
# Start Celery worker
celery -A alx_travel_app worker --loglevel=info

# Start Celery beat (scheduler)
celery -A alx_travel_app beat --loglevel=info

# Monitor Celery tasks
celery -A alx_travel_app flower
```

### Environment Management
```bash
# Generate new secret key
python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"

# Check environment variables
python3 manage.py shell -c "from django.conf import settings; print('DEBUG:', settings.DEBUG)"

# Validate .env file
python3 -c "import os; from dotenv import load_dotenv; load_dotenv(); print('SECRET_KEY set:', bool(os.getenv('SECRET_KEY')))"
```

## 🚀 Quick Start (5 minutes)

**For immediate testing without MySQL setup:**

1. **Clone and install:**
```bash
git clone https://github.com/FranKiarie/alx_travel_app.git
cd alx_travel_app
pip3 install -r requirements.txt
```

2. **Use SQLite (no database setup needed):**
```bash
cp env.example .env
# Edit .env and leave DB_NAME empty to use SQLite
```

3. **Run the project:**
```bash
python3 manage.py migrate
python3 manage.py runserver
```

4. **Access the API:**
   - **Health Check**: http://localhost:8000/api/health/
   - **Swagger Docs**: http://localhost:8000/swagger/
   - **Admin Panel**: http://localhost:8000/admin/
   - **ReDoc**: http://localhost:8000/redoc/

**That's it!** Your Django API is running with SQLite database.

## 📦 Dependencies & Third-Party Apps

This project uses 30 Python packages including:

### Core Framework
- **Django 5.2.6** - Web framework
- **Django REST Framework 3.16.1** - API framework

### API Documentation
- **drf-yasg 1.21.10** - Swagger/OpenAPI documentation
- **PyYAML 6.0.2** - YAML support for API docs

### Database & Authentication
- **PyMySQL 1.1.2** - MySQL database adapter
- **cryptography 45.0.7** - MySQL authentication support

### CORS & Security
- **django-cors-headers 4.7.0** - Cross-Origin Resource Sharing
- **django-environ 0.12.0** - Environment variable management

### Background Tasks
- **Celery 5.5.3** - Background task processing
- **kombu 5.5.4** - Message transport
- **billiard 4.2.1** - Multiprocessing library

### Configuration
- **CORS_ALLOWED_ORIGINS**: Configured for localhost:3000, localhost:8000
- **REST_FRAMEWORK**: Pagination, JSON rendering, permissions
- **SWAGGER_SETTINGS**: Interactive API documentation

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Add tests if applicable
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## 📄 License

This project is licensed under the BSD License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

If you encounter any issues:

1. Check the [Issues](https://github.com/FranKiarie/alx_travel_app/issues) page
2. Create a new issue with detailed information
3. Ensure all prerequisites are installed
4. Verify your environment variables are correct

---

**Built with ❤️ for ALX Software Engineering Program**
