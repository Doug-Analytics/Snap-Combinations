library(tidyverse)
library(nflverse)

players <- load_players() %>%
  select(gsis_id, display_name, position)


saveRDS(players, "players_df.rds")


pbp <- load_participation(2023, include_pbp = TRUE) %>%
  filter(special == 0, !is.na(defense_personnel),
         !penalty_type %in% c("Defensive Delay of Game", "Neutral Zone Infraction", "False Start", "Delay of Game")) %>%
  select(offense_players, defense_players, posteam, defteam, nflverse_game_id, week, play_id)

saveRDS(pbp, "pbp_df.rds")


teams <- load_teams() %>%
  select(team_abbr, team_color, team_color2, team_wordmark)

saveRDS(teams, "teams_df.rds")
