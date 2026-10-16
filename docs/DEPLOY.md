# Deploying imanolgomez.com

Everything in this file is done **by hand, once**, by Imanol. The two workflows in
`.github/workflows/` take over after that (`deploy.yml` on `main`, `check.yml` on
pull requests).

Nothing here touches DNS for `steinergomez.com` — it carries email and must be left
alone.

## 1. Repo settings (GitHub)

**Already done** (via `gh api`, 2026-10-16):

- Pages source is `GitHub Actions` (`build_type = workflow`). The first Deploy run
  failed at `configure-pages` with `Get Pages site failed` purely because no Pages
  site existed yet.
- Custom domain is `imanolgomez.com` and **Enforce HTTPS** is on
  (`https_enforced = true`). The certificate is a Let's Encrypt cert for
  `CN=imanolgomez.com`, issued automatically once DNS pointed at GitHub.

Check the current state any time with:

```sh
gh api repos/ImanolGo/imanolgomez.com/pages --jq '{cname,https_enforced,build_type,status}'
```

No `CNAME` file is committed on purpose: with the GitHub Actions source, the custom
domain lives in repository settings, and a stale `CNAME` file is a classic way to
break a deploy.

Everything below is the order it was actually done in, kept for reference and for
setting up the next domain.

### While DNS is not set up yet

The site is served at `https://imanolgo.github.io/imanolgomez.com/` but renders
**without styling** there, and the same is true for any preview URL. Nothing is
broken: `base_url` is the custom domain, so the deployed HTML asks for
`https://imanolgomez.com/main.css`, which still resolves to the registrar's parking
page. It fixes itself the moment the DNS records below are live. Use `zola serve`
for local previewing in the meantime.

## 2. Verify the domain at the account level

Do this before pointing DNS at GitHub — it stops someone else from claiming a
subdomain of `imanolgomez.com`.

1. **GitHub → Settings (personal account, not the repo) → Pages → Add a verified
   domain** → enter `imanolgomez.com`.
2. GitHub shows a `TXT` record (`_github-pages-challenge-<user>`). Add it at
   Namecheap exactly as shown, then click **Verify**. It can take a few minutes to
   propagate; re-click Verify rather than re-adding the record.

## 3. DNS (Namecheap)

The domain's nameservers are `dns1/dns2.registrar-servers.com` — Namecheap BasicDNS.
**Domain List → imanolgomez.com → Advanced DNS.**

Two records exist today and both must go:

| Type | Host | Current value | Action |
|---|---|---|---|
| A | `@` | `192.64.119.15` | delete (registrar parking) |
| CNAME | `www` | `parkingpage.namecheap.com.` | delete (registrar parking) |

**Keep this one — do not delete it.** It is Namecheap email forwarding, and
deleting it breaks mail for the domain:

| Type | Host | Value |
|---|---|---|
| TXT | `@` | `v=spf1 include:spf.efwd.registrar-servers.com ~all` |

Then add:

| Type | Host | Value | TTL |
|---|---|---|---|
| A | `@` | `185.199.108.153` | Automatic |
| A | `@` | `185.199.109.153` | Automatic |
| A | `@` | `185.199.110.153` | Automatic |
| A | `@` | `185.199.111.153` | Automatic |
| AAAA | `@` | `2606:50c0:8000::153` | Automatic |
| AAAA | `@` | `2606:50c0:8001::153` | Automatic |
| AAAA | `@` | `2606:50c0:8002::153` | Automatic |
| AAAA | `@` | `2606:50c0:8003::153` | Automatic |
| CNAME | `www` | `imanolgo.github.io.` | Automatic |

Keep the `TXT` record from step 2 as well. Do not touch DNS for `steinergomez.com` —
that is a different domain and carries email.

## 4. Verify

```sh
dig +short @1.1.1.1 imanolgomez.com A       # the four 185.199.x.153 addresses
dig +short @1.1.1.1 www.imanolgomez.com     # -> imanolgo.github.io.
curl -sI https://imanolgomez.com | head -1                     # HTTP/2 200
curl -sI http://imanolgomez.com | head -3                      # 301 -> https://
curl -sI https://www.imanolgomez.com | grep -i '^location'     # -> https://imanolgomez.com/
```

