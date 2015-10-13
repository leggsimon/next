---
layout: default
title: New Starter
section: Developer guide
permalink: /docs/developer-guide/new-starter/
---

# New Starter Guide

- Welcome to Team Next!
- Google stuff
  * Make sure you have access to [the Next Google Drive](https://drive.google.com/open?id=0B0DDxFh3ZO93T3VYbkZVZnNEQk0&authuser=1).
  * [Join the team's Google Group](https://groups.google.com/a/ft.com/forum/#!forum/next.team) to get email updates and access to the shared documents on Google Drive.
  * [Join the feedback Google Group](https://groups.google.com/a/ft.com/forum/#!forum/next.feedback) to get user feedback emails. (Replying to queries is part of [bug challenge](http://financial-times.github.io/next/docs/developer-guide/bug-challenge/).)
  * Be aware of (but don't try to learn) [the Google Doc of FT-specific terms](https://docs.google.com/a/ft.com/spreadsheet/ccc?key=0AlHku4bDWky2dDZraDlKNzhOY1JDZzM5Mk5COGs5MFE#gid=0).
- Slack
  * Join our [general](https://financialtimes.slack.com/messages/ft-next/) and [dev](https://financialtimes.slack.com/messages/ft-next-dev/) Slack channel for team discussions (if you're not on Slack follow the instructions to create an account).
  * Slack domain is financialtimes
- Add yourself to our [bug rota](https://docs.google.com/spreadsheets/d/1mbJQYJOgXAH2KfgKUM1Vgxq8FUIrahumb39wzsgStu0/edit#gid=0) (check whether this is still running)
- IT Services should have enabled admin rights when they set up your machine, but you should [request admin access to your FT laptop via Salesforce](https://financialtimes.my.salesforce.com/home/home.jsp) to ensure it doesn't get revoked.
- Repositories
  * Public repositories are on [GitHub](https://github.com/Financial-Times/), private on [Stash](http://git.svc.ft.com/projects/NEXT).  Repositories should be public if at all possible.  Do not create private repositories on GitHub.
  * Ask to be invited to [the Next team on GitHub](https://github.com/orgs/Financial-Times/teams/next).
  * Ask to be added as [an admin to the Next Stash repositories](http://git.svc.ft.com/plugins/servlet/projectpermissions/NEXT).
  * If you are using SSH don't forget to [generate new keys] (https://help.github.com/articles/generating-ssh-keys/) for your laptop and add to Git and Stash
- Other tools
  * Ask to be invited to the Next team on Sentry.
  * Ask to be invited to the PagerDuty and added to a Bug challenge schedule.
  * Ask to be invited to the FT team on Pingdom (optional).
  * Ask to be invited to the Financial Times on Heroku. You'll need to setup a new Heroku account with your FT.com email (Please enable two factor authentication).
    * now would be a good time to [install heroku toolbelt] (https://toolbelt.heroku.com/)
  * Ask to be invited to Fastly.com (optional) (Also enable two factor authentication).
  * [Sign up for LastPass](https://docs.google.com/document/d/11g8nghpv0aCnmh49FK8AK9wxUWC_Wj9swCAURKniJ4o/edit) and ask someone to be added to the Next team shared LastPass folder as an *administrator*.
- FT.com
  * Check your email to see if you've already been registered for free subscription to the ft.com, if not
    * Sign-up for an [account on ft.com](http://registration.ft.com/registration) then ask corporate.support@ft.com to upgrade it to a [free subscription](https://neo.pearson.com/community/enabling-functions/ges-human-resources/reward/my_benefits_uk/blog/2012/10/09/ftcom-subscriptions).

- Ask `itservicedesk@ft.com` to be added to the "eng" and "logs" Active Directory groups, and the unix group within each of those. This will get you access to [AWS](https://awslogin.internal.ft.com) and [Splunk](https://splunk.internal.ft.com).
- Ask Matt C or Matt A for a quick run through of the architecture of Next (CDN, Content APIs, etc)

# Development tools

## Environment setup
* To avoid permissions problems down the line it's worth running `chown -R $USER /usr/local` to give npm permission to install globally before you do anything else
* Prepending `node_modules/.bin` to your `$PATH` will mean you have to install fewer things globally and will pick up local updates to modules that provide a cli

Almost all Next applications rely on the following tools installed globally on development machines.  Please ensure both of these are successfully installed onto your development environment first:-

- [Origami Build Tools](https://github.com/Financial-Times/origami-build-tools/)
- [Next Router](http://git.svc.ft.com/projects/NEXT/repos/router/browse)
- [Heroku Toolbelt](https://toolbelt.heroku.com/) with the docker plugin `heroku plugins:install heroku-docker`

It's also useful to use the [node version manager](https://www.npmjs.com/package/n) `npm install n -g` to manage your local node installs.

In order to work with our ecosystem of components you will need to point bower at the origami registry. Running the following in terminal will do this for you.

```
[ -e ~/.bowerrc ] || echo '{ "registry": { "search": [ "http://registry.origami.ft.com", "https://bower.herokuapp.com" ] } }' > ~/.bowerrc
```

If you experience any problems take a look at our [troubleshooting guide](/next/docs/developer-guide/troubleshooting/). If your problem isn't listed there but you manage to solve it, please add the solution to the guide.

# Peer review and Pull requests

1. Remember, our engineering choices mean most code changes, a) are unlikely to have catastrophic effects across the stack; b) can be rolled back fairly easily if there's a problem... so don't be scared of making mistakes.

1. If a code change is relatively trivial there's no need to wait for a peer review. What does 'trivial' mean? Not an exact science, but if you feel the code changes

	- are easy to comprehend
	- affect a small number of lines/files
	- don't affect much of our stack

	and you don't have any real doubts over the quality of what you've written, then it's a good candidate to skip peer reviewing. There's no harm in asking for a peer review, but if it's not forthcoming don't hold back from merging anyway.

1. For more significant changes always ask for a peer review by posting a link on the relevant channel on slack or cc-ing one or more developers in github (some teams also use the github-slack integration). If no-one reviews your code after a while either

	- go and ask somebody directly to do so. Stand next to them tutting and checking your watch if necessary.
	- review it yourself - the time spent waiting will have given you fresh eyes. If you feel confident everything's OK go ahead and merge

1. For larger changes, particularly if they involve changes to more than one repo, consider putting them behind a feature flag (for many user facing changes you should be doing this anyway). This way you and other internal staff can experiment with toggling the feature to see the effect

1. Our test coverage varies from one app to another but in general tests are a valuable thing. If the repo you're working on is already well covered by tests add some to cover your changes too. If its test coverage is poor/non-existent don't let that stop you from making a start by adding some to cover your new code.

1. **It's more important to verify your code works in the wild *after* deploying than it is to get the code approved by somebody *before* deploying**. A :+1: does not mean your code actually works so

	- If releasing a change to an app keep an eye on it in next-radiator and sentry (changes take about 10 minutes to show up due to heroku preboot)
	- If releasing a component, redeploy an app that consumes it and check the app to see if everything's ok

1. Take all the above with a pinch of salt and trust your judgment :)
