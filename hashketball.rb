require 'pry'

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(name)
  game_hash.each do |location, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player_names, stats|
          if name == player_names
            stats.each do |key, value|
              if key == :points
                return value
              end
            end
          end
        end
      end
    end
  end
end
      
def shoe_size(name)
  game_hash.each do |location, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player_names, stats|
          if name == player_names
            stats.each do |key, value|
              if key == :shoe
                return value
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(x)
  game_hash.each do |location, team|
    team.each do |attributes, data|
      if attributes == :team_name && data == x
        return team[:colors]
      end
    end
  end
end

def team_names
  team_array = []
  
  game_hash.each do |location, team|
    team.each do |name, data|
      if name == :team_name
        team_array << data
      end
    end
  end
  
  team_array
end

def player_numbers(team_x)
  jersey_array = []
  
  game_hash.each do |location, team|
    team.each do |name, data|
      if name == :team_name && data == team_x
        team[:players].each do |player_names, stats|
          stats.each do |jersey_number, value|
            if jersey_number == :number
              jersey_array << value
            end
          end
        end
      end
    end
  end
  jersey_array
end

def player_stats(name)
  game_hash.each do |location, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player_names, stats|
          if name == player_names
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  shoe = 0
  rebounds = 0
  
  game_hash.each do |location, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player_name, stats|
          stats.each do |key, value|
            if key == :shoe
              if value > shoe
                shoe = value
                rebounds = team[:players][player_name][:rebounds]
              end
            end
          end
        end
      end
    end
  end
  
  return rebounds
  
end
  