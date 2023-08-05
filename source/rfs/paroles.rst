
=========================
RFC : Gestion des paroles
=========================

Calé sur le midi, les paroles sont lues, puis associé au timing

Les éléments sont décomposé en sylabes, 
puis assemblées en lignes, 

les éléments de la lignes sont associé au timing des évènements, 


une gestion de la "sylabe active" est suivi par un objet et un objet "layout, ou rendu", est utilisé en fonction de la technologie de restitution (console, HTML, javascript, ou ecran LCD ..)


un process externe est imaginé pour envoyer ou diffuser les éléments par socket, ou web
ou par un client dédié


