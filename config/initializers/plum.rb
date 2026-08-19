Plum.configure do |config|
  # Standalone/default mode: Plum manages its own site and users.
  config.current_site_resolver = ->(_controller) { Plum::Site.first_or_create_standalone! }
  config.current_user_resolver = lambda { |controller|
    Plum::User.find_by(id: controller.session[:plum_user_id]) if controller.session[:plum_user_id]
  }
  config.authorize_with = :plum

  # Host themes win first, bundled Plum themes provide the fallback.
  config.theme_paths = [
    Rails.root.join("app/themes"),
    Plum::Engine.root.join("app/themes")
  ]

  # Static page caching serves rendered pages from disk instead of hitting
  # the database/Liquid on every request — a big win on a single server, but
  # only correct on a single server. See docs/static-caching.md before
  # enabling this on a multi-node/PaaS deployment (Heroku, Render, etc. with
  # 2+ dynos or instances).
  #
  # config.static_cache_enabled = true

  # White-label the control panel:
  #
  # config.cp_name = "My Brand"
  # config.cp_subtitle = "Website"
  # config.cp_logo_path = "my-logo.svg"
  # config.cp_accent_color = "#7c3aed"
  # config.cp_sidebar_bg = "#241B27"
  # config.cp_sidebar_header_bg = "#1E1621"
  # config.cp_sidebar_text = "#D9CBD4"
  # config.cp_sidebar_muted = "#A8929F"
  # config.cp_back_url = "/dashboard"
  # config.cp_back_label = "← Table Needs"

  # Embedded host example:
  #
  # config.current_site_resolver = ->(_controller) { Current.restaurant.plum_site }
  # config.current_user_resolver = ->(_controller) { Current.user }
  # config.authorize_with = :host
  # config.host_authorization_resolver = ->(_controller) { Current.user.can_manage_website?(Current.restaurant) }
  # config.register_content_source :restaurant, ->(context) { context.site.owner.to_liquid }
  # config.register_content_source :menu, "TableNeeds::PlumAdapters::Menu"
  # config.register_content_source :hours, ->(context) { context.owner.hours_for_web }
end
