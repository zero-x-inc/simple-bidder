class SiteLoader
  class << self
    def call(data:, exchange:, publisher:)
      site_data = data['site']
      return nil unless site_data.present?

      site = Site.find_or_create_by(
        exchange_id: exchange.id,
        external_id: site_data['id']
      )

      if site.name != site_data['name']
        site.name = site_data['name']
      end

      if site.domain != site_data['domain']
        site.domain = site_data['domain']
      end

      app.save! if app.changed?
      return site
    end
  end
end
