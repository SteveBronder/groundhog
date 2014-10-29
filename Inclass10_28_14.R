

#Class OCtober 28th, 2014
# Non-parametric test

times <- c(30,25,20,18,21,22)



N <- 10000

for (i in 1:N){
  
  if (i == 1) {
    dif.s <- NULL
  }
  # randomly sample times
mix <- sample(times,6,replace=FALSE)

#take mean of first three
xbar1 <- mean(mix[1:3])

#take mean of last three
xbar2 <- mean(mix[4:6])

#take difference
dif <- xbar1 - xbar2

#The below code is the same as dif.s <- c(dif.s,dif), but stops the repeat problems concactenate has
dif.s[i]<-dif
}

mean(dif.s)
hist(dif.s,density=6)

#right tail p value

length(dif.s[dif.s>=4.666])

