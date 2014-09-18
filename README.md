mini-rails-fb
=============

This is a small project that I did for an interview on limited time.

First you'll have to add a Facebook Api Token in `lib/tasks/container.rake` on second line.

This project comes with a Dockerfile, build it like any docker image and run it with:

`docker run  -d -p 3000:3000 <name> rake run`

It should start on: http://192.168.59.103:3000/

Or you can just do a `export FBGRAPH_ACCESS_TOKEN=<facebooktoken>` to add it to your env and launch the project like any rails project.