---
layout: default
title: New Starter
section: Developer guide
permalink: /docs/developer-guide/new-starter/
---

# New Starter Guide

- Welcome to Team Next!
- [Join our Google Group](https://groups.google.com/a/ft.com/forum/#!forum/next.team) to get email updates.
- [Join our Slack channel](https://financialtimes.slack.com/messages/ft-next/) for team discussions (if you're not on Slack follow the instructions to create an account).
- Public repositories are on [GitHub](https://github.com/Financial-Times/), private on [Stash](http://git.svc.ft.com/projects/NEXT).  Repositories should be public if at all possible.  Do not create private repositories on GitHub.
- Ask to be added as [an admin to the Next Stash repositories](http://git.svc.ft.com/plugins/servlet/projectpermissions/NEXT).
- Make sure you have access to [the Next Google Drive](https://drive.google.com/open?id=0B0DDxFh3ZO93T3VYbkZVZnNEQk0&authuser=1).
- Ask to be invited to [the Next team on GitHub](https://github.com/orgs/Financial-Times/teams/next).
- Ask to be invited to the Next team on Sentry.
- Ask to be invited to the FT team on Pingdom (optional).
- Ask to be invited to the Financial Times on Heroku.
- Ask to be invited to Fastly.com (optional).
- Be aware of (but don't try to learn) [the Google Doc of FT-specific terms](https://docs.google.com/a/ft.com/spreadsheet/ccc?key=0AlHku4bDWky2dDZraDlKNzhOY1JDZzM5Mk5COGs5MFE#gid=0).


## Peer review and Pull requests

1. Remember, our engineering choices mean most code changes, a) are unlikely to have catastrophic effects across the stack; b) can be rolled back fairly easily if there's a problem... so don't be scared of making mistakes.

1. If a code change is relatively trivial there's no need to wait for a peer review. What does 'trivial' mean? Not an exact science, but if you feel the code changes

	- are easy to comprehend
	- affect a small number of lines/files
	- don't affect much of our stack

	and you don't have any real doubts over the quality of what you've written, then it's a good candidate to skip peer reviewing. There's no harm in asking for a peer review, but if it's not forthcoming don't hold back from merging anyway.

1. For more significant changes always ask for a peer review by posting a link on the relevant channel on slack or cc-ing one or more developers in github (some teams also use the github-slack integration). If no-one reviews your code after a while either

	- go and ask somebody directly to do so. Stand next to them tutting and checking your watch if necessary.
	- review it yourself - the time spent waiting will have given you fresh eyes. If you feel confident everything's OK go ahead and merge because ...

1. ... It's more important to verify your code works in the wild *after* deploying than it is to get the code approved by somebody *before* deploying. A :+1: does not mean your code actually works so

	- If releasing a change to an app keep an eye on it in next-radiator and sentry (changes take about 10 minutes to show up due to heroku preboot)
	- If releasing a component, redeploy an app that consumes it and check the app to see if everything's ok

1. Take all the above with a pinch of salt and trust your judgement :)
