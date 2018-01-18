require 'rubygems'
require 'nokogiri' 
require 'open-uri'  


def get_all_the_urls_of_val_doise_townhalls()
	page = Nokogiri::HTML(open("https://annuaire-des-mairies.com/val-d-oise.html"))
	annuaire = Hash.new
	cities = ""
	page.css('a.lientxt').each do |town|
		site = "https://annuaire-des-mairies.com" + town['href'][1..-1]
		cities = town.text
		#puts cities + " => " + get_the_email_of_a_townhal_from_its_webpage(site) 
		#puts get_the_email_of_a_townhal_from_its_webpage(site)
		annuaire = {:nom => cities, :email => get_the_email_of_a_townhal_from_its_webpage(site)}
		puts annuaire
	end

end

def get_the_email_of_a_townhal_from_its_webpage (adresse)
	page = Nokogiri::HTML(open(adresse))  

	#puts page.css('td.style27 p.Style22 font')[6].text
	return page.css('td.style27 p.Style22 font')[6].text
end

get_all_the_urls_of_val_doise_townhalls()