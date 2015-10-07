---
layout: default
title: Setting up Multi Region Apps
section: Developer guide
permalink: /docs/developer-guide/multi-region-apps/
---

# Creating a new Multi-Region App (or converting an existing one)

`next-build-tools` has some new commands which make use of Heroku's new [pipeines](https://devcenter.heroku.com/articles/pipelines) feature, which make it easier to deploy apps to multiple regions without increasing the deploy time.

## 1: Install Dependencies

These steps will require `next-build-tools` **version 5** or greater so please update your package.json file in your app before continuing and [follow the upgrade steps](https://github.com/Financial-Times/next-build-tools/).

You will also need the heroku pipelines add-on.  Run this command to get it:

    heroku plugins:install heroku-pipelines

## 2: Set up a pipeline:

Run `nbt drydock [APP_NAME] -m` to set up a pipeline.  So, if your app is article, run this:

    nbt drydock ft-next-article -m
    
The `-m` option makes it multi-region - you can ignore this if you're just trying to create a pipeline and don't need a US app.

## 3: Change your Makefile

Which commands to use will depend on what is your needed for your app:

### If your app doesn't have any smoke tests

Your makefile should have a provision task which looks like this:

    provision:
        nbt float

And a deploy task which looks like this:

    deploy:
        nbt ship -m

The `-m` option is again for multi-region apps - leave this off if you don't have a US app.  

### If your app has smoke tests

You will need a variable setup at the top of your Makefile like this:

    TEST_APP := "ft-article-branch-${CIRCLE_BUILD_NUM}"
    
(If you're not using Circle CI you'll need to change the CIRCLE_BUILD_NUM to something else)

Your makefile should have a provision task like this:

    provision:
        nbt float -md --testapp ${TEST_APP}
        # smoke tests go here!

And a deploy task:
    
    deploy:
        nbt ship -m

And the standard tidy task
    
    tidy:
        nbt destroy ${TEST_APP}

Here's what the options in `float` mean:

* `-m` By default float will not run on the master branch as if you are just doing __gtg checks `ship` can take care of that for you - but if you have further smoke tests to run you'll need to run it on master as well by using this option
* `-d` Float will automatically destroy the test app by default after running the __gtg check - this option prevents this from happening (which is why you need the tidy task as well)
* `--testapp` Float will create the new app using this name

## 4: Push and Hope!

Run this in a branch first and check the float task works correctly, then merge and check that ship runs as you would expect

## 5: Amend the service registry

Don't do this until you have verified that your app is working fine in its new locations.  Once you have, then amend the service registry.  The **nodes** property for your app might well look like this:

    nodes: [
    	"http://ft-next-my-app.herokuapp.com"
    ],

Change it so it looks like this:

    nodes: [
        {
            region : 'eu',
            url: 'http://ft-next-my-app-eu.herokuapp.com
        },
        {
            region : 'us',
            url: 'http://ft-next-my-app-us.herokuapp.com
        }
    ]

Then requests to the EU router will use the EU app and the US requests the US app.

## 6: Delete the old app

Once you have verified the new apps are working correctly in production you can delete the old non-pipeline one
