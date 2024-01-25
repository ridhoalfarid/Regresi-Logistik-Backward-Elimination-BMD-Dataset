library(openintro)
library(tidymodels)
library(parsnip)
library(tidyverse)
library(kableExtra)

data_bmd = read.csv("D:\\Proyek\\BMD DATASET USING LOGISTIC REGRESSION\\bmd.csv")

data_bmd$bmi = data_bmd$weight_kg/((data_bmd$height_cm/100)^2)

data_bmd = data_bmd %>%
  mutate(sex = if_else(sex == "M", "man", "woman"),
         sex = fct_relevel(sex, "woman", "man"),
         fracture = as.factor(fracture)) %>%
  select(fracture, age, sex, bmi, bmd)

# logistic regression
bmd_full_fit <- logistic_reg() %>%
  set_engine("glm") %>%
  fit(fracture ~ age + sex + bmi + bmd, 
      data = data_bmd, family  = "binomial")

bmd_full_fit %>%
  tidy() %>%
  mutate(p.value = ifelse(p.value < 0.0001, "<0.0001", round(p.value, 4))) %>%
  kbl(linesep = "", booktabs = TRUE, digits = 2, align = "lrrrrr") %>%
  kable_styling(bootstrap_options = c("striped", "condensed"), 
                latex_options = c("striped", "hold_position")) %>%
  column_spec(1, width = "15em", monospace = TRUE) %>%
  column_spec(2:5, width = "5em")

# backward 1
bmd_full_fit <- logistic_reg() %>%
  set_engine("glm") %>%
  fit(fracture ~ sex + age + bmd, 
      data = data_bmd, family  = "binomial")

bmd_full_fit %>%
  tidy() %>%
  mutate(p.value = ifelse(p.value < 0.0001, "<0.0001", round(p.value, 4))) %>%
  kbl(linesep = "", booktabs = TRUE, digits = 2, align = "lrrrrr") %>%
  kable_styling(bootstrap_options = c("striped", "condensed"), 
                latex_options = c("striped", "hold_position")) %>%
  column_spec(1, width = "15em", monospace = TRUE) %>%
  column_spec(2:5, width = "5em")

# backward 2
bmd_full_fit <- logistic_reg() %>%
  set_engine("glm") %>%
  fit(fracture ~ sex + bmd, 
      data = data_bmd, family  = "binomial")

bmd_full_fit %>%
  tidy() %>%
  mutate(p.value = ifelse(p.value < 0.0001, "<0.0001", round(p.value, 4))) %>%
  kbl(linesep = "", booktabs = TRUE, digits = 2, align = "lrrrrr") %>%
  kable_styling(bootstrap_options = c("striped", "condensed"), 
                latex_options = c("striped", "hold_position")) %>%
  column_spec(1, width = "15em", monospace = TRUE) %>%
  column_spec(2:5, width = "5em")

# backward 3
bmd_full_fit <- logistic_reg() %>%
  set_engine("glm") %>%
  fit(fracture ~ bmd, 
      data = data_bmd, family  = "binomial")

bmd_full_fit %>%
  tidy() %>%
  mutate(p.value = ifelse(p.value < 0.0001, "<0.0001", round(p.value, 4))) %>%
  kbl(linesep = "", booktabs = TRUE, digits = 2, align = "lrrrrr") %>%
  kable_styling(bootstrap_options = c("striped", "condensed"), 
                latex_options = c("striped", "hold_position")) %>%
  column_spec(1, width = "15em", monospace = TRUE) %>%
  column_spec(2:5, width = "5em")

