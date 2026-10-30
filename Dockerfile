FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt pyproject.toml README.md ./
RUN pip install --no-cache-dir -r requirements.txt

COPY src ./src
RUN pip install --no-cache-dir --no-deps .

COPY data ./data

RUN useradd --create-home appuser && chown -R appuser /app
USER appuser

CMD ["python", "-m", "etl_pipeline"]
