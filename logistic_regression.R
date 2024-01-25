library(openintro)
library(tidymodels)
library(parsnip)
library(tidyverse)
library(kableExtra)
library(caTools)

data_bmd = read.csv("D:\\Proyek\\BMD DATASET USING LOGISTIC REGRESSION\\bmd.csv")

data_bmd$bmi = data_bmd$weight_kg/((data_bmd$height_cm/100)^2)

data_bmd = data_bmd %>%
  mutate(sex = if_else(sex == "M", "man", "woman"),
         sex = fct_relevel(sex, "woman", "man"),
         fracture = as.factor(fracture)) %>%
  select(fracture, age, sex, bmi, bmd)

table(data_bmd$fracture)
data_bmd$fracture <- ifelse(data_bmd$fracture == "fracture", 1, 0)
table(data_bmd$fracture)

# random split data
set.seed(88)
split = sample.split(data_bmd$fracture, SplitRatio = 0.75)
split

# creat training and testing sets
bmd_train = subset(data_bmd, split == TRUE)
bmd_test = subset(data_bmd, split == FALSE)
nrow(bmd_train)
nrow(bmd_test)

# logistic regression model
model = glm(fracture ~ age + sex + bmi + bmd, data = data_bmd, family = "binomial")
summary(model)

# backward 1
model = glm(fracture ~ age + sex + bmd, data = data_bmd, family = "binomial")
summary(model)

# backward 2
model = glm(fracture ~ sex + bmd, data = data_bmd, family = "binomial")
summary(model)

# backward 3
model = glm(fracture ~ bmd, data = data_bmd, family = "binomial")
summary(model)

predictTrain = predict(model, type = "response")
predictTrain

# threshold
library(ROCR)
rocrpred = prediction(predictTrain, data_bmd$fracture)
rocrpref = performance(rocrpred, "tpr", "fpr")
plot(rocrpref, colorize = TRUE, print.cutoffs.at = seq(0.1,by=0.1), text.adj=c(-0.2,1.7))

# tingkat akurasi
predicTest = predict(model, type = "response", newdata = bmd_test)
table(bmd_test$fracture, predicTest >= 0.5)

#accuracy
(11+29)/42

