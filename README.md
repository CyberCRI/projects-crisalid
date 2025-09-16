# Projects - CRISalid

Run Projects backend, CRISalid Apollo server, RabbitMQ and Neo4j graph database.

## Requirements
- Docker Compose V2
- A CRISalid Neo4j graph dump

## Usage

### Clone the repository

```bash
git clone --recurse-submodules git@github.com:CyberCRI/projects-crisalid.git 
```

### Update the submodules

```bash
git pull --recurse-submodules
```

### Set up your environment variables

```bash
cp .env.example .env
```
Default values that work for a local Docker container are given.

### Run the stack

#### Neo4j setup

If you run the stack for the first time, first place your `neo4j.dump` file in the `crisalid-apollo/neo4j/dumps` directory, then run one of the following commands:
```bash
make local-restore  # To run the stack and restore the dump
make build-restore  # To rebuild and run the stack and restore the dump
```

If you already have data in your graph, then run one of the following commands:
```bash
make local  # To run the stack
make build  # To rebuild and run the stack
```

#### Projects backend setup

Get a shell access to the backend container:
```bash
make projects-bash
```

Execute database migrations, collect static files and compile translation files:
```bash
# inside the container
python manage.py migrate
python manage.py collectstatic
python manage.py compilemessages
```

A default superadmin is created in keycloak. To import it in Projects, you need to login at least once in the [swagger](http://localhost:8000/api/schema/swagger-ui) or in [Django admin](http://localhost:8000/admin) using these credentials:
- username: `admin` or `admin@localhost.com`
- password: `admin`

You can also use these credentials (use the `admin` username, not the email) to connect to the [Keycloak admin panel](http://localhost/8001)
