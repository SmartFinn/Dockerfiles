# Docker PlexMediaServer

Run [Plex Media Server](https://plex.tv/) (non plexpass) inside a [Docker](http://www.docker.com) container.

## Instructions

1. Clone this repository and change to the directory:

  ```sh
  git clone https://github.com/SmartFinn/Dockerfiles.git
  cd Dockerfiles/plexmediaserver
  ```

2. Build and run a container:

  ```sh
  make build
  make run
  ```

  or build your own

  ```sh
  mkdir -p "$HOME/.plexmediaserver"
  docker build -t $USER/plexmediaserver .
  docker run --detach=true --restart=unless-stopped \
    --net=host --publish=32400:32400 \
    --user=$(id -u):$(id -g) \
    --volume=/etc/localtime:/etc/localtime:ro \
    --volume=$HOME/.plexmediaserver:/config \
    --volume=/media:/media \
    --name plexmediaserver $USER/plexmediaserver
  ```

3. Open [http://localhost:32400/web](http://localhost:32400/web) or `http://<docker-host-ip>:32400/web` in your browser.
