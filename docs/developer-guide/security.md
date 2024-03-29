---
layout: default
title: Security best practises
section: Developer guide
permalink: /docs/developer-guide/security/
---

# Security policies

- **HIGH** *Do not commit API keys or passwords to repositories*, with the following exceptions:-
	- Except in the [`next-config-vars`](http://git.svc.ft.com/projects/NEXTPRIVATE/) repositority, which is specifically designed for the storage of API keys.
- **MEDIUM** *Avoid creating shared accounts*, where possible create accounts against individual users (shared accounts may be created for the purposes of automation in some cases).
- **HIGH** *Do not store passwords for shared accounts anywhere except for [LastPass](https://lastpass.com/)*.
- **MEDIUM** *When creating a shared account for automation create it against an email address specifically made for that single purpose, e.g. `next-fastlyapi-prod@ft.com`.*  You can have `any-email-address@ft.com` created by requesting a [Google Group](https://groups.google.com) to be set up in the same name by `itservicedesk@ft.com`.

## Key

- **HIGH** Policy applies to existing and new things.  Existing things that violate the policy should be treated as bugs and fixed as soon as possible.
- **MEDIUM** Policy applies to new things.  Existing things should be updated when convenient.
