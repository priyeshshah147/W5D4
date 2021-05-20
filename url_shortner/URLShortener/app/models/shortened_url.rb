# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string
#  short_url  :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord

    validates :short_url, uniqueness: true
    validates :long_url, presence: true

    def self.random_code
        SecureRandom.urlsafe_base64(:long_url)
    end


end
