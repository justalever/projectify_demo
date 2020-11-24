require 'nokogiri'
require 'open-uri'

class HelloController < ApplicationController

	def index
		if user_signed_in?
			@teams = Team.where('id = ?', current_user.team_id)
			@projects = Project.where('team_id = ?', current_user.team_id)
		end
	end

	def zerodiv
		respond_to do |format|
			format.html {render :ps1_zerodiv}
		end
	end

	def scrape

		#Scraping Code:
		prox = "http://192.41.170.23:3128"
		url1 = 'https://www.foxnews.com/'
		doc1 = Nokogiri::HTML(URI.open(url1,proxy: URI.parse(prox)))
		@headline1 = doc1.css('main a picture img').attribute('alt').value
		#puts headline
		@img_url1 = doc1.css('main a picture img').attribute('src').value
	    #puts img_url
		@headurl_1 = doc1.css('main header a').attribute('href').value

		url2 = 'https://www.ndtv.com/'
		doc2 = Nokogiri::HTML(URI.open(url2,proxy: URI.parse(prox)))
		@headline2 = doc2.css('img.imgbrd').attribute('alt').value
		#puts headline2
		@img_url2 = doc2.css('img.imgbrd').attribute('src').value
	    #puts img_url2
		@headurl_2 = doc2.css('a').attribute('href').value


		respond_to do |format|
			format.html {render :ps1_scrape}
		end
	end
        

	def quotations

		if params[:quotation]
	      @quotation = Quotation.new(quote_params)

	      if params[:newcategory][:id]
	      	@quotation.category = params[:newcategory][:id]
	      	#@catt = params[:newcategory]
	      end


	      if @quotation.save
	        flash[:notice] = 'Quotation was successfully created.'
	        @quotation = Quotation.new
	      end

      	else
        	@quotation = Quotation.new
      	end

      	if(params[:erase])
      		cookies.permanent[:qno] = nil
      	end 

	    if params[:qno]
	    	if cookies[:qno]
	    		cookies.permanent[:qno] = cookies.permanent[:qno] + " " + params[:qno]
	    	else
	    		cookies.permanent[:qno] = params[:qno]
	    	end
	    end	

	    if params[:sort_by] == "date"
	      @quotations = Quotation.where.not(id: cookies.permanent[:qno]? cookies.permanent[:qno].split(" ") : nil).order(:created_at)
	    else
	      @quotations = Quotation.where.not(id: cookies.permanent[:qno]? cookies.permanent[:qno].split(" ") : nil).order(:category)

	    end


	    @exp = Quotation.all
		respond_to do |format|
			format.html
			format.json { render json: @exp }
			format.xml { render xml: @exp.map(&:as_json).to_xml }

		end

		if params[:xml_url]
			@xml_url = params[:xml_url]
			@doc3 = Nokogiri::XML(open(@xml_url))

			if @doc3

				@doc3.css('object').each do |node|
					children = node.children

				Quotation.create(
					#:id => node['id'].inner_text,
					:author_name => children.css('author-name').inner_text,
					:category => children.css('category').inner_text,
					:quote => children.css('quote').inner_text
				)

				end

			else
				flash.alert = "Incorrect URL"
			end
		end

	    #@search = Quotation.search(params[:search])
		#respond_to do |format|
		#	format.html {render :quotations}
		#end

		#@category_list = Quotation.select('DISTINCT category').where.not(category: [nil, ''])
	end

	def searchpage
		@quotations = Quotation.where.not(id: cookies.permanent[:qno]? cookies.permanent[:qno].split(" ") : nil).search(params[:search])

	end

	def ps2_solutions
	end


	def ps3
	end

	def ps4
	end

	def ps5

	end

	def ps6

	end

	def admin_panel
		if current_user.is_admin?
			@users = User.all
			if params[:uid]

				@person = User.find_by_id(params[:uid])

				if @person.is_active?
					@person.is_active = false
					flash[:notice] = "User has been banned"
				else
					@person.is_active = true
					flash[:notice] = "User has been activated"
				end
				@person.save
			end
		else
			flash[:alert] = "Nice try smarty pants!"
			redirect_to root_path
		end


	end







	private

	def quote_params
		params.require(:quotation).permit(:author_name, :category, :newcategory, :quote, :search)

	end




end