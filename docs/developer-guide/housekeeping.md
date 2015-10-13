---
layout: default
title: Housekeeping
section: Developer guide
permalink: /docs/developer-guide/housekeeping/
---

# Housekeeping

An elephant never forgets...

## Apps

- Is your app monitored by [_next-status_](http://git.svc.ft.com/projects/NEXT/repos/status/browse)?
- Does your app have a friendly hostname?
- Does your app have a Travis or Jenkins job?
- Is your app deployed by [next-build-tools](https://github.com/Financial-Times/next-build-tools)?
- Are your app’s environment variables in the [next-config-vars](http://git.svc.ft.com/projects/NEXTPRIVATE/repos/config-vars/browse) API?
- Does it implement next-metrics?
- Have you checked your app does not use CAPI v1 APIs?  (They should use API v2 or v1 _via our Elastic Search mirror_)
- Do you set appropriate cache headers for all your endpoints?

## Features

- Is your new feature flagged?
- Is there a good no-JavaScript core experience?
- Is it tracked by next-beacon?
- Is it tested on IE9+, Firefox, Safari, Chrome, iOS, Android?
