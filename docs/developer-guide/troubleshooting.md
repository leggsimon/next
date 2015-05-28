---
layout: default
title: Troubleshooting
section: Developer guide
permalink: /docs/developer-guide/troubleshooting/
---

# Troubleshooting

- There's a good chance origami build tools will fail due to directory permissions while installing ruby gems. You will need to run `gem install sass -v 3.4.13`/`sudo gem install sass -v 3.4.13` and `gem install scss-lint -v 0.35.0`/`sudo gem install scss-lint -v 0.35.0`.
- If you experience issues with node try `npm install -g npm@2.7.5` to upgrade or downgrade npm
- You will probably need to run `git config --global url."https://".insteadOf git://` in order to access git on some of our wifi networks
- Make sure your ssh is set up correctly [https://help.github.com/articles/generating-ssh-keys/](https://help.github.com/articles/generating-ssh-keys/)
- You should set up [two factor authentication](https://github.com/settings/security) for github. This will mean when you first try to submit code to github your password won't be recognised and you'll need to use a [personal access token](https://github.com/settings/applications) instead of your password in the git cli
- (Don't run `sudo npm install`!)  If npm install commands keep failing with permissions errors, read up at [Intro to NPM](http://howtonode.org/introduction-to-npm) on how to fix it.  But it's probably:-
  -  `sudo chown -R $USER /usr/local` (the default location of globally installed node modules)
  -  `sudo chown -R $USER node_modules` (the folder where app/component specific node modules are installed)
  -  `sudo chown -R $USER ~/.npm` (the default location where npm puts cached versions of node modules)
- Can't find `nodemon`, `mocha`, etc.  Your path might be missing `node_modules/.bin`.  Edit your `.bashrc` or `.bash_profile` file and ensure your path has the following paths added to it:-
  - `export PATH="node_modules/.bin:$PATH"`
  Then run `source ~/.bash_profile` to add it to your current terminal session
- If bower complains of dependency resolution problems (or `make install` fails repeatedly at the bower step) run `rm -Rf bower_components` and try installing again. Avoid, if at all possible, manually resolving dependencies when bower gives you the option to.
- If sass won't build (it may complain about too many open files) run `rm -Rf .sass-cache`
- Are you setting up a new app within Heroku or Travis? Read up more details on [creating new apps](/docs/developer-guide/creating-new-apps/) within the stack.
