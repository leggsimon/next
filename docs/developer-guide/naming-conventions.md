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

- **Repository name**: `next-*-page`;
- **Heroku app name**: `ft-next-*-page`;
- In the future the dev tools will add `-eu` or `-us` suffixes _automatically_; please do not add this manually;
- **Do not use** version suffixes, eg. `-v001`;
- A lot of the apps currently serving content are named after various fighter planes (mustang, ilyushin). During the infancy of the next project, this was done as it wasn't always certain what a single app's responsibilities would be. As the project has progressed and become more stable it's now easier for us to name apps as per their purpose (next-stream-page, next-front-page).

##APIs

APIs should be named with the following convention -

- **Repository name**: `next-*-api`;
- **Heroku app name**: `ft-next-*-api`;
- In the future the dev tools will add `-eu` or `-us` suffixes _automatically_; please do not add this manually;
- **Do not use** version suffixes, eg. `-v001`.

##Bower and npm modules

Anything not covered by the above, e.g bower and npm components should be named with the following convention -

<code>
n-*
</code>

# Code comments

We use the following comments to help communicate certain things about the code.

- `TODO` - Something that you've not yet done, but probably intend to do.
- `FIXME` - Something that is obviously broken, stupid, or dangerous that needs revisiting.
- `HACK` _or_ `AG:HACK` - A hack you intend to remove in the future. You can initial the hack.

We monitor these here - [http://next-radiator.ft.com/code/HACK](http://next-radiator.ft.com/code/HACK).


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

