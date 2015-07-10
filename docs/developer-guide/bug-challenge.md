---
layout: default
title: Bug challenge
section: Developer guide
permalink: /docs/developer-guide/bug-challenge/
---

# Bug challenge

**I'm on the bug challenge. What's that?**

If you're on the bug challenge, it's for the whole week and with another developer. In other words: Every week, two developers are assigned to the bug challenge. It's works the same as other weekly challenges. Put all your time into it; you aren't meant to work in your usual team.

**What do I do?**

Find things that are broken and fix them. There are many things that can break, and many different places that tell you when something's broken. That's it, really; the rest is up to you.

**Do I need to fix environment stuff?**

Yes. Use this as an opportunity to understand more about the whole Next FT stack, including (e.g.) 

 - List item
 - memory leaks in the platform 
 - protocol issues (e.g. tcp/http/https)
 - platforming, CDNs, proxies (e.g. heroku, fastly)
 - third-party services (e.g. Origami Build Tools) 

**Do I need to fix code bugs in individual services?**

Yes. The general idea is to first liaise with whatever team's responsible for the service/app/api. They might prefer to resolve it themselves, or have some advice. 

**What do I do if I find a bug?**

Your goal is to resolve the issue — or if it's a false alert, improve whatever triggered it. There's no standard set of steps to take, and  you're going to have to use your initiative to sort it out, whatever it is. 

A good place to start is the service registry:

 - http://next-registry.ft.com/ 
 - A place to get some perspective on all the different services that make up Next FT. 

> Side note: The registry's used by Sensu to expose meaningful links in alerts. All Next FT services are meant to be in the registry, but it's manually maintained in github. If you're debugging a Next FT feature and it's not in the registry, ask the ft-next-dev slack channel for answers.

Tip: If your bug has a herokuapp URL, try looking for it in https://dashboard.heroku.com/. And try searching github and/or stash for the code; whoever's done the most code commits is the best person to ask. 

**Where do I find bugs?**

The long-term idea is to have a single dashboard that will monitor every single thing that we want to keep working. Until such a thing exists, you have to look around for evidence of bugs. Here's a list of places to look — in priority order.

Bug challenge task list

 - https://docs.google.com/document/d/1MUFB8d1LzFkVa-BJQP6XXVYfn9RlhHN-W1XTFF4jjaM/edit
 - A handy place to track your debugging tasks.  
 - Check for any half-fixed bugs left over from last week.

Pingdom 

 - https://my.pingdom.com/newchecks/checks 
 - If you don't have access, ask your co-debugger to invite you.
 - You can see what services are down by scrolling to the bottom, or using the filter:
 ![Pingdom filter example](http://next-geebee.ft.com/assets/bug-challenge/pingdom.png)
 
Slack

 - https://financialtimes.slack.com/messages/[channel], where [channel] is:
 - [ft-next-support](https://financialtimes.slack.com/messages/ft-next-support) ← Anyone can ask support questions here
 - [ft-next-dev](https://financialtimes.slack.com/messages/ft-next-dev) ← General dev channel; Sensu bot sends messages here
 - [ft-next-feedback](https://financialtimes.slack.com/messages/ft-next-feedback) ← Next Feedback sends messages here
 - As time goes by, more services will send alerts to slack (e.g. pingdom and sentry)

Next Feedback 

 - https://groups.google.com/a/ft.com/forum/#!forum/next.feedback 
 - The email address for this group is next.feedback@ft.com. 
 - Specifically look for feedback from individuals; if someone has a question or a bug report, respond to it in a professional manner. Be polite and be bold.
 - (This also comes in a weekly report)

Sentry

 - Top ten: https://app.getsentry.com/nextftcom/teams/nextftcom-1/ 
 - All projects: https://app.getsentry.com/nextftcom/ 
 - Further reading: http://sentry.readthedocs.org/en/latest/ 

Sensu

 - In slack, sensu alerts look like this:
  ![In slack, sensu alerts look like this](http://next-geebee.ft.com/assets/bug-challenge/sensu-slack.png)
 - Click "Docs" for information on sensu. 
 - "Dashboard" links to http://sensu.ft.com/. 

JIRA

 - https://jira.ft.com/browse/NFT 
 - Sometimes people report issues here. They tend to be less urgent, but you might find something in there you can sort out.

**If you're leaning you should be cleaning**

The spirit of the bug challenge is to sincerely have a go at fixing things and generally making improvements. 

Be creative. If everything's working perfectly, you're not looking hard enough. You can always make a tool that exposes new performance, accessibility or usability bugs. 

Documentation

 - You can always review and update any documentation. 
 - See if you can organise, improve or fix something
 -- a github readme: https://github.com/Financial-Times/  
 -- google docs: https://drive.google.com/drive/folders/0B0DDxFh3ZO93T3VYbkZVZnNEQk0
 -- next ft guides: http://financial-times.github.io/next/docs/developer-guide/

Next Retrospectives

 - https://docs.google.com/document/d/1Xk0EN824hOVTXXgbbPXoxJp3qGcnFHZ0k-DW0HZ62zk/edit 
 - You might find things that were agreed ought to be done, but was never picked up by any team or challenge. 

Next dev meetup rolling agenda

 - https://docs.google.com/document/d/1_5BVMINvi4JvET3Ue17EJdDihb5Q2UVlfKcDFlfLENY/edit 
 - Review this for a list of things that developers want.

Debugging tools

 - Here's a browser testing guide: http://financial-times.github.io/next/docs/developer-guide/browser-testing/

