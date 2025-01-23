# Enable parallel execution
# 3 is the max parallel processes needed so far (for prestart)
MAKEFLAGS += -j3

# Docker
.PHONY: local
local:
	docker compose up

.PHONY: build
build:
	docker compose up --build

.PHONY: local-restore
local-restore:
	RESTORE_NEO4J_DUMP=true docker-compose up

.PHONY: build-restore
build-restore:
	RESTORE_NEO4J_DUMP=true docker-compose up --build

# Projects backend
.PHONY: projects-bash
projects-bash: 
	docker exec -it projects-backend bash
