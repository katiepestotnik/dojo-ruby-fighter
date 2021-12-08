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
        add_lucky = @luck
        if damage <= 0
            @life -= 1
            puts "#{name}'s attack failed. No damage to #{opponent.name}. #{name} losses 1 point to life for failed attack."
        else
            opponent.life = opponent.life - (damage + add_lucky)
            puts "#{name} attacked with #{damage} and now #{opponent.name} has a life value of #{opponent.life} since #{name} has lucky #{add_lucky} points adding to the damage."
        end
    end
end
class Dojo
    def self.lift_weights fighter
        fighter.strength += 1
        puts "Weight training increases strength to #{fighter.strength}."
    end
    def self.endurance_training fighter
        fighter.defense += 1
        puts "Endurance training increases defense to #{fighter.defense}."
    end
    def self.coin_in_fountain fighter
        fighter.luck += 1
        puts "Lucky coin in the fountain increases luck to #{fighter.luck}."
    end
end

def_number = rand(1..10)
strength_number = rand(1..10)
luck_number = rand(1..2)

puts "Welcome to Dojo Fighter! What is your |name|?"

player_name = gets.chomp
player_name == "name"
puts "Player's name: #{player_name}"
player_name = Fighter.new "#{player_name}", 0, 0, 0, 10
ueshiba = Fighter.new "Ueshiba", def_number, strength_number, luck_number, 10

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
puts "TIME TO BATTLE!!!!!!!!!!"

loop do
    player_name.attack ueshiba
    if ueshiba.life <= 0
        puts "#{player_name.name} wins the battle"
        break
    end
    puts "Ueshiba life value = #{ueshiba.life}"
    puts "#{player_name.name} life value = #{player_name.life}"
    ueshiba.attack player_name
    if player_name.life <= 0
        puts "#{ueshiba.name} wins the battle!"
        break
    end
    puts "Ueshiba life value = #{ueshiba.life}"
    puts "#{player_name.name} life value = #{player_name.life}"
    if player_name.defense > ueshiba.strength
        puts "No points scored since #{ueshiba.name} performed a lot of endurance training."
    elsif ueshiba.strength > player_name.defense
        puts "No points scored since #{player_name.name} performed a lot of endurance training."
    end
end