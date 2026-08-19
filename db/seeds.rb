admin = Plum::User.find_or_initialize_by(email: ENV.fetch("PLUM_ADMIN_EMAIL", "ben@bearface.io"))
admin.password = Rails.env.production? ? ENV.fetch("PLUM_ADMIN_PASSWORD") : "password"
admin.role = :admin
admin.save!

site = Plum::Site.first_or_create_standalone!
site.update!(
  name: "Bearface",
  theme_name: "bearface",
  theme_settings: { "contact_email" => "ben@bearface.io" }
)

Plum::SiteSetting.instance(site).update!(
  name: "Bearface",
  tagline: "Your agency's software team",
  seo_title: "Bearface — White-label software development for agencies",
  seo_description: "Bearface builds custom software your agency sells under its own brand. You own the client, the markup, and the credit.",
  theme_name: "bearface",
  support_email: "ben@bearface.io"
)

pages = site.content_types.find_or_initialize_by(handle: "pages")
pages.update!(
  name: "Pages",
  icon: "page",
  blueprint: {
    "fields" => [
      { "handle" => "summary", "type" => "textarea", "label" => "Summary" },
      { "handle" => "body", "type" => "rich_text", "label" => "Body" },
      { "handle" => "sections", "type" => "blocks", "label" => "Sections" }
    ]
  }
)

