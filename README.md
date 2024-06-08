# taiwan-osm-postgis
This repository provides a Docker Compose setup for running a PostGIS database populated with OpenStreetMap (OSM) data for Taiwan. This setup allows users to easily create and manage a spatial database with Taiwan's map data.

## Prerequisites
- Docker
- Docker Compose

## Getting Started
1. **Clone the Repository**
    ```
    git clone https://github.com/yourusername/taiwan-osm-postgis.git
    cd taiwan-osm-postgis

    ```
2. **Create a `.env` File**  
    Create a `.env` file in the root directory of the project with the following content:
    ```
    POSTGRES_USER=your_username
    POSTGRES_PASSWORD=your_password
    POSTGRES_DB=your_database
    ```
3. **Initialize the Database**  
    Ensure you have an initialization script named init.sql in the root directory. This script should include the necessary SQL commands to set up your PostGIS extensions and any other required initializations.

4. **Run Docker Compose**  
    Run the following command to start the services:
    ```
    docker compose up --build
    ```

    This command will perform the following steps:

    1. Start a PostGIS container.
    2. Download the latest OSM data for Taiwan.
    3. Import the OSM data into the PostGIS database.
    4. Initialize the database with the specified SQL script.

5. **Verify the Setup**  
    Once the containers are up and running, you can verify the database setup by connecting to the PostGIS container:
    ```
    docker compose exec postgis psql -U [your user name] -d [your db name]
    ```
    You can check if the data is correctly imported by running a query:
    ```
    SELECT * FROM planet_osm_roads LIMIT 10;
    ```

## Directory Structure
```
.
├── docker-compose.yml
├── Dockerfile
├── .env
├── init.sql
├── README.md
└── init_postgis
    └── create_extensions.sql
```

## Docker Compose Configuration
Here's a brief explanation of the Docker Compose configuration:

- postgis: This service runs the PostGIS database.
- osm2pgsql: This service downloads the OSM data for Taiwan and imports it into the PostGIS database.
- init-postgis: This service initializes the PostGIS database with the provided SQL script.

## Troubleshooting
- **Environment Variables:** Ensure the `.env` file contains the correct environment variables.
- **Data Import:** If the `planet_osm_roads` table is empty, check the logs for the osm2pgsql service to identify any issues during the data import process.
- **PostGIS Initialization:** Ensure the `init.sql` file contains the correct SQL commands to set up PostGIS extensions and initialize the database properly.

## Contributing
Feel free to open issues or submit pull requests if you have any improvements or suggestions.

## License
This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.