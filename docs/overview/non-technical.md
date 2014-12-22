---
layout: default
title: Non-technical explainer
section: Overview
permalink: /docs/overview/non-technical/
---

# Non-technical introduction

Next is a new foundation for building digital applications at the FT.

## How does Next fit with Origami?

We use almost all the tools and components the Origami team have produced and we are a regular contributor back to those tools.  We envisage that many of the components we are building in Next will eventually transfer to being owned by the Origami team.  We also use [Origami Build Tools](https://github.com/Financial-Times/origami-build-tools) to build all of Next's applications' styling and client side JavaScript.

## How does Next fit with FT Platform?

Optimising speed to market is one of the fundamental principles of Next.  In order to achieve this we have built our own deployment mechanism on top of Heroku, called [Haikro](https://github.com/matthew-andrews/haikro), which is also being trialled by the web app team and Interactive Graphics.  It is crucial that Next infrastructure is simple and fast enough so that every member of the Next development team is able to provision servers and deploy code for their services within minutes.

Previous attempts to integrate Next with FT Platform have demonstrated that it is not yet ready to be used in this way and so we have decided for now not to use FT Platform.  That said we are continuing to work with the FT Platform team to work towards this goal.
