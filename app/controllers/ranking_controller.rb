class RankingController < ApplicationController
	#before_action :set_item, only: [:have, :want]
	def have
		@ranking_have = Have.limit(10).group(:item_id).order('count_all desc').count
	end

	def want
		@ranking_want = Want.limit(10).group(:item_id).order('count_all desc').count
		#@want_ids = @ranking_want.keys
			
	end

	private
	def set_item
		@items = Item.find(:all)
	end
end
