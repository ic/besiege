Besiege
=======

Simplistic web front end (at this point) for the great [Joe Dog's Siege](http://www.joedog.org/JoeDog/Siege).

Warning: This is just starting and it solely meets personal needs at this point. It will evolve, but please keep low expectations right now, although this will evolve!

Requirements
------------

Please install Siege first, and have it available on the path available to the Besiege web server.

To install Siege, you can:

* Get it directly from [Joe Dog's site](http://www.joedog.org/JoeDog/Siege).
* MacPorts
* HomeBrew? (I did not confirm yet)

Install & Usage
---------------

    git clone git@github.com:ic/besiege.git && cd besiege
    bundle install
    rackup

The web app is based on Sinatra and will use whatever compatible server is available, falling back on WebBrick. It listens on port 9292 at this time.

Pass the URL you want to test:

    http://localhost:9292/www.google.com

After a few seconds (for Siege to run, blocking call), the result is a report generated by Siege. Basically, the command run on the server is:

    siege -r10 -b -i -c50 -l/tmp/siege.log http://www.google.com

Just refresh the page to get a new report.

More coming soon, as needs arise!

See Also
--------

* [Micro Army](https://github.com/j2labs/microarmy): Deploy N AWS micro instances and launch coordinated Siege against web servers.
* [siege.js](https://github.com/kissjs/siege.js): Browser-based HTTP benchmarking.
* [Unofficial Siege on Github](https://github.com/tail/siege): Unofficial mirror of [Joe Dog's Siege](http://www.joedog.org/JoeDog/Siege).
* Of course, [Joe Dog's Siege](http://www.joedog.org/JoeDog/Siege).
* [Docker installer](https://github.com/ic/docker-besiege)
