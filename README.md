# Setting up a self hosted Regexr service

The goal of this is to make it possible to run your own regexr.com service.

The source, both client and server, is available on gskinners GitHub https://github.com/gskinner/regexr and that's what I've chosen to use as my base for all of this.

This specific setup requires Docker. There are probably a hundred different ways of doing this, but Docker seem to be fairly popular for localhosted bits and bobs.

This was made using Ubuntu, so I will assume you have a similar environment if you want to try this out.

# What you need

* Docker
* docker-compose
* A text editor
* A clone of this repository
* A few instructions seen below
* A bit of patience and understanding. I didn't spend time on making automation scripts for everything

# Installation

1. Clone this repo into a folder of your choosing
1. If you have `curl` installed on your computer, you can use the `fetch-regexr-release.sh` script to get the currently latest release, 3.6.1, of Regexr put into its proper folder
1. Review the files `docker-compose.yml`, `Dockerfile-app`, `Dockerfile-api` if you'd like to change anything or just read the contents of what's about to be set up
1. Create a folder called `datastore` and set the permissions to allow for Docker containers to write to it. This folder is used as the database storage area
1. Edit the file `./regexr-3.6.1/dev/srv/net/Server.js`
   * Change the last line from  
     `Server.url =  Server.host + "/server/api.php";`  
     to  
     `Server.url =  "http://localhost:8888/server/api.php";`
1. Copy the file  
   `./regexr-3.6.1/server/Config.sample.php`  
   to  
   `./regexr-3.6.1/server/Config.php`
1. Edit the file `./regexr-3.6.1/server/Config.php`
   * Change the following lines from  
     `define('DB_HOST', 'YOUR_DB_HOST');`  
     `define('DB_USER_NAME', 'YOUR_DB_USER_NAME');`  
     `define('DB_PASSWORD', 'YOUR_DB_PASSWORD');`  
     `define('DB_NAME', 'YOUR_DB_NAME');`  
     to  
     `define('DB_HOST', 'db');`  
     `define('DB_USER_NAME', 'root');`  
     `define('DB_PASSWORD', 'Impish capacity footgear partyanimal 1234');`  
     `define('DB_NAME', 'regexr');`  
1. Edit the file `./regexr-3.6.1/server/api.php`
   * Change the following lines from  
     ```
     if (DEBUG) {
      header("Access-Control-Allow-Origin: *");
     }
     ```
     to  
     `header("Access-Control-Allow-Origin: *");`
1. Run `docker-compose build` to prep the images or `docker-compose up` to build and run the service

# Post-install

* There's an ad popping up in the bottom left corner, and it's included in the Regexr source and not associated with me. Considering this is supposed to be an as stand alone, self hosted solution as possible, you man want to look for the ad generation code and comment that out, to not start getting ad traffic from networks you don't want.

# Accessing

* You'll be able to reach your self hosted Regexr service on `http://localhost:3000`
