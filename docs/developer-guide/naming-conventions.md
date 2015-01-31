---
layout: default
title: Naming conventions
section: Developer guide
permalink: /docs/developer-guide/naming-conventions/
---

# Standardised names for classes & data attributes

Next websites use the following conventions for data-attributes and classes:

## Data attributes
```yaml
data-content-id: 
  {capi uuid} or clamo-{fastft id} or ... extend sensibly as we bring in other content sources
  
data-concept-id:
  id of metadatum, wherever they be used (container for stream, tags etc.)
  for v1 metadata asearch string of the form `taxonomy:"name"` is used as the id
data-trackable:
  used by the tracking system to determine the dom path to the element being tracked
  pipe separated list of contextual information
```

## Classes
