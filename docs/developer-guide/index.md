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
- The applications (e.g. next-front-page, next-stream-page, etc) serve the public facing pages of Next.

# Make

All Next applications use `make` and all implement the following `make` commands:-

- `make clean` cleans the checkout of any uncommited files, such as `node_modules` and built JavaScript and CSS files.
- `make install` installs dependencies
- `make deploy` deploys the application (you may need to environment variables for this to run successfully)
- `make run` runs the application locally (usually on port `localhost:5050`).

Many applications also implement some or all of:-

- `make build` / `make build-production` runs build steps (e.g. compilation of JavaScript & Sass).
- `make watch` same as `make build` but watches for changes and automatically rebuilds.
- `make test` runs unit tests, linting and other tests (that don't require a dynamically provisioned VM).
  - `make verify` runs linting
  - `make unit-test` runs unit-tests (usually mocha)
- `make provision` dynamically spins up a Heroku app, deploys the application to it, and checks that it has deployed successfully (its `GET /__gtg` endpoint returns `200 OK`).
- `make tidy` destroyed the dynamically spun up Heroku app.

## Conventions
- We write code in U.S. English.  This is to avoid things like `color: $next-colour-blue;`.
- We use tabs for indentation.
- We take turns to bring biscuits into office.

## Typical develoment workflow

- Identify something on https://next.ft.com that needs changing.
- Use the [Service Registry](http://next-registry.ft.com/) by comparing the URL of the page that needs changing to the regular expression patterns in the second column.
- `git clone` the repository corresponding to that application and `cd` into it.
- Run `make install` to install the dependencies of that application.
- Run `make build` to build the project files.
- Ensure the application runs locally with `make run` and going to the URL of the page needing changes.  Note: normally, `make run` will run the whole site with *just the application you have checked out* running on your machine, proxying everything else to live.
- Create a new branch and make the desired change.
- Commit that change and create a pull request back to that application.
- Drop a note in the Next rooms on [Slack](https://financialtimes.slack.com/messages/ft-next/), if you have an @ft.com email address, next.team@ft.com.
- It's your responsibility to find and nag someone to review your pull request.  They will typically add a :+1: or otherwise in a comment.
- Once you've addressed any concerns they have, as pull request creator it's your responsibility to merge the pull request.
- Please note for applications merging a pull request is the same as a production deploy — and as the merger of a pull request you are responsible for the successful deploy of that merge.
- For components you are responsible for creating a release (sometimes this means running a command line script, sometimes it's just creating a new tag or release on that repository).
