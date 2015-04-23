---
layout: default
title: New Starter
section: Developer guide
permalink: /docs/developer-guide/new-starter/
---

# New Starter Guide

- Welcome to Team Next!
- [Join our Google Group](https://groups.google.com/a/ft.com/forum/#!forum/next.team) to get email updates.
- Join our [general](https://financialtimes.slack.com/messages/ft-next/) and [dev](https://financialtimes.slack.com/messages/ft-next-dev/) Slack channel for team discussions (if you're not on Slack follow the instructions to create an account).
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

# Development tools

*To avoid permissions problems down the line it's worth running chown -R $USER /usr/local` to give npm permission to install globally before you do anything else*

Almost all Next applications rely on the following tools installed globally on development machines.  Please ensure both of these are successfully installed onto your development environment first:-

- [Origami Build Tools](https://github.com/Financial-Times/origami-build-tools/)
- [Next Build Tools](https://github.com/Financial-Times/next-build-tools/)
- [Next Router](http://git.svc.ft.com/projects/NEXT/repos/router/browse)

Many applications also need a Content API key stored in a file in your home directory `~/.ftapi`.  You may also need to set an Elasticsearch url in a file in your home directory `~/.nextElasticSearchUrl`.  Please ask a member of the next team for an API key and the Elasticsearch url.

In order to work with our ecosystem of components you will need to point bower at the origami regsitry. Running the following in terminal will do this for you. 

```
[ -e ~/.bowerrc ] || echo '{ "registry": { "search": [ "http://registry.origami.ft.com", "https://bower.herokuapp.com" ] } }' > ~/.bowerrc
```

## Setup troubleshooting

- There's a good chance origami build toools will fail due to directory permissions while installing ruby gems. You will need to run `gem install sass -v 3.4.13`/`sudo gem install sass -v 3.4.13` and `gem install scss-lint -v 0.35.0`/`sudo gem install scss-lint -v 0.35.0`.
- If you experience issues with node try `npm install -g npm` to upgrade npm
- You will probably need to run `git config --global url."https://".insteadOf git://` in order to access git on some of our wifi networks
- Make sure your ssh is set up correctly [https://help.github.com/articles/generating-ssh-keys/](https://help.github.com/articles/generating-ssh-keys/)
- You should set up [two factor authentication](https://github.com/settings/security) This will mean when you first try to submit code to github your password won't be recognised and you'll need to use a [personal access token](https://github.com/settings/applications) instead of your password in the git cli
