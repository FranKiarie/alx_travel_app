# ALX Travel App

A Django-based travel listing platform with REST API, Swagger documentation, and flexible database configuration.

## Quickstart (Dev)

```bash
git clone https://github.com/FranKiarie/alx_travel_app.git
cd alx_travel_app
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
pip install -r requirements.txt
cp .env.example .env
python manage.py migrate
python manage.py runserver
```

Visit http://localhost:8000/admin/ to create a superuser.

## Database Options

### SQLite (Default)
No setup required. Works out of the box with `.env.example`.

### MySQL (Production-like)
1. Install MySQL and create database:
```sql
CREATE DATABASE alx_travel;
CREATE USER 'alx_user'@'localhost' IDENTIFIED BY 'strongpass';
GRANT ALL PRIVILEGES ON alx_travel.* TO 'alx_user'@'localhost';
FLUSH PRIVILEGES;
```

2. Update `.env`:
```env
DB_ENGINE=mysql
DB_NAME=alx_travel
DB_USER=alx_user
DB_PASSWORD=strongpass
DB_HOST=127.0.0.1
DB_PORT=3306
```

3. Install MySQL driver:
```bash
# macOS
brew install mysql-client
export PATH="/opt/homebrew/bin:$PATH"

# Ubuntu/Debian
sudo apt-get install python3-dev default-libmysqlclient-dev build-essential
pip install mysqlclient
```

## REST & CORS

Set `CORS_ALLOWED_ORIGINS` in `.env` for frontend integration:
```env
CORS_ALLOWED_ORIGINS=http://localhost:3000,http://localhost:8080
```

## Static Files (Production)

```bash
python manage.py collectstatic
```

## Optional Swagger

1. Install drf-yasg:
```bash
pip install drf-yasg
```

2. Add to `INSTALLED_APPS` in `settings.py`:
```python
INSTALLED_APPS = [
    # ... other apps
    "drf_yasg",
]
```

3. Add to `urls.py`:
```python
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

schema_view = get_schema_view(
    openapi.Info(title="ALX Travel API", default_version="v1"),
    public=True,
)

urlpatterns = [
    # ... other patterns
    path("swagger/", schema_view.with_ui("swagger")),
    path("redoc/", schema_view.with_ui("redoc")),
]
```

Endpoints: `/swagger/`, `/redoc/`

## Runbook

### Common Commands
```bash
# Lint
flake8 .
black .
isort .

# Django checks
python manage.py check
python manage.py check --deploy

# Migrations
python manage.py makemigrations
python manage.py migrate
python manage.py showmigrations

# User management
python manage.py createsuperuser
python manage.py changepassword <username>

# Tests
python manage.py test
pytest  # if using pytest

# Static files
python manage.py collectstatic
python manage.py findstatic admin/css/base.css
```

## Troubleshooting

### DisallowedHost Error
Add your domain to `ALLOWED_HOSTS` in `.env`:
```env
ALLOWED_HOSTS=127.0.0.1,localhost,yourdomain.com
```

### CORS Blocked
Check `CORS_ALLOWED_ORIGINS` in `.env`:
```env
CORS_ALLOWED_ORIGINS=http://localhost:3000
```

### mysqlclient Install Issues
```bash
# macOS
brew install mysql-client
export PATH="/opt/homebrew/bin:$PATH"
pip install mysqlclient

# Ubuntu/Debian
sudo apt-get install python3-dev default-libmysqlclient-dev build-essential
pip install mysqlclient

# Windows
# Download wheel from https://www.lfd.uci.edu/~gohlke/pythonlibs/#mysqlclient
pip install mysqlclient-2.1.1-cp39-cp39-win_amd64.whl
```

### Environment Variables Not Loading
1. Ensure `.env` exists in project root
2. Check file permissions: `ls -la .env`
3. Verify django-environ is installed: `pip list | grep django-environ`

### Swagger 404
1. Ensure `drf_yasg` is in `INSTALLED_APPS`
2. Check URL patterns in `urls.py`
3. Verify app is in `INSTALLED_APPS`

## Development

```bash
# Run with debug
DEBUG=True python manage.py runserver

# Run tests with coverage
pip install coverage
coverage run --source='.' manage.py test
coverage report
coverage html
```

## License

BSD License