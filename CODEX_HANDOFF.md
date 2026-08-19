# Codex handoff — bearface.io

You're picking up the Bearface site. Read this fully before touching anything.

## The business

Bearface (Ben Simmons, ben@bearface.io) is a white-label software development
studio whose customers are **marketing agencies**. Agencies win clients who ask
for custom software (portals, mobile apps, e-commerce, integrations); Bearface
scopes it, quotes a fixed wholesale price, and builds under the agency's brand.
The agency owns the client, marks up 20–40%, and resells managed hosting for
recurring margin. Bearface never contacts the end client. The site's one job:
get an agency owner to forward a client's software request for a wholesale quote.

## The site

- Rails 8 + Plum CMS (mounted at `/`), scaffolded with `plum new`. This repo.
- Run it: `bin/rails server` → http://localhost:3000. Control panel at `/cp`
  (dev login: `ben@bearface.io` / `password`).
- All page content lives in Plum as editable blocks. `db/seeds.rb` is the
  source of truth right now; `bin/rails db:seed` re-seeds (it OVERWRITES the
  home entry, so don't run it after content diverges in /cp).
- The theme is yours: `app/themes/bearface/` — you (Codex) designed it in an
  earlier session. "Production dossier" direction: cobalt blueprint hero, paper
  ground, acid-yellow highlights, ink sections, DM Mono labels, Space Grotesk
  display. The owner LIKES the theme. Don't redesign it.
- `theme.yml` defines the block fields — do not change field handles (content
  in the DB references them).
- Deployment will be `plum connect <vps-ip>` + `plum deploy` (Once). Not set
  up yet; not your concern unless asked.

## The open problem: the logo

This is the task the owner is handing you. History, so you don't repeat it:

1. **Original 2016 mark** — bear head in side profile, negative space, angular
   badge (`app/themes/bearface/assets/mark-*.png`, currently in the header,
   footer, CTA, and favicon as a placeholder). Owner has moved on from it:
   "forget the original logo."
2. **Your round 1** (pictorial, geometric bears) — rejected: "they look like
   throwup." Blocky cartoon faces, mascot energy.
3. **Your round 2** (refined profile badge, divided profile, signal profile,
   in `logo-proposals/`) — rejected: "SO FUCKING BAD."
4. **A typographic direction by another assistant** (BEARFACE wordmark with a
   redacted `CLIENT: ████` subline; also a classification-bar wordmark) —
   rejected: "i hate it. so much."

What that history says: drawn bears haven't cleared the bar, and neither did
type gimmicks. The owner wants something genuinely good and hasn't seen it
yet. Talk to him before generating: ask what brands' marks he admires, what
feeling he wants, whether "bear" even needs to be literal. Iterate in small
batches — one or two strong options with rationale beats three mediocre ones.

Technical constraints for any mark that ships:
- Works on all four site surfaces: paper `#f4f2eb`, cobalt `#1238ff`,
  acid `#dfff00`, ink `#101010` (see `:root` in `assets/theme.css`).
- Single color (SVG with `currentColor` fills, or per-surface PNG variants).
- Legible at 24px (header/favicon) and strong at 200px (CTA panel).
- Wired in at: `layouts/base.liquid` (header, footer, favicon) and
  `blocks/cta.liquid` (large mark). Swap assets there when a direction wins.

## Preview loop

```
bin/rails server -p 3111
chromium --headless --disable-gpu --window-size=1440,7000 \
  --screenshot=/tmp/site.png --hide-scrollbars http://localhost:3111/
```

## Repo state

- Committed: scaffold, theme, seeded content, original-logo placeholder.
- `logo-proposals/` holds the rejected round-2 SVGs and notes; delete or reuse.
- `LOGO_BRIEF.md`, `LOGO_BRIEF_2.md`, `DESIGN_BRIEF.md` are historical briefs
  from earlier rounds — context only.
- Copy is final-ish: generalized model language (Retail / 20–40% / Wholesale /
  Recurring), mobile apps included in services. Don't rewrite copy without
  being asked.
