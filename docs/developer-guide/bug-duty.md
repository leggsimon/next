---
layout: default
title: Bug duty
section: Developer guide
permalink: /docs/developer-guide/bug-duty/
---

# Bug duty

Every day one developer is assigned to bug duty.  The person on bug duty works
on the following sorts of problems prioritised in the following order.

1. Live production issues (anything causing our pingdom alerts to fail).
1. Responding to user feedback/bug reports sent to [next.feedback@ft.com](https://groups.google.com/a/ft.com/forum/#!forum/next.feedback).
1. Serious issues reported via
[Slack](https://financialtimes.slack.com/messages/ft-next/) or other channels
(non-serious issues should be filed in [JIRA](https://jira.ft.com/browse/NFT) - when you login for the first time you must use your AD username and password, not Google login).
1. Live code errors that have been caught by
[Sentry](https://app.getsentry.com/nextftcom/).
1. More fine grained alerts appear in [Sensu](http://sensu.ft.com)
1. Issues filed in [JIRA](https://jira.ft.com/browse/NFT).
1. Maintaining the documentation.
1. Review [retrospective actions](https://docs.google.com/document/d/1Xk0EN824hOVTXXgbbPXoxJp3qGcnFHZ0k-DW0HZ62zk/edit) for ideas on problems that need solving.
