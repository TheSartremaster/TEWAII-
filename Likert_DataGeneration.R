##===Creating Random Observations based on a normal distribution===
##Rules for Special Groups
### Age: m = 22, sd = 6.8, Min = 18, Max = 59


## ==Range for the Pool Distribution==
## Get from the Method Section. Example: Likert Scale 1-7: Min=1, Max=7
mean <- 50          ##Wanted Mean for the Pool
sdev <- 45.8       ##Wanted SD for the Pool
Max <- 100         ##Maximum Logical Score
Min <- 0          ##Minimum Logical Score
VPNS <- 3000       ##Number of VPNs (Rows)
Variables <- 1    ##Number of Variables (Columns)
rounding <- TRUE ##Should the results be rounded?

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

##==Activate if Output needs to be rounded:==
if (rounding == TRUE) {
output <- round(output, digits = 1) }

###==Write into TXT==
write(output, "FakeDataOutput.txt", ncolumns = Variables, sep = "\t")

