<p align="center">
  <a target="blank"><img src="https://raw.githubusercontent.com/mohamedo7x/Traffic/refs/heads/front-end/Dashboard/src/assets/Images/mini-logo.png?token=GHSAT0AAAAAADAF7SWPQM4RIFJ75JMMPKACZ6TFZAQ" width="120" alt="Nest Logo" /></a>
</p>
<h3 align="center">Backend License Plate AI Tracker📷</h3>

# Running a Container with Dummy Data

This guide explains how to start a Docker container with dummy data for testing or development purposes.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed on your machine.
- A sample Docker image (e.g., MySQL, PostgreSQL, MongoDB, or a custom application).

## Steps to Start a Container with Dummy Data

### 1. Pull the Required Docker Image

Before starting, ensure you have the necessary Docker image:

```sh
# Example: Pull a MySQL image
docker pull mysql:latest
```

### 2. Create a Dummy Data Script

For databases, create an SQL file with dummy data. Example (`dummy_data.sql`):

```sql
CREATE DATABASE testdb;
USE testdb;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO users (name, email) VALUES
    ('Alice', 'alice@example.com'),
    ('Bob', 'bob@example.com');
```

### 3. Start the Container and Load Dummy Data

```sh
# Start a MySQL container
docker run --name mysql_container -e MYSQL_ROOT_PASSWORD=root -d mysql:latest

# Copy the dummy data script into the container
docker cp dummy_data.sql mysql_container:/dummy_data.sql

# Execute the script inside the container
docker exec -i mysql_container mysql -uroot -proot < dummy_data.sql
```

### 4. Verify the Data

You can verify the inserted data by connecting to the database:

```sh
docker exec -it mysql_container mysql -uroot -proot -e "SELECT * FROM testdb.users;"
```

### 5. Stop and Remove the Container

When done, clean up by stopping and removing the container:

```sh
docker stop mysql_container
docker rm mysql_container
```

## Conclusion

Now, you have a running container populated with dummy data. You can use this setup for testing and development. Adjust the data as needed for your use case!