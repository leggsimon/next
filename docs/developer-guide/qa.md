---
layout: default
title: QA 
section: Developer guide
permalink: /docs/developer-guide/qa/
---

# QA

## Environments

Next has no internal dev/test/stage/etc environments. You can provision and run
ad-hoc applications on Heroku. You can run the whole stack on
your localhost. These are the environments where we conduct QA.

Mostly, everyone connects to production APIs from every environment.

Mostly, Next is continuously deployed to production, with no manual
intervention.

Next makes heavy use of [feature
flags](http://martinfowler.com/bliki/FeatureToggle.html) to allow us to ship
code in to production that isn’t ready for public consumption. The team (and FT
staff) can switch these on to test features. Often, early versions of features
are incomplete and/or experimental and don’t work across a full range of
browsers.

Flags automatically expire, so features automatically switch off.  A list of expired and soon-to-expire features is [available on our dashboard](http://ft-next-graphite-dashboard.herokuapp.com/radiator).

## Process

Next favours small groups of people
[collaborating](http://www.agilemanifesto.org) to quickly get things done.

Every change in Next is a pull request. Paying attention to these will help
understand what’s going on in the project, or look at the whiteboards and talk
to people.

## Applications

Next is comprised of dozens of small components.

Each component can be cloned from the repository and `make test` executed, or
`make run`.

Typically a test will involve :-

- Running `origami-build-tools verify` on the code (or `next-build-tools verify`, which uses Origami build tools internally), which provides linting.
- Some unit tests.  
- (Sometimes) an integration test over headless HTTP.
- (Sometimes) automated tests running on real browsers in the cloud.
- (Sometimes) screenshot diffing to detect visual changes (when things change a comment will be added to the pull request with links to the changes)

We dynamically provision an instance of the application for each pull request
and smoke test in several browsers (via Sauce Labs).

External components (such as Origami, polyfill.io) implement their own tests.

Developers, designers, QA and product managers are charged with verifying the
code they ship works in our supported browsers.

## Monitoring

To catch live errors from the client and server we log exceptions to
[Sentry](https://getsentry.com). Each day a developer is on [bug
challenge](/docs/developer-guide/bug-challenge/) and will monitor Sentry for problems.

Next code is [heavily
instrumented](https://github.com/Financial-Times/next-metrics) and metrics
pushed to Graphite. We set simple alert thresholds
using [Sensu](http://sensuapp.org) to show us when broken code has shipped.

We also make use of real user monitoring, which helps understand how the
live service is performing.

Next uses Pingdom to monitor all services.

## Performance testing

We have _1 second threshold on 3G for domContentLoaded_. We measure this
with the internal WPT instance (triggered per build/release) and real
user monitoring of the Navigation Timing API.

Currently we have a _5 second threshold on internal request response times_ (goal
is 2s). After this point the router will terminate the request and throw an
error. The stale-if-error CDN will typically prevent this from being seen by
users.

Everything else can largely be solved fairly cheaply by a) more caching, b)
more cpu/memory, c) less bad code.

We’ve a simple siege benchmarking process that can be run on dev machines
and/or Heroku against the production stack.

For the most part I want to soak test the application by applying ft.com
production traffic to next.ft.com over several months. We started this on Feb
14th, 2015. This approach is descried in [more detail
here](http://matt.chadburn.co.uk/notes/how-to-load-test.html).

## Misc.

We have no automated security testing and won’t for 2015 Q1.

I expect full browser integration testing (Eg, Selenium) to be fairly light for
a few months.

We have no automated browser / css visual testing and won’t for Q1.

We will try maintain an uptime of around 99.5% (frontend stack) during Alpha.

We publish our [incident
reports](https://github.com/Financial-Times/next-bugs/tree/master/incidents) in
git.

