#==Creating a random vector, based on nominal/ordinal Variables==

##Rules for Special Groups
### Gender: probability <- c(0.69,0.3,0.01) for 0=Female, 1=Male, 3=Other
### Sexuality: probability <-c(0.45, 0.35, 0.19, 0.01) for 0=Heterosexual, 2=Homosexual, 3=Bisexual, 4=Other

##==Metrics==
VPNS <- 119                   ##Number of VPNs (Rows)
Variables <- 7                ##Number of Variables (Columns)
nr_fields<- VPNS*Variables    ##VPNs*Variables
groups <- c(1:7)              ##Number of Groups
prob <- FALSE                 ##is a probability needed?

##==Probability of the Groups. Should sum up to 1 Deactivate if you need aDistribution==
probability <- c(0.69,0.3,0.01)    

##==Activate in case of Distribution for Probability!!!!==
#probability <- rnorm(78, mean = 30, sd = 5)
#probability <- probability/sum(probability)
#probability <- probability^2
#probability <- probability^0.5

##==Sampling: Activate weather probability is needed or not!==
if (prob == TRUE) {
output <- matrix(sample(x = groups, size=nr_fields, replace=TRUE, prob = probability),nrow = VPNS, ncol = Variables)
}
if (prob == FALSE) {
output <- matrix(sample(x = groups, size=nr_fields, replace=TRUE),nrow = VPNS, ncol = Variables)
}
##Writing
write(output, "FakeDataOutput.txt", ncolumns = Variables, sep = "\t")