To run locally:

- Install Ruby, e.g. using [rvm](https://rvm.io/).
- Install dependencies: `bundle install` and `npm install`
- Start the server: `bundle exec jekyll serve`
- Visit the site at [localhost:4000](http://localhost:4000)

## Testing the Build

Before pushing changes, you can test that the build process works locally:

```bash
./test-build.sh
```

This script:
- Installs all dependencies (Ruby gems and npm packages)
- Builds the Jekyll site with production settings
- Verifies that Tailwind CSS is compiled correctly
- Checks that the `_site` directory is generated

Alternatively, you can run the build commands manually:

```bash
bundle install
npm ci
JEKYLL_ENV=production bundle exec jekyll build
```

The built site will be in the `_site/` directory.

## Deployment

The site is automatically deployed to GitHub Pages via GitHub Actions when you push to the `main` branch. The workflow:
1. Installs Ruby and Node.js dependencies
2. Builds the Jekyll site (which compiles Tailwind CSS via PostCSS)
3. Deploys to GitHub Pages

No manual steps required!
