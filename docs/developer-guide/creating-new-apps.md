---
layout: default
title: Creating new apps
section: Developer guide
permalink: /docs/developer-guide/creating-new-apps/
---

# Creating new apps

So you'd like to create a new app. First things first, assess whether or not you really need
to create a new app: 

- Could your endpoint/template/job exist within an existing app? 
- Does it really need its own build system?
- Does it really need its own deployment process?

If you are **sure** you still need to create a new application within the stack, follow the steps below:

## Initialize the app:

- Create a new GitHub repo within the [Financial-Times](https://github.com/Financial-Times) organization and ensure it is public.
- Depending on your application's needs, copy a base directory structure and files from a similar existing application:
	- If it's an api: [next-mustang](https://github.com/Financial-Times/next-mustang)
	- If it has user facing views [next-engels](https://github.com/Financial-Times/next-engels)
	-  *TODO:* create a base application for others to fork/copy from
- Adjust the project `Makefile` to your needs 
	- Does it need an `nbt build` step?
	- Does it need an `nbt deploy-hased-assets` step?
	- If not add the `--skip-layout-checks` to `nbt verify`
- Ensure the app is correctly named within the `package.json` and `bower.json` manifests and have the correct dependencies listed.
- Make your changes and develop the initial app locally
- Ensure `make run` and `make test` work appropriately.

## Ready to deploy:
 
- Add a new property to the [config-vars](http://git.svc.ft.com/projects/NEXTPRIVATE/repos/config-vars/browse/models/production.json) data including the environment vars your application needs.
	- *Note:* The Sentry ARN and URL must be unique. You can create a new app in Sentry [here](https://app.getsentry.com/nextftcom/) to obtain an ARN.
	- *Note:* We prefer each application to have it's own unique API key. Get a new one from the list [here](https://docs.google.com/spreadsheets/d/1y8jZMQUjHh8jyyOXMIedEkw03IRoxUIGy88d58782WY)
	- Verify your change has deployed before moving on: `curl -I https://ft-next-config-vars.herokuapp.com/app/YOUR_APP_NAME?apiKey=YOUR_API_KEY`
	- Join the [ft-next-config-vars](https://dashboard.heroku.com/apps/ft-next-config-vars/resources) app in Heroku
- Create a new application within Heroku corresponding to your app's name:
	- `heroku create YOUR_APP_NAME --region eu --org financial-times`
	- Test your app's configuration running `nbt configure`
- Configure your Travis CI build via the dashboard:
	- Go to: https://travis-ci.org/Financial-Times/YOUR_APP_GITHUB_NAME/settings 
	- Click on environment variables tab and add the following defaults:
		- `HEROKU_AUTH_TOKEN`, `GITHUB_AUTH_TOKEN` & `SPLUNK_URL`
	- Add any application specific env vars your app may need to build.
- Raise a PR within GitHub for your initial changes and merge.
- The merge should have triggered a build.
- If the build and deploy was successful: **Rejoice!**
