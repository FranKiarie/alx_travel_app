# ALX Travel App

A Django-based travel listing platform with REST API, Swagger documentation, and MySQL database integration.

## Features

- Django REST Framework for API development
- Swagger/OpenAPI documentation
- CORS headers for cross-origin requests
- MySQL database integration
- Celery for background task processing
- Environment variable management with django-environ

## Prerequisites

- Python 3.8+
- MySQL 8.0+
- RabbitMQ (for Celery)

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd alx_travel_app
```

2. Install dependencies:
```bash
pip3 install -r requirements.txt
```

3. Set up environment variables:
```bash
cp .env.example .env
# Edit .env with your database credentials
```

4. Create MySQL database:
```sql
CREATE DATABASE alx_travel_db;
```

5. Run migrations:
```bash
python3 manage.py makemigrations
python3 manage.py migrate
```

6. Create superuser:
```bash
python3 manage.py createsuperuser
```

7. Start the development server:
```bash
python3 manage.py runserver
```

## API Documentation

Once the server is running, you can access:

- **Swagger UI**: http://localhost:8000/swagger/
- **ReDoc**: http://localhost:8000/redoc/
- **Admin Panel**: http://localhost:8000/admin/
- **Health Check**: http://localhost:8000/api/health/

## Project Structure

```
alx_travel_app/
├── alx_travel_app/          # Main project directory
│   ├── settings.py          # Django settings
│   ├── urls.py             # Main URL configuration
│   └── wsgi.py             # WSGI configuration
├── listings/               # Listings app
│   ├── models.py           # Database models
│   ├── views.py            # API views
│   ├── urls.py             # App URL configuration
│   └── admin.py            # Admin configuration
├── requirements.txt        # Python dependencies
├── .env                    # Environment variables
└── manage.py              # Django management script
```

## Environment Variables

The following environment variables are required in your `.env` file:

```env
SECRET_KEY=your-secret-key
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1

# Database Configuration
DB_NAME=alx_travel_db
DB_USER=root
DB_PASSWORD=your-password
DB_HOST=localhost
DB_PORT=3306

# Celery Configuration
CELERY_BROKER_URL=amqp://localhost:5672
CELERY_RESULT_BACKEND=rpc://
```

## Development

### Running Tests
```bash
python3 manage.py test
```

### Code Quality
```bash
# Check for issues
python3 manage.py check

# Run linting (if configured)
flake8 .
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the BSD License.
