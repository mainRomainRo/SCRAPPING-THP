require 'rubygems'
require 'nokogiri' 
require 'open-uri'  


page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) #on va diriger Nokogiri vers la page coin marketcap

name_list = page.css('a.currency-name-container') #On repere le selecteur du nom des coins et on stock dans l'objet page.css qu'on nomme name_list , on va faire appel à ça par la suite en utlisant le .text qui va chercher le texte de la balise , dans notre cas le nom du coin
price_list = page.css('a.price') #On stock la liste de prix, on repère son selecteur : a.price, et la stocke avec la methode Nokogiri dans price_list, on va par la suite appeler ['data-usd'] pour donner le prix du coin
tab = Hash.new #on crée un nouveau Hash, dans lequel on va stocker le nom des coin et le prix associé

=begin

   
  
    
=end

for i in 0 .. (name_list.length-1)#on crée donc une boucle for qui commence à 0 et se termine à name_list.length-1 : qui correspond à la longueur de notre tableau
    tab[name_list[i].text] = [price_list[i]['data-usd']]# on fait prendre à notre hash à chaque fois l'entrée : nom coin et prix coin en utilisant les méthodes .text et ['data-usd'] pour chaque éléments de nos array définits (L8-10)
end

puts tab #on termine par puts notre hash

=begin
ce code ne fonctionne pas 
puts "   "
puts "sleeping 5 sec"
sleep(3600)   # on rajoute une methode sleep qui permet de relancer le programme toute les heures (3600)
=end
