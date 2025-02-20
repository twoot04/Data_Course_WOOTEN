getwd()
grades <- "./Data/Fake_grade_data.csv"
grades
dat <- read.csv(grades)

#dat <- read.csv(grades)
#dat <- read.csv(grades)
#dat <- read.csv(grades)
#dat <- read.csv(grades)
#dat <- read.csv(grades)
#dat <- read.csv(grades)
#dat <- read.csv(grades)

class(dat)
# class(dat
# class(dat)
# class(dat)
# class(dat)
# class(dat)
# class(dat)
# class(dat)
# class(dat)
# class(dat)

class(grades)
# class(grades)
# class(grades)
# class(grades)
# class(grades)
# class(grades)
# class(grades)
# class(grades)
# class(grades)

names(dat)
# names(dat)
# names(dat)
# names(dat)
# names(dat)
# names(dat)
# names(dat)
# names(dat)

nrow(dat)
# nrow(dat)
# nrow(dat)
# nrow(dat)
# nrow(dat)

ncol(dat)
# ncol(dat)
# ncol(dat)
# ncol(dat)
# ncol(dat)
# ncol(dat)

class(ncol(dat))
#class(ncol(dat))
#class(ncol(dat))
#class(ncol(dat))
#class(ncol(dat))
#class(ncol(dat))

dat[1,3]
#dat[1,3]
#dat[1,3]
#dat[1,3]
#dat[1,3
#dat[1,3]]

names(dat)[16]
#names(dat)[16]
#names(dat)[16]
#names(dat)[16]
#names(dat)[16]

x <- names(dat)
# x<- names(dat)
# x <- names(dat)
# x <- names(dat)
# x <- names(dat)
# x <- names(dat)

#final project scores
dat[,16]
#dat[,16]
#dat[,16]
#dat[,16]

#mean final project score
mean(dat[,16])
#mean(dat[,16])
#mean(dat[,16])
#mean(dat[,16])
#mean(dat[,16])
#mean(dat[,16])

#a nicer way, since it's data.frame...
mean(dat$Final_Project)
#mean(dat$Final_Project)
#mean(dat$Final_Project)
#mean(dat$Final_Project)
#mean(dat$Final_Project)

dat$Final_Project
round(mean(dat$Final_Project))
round(mean(dat$Final_Project))
round(mean(dat$Final_Project))
round(mean(dat$Final_Project))
round(mean(dat$Final_Project))

sum(dat$Skills_Test_1)
sum(dat$Skills_Test_1)
sum(dat$Skills_Test_1)
sum(dat$Skills_Test_1)
sum(dat$Skills_Test_1)
sum(dat$Skills_Test_1)
sum(dat$Skills_Test_1)

test_totals <- dat$Skills_Test_1 + dat$Skills_Test_2 + dat$Skills_Test_3 + dat$Skills_Test_4
dat$Test_Totals <- test_totals 
test_totals
plot(dat$Test_Totals,dat$Final_Project)
mod <-lm(dat$Final_Project ~ dat$Test_Totals)
mod <-lm(dat$Final_Project ~ dat$Test_Totals)
mod <-lm(dat$Final_Project ~ dat$Test_Totals)
mod <-lm(dat$Final_Project ~ dat$Test_Totals)

summary(mod)
dat$predictions <- predict(mod, dat)
plot(x=dat$predictions,y=dat$Final_Project)
dat$predictions
dat$Final_Project
dat$predictions - dat$Final_Project 
dat$difference <- dat$predictions - dat$Final_Project
plot(dat$difference)
names(dat)
dat[,2:11]
dat$assignment_sums <- rowSums(dat[,2:11])
plot(x=dat$assignment_sums, y=dat$Test_Totals)

#which student has the lowest assignment total 
which(dat$assignment_sums == min(dat$assignment_sums))
dat[wich(dat$assignment_sums == min(dat$assignment_sums))]
dat[which(dat$assignment_sums == min(dat$assignment_sums))]
loser <- [which(dat$assignment_sums == min(dat$assignment_sums))]
loser <- which(dat$assignment_sums == min(dat$assignment_sums))
loser

#logical expressions
TRUE
FALSE
1+TRUE

dat[dat$Final_Project > 100]
#.  < > <= >= %in% 
# / or & and 

x < 3
x <= 3
x == 3
x >3 & x < 5
x %in% 1:6 
1+FALSE
