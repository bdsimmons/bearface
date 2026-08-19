# Bearface logo — design brief

You designed the theme in `app/themes/bearface/` (read `assets/theme.css` to
re-load your own design system: the cobalt, the acid yellow, the paper/ink
palette, the technical/mono typography, the "production dossier" aesthetic).

The current logo is the company's 2016 mark: a bear head in side profile,
reversed out of an angular badge (see `app/themes/bearface/assets/mark-white.png`).
The owner is open to a new mark that matches the theme's aesthetic better —
but it must still be unmistakably a bear. Bearface is a white-label software
studio: the bear works behind the agency's brand, invisible to the end client.

## Deliverables

Create THREE distinct logo candidates, each a standalone SVG file:

- `logo-proposals/candidate-a.svg`
- `logo-proposals/candidate-b.svg`
- `logo-proposals/candidate-c.svg`

Rules for each candidate:

- A square-ish MARK (not a full wordmark lockup) on a viewBox around 0 0 100 100.
- Draw with geometric primitives (rects, polygons, circles, simple paths) —
  precise and constructed, not illustrative or cute. It should look like it
  belongs next to the §-numbered contract clauses and mono eyebrow labels.
- Single color: use `currentColor` for every fill so the mark can be stamped
  in ink, white, cobalt, or acid via CSS `color` on the parent.
- No gradients, no strokes thinner than 2 units, no text in the mark.
- Legible at 24px and strong at 200px.
- Three genuinely different concepts — e.g. different takes on bear geometry,
  negative space, or the front/behind white-label idea. Don't do three
  variations of one idea.

Also write `logo-proposals/NOTES.md`: for each candidate, 2–3 sentences on the
concept and why it fits the identity.

Do not modify any theme files — proposals only, in `logo-proposals/`.
