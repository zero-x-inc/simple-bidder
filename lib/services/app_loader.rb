class AppLoader
  class << self
    def call(data:, exchange:, publisher:)
      app_data = data['app']
      return nil unless app_data.present?

      app = App.find_or_create_by!(
        exchange_id: exchange.id,
        publisher_id: publisher.id,
        external_id: app_data['id']
      )

      if app.name != app_data['name']
        app.name = app_data['name']
      end

      if app.domain != app_data['domain']
        app.domain = app_data['domain']
      end

      app.save! if app.changed?
      return app
    end
  end
end
