# Variance estimate of MC chain
# Reference: Robert and Casella, Chap 3, p.84

h <- function(x){
  return((cos(50*x) + sin(20*x))^2)
}

# density
N <- 10000
x_grid <- seq(0, 1, length.out=N)
plot(x_grid, h(x_grid), type='l', ylab='density')

# histogram of h(u)
u <- runif(N, 0, 1)
hist(h(u), breaks=100)

# monte carlo approximation of the integral
sum(h(u))/N
# analytical answer is 0.965

# running plot
x_bar <- rep(0, N)
x_var <- rep(0, N)
for (i in seq(1, N)){
  u <- runif(1, 0, 1)
  if (i == 1){
    x_bar[i] <- h(u) 
    x_var[i] <- 0 
  }else{
    x_bar[i] <- x_bar[i-1] + 1/i * (h(u) - x_bar[i-1]) 
    x_var[i] <- x_var[i-1] +
      ((h(u) - x_bar[i-1]) * (h(u) - x_bar[i]) - x_var[i-1])/(i-1)
  }
}
x_se <- sqrt(x_var)
x_upper <- x_bar + x_se*qnorm(0.975)/sqrt(seq(1, N))
x_lower <- x_bar + x_se*qnorm(0.025)/sqrt(seq(1, N))

plot(seq(1, N), x_bar, type='l', ylim=c(0.9, 1.1))
lines(seq(1, N), x_upper, lty='dashed')
lines(seq(1, N), x_lower, lty='dashed')