home = site.entries.find_or_initialize_by(slug: "home")
home.update!(
  content_type: pages,
  author: admin,
  title: "Home",
  status: :published,
  published_at: Time.current,
  data: {
    "summary" => "White-label software development for agencies.",
    "sections" => [
      {
        "id" => SecureRandom.uuid,
        "type" => "hero",
        "fields" => {
          "eyebrow" => "White-label software development for agencies",
          "heading" => "Your agency's software team.",
          "subheading" => "Your client just asked for something WordPress can't do — a customer portal, a custom ordering system, software. Say yes. Bearface scopes it, quotes it wholesale, and builds it under your brand. You own the client, the markup, and the credit.",
          "primary_label" => "Send us a project to scope",
          "primary_url" => "mailto:ben@bearface.io?subject=Project%20to%20scope",
          "secondary_label" => "See how the model works",
          "secondary_url" => "#model"
        }
      },
      {
        "id" => SecureRandom.uuid,
        "type" => "deal_math",
        "fields" => {
          "eyebrow" => "The model, in one deal",
          "cell1_who" => "Your client pays",
          "cell1_amount" => "$28,800",
          "cell1_desc" => "Your quote, your invoice, your relationship.",
          "cell2_who" => "You keep",
          "cell2_amount" => "$4,800",
          "cell2_desc" => "A 20% markup on the build — before recurring margin.",
          "cell3_who" => "Bearface builds for",
          "cell3_amount" => "$24,000",
          "cell3_desc" => "Fixed price, milestone payments, defined scope.",
          "cell4_who" => "Then, every month",
          "cell4_amount" => "$75–150",
          "cell4_desc" => "Your margin on managed hosting & support you resell.",
          "note" => "Real numbers from a real engagement shape: a multi-school fundraising platform with teacher portals, unique student storefronts, and Stripe checkout. Your client never learns Bearface exists unless you want them to."
        }
      },
      {
        "id" => SecureRandom.uuid,
        "type" => "rules",
        "fields" => {
          "heading" => "The white-label rules",
          "introduction" => "Agencies get burned by developers who go around them. These aren't marketing lines — they're the terms in our contract.",
          "item1_title" => "You own the client, end to end.",
          "item1_text" => "We never contact your client directly. Demos, training videos, and documentation carry your branding, not ours.",
          "item2_title" => "Wholesale pricing, made to mark up.",
          "item2_text" => "Fixed quotes with milestone payments and suggested retail, so you know your margin before you pitch.",
          "item3_title" => "Defined scope, protected margin.",
          "item3_text" => "Anything outside the fixed scope is quoted before it's built. Your markup never gets eaten by our overruns.",
          "item4_title" => "Your client owns the code.",
          "item4_text" => "Work for hire, transferred on final payment. No lock-in you'd have to explain later.",
          "item5_title" => "Sales support behind the curtain.",
          "item5_text" => "We help you scope, price, and answer the technical questions in your pitch — as your team."
        }
      },
      {
        "id" => SecureRandom.uuid,
        "type" => "steps",
        "fields" => {
          "heading" => "How an engagement runs",
          "step1_label" => "01 / Scope",
          "step1_title" => "Forward us the ask",
          "step1_text" => "Send the client's request — an email thread is enough. Within a few days you get a scope, a fixed wholesale price, and a suggested retail number.",
          "step2_label" => "02 / Pitch",
          "step2_title" => "You sell it",
          "step2_text" => "Pitch under your brand with our technical backup. We join calls as your development team when it helps close.",
          "step3_label" => "03 / Build",
          "step3_title" => "We ship in weeks",
          "step3_text" => "Milestone demos your client can click, not status reports. Typical build: four to eight weeks from deposit to launch.",
          "step4_label" => "04 / Recur",
          "step4_title" => "You bill monthly",
          "step4_text" => "We run hosting, monitoring, and updates at a flat wholesale rate. You resell it as your managed plan and keep the margin."
        }
      },
      {
        "id" => SecureRandom.uuid,
        "type" => "services",
        "fields" => {
          "heading" => "What we build",
          "introduction" => "Production software with real money and real users moving through it — the requests your clients bring that a plugin can't answer.",
          "item1_title" => "Custom web applications",
          "item1_text" => "Portals, dashboards, booking and ordering systems — built on Ruby on Rails, the stack behind Shopify and GitHub.",
          "item2_title" => "E-commerce & payments",
          "item2_text" => "Stripe integrations, multi-tenant storefronts, subscriptions, payouts. We've built payment systems at point-of-sale scale.",
          "item3_title" => "Integrations & automation",
          "item3_text" => "Making the client's CRM, ERP, or legacy system talk to the web. APIs, imports, sync jobs, webhooks.",
          "item4_title" => "Client-editable sites",
          "item4_text" => "When a project needs content the client manages themselves, we wire in a CMS layer — under your brand, like everything else."
        }
      },
      {
        "id" => SecureRandom.uuid,
        "type" => "about",
        "fields" => {
          "heading" => "Who's behind it",
          "body" => "Bearface is run by Ben Simmons, a software engineer who has spent 15+ years shipping production systems — restaurant point-of-sale platforms, payment gateway integrations, e-commerce, and the unglamorous middleware that keeps money moving correctly.\n\nThe agency model exists because of a pattern: great marketing agencies keep winning clients whose next request is software, and subcontracting to a random dev shop risks the relationship. Bearface is built to be the standing answer — a development arm you can put your name on.",
          "credentials" => "15+ years production software\nPoint-of-sale & payments\nStripe · TSYS · Elavon\nRuby on Rails · Hotwire\nFixed-price, milestone billing"
        }
      },
      {
        "id" => SecureRandom.uuid,
        "type" => "cta",
        "fields" => {
          "eyebrow" => "Start with one project",
          "heading" => "Got a client asking for software?",
          "text" => "Forward the request. You'll have a wholesale quote you can mark up — usually within a few days, always without a commitment.",
          "email" => "ben@bearface.io"
        }
      }
    ]
  }
) if home.new_record? || home.data.fetch("sections", []).blank?

main_nav = site.nav_menus.find_or_initialize_by(handle: "main")
main_nav.update!(name: "Main navigation")
[
  [ "The model", "/#model" ],
  [ "How it works", "/#process" ],
  [ "What we build", "/#build" ],
  [ "About", "/#about" ],
  [ "Contact", "/#contact" ]
].each_with_index do |(label, url), index|
  item = main_nav.nav_items.find_or_initialize_by(label: label)
  item.update!(site: site, entry: nil, url: url, position: index + 1, parent: nil)
end

puts "Seeded Bearface site"
puts "Control panel: http://localhost:3000/cp"
puts "Development login: #{admin.email} / password" unless Rails.env.production?
