---
layout: default
title: S3 Bucket Replication
section: Developer guide
permalink: /docs/developer-guide/s3-bucket-replication/
---

# Setting up Multi-Region Replication on an S3 Bucket

Part of the requirements for services on the platinum tier is that they must be hosted in 2 different locations.  This also applies to static assets hosted on S3.  

Luckily, Amazon can do the job of ensuring replication between buckets for us.  This is how to set it up - please note that you will need to raise a ticket via salesforce to complete these steps, so make sure you know how to (and are able to) log in to salesforce.

1. **Create 2 buckets**
    
    One in Ireland (eu-west-1) and one in the US Standard (us-east-1) region.

2. **Add versioning to both buckets**
    
    On the S3 Console find the Versioning menu item and click __enable versioning__
    
3. **Add a lifecycle rule**
    
    With versioning on each upload creates a new object - this will add a lot to hosting costs, so we add a rule to delete all versions
    
    If you need to keep them for some reason you can ignore this step
    
    Lifecycle rules are found under the Lifecycle menu item for the bucket - please see the Amazon docs for more information
    
4. **Open a ticket in salesforce to set up replication**

    * From salesforce click __technology self service__ then choose __TECHNOLOGY ONLY requests__ from the menu on the right
    * The request type is "Infrastructure Request" associated program is "strategic products" and Infrastructure requests is "standard request"
    * When filling in the details be sure to provide the name and region of the source and destination buckets
    
5. Now sit back and wait for the guys in infrastructure to do their thing - they are normally pretty responsive so it shouldn't take more than a couple of hours.
