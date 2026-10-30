.PHONY: install run test lint format docker-build docker-run

install:
	pip install -r requirements-dev.txt && pip install -e .

run:
	python -m etl_pipeline

test:
	pytest --cov=etl_pipeline --cov-report=term-missing

lint:
	ruff check . && ruff format --check .

format:
	ruff check --fix . && ruff format .

docker-build:
	docker build -t etl-clientes .

docker-run:
	docker run --rm -v "$$(pwd)/data:/app/data" etl-clientes
