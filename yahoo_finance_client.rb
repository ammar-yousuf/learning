require 'net/http'
require 'nokogiri'
require 'open-uri'
require 'pry'

class YahooFinanceClient
	def get_stats(ticker_symbol)
		{}
	end

	def get_html(ticker_symbol)
		url = URI("http://finance.yahoo.com/q?s=aapl")
		response = Net::HTTP.get(url)		
		response
	end

	def get_table(html)
		table = {}
		doc = Nokogiri::HTML(html)
		doc.css('.rtq_table').each do |h|			
			h.search(".yfnc_tabledata1").each do |i|
				parsed = i.parent.content.split(":")				
				table[parsed[0]] = parsed[1]
			end			
		end

		table
	end
end