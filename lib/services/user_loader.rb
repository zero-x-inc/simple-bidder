class UserLoader
  class << self
    def call(data:, exchange:)
      user_data = data['user']
      return nil unless user_data.present?

      user = User.find_or_create_by(
        exchange_id: exchange.id,
        external_id: user_data['id']
      )

      if (keywords = user_data['keywords']).present?
        gender = keywords.find {|k| k.include?('gender')}
        age = keywords.find {|k| k.include?('age')}

        if age.present?
          user.yob = Time.new.year - age.split(':').last.to_i
        end

        if gender.present?
          user.gender = gender.split(':').last.downcase
        end
      else
        if (gender = user_data['gender']).present?
          user.gender = gender.downcase
        end

        if (yob = user_data['yob']).present?
          user.yob = yob
        end
      end

      user.save! if user.changed?
      return user
    end
  end
end
