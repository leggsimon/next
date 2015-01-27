---
layout: default
title: Setting up Jenkins
section: Developer guide
permalink: /docs/developer-guide/jenkins/
---

# Introduction to Jenkins

For repositories hosted on Stash please set up CI jobs on [our Jenkins instance](http://ftjen06392-lvpr-uk-p.osb.ft.com:8181).

## Storing the configuration in XML

See Service Registry as an example:-
- [http://git.svc.ft.com/projects/NEXT/repos/service-registry/browse](http://git.svc.ft.com/projects/NEXT/repos/service-registry/browse)
- [http://git.svc.ft.com/projects/NEXT/repos/service-registry/browse/.jenkins.xml](http://git.svc.ft.com/projects/NEXT/repos/service-registry/browse/.jenkins.xml)
- [http://git.svc.ft.com/projects/NEXT/repos/service-registry/browse/Makefile#17](http://git.svc.ft.com/projects/NEXT/repos/service-registry/browse/Makefile#17)

## Setting up Stash Notifications

Don't forget to set up the **Stash Webhook to Jenkins** hook inside Stash for your repository.  This will add a green tick on pull requests that pass builds, which makes it much more obvious
when builds fail - helping prevent bad changes from being merged in.

1. Go to your rpeository in Stash.  Click **Settings** then **Hooks** (under **Workflow**)
2. Click the pencil icon next to **Stash Webhook to Jenkins**.
3. Set the Jenkins URL to `http://ftjen06392-lvpr-uk-p.osb.ft.com:8181`
4. Set the Repo Clone URL to `http://git.svc.ft.com:8080/scm/next/your-repository-name.git` (this must match **exactly** the repository URL set in your Jenkins config)
5. Click **Trigger Jenkins** to test the configuration, ensure it says **Success!**
6. Click **Enable** or **Save**.
