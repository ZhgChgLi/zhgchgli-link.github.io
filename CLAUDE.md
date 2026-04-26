# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal LinkTree-style site (linkyee fork) deployed to GitHub Pages. Content is driven by `config.yml`; `scaffold.rb` renders the active theme into `_output/`; `deploy.sh` (CI only) publishes `_output/` to the `gh-pages` branch.

## Common commands

```bash
# Install gems (Ruby 3.4.2, see .ruby-version)
bundle install

# Build the site locally — reads config.yml, renders ./themes/<theme>/ into ./_output/
bundle exec ruby ./scaffold.rb

# Preview locally (any static server pointed at _output/)
cd _output && python3 -m http.server 8000
```

There are no tests, linters, or a Jekyll pipeline — `scaffold.rb` is the entire build. Despite the name in deploy.sh comments, this project does **not** use Jekyll; it uses Liquid templates directly via the `liquid` gem.

`deploy.sh` refuses to run outside GitHub Actions (`GITHUB_ACTION` env check). Don't run it locally; iterate with `scaffold.rb` instead.

## Architecture

**Build pipeline (`scaffold.rb`)** — single-file builder, runs in this order:

1. Loads `config.yml`.
2. Copies `./themes/<config.theme>/` → `./_output/` (defaults to `default`).
3. Loads each entry in `config.plugins`: requires `./plugins/<PluginName>.rb`, instantiates the class with the YAML value, calls `.execute()`, stores the return under `settings["vars"][PluginName]`.
4. Runs Liquid over every `links[].link.*`, `socials[].social.*`, plus top-level `title`/`footer`/`tagline`/`name` — so `{{ vars.MediumFollowersCountPlugin }}` style interpolation works inside config strings *before* the page template is rendered.
5. Renders `_output/index.html` with the full settings hash as the Liquid context, overwriting the file in place.

**Plugins (`./plugins/*.rb`)** — subclass `Plugin` (in `plugins/Plugin.rb`), implement `execute`, return any value. The return is exposed as `vars.<ClassName>` in Liquid. The plugin's class name **must match the filename** because `scaffold.rb` resolves it via `Object.const_get(pluginFileName)`. Plugin config is passed to `initialize` as the YAML value under that plugin key — note `GithubRepoStarsCountPlugin` reads `data[0]` because the YAML form is a list under the plugin name.

**Themes (`./themes/<name>/`)** — must contain at least `index.html` (Liquid template). Switch by setting `theme:` in `config.yml`. Whole directory is copied verbatim, so CSS/JS/images live alongside the template.

**Deployment (`.github/workflows/build.yml` → `deploy.sh`)** — pushes to `main`, manual dispatch, or daily cron (00:00 UTC, refreshes plugin-derived vars like star counts). Builds, then force-pushes `_output/` (plus preserved `.git` and `CNAME`) to the `gh-pages` branch. Medium plugin needs `MEDIUM_HOST`, `MEDIUM_COOKIE_UID`, `MEDIUM_COOKIE_SID` secrets.

## Editing notes

- Content changes are almost always `config.yml` edits, not template edits.
- Anything inside `_output/` is build output — do not commit hand edits there; they're wiped on next build.
- When adding a plugin, register it in `config.yml` under `plugins:` and reference its output via `{{vars.ClassName}}` — pure template/config additions, no scaffold.rb changes needed.
