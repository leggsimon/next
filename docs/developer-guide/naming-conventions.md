---
layout: default
title: Naming conventions
section: Developer guide
permalink: /docs/developer-guide/naming-conventions/
---

# Standardised names for apps, APIs and modules

Next repositories use the following naming conventions

##Apps

Apps should be named with the following convention -

<code>
next-*
</code>

A lot of the apps currently serving content are named after various fighter planes (engels, dobi, ilyushin). During the infancy of the next project, this was done as it wasn't always certain what a single app's responsibilities would be. As the project has progressed and become more stable it's now easier for us to name apps as per their purpose (next-article).

##APIs

APIs should be named with the following convention -

<code>
n-*-api
</code>

##Bower and npm modules

Anything not covered by the above, e.g bower and npm components should be named with the following convention -

<code>
n-*
</code>

# Standardised names for classes & data attributes

Next websites use the following conventions for data-attributes and classes:

## Data attributes

* data-content-id  
    {capi uuid} or clamo-{fastft id} or ... extend sensibly as we bring in other content sources
* data-concept-id  
    id of metadatum, wherever they be used (container for stream, tags etc.)  
    for v1 metadata asearch string of the form `taxonomy:"name"` is used as the id
* data-trackable  
    used by the tracking system to determine the dom path to the element being tracked  
    pipe-separated list of contextual information
