
library(tidyverse)

c(
  "Health Points", "Stamina", "Iniative", 
  "Damage Reducer", "Attack Bonus", "DDI", 
  "Sub Bonus", "SDI", "Pin Bonus", 
  "Bleed Bonus", "Block", "Dodge", 
  "Pin Opp", "Escape Sub")

### BASE



bronze_higher

stats <- c(
  "Health Points", "Stamina", "Iniative", 
  "Damage Reducer", "Attack Bonus", "DDI", 
  "Sub Bonus", "SDI", "Pin Bonus", 
  "Bleed Bonus", "Block", "Dodge", 
  "Pin Opp", "Escape Sub")

sample(
  stats, 10, 
  replace = TRUE, 
  prob = c(0.1, 0.05, 0.05, 0.05, 0.1, 0.05, 0.1, 0.1, 0.05, 0.05, 0.1, 0.1, 0.05, 0.05))

bronze <- tibble(
  "Base Stats" = c(
    "Health Points", "Stamina", "Iniative", 
    "Damage Reducer", "Attack Bonus", "DDI", 
    "Sub Bonus", "SDI", "Pin Bonus", 
    "Bleed Bonus", "Block", "Dodge", 
    "Pin Opp", "Escape Sub"),
  "Boosted Stat" = `Base Stats`,
  "Energy Cost" = sample(x = c(1, 2), 
                         size = 14, replace = TRUE)
) %>% 
  expand(`Base Stats`, `Boosted Stat`, `Energy Cost`) %>%
  filter(!`Base Stats` == `Boosted Stat`) %>%
  add_row(
    "Base Stats" = rep('Energy Card', 2),
    "Boosted Stat" = c("Energy Card +1", "Energy Card +2"),
    "Energy Cost" = rep(0, 2)
  )


silver <- tibble(
  "Base Stats" = c(
    "Health Points", "Stamina", "Iniative", 
    "Damage Reducer", "Attack Bonus", "DDI", 
    "Sub Bonus", "SDI", "Pin Bonus", 
    "Bleed Bonus", "Block", "Dodge", 
    "Pin Opp", "Escape Sub"),
  "Boosted Stat" = `Base Stats`,
  "Energy Cost" = sample(x = c(2, 3, 4), 
                         size = 14, replace = TRUE)
) %>% 
  expand(`Base Stats`, `Boosted Stat`, `Energy Cost`) %>%
  filter(!`Base Stats` == `Boosted Stat`) %>%
  add_row(
    "Base Stats" = rep("Energy Card", 3),
    "Boosted Stat" = c("Energy Card +2", "Energy Card +3", "Energy Card +4"),
    "Energy Cost" = c(0, 0, 0)
  )

gold <- tibble(
  "Base Stats" = c(
    "Health Points", "Stamina", "Iniative", 
    "Damage Reducer", "Attack Bonus", "DDI", 
    "Sub Bonus", "SDI", "Pin Bonus", 
    "Bleed Bonus", "Block", "Dodge", 
    "Pin Opp", "Escape Sub"),
  "Boosted Stat" = `Base Stats`,
  "Energy Cost" = sample(x = c(3:6), 
                         size = 14, replace = TRUE)
) %>% 
  expand(`Base Stats`, `Boosted Stat`, `Energy Cost`) %>%
  filter(!`Base Stats` == `Boosted Stat`) %>%
  add_row(
    "Base Stats" = rep("Energy Card", 4),
    "Boosted Stat" = c("Energy Card +3", "Energy Card +4", "Energy Card +5", "Energy Card +6"),
    "Energy Cost" = c(0, 0, 0, 0)
  )


#slice_sample(bronze, n = , replace = TRUE)

#bronze %>%
#  mutate(
#    across(everything(), str_replace, "_", " "),
#    across(everything(), str_to_title)
#  ) %>%
#  rename_with(~ gsub('[[:punct:]]', ' ', .x)) %>%
#  rename_with(str_to_title)


