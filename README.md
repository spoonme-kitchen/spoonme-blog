To run locally:

- Install Ruby, e.g. using [rvm](https://rvm.io/).
- Install dependencies: `bundle install` and `npm install`
- Start the server: `bundle exec jekyll serve`
- Visit the site at [localhost:4000](http://localhost:4000)

## Deployment

The site is automatically deployed to GitHub Pages via GitHub Actions when you push to the `main` branch. The workflow:
1. Installs Ruby and Node.js dependencies
2. Builds the Jekyll site (which compiles Tailwind CSS via PostCSS)
3. Deploys to GitHub Pages

No manual steps required!
