#### Poisson Regression ####
# Risk ratio information

# function for rate ratio calculation
# cited from https://rpubs.com/kaz_yos/poisson
glm.RR <- function(GLM.RESULT, digits = 4) {
  if (GLM.RESULT$family$family == "binomial") {
    LABEL <- "OR"
  } else if (GLM.RESULT$family$family == "poisson") {
    LABEL <- "RR"
  } else {
    stop("Not logistic or Poisson model")
  }
  COEF      <- stats::coef(GLM.RESULT)
  CONFINT   <- stats::confint(GLM.RESULT)
  p.value   <- summary(GLM.RESULT)$coefficients[,"Pr(>|z|)"]
  TABLE     <- cbind(coef=COEF, CONFINT)
  TABLE.EXP <- exp(TABLE)
  TABLE.EXP <- cbind(TABLE.EXP, p.value)
  TABLE.EXP <- round(TABLE.EXP, digits)
  TABLE.EXP = TABLE.EXP[-1, ]  # remove the intercept row
  colnames(TABLE.EXP)[1] <- LABEL
  TABLE.EXP
}