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
# Edit .env with your database credentials
```

4. **Create MySQL database:**
```sql
CREATE DATABASE alx_travel_db;
GRANT ALL PRIVILEGES ON alx_travel_db.* TO 'your_username'@'localhost';
FLUSH PRIVILEGES;
```

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
│   ├── __init__.py         # Python package marker
│   ├── settings.py         # Django settings with environment variables
│   ├── urls.py            # Main URL configuration with Swagger
│   ├── wsgi.py            # WSGI configuration
│   └── asgi.py            # ASGI configuration
├── listings/              # Listings Django app
│   ├── __init__.py        # Python package marker
│   ├── admin.py           # Admin configuration
│   ├── apps.py            # App configuration
│   ├── models.py          # Database models
│   ├── views.py           # API views with health check
│   ├── urls.py            # App URL configuration
│   ├── tests.py           # Test cases
│   └── migrations/        # Database migrations
├── requirements.txt       # Python dependencies (30 packages)
├── .env                   # Environment variables (local)
├── env.example           # Environment variables template
├── .gitignore            # Git ignore rules
├── README.md             # Project documentation
└── manage.py             # Django management script
```

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

### Running Tests
```bash
python3 manage.py test
```

### Code Quality
```bash
# Check for Django issues
python3 manage.py check

# Run linting (if configured)
flake8 .

# Check migrations
python3 manage.py showmigrations
```

### Database Operations
```bash
# Create new migrations
python3 manage.py makemigrations

# Apply migrations
python3 manage.py migrate

# Create superuser
python3 manage.py createsuperuser

# Load sample data (if available)
python3 manage.py loaddata fixtures/sample_data.json
```

### Celery (Background Tasks)
```bash
# Start Celery worker
celery -A alx_travel_app worker --loglevel=info

# Start Celery beat (scheduler)
celery -A alx_travel_app beat --loglevel=info
```

## 🚀 Quick Start

For a quick start without MySQL setup:

1. **Use SQLite temporarily:**
   - Comment out MySQL settings in `settings.py`
   - Uncomment SQLite settings
   - Run `python3 manage.py migrate`
   - Start server with `python3 manage.py runserver`

2. **Access the API:**
   - Health check: http://localhost:8000/api/health/
   - Swagger docs: http://localhost:8000/swagger/

## 📦 Dependencies

This project uses 30 Python packages including:
- **Django 5.2.6** - Web framework
- **Django REST Framework 3.16.1** - API framework
- **drf-yasg 1.21.10** - Swagger documentation
- **PyMySQL 1.1.2** - MySQL database adapter
- **Celery 5.5.3** - Background task processing
- **django-cors-headers 4.7.0** - CORS support

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
