require 'rubygems'
require 'nokogiri' 
require 'open-uri'  
=begin
L'idée est de commencer par créer une  méthode get_the_email_of_a_townhal_from_its_webpage qui récupère
l'adresse email à partir de l'url d'une mairie.
Ensuite,on créer une méthode get_all_the_urls_of_val_doise_townhalls qui récupère toutes les url de villes du Val d'Oise. 
=end

def get_all_the_urls_of_val_doise_townhalls()
	page = Nokogiri::HTML(open("https://annuaire-des-mairies.com/val-d-oise.html"))
	annuaire = Hash.new # creation d'un hash qui va repertorier les urls 
	cities = ""
	page.css('a.lientxt').each do |town|# 
		site = "https://annuaire-des-mairies.com" + town['href'][1..-1]#
		cities = town.text # on crée une variable cities qui contient la méthode .text appliqué sur les noms des éléments 
		annuaire = {:nom => cities, :email => get_the_email_of_a_townhal_from_its_webpage(site)} # on fait entrée sur le hash chaque valeur avec la disposition "nom ,email" qui renvoi sur chaque variables 
		puts annuaire #on affiche sur le terminal le hash 
	end

end

def get_the_email_of_a_townhal_from_its_webpage (adresse)# creation de la methode qui va récuperer l'adresse email d'une mairie a partir de l'url
	page = Nokogiri::HTML(open(adresse))  
	return page.css('td.style27 p.Style22 font')[6].text
end

get_all_the_urls_of_val_doise_townhalls()
