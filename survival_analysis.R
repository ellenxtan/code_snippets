#### time to event analysis ####
# a good tutorials: 
# https://www.emilyzabor.com/tutorials/survival_analysis_in_r_tutorial.html#survival_function


# Load required packages
library(survival)
library(survminer)
library(dplyr)

# function of summary of Cox model results
result_smry = function(x){ 
  x <- summary(x)
  p.value<-signif(x$wald["pvalue"], digits=2)
  # wald.test<-signif(x$wald["test"], digits=2)
  # beta<-signif(x$coef[1], digits=2);#coeficient beta
  HR <-round(x$coef[2], digits=2);#exp(beta)
  HR.confint.lower <- round(x$conf.int[,"lower .95"], 2)
  HR.confint.upper <- round(x$conf.int[,"upper .95"],2)
  HR <- paste0(HR, " (", 
               HR.confint.lower, "-", HR.confint.upper, ")")
  # res<-c(beta, HR, wald.test, p.value)
  # names(res)<-c("beta", "HR (95% CI for HR)", "wald.test", 
  #               "p.value")
  res<-c(HR, p.value)
  names(res)<-c("HR (95% CI for HR)", "p.value")
  return(res)
  #return(exp(cbind(coef(x),confint(x))))
}

# censor those without event at N days and those had event over N days at N days.

# KM curve (nonparametric method)
Sur_Obj1 <- Surv(mydata$duration, mydata$status)
kmfit1 <- survfit(Sur_Obj1 ~ SIRS_highest, data=mydata)
ggsurvplot(kmfit1, xlab="Time (days)", ylab="Proportion of POF-free",
           legend.labs=c("2 criteria", "3 criteria", "4 criteria"),
           pval = TRUE)#, palette = "grey")#, linetype=c("dashed", "solid"))#, conf.int = TRUE,xlim=c(0,22), break.time.by = 1, 

# Log-rank test for equality of survival functions
survdiff(Sur_Obj1 ~ SIRS_highest, data=mydata)

# Cox regression model (semi-parametric)
cox.model1 <- coxph(Sur_Obj1 ~ SIRS_highest, data = mydata)
result_smry(cox.model1)  # hazard ratio & p-value
cox.zph(cox.model1)  # test proportion hazard assumption for the cox model