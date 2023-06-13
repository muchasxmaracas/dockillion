# Dockillion
Dockerized Bastillion keybox

For more information visit the [Bastillion website](https://www.bastillion.io/) or the [GitHub page](https://github.com/bastillion-io/Bastillion)

### Local development
* Create .docker/.env.local from .docker/.env.dist
* bin/service [start|stop|restart|build]

### Prerequisites
* Nginx or another webserver for reverse proxy (Nginx recommended for ease of setup)
* ACME for SSL certificates - see [here](https://github.com/acmesh-official/acme.sh) for installation

### Info
* In order for the image to run on ARM64 buildx is used for building
* Deployment was made for GitLab CI/CD initially - currently no Github Actions implemented!

### Crucial
* WARNING: deleting the directory data/keydb or its content equals wiping the complete system! 

### Docker Service Ports
| Port   | Environment | Service            | Domain
| ---    | ---         | ---                | ---
| 12372  | Production  | Bastillion Prod    | prod.yourdomain.com
| 12371  | Stage       | Bastillion Stage   | stage.yourdomain.com
| 8888   | Local Dev   | Development        | [Local Dev](http://localhost:8888)
