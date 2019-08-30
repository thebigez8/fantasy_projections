
library(tidyverse)
out <- "2019_FF_players.csv" %>%
  read_csv(na = c("", "NA", "--")) %>%
  mutate(Pos = str_extract(TeamPos, "(RB|WR|TE|QB|K|D/ST)$")) %>%
  filter(!is.na(Pts)) %>%
  group_by(Pos) %>%
  mutate(PAR = Pts - mean(Pts)) %>%
  ungroup() %>%
  arrange(-PAR)

