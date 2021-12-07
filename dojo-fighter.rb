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
            opponent.life += 1
            puts "#{name}'s attack failed. No damage to #{opponent.name}. #{opponent.name} gains 1 point to their life."
        else
            opponent.life = opponent.life - damage
            puts "#{name} attacked with #{damage} and now #{opponent.name} has a life value of #{opponent.life}"
        end
    end
end
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

puts "Welcome to Dojo Fighter! What is your |name|?"

player_name = gets.chomp
player_name == "name"
puts "Player's name: #{player_name}"
player_name = Fighter.new "#{player_name}", 0, 0, 0, 10
ueshiba = Fighter.new "Ueshiba", 4, 4, 4, 10

puts "#{player_name.name} and #{ueshiba.name} are training at the dojo for 10 weeks. After 10 weeks, they will battle each other to determine the ultimate champion!"

week = 1
while week <=10
    puts "How do you want to train for week #{week}? Enter: |weights|, |endurance|, or |luck|."
        choice = gets.chomp.upcase
        if choice == "WEIGHTS"
            Dojo.lift_weights(player_name)
        elsif choice == "ENDURANCE"
            Dojo.endurance_training(player_name)
        elsif choice == "LUCK"
            Dojo.coin_in_fountain(player_name)
        else
            puts "Oops, invalid choice, no points gained this week."
        end
        week += 1
    end
puts "TIME TO BATTLE"

loop do
    player_name.attack ueshiba
    ueshiba.attack player_name
    puts ueshiba.life
    puts player_name.life
    if player_name.life <= 0
        puts "#{ueshiba.name} wins the battle!"
        break
    elsif ueshiba.life <= 0
        puts "#{player_name.name} wins the battle"
        break
    end
end