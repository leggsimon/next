---
layout: default
title: How some Next apps meet Platinum SLAs
section: Developer guide
permalink: /docs/overview/platinum/
---

# How we meet the requirements of Platinum-level product tier

## Overview

This document goes through each of the items required by the [Platinum service tier](https://docs.google.com/spreadsheets/d/1R2cm_MkcLKe6ceoIiFYfnkbE-gXjNMs9JTbvUXbSrs0/edit#gid=1424287194) and explains how Next meets them.

## Support requirements

The Next team directly supports all platinum services 24x7.  We use [PagerDuty](http://pagerduty.com) and [Pingdom](http://pingdom.com) to monitor Next features and services and intelligently escalate issues that affect the website, potentially waking a member of the team up if a service we consider ‘platinum’ is not working correctly.

### Performance, availability and continuity requirements

#### Response, fix & recovery time objective targets

We aim to meet the targets.  Downtime and response times are measured with Pingdom and PagerDuty.

#### Availability targets

We follow the FT's standard definition of availability and publish our availability metrics on our [‘radiator dashboard’](http://next-radiator.ft.com/apps).

#### No downtime changes & releases

All Next applications have no downtime changes & releases by default.

### Warranty

We will provide a warranty of at least 2 weeks.

## Engineering requirements

### General — confirm product rating

The product team continuously re-assess what the most appropriate service level are for different features with collaboration with our depenedencies and the Next engineering team.

### QA delivery tasks

We follow the spirit rather than the letter of these rules as many of the details described on the selection guide are not relevant for Next.  We have a QA resource available to teams to provide this sort of help as required by the teams.

### Automation

- We automatically monitor performance continuously, for example [opt-out-form](http://next-radiator.ft.com/apps/opt-out-form/graphs).
- We have automated tests, where appropriate, and we maintain them.
- We use automated device testing, where appropriate.

#### Dedicated test environment available & maintained 24/7

We follow the spirit rather than the letter of these rules.  Our test environments for most applications are spun up dynamically and shut down, as required, per application.

### General delivery tasks

#### Confirm performance SLA's

Next has performance goals that apply to all applications.

#### Confirm delivery pipeline

It's not clear what this means.  We have a few different delivery pipelines depending on the technology in use.

#### Error handling

We handle errors.

#### Synthetic transactions

It's not clear what this means.

#### Health check dashboard

We want to use [the FT healthcheck aggregator](http://healthcheck.ft.com/).  In fact, a pull request has even been made and merged to include some Next apps in it but because the Jenkins jobs on it has been failing we weren't able to deploy it.  We are continuing to discuss this with the team that maintains this application.

#### Error dashboard

We have [an error dashboard](https://app.getsentry.com/nextftcom/).

#### Performance dashboard

We have basic per app performance dashboards on our ‘radiator dashboard’, for example [opt-out-form](http://next-radiator.ft.com/apps/opt-out-form/graphs).

#### Basic availability check (pingdom)

All apps have basic availability checks in Pingdom.  IDs for each check are on apps pages on the [‘radiator dashboard’](http://next-radiator.ft.com).

#### Alerts validated

This doesn't mean anything.

#### Component & dependancy monitoring

We monitor our dependencies through the [‘radiator dashboard’](http://next-radiator.ft.com/dependencies).  A tool to monitor our components is in development and on the [Q3 Next platform roadmap](https://docs.google.com/presentation/d/1U0-NSoujGLyqd22Ms_2WH6jtn8bN6xjHwT5rLH08iiw/edit#slide=id.g44b649aef_02).

#### Troubleshooting guide

We use the `/__health` endpoints (per app and through a dedicated [‘health app’](http://ft-next-health.herokuapp.com/__health)) to store for providing troubleshooting steps when we detect failures in the Next system.

### Operational requirements

#### Out of hours release support

We support releasing code out of hours.

#### Supplier details captured/recorded in the DB and validate CMDB updates

We are working with Geoff Thorpe directly to achieve this goal.

#### Failover process reviewed and tested

Our failover process is largely automatic and it has been tested.

#### Performance monitoring

We monitor performance through the Next [‘radiator dashboard’](http://next-radiator.ft.com).

#### Run book validation

We are collating the information required for run books on the Next [‘radiator dashboard’](http://next-radiator.ft.com).  We do not believe the current solution for Run Books at the FT is appropriate for the microservice architecture that Next has and are working to refine what a Run Book means with FT Technology.

#### Automated validation post release

It's not clear what this means.

#### Recovery testing

It's not clear what this means.

## Platform requirements

### Developer workflow

We have considered all of:-

- Speed to market
- Self-service
- Repeatable delivery mechanism
- Suitable for complexity
- Security
- EU/UK Legal / Regulatory
- Connectivity to internal systems

### Platforms

- DNS: we use Dyn.
- Web Application Firewall: we are waiting for Fastly's product to become available.  We have already been promised early access.
- CDN: we use Fastly.
- Platform: we use multi-region Heroku and multi-region S3.  We will soon use multi-region Elastic Search through [Found](https://www.elastic.co/found).
- Monitoring: we use Pingdom.
- Delivery Mechanism: we use [next-build-tools](https://github.com/Financial-Times/next-build-tools) and [Haikro](https://github.com/matthew-andrews/haikro) instead of FTPlatform

## Persistence requirements

No platinum Next apps have persistence.

## Performance requirements

We follow the spririt rather than the letter of these rules.  Much of the ‘definition’ and ‘sign off’ process is largely not applicable to the way Next works.

- We do load testing.
- We have performance targets.
- We measure our application performance on the server.
- We measure the performance of our dependencies.
- We collect real user data and we measure performance synthetically with Web Page Test.
