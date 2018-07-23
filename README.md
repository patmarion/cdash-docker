This repo is based off: https://github.com/WardF/docker-cookbook/tree/master/dockerfile-cdash

A docker-ized CDash instance.  See http://www.cdash.org for information regarding cdash.

## Usage

  Use the build.sh script to build the docker image.
  
  Use "run.sh" without arguments to start a container and start
  the mysql and apache services.  After it starts, pressing <enter>
  will exit and stop the container and services.

  Use "run.sh bash" to start a container with an interactive prompt.
  Once inside the container, you can use the "mysql_import.sh" and
  "mysql_export.sh" scripts to import and export the cdash database
  from/to the file /root/local_files/cdash_database.sql.gz.  Note that
  /root/local_files is a mounted volume, so files written to that
  location will be available in the local_files folder outside the
  container.
