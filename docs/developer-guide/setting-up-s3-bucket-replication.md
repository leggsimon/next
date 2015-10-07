---
layout: default
title: S3 Bucket Replication
section: Developer guide
permalink: /docs/developer-guide/s3-bucket-replication/
---

# Setting up Multi-Region Replication on an S3 Bucket

Part of the requirements for services on the platinum tier is that they must be hosted in 2 different locations.  This also applies to static assets hosted on S3.  

Luckily, Amazon can do the job of ensuring replication between buckets for us.  This is how to set it up - please note that you will need to raise a ticket via SalesForce to complete these steps, so make sure you know how to (and are able to) [log in to SalesForce](https://financialtimes.my.salesforce.com).

1. **Create 2 buckets**
    
    One in Ireland (eu-west-1) and one in the US Standard (us-east-1) region.

    The typical naming convention we follow is `ft-next-${serviceName}` for the EU bucket, and `ft-next-${serviceName}-us` for the US bucket.

2. **Set up ‘Enable Website Hosting’

    For both buckets, on the S3 Console click ‘Properties’ then select ‘Static Website Hosting’ then select ‘Enable website hosting’.  Choose an appropriate index document, such as `index.html`.

3. **Add versioning to both buckets**
    
    For both buckets, on the S3 Console click ‘Properties’ then select ‘Versioning’ then select ‘Enable versioning’.
    
4. **Add a lifecycle rule to delete old versions**
    
    With versioning on each upload creates a new object - this will add a lot to hosting costs, so we add a rule to delete all versions.
    
    If you need to keep them for some reason you can ignore this step.
    
    For both buckets, on the S3 Console click ‘Properties’ then select ‘Lifecycle Rules’ then select ‘Add rule’.

    Ensure that the new rule will apply to the **whole bucket** then select **Configure rule**.

    Under ‘Action on Previous Version’ check ‘Permanently Delete’ and set the number of ‘Days after becoming a previous version’ to **1**.  Click ‘Review’ and then ‘Create and Activate Rule’.
    
5. **Open a ticket in SalesForce to set up replication**

    * From SalesForce click __technology self service__ then choose __TECHNOLOGY ONLY requests__ from the menu on the right.
    * The request type is "Infrastructure Request" associated program is "Strategic Products" and Infrastructure requests is "standard request".
    * When filling in the details be sure to provide the name and region of the source and destination buckets.
    
5. Now sit back and wait for the guys in infrastructure to do their thing - they are normally pretty responsive so it shouldn't take more than a couple of hours.