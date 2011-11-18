# server_rotate

## What is it? 

server_rotate is a very simple server in Sinatra that gets a list of files and serve them, one at a time.

## Usage

Put n files inside the "files" folder. The first time that you run the server and access the "/" route, the server will create a YAML file inside the "cache" folder. From then on, it will use this "database" to keep track of which file it will server next.

After the last file, the server will wrap around and start all over again with the first file. 
