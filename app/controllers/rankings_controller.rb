class RankingsController < ApplicationController
	#before_action :set_item, only: [:have, :want]
	def have
		@ranking_haves = Have.limit(10).group(:item_id).order('count_all desc').count
		want_ids = @ranking_haves.keys
		@values = @ranking_haves.values
		@items = Item.find(want_ids).sort_by{|i| want_ids.index(i.id)} 
	end

	def want
		@ranking_wants = Want.limit(10).group(:item_id).order('count_all desc').count
		want_ids = @ranking_wants.keys
		@values = @ranking_wants.values
		@items = Item.find(want_ids).sort_by{|i| want_ids.index(i.id)} 
	end

	private
	def set_item
	#	@items = Item.find(:all)
	end
end
