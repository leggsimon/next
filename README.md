## This is a gh-pages branch

Please visit http://financial-times.github.io/ft-origami to view the site

## Building

Since this is a GitHub pages site, built CSS and JS bundles must be committed to the repository.  We store them in `buildcache` to avoid any confusion - these files should not be edited.  To regenerate them, use Grunt:

1. Clone the repo
1. Run `npm install`
2. Edit main.scss and main.js as desired
3. Run `grunt` (or if you prefer, `grunt js` or `grunt css`)

## Viewing locally

1. Install Jekyll `gem install jekyll`
2. Build the documentation `jekyll build`
3. In `_config.yml` make the baseurl an empty string,

```
...
baseurl:
...
```

4. Serve it `jekyll serve` and view on http://localhost:4000/ 
