2.2.3. Questions

1--nombre total d'objets Album contenus dans la base ---347 (Album.all.length)
auteur de la chanson "White Room" ?
---Eric Clapton
(tp Track.where(title:"White Room"), :artist)

2--Quelle chanson dure exactement 188133 milliseconds ?
---Perfect
(tp Track.where(duration:188133), :title)

3--Quel groupe a sorti l'album "Use Your Illusion II" ?
---Guns N Roses
(tp Album.where(title: "Use Your Illusion II"), :artist)

4--Combien d'albums dont le titre contient "Great" ?
---13
(Album.where("title like ?", "%Great%").length)

5--Supprime tous les albums dont le nom contient "music".
---4 deleted
(Album.where("title like ?", "%music%").destroy_all)

6--Combien d'albums écrits par AC/DC ?
---2
(Album.where(artist: "AC/DC").length)

7--Combien de chanson durent exactement 158589 millisecondes ?
---0
(Track.where(duration: 158589).length)

Pour ces questions, tu vas devoir effectuer des boucles dans la console Rails. C'est peu commun mais c'est faisable, tout comme dans IRB.

8--puts en console tous les titres de AC/DC.

For Those About To Rock (We Salute You)
Put The Finger On You
Lets Get It Up
Inject The Venom
Snowballed
Evil Walks
C.O.D.
Breaking The Rules
Night Of The Long Knives
Spellbound
Go Down
Dog Eat Dog
Let There Be Rock
Bad Boy Boogie
Problem Child
Overdose
Hell Aint A Bad Place To Be
Whole Lotta Rosie

(Track.where(artist: "AC/CD").each do |track|
    puts track.title
end)

9--puts en console tous les titres de l'album "Let There Be Rock".

Go Down
Dog Eat Dog
Let There Be Rock
Bad Boy Boogie
Problem Child
Overdose
Hell Aint A Bad Place To Be
Whole Lotta Rosie

(Track.where(album: "Let There Be Rock").each do |track|
    puts track.title
end)

10--le prix total de cet album ainsi que sa durée totale.
[2453259, 7.920000000000001]


(Track.where(album: "Let There Be Rock").sum(&:price))

(total_dur = 0
total_price = 0
Track.where(album: "Let There Be Rock").each do |track|
    total_dur += track.duration
    total_price += track.price
end
[total_dur, total_price])
11--coût de l'intégralité de la discographie de "Deep Purple".
90.09


(Track.where(artist: "Deep Purple").sum(&:price))


12--Modifie (via une boucle) tous les titres de "Eric Clapton" afin qu'ils soient affichés avec "Britney Spears" en artist.

Track.where(artist: "Eric Clapton").each do |track|
    track.update(artste: "Britney Spears")
end

