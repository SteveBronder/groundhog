spit <- read.csv("./spit_data.csv",header=TRUE)

attach(spit)

# give boxplot of spit
boxplot(spit)

# load in package reshape2
library(reshape2)

# Use melt function to place data in long format
spit.take <- melt(spit,measure.vars=c("Steve","Mark","Mike","Adam","Jordan","Rich","Anthony","Lacy"))

#Show example
head(spit.take)

#Get summary results from aov
summary(aov(value~variable,data=spit.take))

# 
## Df Sum Sq Mean Sq F value Pr(>F)  
## variable     7 283719   40531   1.925 0.0979 .
## Residuals   32 673648   21051                 
## ---
##  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

kruskal.test(value~variable,data=spit.take)

## Kruskal-Wallis rank sum test
##
## data:  value by variable
## Kruskal-Wallis chi-squared = 12.2487, df = 7, p-value = 0.09267

# HW: Impliment ANOVA test on the spit data using some other software (besides R). Confirm R Anova table output. 
# In latex, write a short report of this entire project