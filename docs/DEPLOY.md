# Deploying imanolgomez.com

Everything in this file is done **by hand, once**, by Imanol. The two workflows in
`.github/workflows/` take over after that (`deploy.yml` on `main`, `check.yml` on
pull requests).

Nothing here touches DNS for `steinergomez.com` — it carries email and must be left
alone.

## 1. Repo settings (GitHub)

1. **Settings → Pages → Build and deployment → Source:** `GitHub Actions`.
   (Not "Deploy from a branch" — the site is built by `deploy.yml`.)
2. **Settings → Pages → Custom domain:** `imanolgomez.com`, then **Save**.
3. Tick **Enforce HTTPS** once the certificate is issued (can take up to an hour).
   Until then the checkbox is disabled and the site may briefly serve over HTTP.

No `CNAME` file is committed on purpose: with the GitHub Actions source, the custom
domain lives in repository settings, and a stale `CNAME` file is a classic way to
break a deploy.

## 2. Verify the domain at the account level

Do this before pointing DNS at GitHub — it stops someone else from claiming a
subdomain of `imanolgomez.com`.

1. **GitHub → Settings (personal account, not the repo) → Pages → Add a verified
   domain** → enter `imanolgomez.com`.
2. GitHub shows a `TXT` record (`_github-pages-challenge-<user>`). Add it at
   Namecheap exactly as shown, then click **Verify**. It can take a few minutes to
   propagate; re-click Verify rather than re-adding the record.

## 3. DNS (Namecheap)

**Domain List → imanolgomez.com → Advanced DNS.** Delete the default parking
records (`CNAME www → parkingpage.namecheap.com` and the `URL Redirect @`), then add:

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

Keep the `TXT` record from step 2. Leave any `MX` record for `steinergomez.com` or
mail alone — that is a different domain and unrelated to this site.

## 4. Verify

```sh
dig +short imanolgomez.com A          # the four 185.199.x.153 addresses
dig +short www.imanolgomez.com        # -> imanolgo.github.io.
curl -sI https://imanolgomez.com | head -1        # HTTP/2 200
curl -sI https://www.imanolgomez.com | head -1    # redirects to the apex
```

Then confirm in a browser:

- `https://imanolgomez.com` and `https://www.imanolgomez.com` both load over HTTPS.
- `www` ends up on the apex (one redirect).
- `https://imanolgomez.com/robots.txt` mentions the sitemap, and
  `/sitemap.xml` lists the pages.

## 5. What each workflow does

`deploy.yml` — on push to `main`, or by hand from the Actions tab:

1. Installs Zola `0.23.6` from the release tarball (pinned in the workflow `env`).
2. `zola build` → `public/`.
3. Uploads `public/` as a Pages artifact and deploys it.

`check.yml` — on every pull request and on pushes to branches other than `main`:

1. `zola check` — builds and checks links. Broken **internal** links fail the run;
   external link problems are warnings (`config.toml` → `[link_checker]`), because
   third-party hosts rot, rate-limit or block bots.
2. Fails if the built site contains a `TODO(` placeholder (AGENTS.md rule 4). Until
   the content placeholders listed in the project pages are resolved, this check is
   **expected to fail** — that is the gate working, not a bug. Draft pages are
   excluded from `public/`, so drafts never trip it.

## 6. Rotating the pinned Zola version

`ZOLA_VERSION` lives in both workflows and a comment ties it to the locally
installed version. To upgrade: bump both files, run `zola build && zola check`
locally with the new version first, and commit in one change.
