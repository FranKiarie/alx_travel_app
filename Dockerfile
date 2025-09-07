# syntax=docker/dockerfile:1
ARG PYTHON_VERSION=3.12-slim

############################
# Base (builder)
############################
FROM python:${PYTHON_VERSION} AS builder

ENV PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_NO_CACHE_DIR=off \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# System deps for mysqlclient
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    default-libmysqlclient-dev \
    pkg-config \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Allow overriding requirements filename if needed
ARG REQUIREMENTS_FILE=requirements.txt
COPY ${REQUIREMENTS_FILE} /app/requirements.txt

RUN python -m pip install --upgrade pip && \
    pip wheel --wheel-dir /wheels -r /app/requirements.txt

############################
# Runtime
############################
FROM python:${PYTHON_VERSION}

ENV PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_NO_CACHE_DIR=on \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# System runtime deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy wheels from builder for fast, reproducible installs
COPY --from=builder /wheels /wheels
RUN pip install --no-cache-dir /wheels/*

# Copy project
COPY . /app

# A simple entrypoint that waits for DB, runs migrations, then starts server
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose the dev port
EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]