# Bearface theme — design brief

You are designing the public theme for **bearface.io**, the site of Bearface, a
white-label software development studio whose customers are **marketing agencies**
(WordPress/marketing shops) that need custom software for *their* clients.
Bearface builds under the agency's brand; the agency keeps the client, the
markup, and the credit. The site's one job: get an agency owner to forward a
client's software request to ben@bearface.io for a wholesale quote.

## What to build

This is a Plum CMS (Rails engine) Liquid theme. Create these files under
`app/themes/bearface/`:

- `layouts/base.liquid` — HTML shell (head, header/nav, `{{ content }}`, footer)
- `templates/entries/pages.liquid` — page template; for the entry with
  `entry.slug == "home"` render `{{ entry.data.sections }}` (that emits the
  rendered blocks); for other pages render a simple article with
  `{{ entry.title }}` and `{{ entry.data.body }}`
- `blocks/hero.liquid`
- `blocks/deal_math.liquid`
- `blocks/rules.liquid`
- `blocks/steps.liquid`
- `blocks/services.liquid`
- `blocks/about.liquid`
- `blocks/cta.liquid`
- `assets/theme.css` — all styling
- `assets/bearface-mark.svg` — a bear mark used as logo + favicon (design one;
  simple, geometric, ownable)

`app/themes/bearface/theme.yml` already exists and defines every block's fields —
read it for the exact field handles. **Do not change theme.yml.**
The real page content lives in `db/seeds.rb` — read it so you design with the
actual copy, not lorem.

## Liquid contract (Plum)

- In a block partial, fields are accessed directly on `block`:
  `{{ block.heading }}`, `{{ block.item1_title }}`, etc.
- Layout receives `{{ content }}`; page templates receive `entry`
  (`entry.title`, `entry.slug`, `entry.data.<field>`).
- `site.name`, `site.theme_settings.contact_email` are available.
- Navigation: `nav.main.items` — each item has `.label` and `.url`.
- Theme assets: `{{ 'theme.css' | theme_asset_url }}` /
  `{{ 'bearface-mark.svg' | theme_asset_url }}`.
- Standard Liquid filters only. Two fields need splitting:
  `about.body` is plain text with paragraphs separated by blank lines;
  `about.credentials` is one credential per line. Use `capture` +
  `split` to break them up (you cannot write "\n" literally in Liquid —
  capture a real newline).
- A working reference theme (structure only, NOT visual reference) is at
  `/home/ben/Work/plum-site/app/themes/plum/`.

## Anchors

The nav links to `/#model`, `/#process`, `/#build`, `/#about`, `/#contact`.
Give the deal_math block `id="model"`, steps `id="process"`, services
`id="build"`, about `id="about"`, cta `id="contact"`.

## Design direction

A previous design was rejected by the owner as generic: it was a warm-cream
page with an amber accent, Archivo headings, rounded cards in a grid, and a
dark "stats band" — a textbook AI-generated landing page. Do not produce that
again, and do not produce its dark-mode twin or another recognizable template
(purple-gradient SaaS hero, broadsheet-serif editorial, near-black with one
neon accent).

You have full creative authority over palette, typography, layout, and motion.
Bring a strong, specific point of view that fits the subject: a small,
senior, behind-the-scenes engineering outfit that agencies put their own name
on — confident, precise, a little wry ("the bear behind your brand" energy is
available if you want it, not required). Surprise us. Some raw material worth
designing around: the deal-math numbers ($28,800 / $4,800 / $24,000 /
$75–150/mo) are the heart of the pitch; the white-label rules read like
contract terms; the whole business is about being invisible.

## Hard requirements

- Semantic, accessible HTML (focus states, contrast, reduced-motion respect).
- Responsive from 360px to wide desktop; no horizontal page scroll.
- Fast: no JS frameworks, no build step. Vanilla JS only if a small amount
  earns its place. Google Fonts are fine (link tags).
- Works entirely from the Liquid data — no hardcoded copy that exists in the
  CMS fields (footer/nav chrome may be authored in the layout).
- Every block partial must render acceptably if an optional field is blank.
- Valid Liquid — the site must boot and render at http://localhost:3000.

When you're done, list the files you created and summarize your design
direction in a few sentences.
