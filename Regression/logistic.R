#### logistic regression ####

fit = glm(formula = `Hospitalization 2009-2017` 
          ~ `any eosinohilia 2009-2018` + age + `Disease duration`
          + `any allergies` + `Anxiety/Depression` + `Any high CRP 2009-2017`
          + `any low albumin 2009-2017` #+ `Any high ESR 2009-2017` 
          + `any low hemoglobin 2010-2017` + `opioids 2010-2017`
          + `Anti TNF 2010-2017` + `Immunomodulator 2010-2017`
          + `Prednisone 2010-2017`
          , data = mydata, family = "binomial")

smry = summary(fit)

aor = exp(coef(fit))
ci = exp(confint(fit))
p.value = smry$coefficients[,4]
result = round(cbind(aor, ci, p.value), digits=4)[-1,]