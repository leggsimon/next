# Lifecycle of a request

tl:dr; - This is how next.ft.com works.

Next is made up of (at time of writing) 30 or so components and services, all cooperating* to deliver a page of the next.ft.com site to the end user. Below is an attempt to explain how this all fits together to successfully deliver a page to the end user. So to begin the story:

> A user has requested a url `http://next.ft.com/stream/people/Neil%20Hamilton`

## 1. Responding to a page request

### Where to handle the request
Firstly the request hits our Fastly CDN (get to grips with it! https://www.youtube.com/watch?v=6X--X9R3aOE), configured with a mixture of the [web interface] and our own [varnish config](fastly deploy repo). If the CDN already holds a cached copy of the page** and it hasn't expired yet this is sent straight back to the user; skip straight to part 2 (remember to pick up £200 as you pass GO). If not the request is forwarded to the [router].

The router is a node app that knows which application should handle which request by checking the [service registry] (it's [human readable](json endpoint), so a good place to start if you're not sure which app delivers a given page). It's worth noting here that it doesn't check the registry for *every* request, but polls it regularly and stores the result in memory; this is a common pattern in next applications, used to reduce the impact of poor performance in services we depend on.

In our example the router will identify a `/stream` url has been requested and therefore should be handled by the next-dobi application. It forwards the request to Dobi and awaits a response.

### Anatomy of a next application
Dobi is a typical next user-facing application. We use a few [conventions](app structure doc) and an ever-growing list of shared tools and modules to maintain consistency and maintainability across all our microservice applications. Each application is essentially an [express] app, but we don't use express directly. Rather we wrap it using [ft-next-express] which adds [handlebars] as the templating engine, sets up [error-reporting](express-errors-handler)... I'll leave the rest to the [README](https://github.com/Financial-Times/next-express). It exports this enhanced express app ready for you to define routes, add more middleware, give a silly aeroplane-based name to and nurture just as you would an ordinary express app.

Dobi, like all our apps, is primarily concerned with serving FT content to the user. It fetches this content from a combination of the following services: CAPI1, CAPI2, SAPI, CLAMO our elastic search container for CAPI1***. The main conduit for this content is [ft-api-cient], which wraps the responses in Promises and Models and readies the content to be manipulated and rendered by the application. These APIs, for the most part, require api keys which are set in environment variables (in your local environment you will need to store these keys in hidden files in your user root). Environment variables are also needed to configure various other APIs e.g. applicatin monitoring services such as pingdom and graphite.

So that's what the application is, but it's no use it sitting on your development machine is it. So this is how it's deployed.

Each app is hosted on [heroku]. We use Codeship for continuous deployment and make to define and run our installation, build, test and deployment tasks. In general the same/similar tasks are used to set up your local copy of the site. The tasks take advantage of a number of external tools. The front-end code is built using [origami-build-tools] and [gulp]. Unit tests are run using mocha, with integration tests using [nighwatch] and running against copies of the application runing on temporary heroku domains. Finally the application is deployed to heroku using [haikro]. Some of the above (and ideally most of it eventually) is encapsulated in [next-build-tools]. Yes, there are an awful lot of ingredients in the deployment pie, but most of them run quite happily with fairly infrequent stirring by a human. It may seem like we've overcooked it - and indeed like I've over-egged this cookery metaphor - but as we're deploying new features and fixes to next applications several times a day our deployment pipeline needs all these features to enable us to do this confidently.

Once the application is up and running on heroku it's ready to receive traffic from the router

### Sending the response out to the user
Provided the request successfully matches one of Dobi's routes Dobi will send a 200 response with a chunk of html (or, from time to time, JSON). The router will pass this back up to Fastly, which will in turn send it to the user and cache for future identical requests. The sun shines, world peace arrives and everyone's happy. In the unlikely event that the response is an error (as if next ever errors!) Fastly sends (weird hack alert!) a blank html page with an iframe containing an error page served by [next-errors].

And they all lived happily ever after.

## 2. Delivering the styled and enhanced experiences
... Or did they??

You may have picked up on my glibly stating

> send a 200 response with a chunk of html

We did try to get this to happen by magic, but unfortunately there were technical difficulties so we had to code it properly instead. Here's how:

### Origami and bower
First some background. Presumably, being a node developer, you're familiar with npm. Bower is similar, but it's for client-side components only and won't nest components; your `/bower_components` directory will always be a pretty flat structure. Bower components can contain not just javascript, but also css, sass, templates, or anything really. Principally we use it for js, sass and handlebars/mustache templates. Our components are mostly stored on github, as are the origami components we use. [Origami] is FT's project to create an ecosystem of reusable client side components and services. The components contain javascript, sass and example markup and are used to provide a range of front-end features e.g. formatting and auto-updating dates, or a responsive grid. Next components, while in general not totally compliant with the origami spec are generally written with the intention that one day they will evolve to be origami modules.

### The core experience - templating and styles
The way next delivers templates is *slightly* weird. As mentioned above, bower guarantees a flat directory structure which is perfect for templates as the paths to your partials are very predictable. So despite the fact the vast majority of the rendering is done server side and the templates are, in some cases, hard dependencies of our node modules, we store them in bower components. It's not perfect but it works pretty well. [ft-next-express] provides us with a handlebars instance and lots of [custom helpers], and within your apps you can call `res.render( ... )` as you would in any other express app.

### The enhanced experience - javascript and... err... monkey tennis??

## (footnote to 1 & 2) Learning to live in component hell
If you're used to working in large monolithic applications switching to working on, at times, four or five components simultaneously in order to roll out a single feature can be a total head... ache. But it does get more intuitive the longer you work this way, and there are things you can do to make it easier.

npm/bower link
semver is your friend - don't be scared that eh'll die when he gets old. Semver, even when he reaches the ripe old release of 512, is still as sprightly as he was at version 1
tagged release e.g. ft-next-express
npm version
sentry

## 3. Personalisation

## 4. Messing about with it (feature flags, ab tests and the like)



* most of the time
** most pages are cached by the CDN, with the exception of personalised pages e.g. /mypage/following
*** Yes, it's messy at the moment, but it will get better; eventually CAPI2 will include equivalents of all the features contained in the other services and we'll just use CAPI2. But for the time being it is unfortunately one area where it pays to ask somebody who's familiar with the codebase.
****