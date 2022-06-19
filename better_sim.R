

stats <- c(
  "Health Points", "Stamina", "Iniative", 
  "Damage Reducer", "Attack Bonus", "DDI", 
  "Sub Bonus", "SDI", "Pin Bonus", 
  "Bleed Bonus", "Block", "Dodge", 
  "Pin Opp", "Escape Sub")

# might be able to just use it as a vector?
#bronze_base <- tibble('Base Stats' = stats)

bronze_base <- c(
  'Health Points', 'Stamina', 'Iniative', 
  'Damage Reducer', 'Attack Bonus', 'DDI', 
  'Sub Bonus', 'SDI', 'Pin Bonus', 
  'Bleed Bonus', 'Block', 'Dodge', 
  'Pin Opp', 'Escape Sub')

# higher frequency bases - makes these 1.3x or 1.5x the lower freq types
c('Attack Bonus', 'Block', 'Dodge', 'Sub Bonus', 'Health Points', 'SDI')

# less common/regular bases
c('DDI', 'Initiative', 'Damage Reducer', 'Bleed Bonus', 'Escape Sub', 'Pin Bonus', 'Pin Opp', 'Stamina')


#bronze_boosted <- tibble('Boosted Stat' = stats)

bronze_boosted <- c(
  'Health Points', 'Stamina', 'Iniative', 
  'Damage Reducer', 'Attack Bonus', 'DDI', 
  'Sub Bonus', 'SDI', 'Pin Bonus', 
  'Bleed Bonus', 'Block', 'Dodge', 
  'Pin Opp', 'Escape Sub')

# higher frequency boosted stats
c('Stamina', 'Pin Opp', 'Iniative', 'Pin Bonus', 'Health Points', 'DDI', 'SDI', 'Damage Reducer')

# lower frequency
c('Attack Bonus', 'Block', 'Dodge', 'Sub Bonus', 'Bleed Bonus', 'Escape Sub')


#'Energy Cost' 
c('Energy +1', 'Energy +2')
sample(c('Energy +1', 'Energy +2'), size = 3, replace = TRUE, prob = c(0.6, 0.4))

# create a column for the probability so then you can use 
# bronze %>% slice_sample(weight_by = prob, n = 3)
# 

card_sample <- function(){
  
  stats <- c(
    'Health Points', 'Stamina', 'Iniative', 
    'Damage Reducer', 'Attack Bonus', 'DDI', 
    'Sub Bonus', 'SDI', 'Pin Bonus', 
    'Bleed Bonus', 'Block', 'Dodge', 
    'Pin Opp', 'Escape Sub')
  
  base_prob <- c(0.1, 0.05, 0.05, 0.05, 0.1, 0.05, 0.1, 0.1, 0.05, 0.05, 0.1, 0.1, 0.05, 0.05, 0.15)
  base_prob_scaled <- base_prob/sum(base_prob)
    
  base_stat <- sample(c(stats, 'Energy Card'), 
                      size = 3,
                      replace = TRUE,
                      prob = base_prob_scaled)
  
  boosted_prob <- c(0.075, 0.1, 0.1, 0.1, 0.025, 0.1, 0.075, 0.075, 0.1, 0.05, 0.025, 0.025, 0.1, 0.05, 0.05, 0.125)
  boosted_prob_scaled <- boosted_prob/sum(boosted_prob)
  
  boosted_stat <- sample(c(stats, 'Energy Card +1', 'Energy Card +2'), 
                         size = 3,
                         replace = TRUE,
                         prob = boosted_prob_scaled)
  
  energy_cost <- sample(c('Energy +1', 'Energy +2'), 
                       size = 3, replace = TRUE, 
                       prob = c(0.6, 0.4))
  
  df <- tibble(
    'Base Stat' = base_stat,
    'Boosted Stat' = boosted_stat,
    'Energy Cost' = energy_cost
  )
  
  return(df)
}

