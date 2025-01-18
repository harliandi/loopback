# LoopBack 3 Application Setup

This repository contains a **LoopBack 3** application, which is a highly extensible framework for building APIs and connecting them to backend data sources such as PostgreSQL.

---

## **Prerequisites**

### Required Software:
- **Node.js**: Version 12.x or later (ensure compatibility with LoopBack 3).
- **npm**: Installed with Node.js.
- **Docker**: *(Optional)* For running the application in a container.
- **PostgreSQL**: A database server for storing data.

---

## **Setup Instructions**

### 1. Clone the Repository
```bash
git clone https://github.com/harliandi/loopback.git
cd loopback
```

### 2. Install Dependencies
```bash
npm install
```

### 3. Create a .env file in the root directory with the following content:
```env
# Application settings
PORT=3000

# PostgreSQL database configuration
DB_HOST=localhost
DB_PORT=5432
DB_USER=your_database_user
DB_PASSWORD=your_database_password
DB_DATABASE=your_database_name

# Automigrate settings
AUTO_MIGRATE=false
```

### 4. Run the Application
**Without Docker:**
1. Ensure PostgreSQL is running and accessible with the credentials provided in the .env file.
2. Start the application:
```bash
npm start
```
**With Docker:**
1. Build the Docker image:
```bash
docker build -t loopback .
```
2. Run the container:
```bash
docker run -d --name loopback \
  -p 3000:3000 \
  --env-file .env \
  loopback
```
## **Running Automigrate**
To initialize or reset the database schema, set AUTO_MIGRATE=true in the .env file and restart the application.

For example:

```bash
# Temporarily enable automigrate
AUTO_MIGRATE=true npm start
```
Once the migration is complete, set AUTO_MIGRATE=false again to avoid overwriting the schema.
## **Environment Configuration**
| Variable   |     Default Value      |  Description |
|------------|:----------------------:|-------------:|
| AUTO_MIGRATE |  false | Enables database schema migration at start. |
| PORT |    3000   |   Port for running the application. |
| DB_HOST | localhost |    PostgreSQL host. |
| DB_PORT | 5432 |   PostgreSQL port. |
| DB_USER | your_user |    PostgreSQL username. |
| DB_PASSWORD | your_pass |    PostgreSQL password. |
| DB_DATABASE | your_db |    PostgreSQL database name. |

## **Project Structure**
- **server/**
  - Contains application configurations, models, and datasources.
- **.env**
  - Stores environment variables for local development.
- **Dockerfile**
  - Configuration for building a Docker container.

## **Troubleshooting**
For additional help, refer to the [LoopBack 3 documentation](https://loopback.io/doc/en/lb3/index.html).


