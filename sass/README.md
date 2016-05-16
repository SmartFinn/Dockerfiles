Docker Sass
============

Run [Sass](http://sass-lang.com/) inside a [Docker](http://www.docker.com) container.

Instructions
------------

1. Clone this repository and change to the directory:
  ```sh
  git clone https://github.com/SmartFinn/Dockerfiles.git && cd Dockerfiles/sass
  ```

2. Build and run a container:
  ```sh
  make build
  ./sass-watch dir/with/sass/files/
  ```
  or
  ```sh
  docker build -t smartfinn/sass .
  ./sass-watch dir/with/sass/files/
  ```

3. Use it.
