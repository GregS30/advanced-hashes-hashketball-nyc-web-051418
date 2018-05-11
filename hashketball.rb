require 'pry'

def game_hash

  nested = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        },
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }

  nested

end

def num_points_scored(player_name)
# returns the number of points scored for player_name

  game = game_hash()

  game.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_key, data_val|
          if data_key == player_name
            return data_val[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
# returns the shoe size for player_name

  game = game_hash()

  game.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_key, data_val|
          if data_key == player_name
            return data_val[:shoe]
          end
        end
      end
    end
  end

end

def team_colors(team_name)
# returns an array of team colors for team_name

  game = game_hash()

  game.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names()
# returns an array of the team names

  game = game_hash()
  ar = []

  game.each do |location, team_data|
    ar << team_data[:team_name]
  end

  ar

end

def player_numbers(team_name)
# returns an array of the jersey numbers for team_name

  game = game_hash()
  ar = []

  game.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_item, value|
            ar << value[:number]
          end
        end
      end
    end
  end

  ar
end

def player_stats(player_name)
# returns a hash of player_name stats

  game = game_hash()

  game.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_key, data_val|
          if data_key == player_name
            return data_val
          end
        end
      end
    end
  end
end

def big_shoe_rebounds()

  game = game_hash()
  max_shoe = 0
  rebounds = 0

  game.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_key, data_val|
          if data_val[:shoe] > max_shoe
            max_shoe = data_val[:shoe]
            rebounds = data_val[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored

  game = game_hash()
  max_points = 0
  player_name = nil

  game.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_key, data_val|
          if data_val[:points] > max_points
            max_points = data_val[:points]
            player_name = data_key
          end
        end
      end
    end
  end
  player_name
end

def winning_team

  game = game_hash
  max_points = 0
  max_team = nil

  game.each do |location, team_data|

    sum_points = 0

    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_key, data_val|
          sum_points += data_val[:points]
        end
      end
      if sum_points > max_points
        max_points = sum_points
        max_team = team_data[:team_name]
      end
    end
  end

  max_team
end

def player_with_longest_name
# returns a hash of player_name stats

  game = game_hash()

  max_size = 0
  max_name = nil

  game.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_key, data_val|
          if data_key.size > max_size
            max_size = data_key.size
            max_name = data_key
          end
        end
      end
    end
  end
  max_name
end



puts most_points_scored
puts winning_team
puts player_with_longest_name
