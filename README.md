# grafana

**Monitoring service for docker containers**

### Prerequisites:
- [Docker](https://docs.docker.com/engine/install/)
- [docker-compose](https://docs.docker.com/compose/install/)
- [Makefile](https://www.gnu.org/software/make/)
- [Docker loki-logging plugin](https://grafana.com/docs/loki/latest/clients/docker-driver/)


### Start service
1. Clone this repo
2. Add `.env` file (`cp .env.example .env`) and update if needed 
3. Start service: `make up`

To stop service: `make down`


### Configure compose-file for services to store logs:
1. Add logging extension in head of file:
    ```yaml
    x-logging: &loki-logging
      driver: loki
      options:
        loki-url: "${LOKI_URL}"
    ```
2. For each service in `services:` add logging plugin to store logs:
    ```yaml
    services:
      nginx:
        image: nginx:latest
        logging: *loki-logging  # add this line
    ```
   