---
layout: default
title: Browser testing
section: Developer guide
permalink: /docs/developer-guide/browser-testing/
---

# Browser testing
Next uses [Nightwatch](http://nightwatchjs.org/) to run our in-browser tests.  Nightwatch is a testing framework built around Selenium which can run tests either against any server that implements Selenium Grid software (including [Sauce Labs](https://saucelabs.com)).

The Nightwatch developer guide can be found [here](http://nightwatchjs.org/guide#guidehttp://nightwatchjs.org/guide#guide) and the API reference is [here](http://nightwatchjs.org/api#assertions).  You can also use the implementation at [engels](https://github.com/Financial-Times/next-engels/tree/master/tests) as a guide.   

##Add nightwatch to your dev dependencies

<code>},
  "devDependencies": {
    "bower": "^1.3.12",
	...
    "nightwatch": "^0.5.36"
}</code>

##Get set up with Sauce Labs
Since Next is an open-source project, we're able to use Sauce Labs for free, which saves us the hassle of maintaining our own, local Selenium Grid.

Go to the [signup page](https://saucelabs.com/opensauce) for open source projects and create an account.  There are two things you're going to need when you're done:
> - Sauce Username
- Sauce API key


##Create your configuration file
**nightwatch.json** stores all the configuration information about the tests, including where the tests are going to run and what browsers are going to be used.

You can use the configuration for [engels](https://github.com/Financial-Times/next-engels/blob/master/tests/browser/nightwatch.json) as a starting point, and unless you decide that you don't want to use Sauce, you can generally leave it as it is.  The only thing that may change is the browsers you want to use.  For example:

<code>"firefox" : {
	"desiredCapabilities": {
	"browserName": "firefox",
	"version": "32",
	"platform": "Windows 7"
	}
},</code>

will ask Sauce to run the test on a Firefox, version 32, on a Windows 7 box.  If you want to change these, you can get the necessary desiredCapabilities settings from Sauce's [online documentation](https://saucelabs.com/platforms).

##Create your test file
Create a new .js file and put it in a /tests folder.  Call it what you like, though it should describe what the test is doing.

The most basic test we run is one that loads the page and verifies that the " js js-success" class appears on the page (if the javascript throws any excpetions at all, this will not happen).  It looks like this:

<code>"use strict";</code>

<code>module.exports = {
"Js-success Test" : function (browser) {
	browser
		.url(browser.launch_url)
		.waitForElementVisible('.next-card__content', 5000)
		.assert.attributeEquals(".js", "class", " js js-success")
		.end();
	}
};</code>

`browser.launch_url` pulls the `launch_url` variable from the nightwatch.json file.

##Set some environment variables
* TEST_URL: the url we're pointing the browser at
* SAUCE_USER: the username for our Sauce account
* SAUCE_KEY: the api key for our Sauce account\

These will need to be set up on our CI system as well.

##Install and build the app
So that we can run nightwatch. 

##Run the tests
<code>./node_modules/nightwatch/bin/nightwatch --test tests/browser/tests/(yourTestFile.js) --config ./tests/browser/nightwatch.json -e ie10,firefox,chrome</code>

* **- -test**: instructs nightwatch which test files we want to run
* **- -config**: the location of our nightwatch.json file
* **-e**: which environments we want to run.  In the above case, we want to run our tests across ie10, firefox, and chrome.  The three tests will run in parallel.

Why those three browsers?  Well, chrome is the most popular browser, and covering both Firefox and Internet Explorer 10 rounds out the testing rather nicely.  If the page loads properly in those three browsers, it's very likely to work everywhere else, too.

##Get the results
An xml-formatted report will be in the `/reports` folder.  If there were any failures, you should see a screenshot in the `/screenshots` folder.  You should also get some nice output on the console.

##Other things to consider

 - Consider using test [groups](http://nightwatchjs.org/guide#test-groups) and [tags](http://nightwatchjs.org/guide#test-tags) when writing tests, as they give us the ability to get very specific about which tests we want to run.
 - You can run as many test environments in parallel as you want, but bear in mind that Sauce Labs only allows 3 tests at-a-time on its open source plan.
