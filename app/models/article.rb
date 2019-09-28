class Article < ApplicationRecord
    belongs_to :author
    belongs_to :board
end
