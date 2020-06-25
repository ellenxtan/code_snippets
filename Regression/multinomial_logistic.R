#### multinomial logistic regression ####

library(nnet)

fit = multinom(formula = organ_group
               ~ death
               + age
               + gender
               + etiology_3level
               + charlson_2level
               + transfer
               + obesity
               , data = mydata)

# summary(fit)

z <- summary(fit)$coefficients/summary(fit)$standard.errors
p <- (1 - pnorm(abs(z), 0, 1))*2
print("------ p-value ------")
p
print("------ odd ratio ------")
exp(coef(fit))