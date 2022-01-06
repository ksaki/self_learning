# One pass algorithm to compute variance
# Reference: Welford's online algorithm
# https://en.wikipedia.org/wiki/Algorithms_for_calculating_variance

N <- 100
x <- rnorm(N, 0, 1)

m <- rep(NA, N)
s <- rep(NA, N)
m[1] <- x[1]
s[1] <- 0
for (i in seq(2, N)){
  m[i] <- m[i-1] + (x[i] - m[i-1])/i
  s[i] <- s[i-1] + ((x[i] - m[i-1]) * (x[i] - m[i]) - s[i-1])/(i-1)
}

# compare 
cat('mean(x) ', mean(x), '\n')
cat('one pass ', m[N], '\n')
cat('var(x) ', var(x), '\n')
cat('one pass ', s[N], '\n')
