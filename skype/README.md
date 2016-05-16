Docker Skype
============

Run full-featured [Skype](http://www.skype.com) inside a [Docker](http://www.docker.com) container.

Instructions
------------

1. Clone this repository and change to the directory:
  ```sh
  git clone https://github.com/SmartFinn/Dockerfiles.git && cd Dockerfiles/skype
  ```

2. Build and run a container:
  ```sh
  make build
  ./skype
  ```
  or
  ```sh
  docker build -t smartfinn/skype .
  ./skype
  ```

3. Use Skype.
