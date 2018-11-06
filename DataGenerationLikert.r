##===Creating Random Observations based on a normal distribution===


## ==Range for the Pool Distribution==
## Example: Likert Scale 1-7: Min=1, Max=7
mean <- 3          ##Wanted Mean for the Pool
sdev <- 2.8       ##Wanted SD for the Pool
Max <- 7         ##Maximum Logical Score
Min <- 1          ##Minimum Logical Score
VPNS <- 252       ##Number of VPNs (Rows)
Variables <- 5    ##Number of Variables (Columns)
rounding <- FALSE ##Should the results be rounded?

pool_size <- 10000     ##The Bigger the Size, the smaller the chance of finding a sig. effect later?

###==Create the Pool to sample from==
pool <- rnorm(pool_size, m=mean, sd=sdev)
pool[pool>Max] <- NA
pool[pool<Min] <- NA
pool <- pool[!is.na(pool)]

###==Fill the Data==
nr_fields<- VPNS*Variables
output = matrix(sample(pool, nr_fields, replace=TRUE),nrow = VPNS, ncol = Variables)
#colnames(output) <- c()

##==Rounds the Output if TRUE==
if (rounding == TRUE) {
output <- round(output) }

###==Write into TXT==
write(output, "FakeDataOutput.txt", ncolumns = Variables, sep = "\t")

