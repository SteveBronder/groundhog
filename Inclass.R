
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




