require_relative 'spec_helper'
require 'pry'

require_relative 'yahoo_finance_client'

describe YahooFinanceClient do
	let(:client) { YahooFinanceClient.new }

	xit "reads the market cap correctly" do		
		stats = client.get_stats("APPL")
		expect(stats["Market Cap"]).to eq "581.56B"
	end

	it "gets html" do
		client = double(client, :get_html => "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\"")
		allow(client).to receive(:get_html).and_return("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\"")			
		expect(client.get_html).to start_with("<!DOCTYPE")
	end

	it "gets table" do
		html = client.get_html("APPL")
		table = client.get_table(html)		
		expect(table.keys).to include("Market Cap")
		expect(table.keys).to include("Open")
		expect(table.keys).to include("Prev Close")
	end
end