=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end

class Tournament
  STATE_POINTS = {
    "win" => 3,
    "loss" => 0,
    "draw" => 1
  }.freeze

  private_constant :STATE_POINTS

  def self.tally(input)
    build_table(input)
  end

  def self.header
    "Team                           | MP |  W |  D |  L |  P\n"
  end

  def self.prepare_teams
    Hash.new do |hash, key|
      hash[key] = {
        matches_played: 0,
        wins: 0,
        draws: 0,
        losses: 0,
        points: 0
      }
    end
  end

  def self.calculate_statistic(teams:, match_result:, team_1:, team_2:)
    teams[team_1][:matches_played] += 1
    teams[team_2][:matches_played] += 1

    case match_result
    when "win"
      teams[team_1][:wins] += 1
      teams[team_1][:points] += STATE_POINTS["win"]
      teams[team_2][:losses] += 1

    when "loss"
      teams[team_2][:wins] += 1
      teams[team_2][:points] += STATE_POINTS["win"]
      teams[team_1][:losses] += 1

    when "draw"
      teams[team_1][:draws] += 1
      teams[team_2][:draws] += 1
      teams[team_1][:points] += STATE_POINTS["draw"]
      teams[team_2][:points] += STATE_POINTS["draw"]
    end
  end

  def self.sort_teams(teams)
    teams.sort_by { |team_name, stats| [-stats[:points], team_name] }
  end

  def self.format_teams(teams)
    return "" if teams.empty?

    teams.map do |team_name, scores|
      "%-31s| %2d | %2d | %2d | %2d | %2d" % [
        team_name,
        scores[:matches_played],
        scores[:wins],
        scores[:draws],
        scores[:losses],
        scores[:points]
      ]
    end.join("\n") + "\n"
  end

  def self.fill_teams(teams:, input:)
    matches = input.split("\n")
    matches.each do |match_row|
      next if match_row.strip.empty?

      team_1, team_2, match_result = match_row.split(";")
      match_result.strip!

      calculate_statistic(
        teams: teams,
        team_1: team_1,
        team_2: team_2,
        match_result: match_result)
    end
  end

  def self.build_table(input)
    teams = prepare_teams
    fill_teams(teams: teams, input: input)
    sorted_teams = sort_teams(teams)
    header + format_teams(sorted_teams)
  end

  private_class_method :header, :prepare_teams, :calculate_statistic, :sort_teams, :format_teams, :fill_teams, :build_table
end
