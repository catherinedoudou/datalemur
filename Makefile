.PHONY: run clean fix lint

SHELL := /bin/bash

run:
	set -e; \
	make clean; \
	pwd; \
	python -m venv venv; \
	source ./venv/bin/activate; \
	pip install --upgrade pip; \
	pip install -r requirements.txt;
clean:
	rm -rf venv;
fix:
	sqlfluff fix;
lint:
	sqlfluff lint;