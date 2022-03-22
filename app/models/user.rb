class User < ApplicationRecord
    has_one :store
    # validates :name, presence: true
    # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    # validates :name, presence: true, begin_with_ruby: true



    
    # validate :name_validator
    # private
    # def name_validator
    #     unless name.starts_with? 'Ruby'
    #     errors[:name] << "必須是 Ruby 開頭喔!"
    #     end
    # end
end
