---
layout: default
title: Setting up Circle CI
section: Developer guide
permalink: /docs/developer-guide/circle/
---

# Introduction to Circle CI

We are currently migrating to Circle CI for applications and bower components.  (npm modules should continue using Travis in the existing, undocumented way)

## Brief Architecture

We try to store as much CI configuration centrally in the [config-vars repository](http://git.svc.ft.com:8080/projects/NEXTPRIVATE/repos/config-vars/browse) and then **push** that configuration on every build through Circle CI's APIs.  Not everything about Circle CI can be configured this way so unfortunately we also have to commit a lightweight `circle.yml` file into each repository as well.

## Setting up Circle CI

Create a pull request to the [config-vars repository](http://git.svc.ft.com:8080/projects/NEXTPRIVATE/repos/config-vars/browse), using existing projects in the `models/continuous-integration.js` file as a template.  After merge wait for the build to finish.  There is no delay after the build completes.

### `circle.yml` for applications

Add the following `circle.yml` file to the root of your application's repository:-

	machine:
	  services:
	    - docker
	  node:
	    version: 0.12.7

	deployment:
	  production:
	    branch: master
	    commands:
	      - make deploy

### `circle.yml` for bower components (not npm modules)

Add the following `circle.yml` file to the root of your bower component's repository:-

	machine:
	  node:
	    version: 0.12.7
