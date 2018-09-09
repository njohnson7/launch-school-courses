# easy1_9.rb

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2,
                "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p barney_ary = [flintstones.key(2), flintstones["Barney"]]

p barney_ary2 = flintstones.select { |name, _| name == 'Barney' }.to_a.flatten

p barney_ary3 = flintstones.to_a[2]

p barney_ary4 = flintstones.sort[1]

p barney_ary5 = flintstones.rassoc(2)

p barney_ary6 = flintstones.assoc('Barney')

p barney_ary7 = flintstones.flatten[4,2]

2.times { flintstones.shift }
p barney_ary8 = flintstones.shift
