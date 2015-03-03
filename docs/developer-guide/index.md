---
layout: default
title: Developer guide
section: Developer guide
permalink: /docs/developer-guide/
---

# Developer guide

Almost all Next applications rely on the following tools installed globally on development machines.  Please ensure both of these are successfully installed onto your development environment first:-

- [Origami Build Tools](https://github.com/Financial-Times/origami-build-tools/)
- [Next Router](http://git.svc.ft.com/projects/NEXT/repos/router/browse)

Many applications also need a Content API key stored in a file in your home directory `~/.ftapi`.

# CDN, Routing and the Registry

<img src="{{ site.baseurl }}/img/architecture.svg" width="75%" />

- The CDN ([Fastly](https://fastly.com)) provides cacheing and (emergency) fallback content if any of the underlying services fail.
- [**next-registry**](http://next-registry.ft.com/) maps regular expressions that are used to match URL paths to applications (e.g. `^/$` maps to `next-engels`, the home page)
- [**next-router**](http://git.svc.ft.com/projects/NEXT/repos/router/browse) is a simple http proxy (currently based on Node) that routes traffic to the correct application based on the data it downloads periodically from the registry.
- The applications (e.g. next-engels, next-dobi, etc) serve the public facing pages of Next.

# Make

All Next applications use `make` and all implement the following `make` commands:-

- `make clean` cleans the checkout of any uncommited files, such as `node_modules` and built JavaScript and CSS files.
- `make install` installs dependencies
- `make deploy` deploys the application (you may need to environment variables for this to run successfully)
- `make run` runs the application locally (usually on port `localhost:5050`).

## Typical develoment workflow

- Identify something on https://next.ft.com that needs changing.
- Use the [Service Registry](http://next-registry.ft.com/) by comparing the URL of the page that needs changing to the regular expression patterns in the second column.
- `git clone` the repository corresponding to that application and `cd` into it.
- Run `make install` to install the dependencies of that application.
- Run `make build` to build the project files.
- Ensure the application runs locally with `make run` and going to the URL of the page needing changes.  Note: normally, `make run` will run the whole site with *just the application you have checked out* running on your machine, proxying everything else to live.
- Create a new branch and make the desire change.
- Commit that change and create a pull request back to that application.
- Drop a note in the Next rooms on [Slack](https://financialtimes.slack.com/messages/ft-next/), HipChat or, if you have an @ft.com email address, next.team@ft.com.

## Common errors

- (Don't run `sudo npm install`!)  If npm install commands keep failing with permissions errors, read up at [Intro to NPM](http://howtonode.org/introduction-to-npm) on how to fix it.  But it's probably:-
  -  `sudo chown $USER -R /usr/local` (the default location of globally installed node modules)
  -  `sudo chown $USER -R node_modules` (the folder where app/component specific node modules are installed)
  -  `sudo chown $USER -R ~/.npm` (the default location where npm puts cached versions of node modules)
- Can't find `nodemon`, `mocha`, etc.  Your path might be missing `node_modules/.bin`.  Edit your `.bashrc` or `.bash_profile` file and ensure your path has the following paths added to it:-
  - `export PATH="node_modules/.bin:/usr/local/bin:$PATH"`
- If a `make install` keeps leading to git connection errors, such as 
  - `github.com[0: 207.97.227.239]: errno=Connection timed out`
  - `fatal: unable to connect a socket (Connection timed out)` 
you'll want to [change your global git configuration](http://stackoverflow.com/questions/4891527/git-protocol-blocked-by-company-how-can-i-get-around-that/10729634#10729634).