Note the `@1.1.1.1`: a local resolver can keep serving the old parked address for
hours after the change, which makes it look like nothing happened.

Confirm in a browser:

- `https://imanolgomez.com` and `https://www.imanolgomez.com` both load over HTTPS.
- `www` ends up on the apex (one redirect).
- `https://imanolgomez.com/robots.txt` mentions the sitemap, and `/sitemap.xml`
  lists the pages.

### Verify domain ownership (recommended, not done yet)

This is the one remaining manual step. It stops anyone else claiming a subdomain of
`imanolgomez.com` with a dangling CNAME.

1. **GitHub → Settings (personal account, not the repo) → Pages → Add a verified
   domain** → `imanolgomez.com`. GitHub shows a `TXT` record whose value is a random
   token; it cannot be generated from the API, which is why this needs the UI.
2. Add that `TXT` at Namecheap, then click **Verify**. Re-click Verify after a few
   minutes rather than re-adding the record.

Check whether it is in place:

```sh
dig +short @1.1.1.1 _github-pages-challenge-imanolgo.imanolgomez.com TXT
```

Keep the record afterwards — GitHub re-checks it.

## 5. What each workflow does

`deploy.yml` — on push to `main`, or by hand from the Actions tab:

1. Installs Zola `0.23.6` from the release tarball (pinned in the workflow `env`).
2. `zola build` → `public/`.
3. Uploads `public/` as a Pages artifact and deploys it.

`check.yml` — on every pull request and on pushes to branches other than `main`:

1. `zola build` then `zola check` — builds and checks links. Broken **internal**
   links fail the run; external link problems are warnings (`config.toml` →
   `[link_checker]`), because third-party hosts rot, rate-limit or block bots. The
   explicit `zola build` is needed because `zola check` renders in memory and leaves
   no `public/` to inspect.
2. Fails if the built site contains a `TODO(` placeholder (AGENTS.md rule 4). Until
   the content placeholders listed in the project pages are resolved, this check is
   **expected to fail** — that is the gate working, not a bug. Draft pages are
   excluded from `public/`, so drafts never trip it.

## 6. If Deploy fails

The most likely failure by far, and the one this repo actually hit first:

```
##[error]Get Pages site failed. Please verify that the repository has Pages
enabled and configured to build using GitHub Actions
```

It means the Pages site does not exist yet, or its Source is not "GitHub Actions".
Check, then create it if needed:

```sh
gh api repos/ImanolGo/imanolgomez.com/pages            # 404 means it does not exist
gh api -X POST repos/ImanolGo/imanolgomez.com/pages -f build_type=workflow
gh workflow run deploy.yml && gh run watch
```

`workflow_dispatch` is the quickest way to re-verify after a settings change: it
re-runs the workflow on `main` without needing a new commit.

### A single URL serves a cached "Site not found" page

Right after the custom domain was attached, `http://imanolgomez.com/` returned
GitHub's 9115-byte "Site not found" page while every other path redirected
correctly. The tell is the `Age:` response header climbing on each request — the
Fastly edge had cached the error from the minutes when the domain was not yet
associated with the repo. A cache-busting query string does not help.

Fix: re-run Deploy (`gh workflow run deploy.yml`), which re-associates the domain
and purges it. If it persists, it is a cache TTL and clears on its own within the
hour. HTTPS redirects were correct throughout, so no visitor was affected.

Ignore the `ubuntu-latest label will migrate to Ubuntu 26` annotation — it is
informational. If it ever causes trouble, pin `runs-on: ubuntu-24.04` in both
workflows.

## 7. Rotating the pinned Zola version

`ZOLA_VERSION` lives in both workflows and a comment ties it to the locally
installed version. To upgrade: bump both files, run `zola build && zola check`
locally with the new version first, and commit in one change.
