# puts "Do you want to |fight| or |run|?"

# input = gets.chomp #chomp trims whitespace

# if input == "fight"
#     puts "you are fighting"
# elsif input == "run"
#     puts "you are running"
# else 
#     puts "invalid choice"
# end

class Fighter
    attr_reader :name
    attr_accessor :defense, :strength, :luck, :life
    def initialize name, defense, strength, luck, life
        @name = name
        @defense = defense
        @strength = strength
        @luck = luck
        @life = life
    end
    def attack opponent
        damage = @strength - opponent.defense
        if damage <= 0
            puts "#{name}'s attack failed. No damage to #{opponent.name}"
        else
            opponent.life = opponent.life - damage
            puts "#{name} attacked with #{damage} and now #{opponent.name} has a life value of #{opponent.life}"
        end
    end
end

ueshiba = Fighter.new "Ueshiba", 7, 7, 7, 7
saito = Fighter.new "Saito", 5, 100, 5, 5


saito.attack ueshiba


class Dojo
    def self.lift_weights fighter
        fighter.strength += 1
        puts "Strength increased to #{fighter.strength}."
    end
    def self.endurance_training fighter
        fighter.defense += 1
        puts "Defense increased to #{fighter.defense}."
    end
    def self.coin_in_fountain fighter
        fighter.luck += 1
        puts "Luck increased to #{fighter.luck}."
    end
end

puts saito.strength
Dojo.lift_weights(saito)
puts saito.strength




