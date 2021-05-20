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

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User




    def self.random_code 
        while true
            var = SecureRandom.urlsafe_base64(16)
            return var unless ShortenedUrl.exists?(short_url: var)
        end
    end

    def self.create_object(user, long_url) #factory method 
        ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: ShortenedUrl.random_code)
    end




end
