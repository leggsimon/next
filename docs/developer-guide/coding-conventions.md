---
layout: default
title: Coding conventions
section: Developer guide
permalink: /docs/developer-guide/coding-conventions/
---

# Coding conventions

See also [naming conventions](/docs/developer-guide/coding-conventions/)

## Code style and linting
We cut the mustard, use the [polyfill service](https://cdn.polyfill.io/v1/docs/) to polyfill missing browser features and `origami build tools build` uses babel, so on the client side you can go crazy with ES5/6 features and modern APIs.

We aim to use the BEM convention in our styles, but aren't averse to more creative use of CSS where you feel it's needed.

Code style is enforced using `next-build-tools verify` for applications and server side modules, and `origami-build-tools verify` for client side components. To find out more write some code and see what they complain about :)

A few looser patterns that have emerged, but aren't enforced, are:

* Declare each variable on a separate line using the `var` keyword
* Use Promises for asynchronous flow control and `fetch` (which we polyfill globally on client and server side) for any http requests.
* Chain Promises by indenting by a single tab e.g.


		fetch(url)
		  .then(fetchres.json)
		  .then(function (data) {

		  });
		  
* Try to avoid client side templating as much as possible. Even for lazily loaded widgets favour server side rendering. Some apps use es6 template strings to render simple chunks of HTML.

## Application and module structure

### User-facing applications

Any user facing applications *must* follow this structure (`next-build-tools` relies on much of it)

```

	root
	  \_ client // Should contain no top level scss or js directories
	    \_ components  // js and scss for each feature. If > 1 file per
	       \_ ...      // feature then group together in a subdirectory
	    main.js
	    main.scss
	  \_ server // all server side js in here
	    \_ controllers // other common directory names include models,
	    app.js         // lib, middleware
	  \_ views
	    \_ partials // other useful partials e.g. page_meta.html
	    layout.html
	  \_ public // built client side files (not to be committed)
	            // all static assets should go in
	            // https://github.com/Financial-Times/next-assets
	  \_ bower_components // not to be committed
	  \_ node_modules     // not to be committed
	  \_ test
	    \_ client // specs and config for nightwatch/karma
	    \_ server // specs go in here (mocha config in Makefile)
	    \_ fixtures
	  README.md
	  bower.json
	  package.json
	  Makefile
	  Procfile
	  .travis.yml
	  .gitignore // must ignore /public/, /bower_components/ and /node_modules/
	  // other config/deployment files are ok in the root too

### API services
Use common sense, but stick to as much of the structure above as possible, particularly with regard to the config files in the directory root.

### Client side components (bower)
Aspire to follow the [origami standard](http://origami.ft.com/), with the exception of templates, which should reside in a `templates` directory and be written using [handlebarsjs](http://handlebarsjs.com). Don't add a version number to the `bower.json` file - rely on git tags for releases. All tags should be semvers beginning with 'v', e.g. `v2.3.4`.

### Server side modules (npm)
No convention on structure. Use the version number `0.0.0` in the `package.json` file and rely on git tags + [npm-prepublish](https://www.npmjs.com/package/npm-prepublish) for releases. All tags should be semvers beginning with 'v', e.g. `v2.3.4`.
