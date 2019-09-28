class Article < ApplicationRecord
    belongs_to :author
    belongs_to :board
    belongs_to :parent, class_name: 'Article'
end
