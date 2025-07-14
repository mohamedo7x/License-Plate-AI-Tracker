<p align="center">
  <a target="blank">
    <img src="./mini-logo.png" width="120" alt="PR" />
  </a>
</p>
<h3 align="center">Backend License Plate AI Tracker 📷</h3>

# Running the Project with Docker

## Prerequisites

Before starting the project, ensure you have the following installed:

- [Docker ](https://www.docker.com/get-started)

---

## Running the Project in Development Mode

Follow these steps to set up the development environment:

1. **Clone the Repository** 🔽  
   Download the project to your device:

   ```sh
   git clone https://github.com/mohamedo7x/Traffic.git
   ```

2. **Navigate to the Project Directory** 📂  
   Change into the project folder:

   ```sh
   cd Traffic
   ```

3. **Build and Start the Containers**

   Build the images and run the containers:

   ```sh
   docker-compose -f docker-compose.yml up --build -d
   ```

4. **Access the Application** 🌐

   - **Backend Server:** [http://localhost:8080](http://localhost:8080)
   - **MySQL Database:** Accessible on port `3307`

5. **Stopping the Containers** 🛑  
   When you need to stop the services:
   ```sh
   docker pull mohamedo7x/license-plate-ai-tracker:latest
   ```

---

## Running the Project in Production Mode

For a production-ready setup, use these steps:

1. **Navigate to the Project Directory** 📂

   ```sh
   cd /path/to/project
   ```

2. **Build and Start the Containers**  
   Use the production configuration:

   ```sh
   docker-compose -f docker-compose.prod.yml up --build -d
   ```

3. **Access the Production Application** 🌐

   - **Production Server:** [http://localhost:3001](http://localhost:3001)
   - **MySQL Database:** Accessible on port `3307`

4. **Stopping the Containers** 🛑  
   Stop the production services when needed:
   ```sh
   docker-compose -f docker-compose.prod.yml down
   ```

---

