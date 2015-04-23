---
layout: default
title: Developer guide
section: Developer guide
permalink: /docs/developer-guide/
---

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
