---
layout: default
title: Developer guide
section: Developer guide
permalink: /docs/developer-guide/
---

# Developer guide

Almost all Next applications rely on the following tools installed globally on development machines.  Please ensure both of these are successfully installed onto your development environment first:-

- [Origami Build Tools](https://github.com/Financial-Times/origami-build-tools/)
- [Next Router](http://git.svc.ft.com:8080/projects/NEXT/repos/router/browse)

# CDN, Routing and the Registry

// TODO: Explain and add architecture diagram

# Make

All Next applications use `make` and all implement the following `make` commands:-

- `make clean` cleans the checkout of any uncommited files, such as `node_modules` and built JavaScript and CSS files.
- `make install` installs dependencies
- `make deploy` deploys the application (you may need to environment variables for this to run successfully)
