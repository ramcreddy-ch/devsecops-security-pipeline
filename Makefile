.PHONY: help scan lint test build

help:
	@echo "DevSecOps Security Pipeline CLI"
	@echo "  scan   - Run local Trivy security scan"
	@echo "  lint   - Run Dockerfile and YAML linting"
	@echo "  test   - Run unit tests"
	@echo "  build  - Build secure multi-stage Docker image"

scan:
	docker run --rm -v $(PWD):/root/.cache/ aquasecurity/trivy fs /root/project

lint:
	hadolint Dockerfile
	yamllint .

test:
	go test ./...

build:
	docker build -t my-secure-app:latest .
