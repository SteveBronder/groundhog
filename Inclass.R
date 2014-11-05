
# Read in csv
Ghog<-read.csv("./ghog_clean.csv",header=TRUE)

# Remove moving average years
Ghog2 <- Ghog[c(1:47,53:65),]

attach(Ghog2)

plot(Year,daysbelow32 )

# No shadow line and shadow line in graph
abline(mean(daysbelow32[ghog=="NOShadow"]),0,col="red")
abline(mean(daysbelow32[ghog=="Shadow"]),0)

# make color points
points(Year[ghog=="NOShadow"],daysbelow32[ghog=="NOShadow"],col="red",pch=4)

mean.b32.ns <- mean(daysbelow32[ghog=="NOShadow"])
mean.b32.s <- mean(daysbelow32[ghog=="Shadow"])
sd.b32.ns <- sd(daysbelow32[ghog=="NOShadow"])
sd.b32.s <- sd(daysbelow32[ghog=="Shadow"])
ln.b32.ns <- length(daysbelow32[ghog=="NOShadow"])
ln.b32.s <- length(daysbelow32[ghog=="Shadow"])

mean.b32.s
ttest.s <- (mean.b32.ns-mean.b32.s)/sqrt((sd.b32.ns^2/ln.b32.ns) + (sd.b32.s^2/ln.b32.s))

ttest.s
#t test with alternative not equal
t.test(daysbelow32[ghog=="NOShadow"],daysbelow32[ghog=="Shadow"],alternative=c("greater"))

#t test with alternative greater
t.test(daysbelow32[ghog=="NOShadow"],daysbelow32[ghog=="Shadow"],alternative=c("greater"))

pt(-.3112,20.11)

#Histograms to check normality
par(mfrow=c(2,2))
hist(daysbelow32[ghog=="NOShadow"],nclass=8,main="Historgram of No Shadow")
hist(daysbelow32[ghog=="Shadow"],nclass=8,main="Historgram of Shadow")

#Density plot to check normality
plot(density(daysbelow32[ghog=="NOShadow"],adjust=2),main="Density of No Shadow")
plot(density(daysbelow32[ghog=="Shadow"],adjust=2),main="Density of Shadow")


pretty <- ggplot(Ghog2,aes(colour=ghog))+scale_color_manual(values = wes.palette(3, "GrandBudapest"))+
  geom_density(aes(x=daysbelow32),adjust=1.5,,size=1.5 )  + ggtitle("Density of Number of Days Below 32")+
    theme(axis.title.x = element_blank(), axis.title.y = element_blank())+
   theme(plot.title = element_text(size = rel(2))) + xlim(0,40)
pretty
#HOMEWORK 
# 1. Apply a two-sample t-test to your groundhog data.
# 2, Check normality assumption
# 3. State Appropriate null and alternative hypothesis
# 4. Compute test statistics df and p-value using t-test
# 5. Provide an in-context conclusion in plain language
