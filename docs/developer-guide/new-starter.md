---
layout: default
title: New Starter
section: Developer guide
permalink: /docs/developer-guide/new-starter/
---

# New Starter Guide

- Welcome to Team Next!
- [Join the team's Google Group](https://groups.google.com/a/ft.com/forum/#!forum/next.team) to get email updates and access to the shared documents on Google Drive.
- Join our [general](https://financialtimes.slack.com/messages/ft-next/) and [dev](https://financialtimes.slack.com/messages/ft-next-dev/) Slack channel for team discussions (if you're not on Slack follow the instructions to create an account).
- Add yourself to our [bug rota](https://docs.google.com/spreadsheets/d/1mbJQYJOgXAH2KfgKUM1Vgxq8FUIrahumb39wzsgStu0/edit#gid=0)
- [Join the feedback Google Group](https://groups.google.com/a/ft.com/forum/#!forum/next.feedback) to get user feedback emails. (Replying to queries is part of [bug duty](http://financial-times.github.io/next/docs/developer-guide/bug-duty/).)
- Public repositories are on [GitHub](https://github.com/Financial-Times/), private on [Stash](http://git.svc.ft.com/projects/NEXT).  Repositories should be public if at all possible.  Do not create private repositories on GitHub.
- Ask to be added as [an admin to the Next Stash repositories](http://git.svc.ft.com/plugins/servlet/projectpermissions/NEXT).
- Make sure you have access to [the Next Google Drive](https://drive.google.com/open?id=0B0DDxFh3ZO93T3VYbkZVZnNEQk0&authuser=1).
- Ask to be invited to [the Next team on GitHub](https://github.com/orgs/Financial-Times/teams/next).
- Ask to be invited to the Next team on Sentry.
- Ask to be invited to the FT team on Pingdom (optional).
- Ask to be invited to the Financial Times on Heroku. You'll need to setup a new Heroku account with your FT.com email (Please enable two factor authentication).
- Sign-up for an [account on ft.com](http://registration.ft.com/registration) then ask corporate.support@ft.com to upgrade it to a [free subscription](https://neo.pearson.com/community/enabling-functions/ges-human-resources/reward/my_benefits_uk/blog/2012/10/09/ftcom-subscriptions).
- Ask to be invited to Fastly.com (optional) (Also enable two factor authentication).
- Be aware of (but don't try to learn) [the Google Doc of FT-specific terms](https://docs.google.com/a/ft.com/spreadsheet/ccc?key=0AlHku4bDWky2dDZraDlKNzhOY1JDZzM5Mk5COGs5MFE#gid=0).
- You may need to [request admin access to your FT laptop via Salesforce](https://financialtimes.my.salesforce.com/home/home.jsp).
- Ask Matt C or Matt A for a quick run through of the architecture of Next (CDN, Content APIs, etc)
- [Sign up for LastPass](https://docs.google.com/document/d/11g8nghpv0aCnmh49FK8AK9wxUWC_Wj9swCAURKniJ4o/edit) and ask someone to be added to the Next team shared LastPass folder as an *administrator*.
- Ask `itservicedesk@ft.com` to be added to the "eng" and "logs" Active Directory groups, and the unix group within each of those. This will get you access to [AWS](https://awslogin.internal.ft.com) and [Splunk](https://splunk.internal.ft.com).

# Development tools

## Environment setup
* To avoid permissions problems down the line it's worth running `chown -R $USER /usr/local` to give npm permission to install globally before you do anything else
* Prepending `node_modules/.bin` to your `$PATH` will mean you have to install fewer things globally and will pick up local updates to modules that provide a cli

Almost all Next applications rely on the following tools installed globally on development machines.  Please ensure both of these are successfully installed onto your development environment first:-

- [Origami Build Tools](https://github.com/Financial-Times/origami-build-tools/)
- [Next Router](http://git.svc.ft.com/projects/NEXT/repos/router/browse)

In order to work with our ecosystem of components you will need to point bower at the origami registry. Running the following in terminal will do this for you.

```
[ -e ~/.bowerrc ] || echo '{ "registry": { "search": [ "http://registry.origami.ft.com", "https://bower.herokuapp.com" ] } }' > ~/.bowerrc
```

If you experience any problems take a look at our [troubleshooting gude](/docs/developer-guide/troubleshooting/). If your problem isn't listed there but you manage to solve it, please add the solution to the guide.
