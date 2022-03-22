class Article < ApplicationRecord
    validates :title, presence: true
    # validates_presence_of :title


    # validate :title_validator

    
    # private
    # def title_validator
    #     # p title
    #     unless title.starts_with? 'Ruby'
    #     errors[:title] << "必須是 Ruby 開頭喔!"
    #     end
    # end
end
