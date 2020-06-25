## useful tutorials with abundant exampless:
## https://cran.r-project.org/web/packages/arsenal/vignettes/tableby.html#simple-example
## http://thatdatatho.com/2018/08/20/easily-create-descriptive-summary-statistic-tables-r-studio/

library(arsenal)

my_controls <- tableby.control(
    test = T, total = T,
    numeric.test = "anova", 
    # cat.test = "fe",
    numeric.stats = c("meansd", "medianq1q3", "Nmiss"),
    cat.stats = c("countpct", "Nmiss"),
    stats.labels = list(
        meansd = "Mean (SD)",
        medianq1q3 = "Median (Q1, Q3)",
        # range = "Min - Max",
        Nmiss = "(Missing)"
    ),
    simulate.p.value = TRUE
)
# my_labels <- list(
#   lifeExp = "Life Expectancy",
#   pop = "Population (million)",
#   gdpPercap = "GDP per capita",
#   year = "Year"
# )

catVars = paste0("chisq(", c("age_cat", "LymphNodeInv", "mcsiz_cat", "ER", 
                             "TMAST", "BEV", "PCRBRNode", "Death"), ")")
exactVars = paste0("fe(", c("MPay", "COR", "bmi_cat", "HistGrade", "FirstEventType", "CW"), ")")
contVars = paste0("anova(", c("BMI", "AGE", "MCSIZ", "BaseNumTL", "NumBevDoses1"), ")")

mytable = tableby(formulize("race_bin", c(catVars, exactVars, contVars)),
                  data = mydata, control = my_controls)
summary(mytable,
        # labelTranslations = my_labels,
        title = "Summary Statistic\n",
        pfootnote = TRUE, digits=2
)
