To run locally:

- Install Ruby, e.g. using [rvm](https://rvm.io/).
- Install Jekyll: `bundle install jekyll`
- Start the server: `bundle exec jekyll serve`
- Visit the site at [localhost:4000](http://localhost:4000)

Site is hosted using GitHub pages. Note that Tailwind doesn't work on GH pages with Jekyll by default, so we're deploying the page with a custom action as detailed here:

https://mzrn.sh/2023/10/26/how-to-use-tailwind-css-with-jekyll-on-github-pages/

But on 31st July I pushed a change and saw that Tailwind wasn't compiling correctly for some reason (the site looked fine locally but styles were broken on prod.)

Needs further investigation, but my hacky quick fix is to manually edit the `gh-pages` branch to add the compiled `main.css` file directly:

- checkout `main`
- save `_site/assets/css/main.css` (it's gitignored) somewhere
- checkout `gh-pages`
- save the above CSS file to `assets/css/main.css`
- commit and push to `origin/gh-pages`
