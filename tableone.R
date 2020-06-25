<<<<<<< HEAD
#### Descriptive tables ####
library(tableone)

contVars = c()  # treat as non-normal

catVars = c()

allVars = union(contVars, catVars)

tab = CreateTableOne(vars=allVars, strata=c("New_IgG4.Group"), 
                     data=mydata, factorVars=catVars)

t1 = print(tab, nonnormal=contVars, varLabels=TRUE, explain=FALSE,
           exact=c())
#, showAllLevels=TRUE)#, explain=FALSE, printToggle=FALSE, )

t1 = subset(t1, select = -c(test))
t1 = as.data.frame(t1)
t1 <- t1 %>% dplyr::select(Low, Normal, High, p)
=======
#### Descriptive tables ####
library(tableone)

contVars = c()  # treat as non-normal

catVars = c()

allVars = union(contVars, catVars)

tab = CreateTableOne(vars=allVars, strata=c("New_IgG4.Group"), 
                     data=mydata, factorVars=catVars)

t1 = print(tab, nonnormal=contVars, varLabels=TRUE, explain=FALSE,
           exact=c())
#, showAllLevels=TRUE)#, explain=FALSE, printToggle=FALSE, )

t1 = subset(t1, select = -c(test))
t1 = as.data.frame(t1)
t1 <- t1 %>% dplyr::select(Low, Normal, High, p)
>>>>>>> daf32582d1a0a0d4fb6443307e6a8017efbf815c
print(t1)  # copy to word: landscape, A3 paper, font size=13, margin=narrow