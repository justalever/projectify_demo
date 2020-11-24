class Quotation < ApplicationRecord

	validates :author_name, :quote, presence: true

	def self.search(search)
		if search
			#where(category: quote).or(where(author: search)).or(where(quote: search))
			where('lower(quote) LIKE lower(?) OR lower(author_name) LIKE lower(?)', "%#{search}%", "%#{search}%")
		else
			all
		end
	end


end
