getwd()
?list.files()
list.files(path = "Data", pattern = ".csv", all.files = TRUE,
           full.names = TRUE, recursive = TRUE, ignore.case = TRUE)
#file.exists("Data/wide_income_rent.csv")


csv_files <- 
  list.files(path = "Data", pattern = ".csv", all.files = TRUE,
                        full.names = TRUE, recursive = TRUE, ignore.case = TRUE)
class(csv_files)
length(csv_files)
csv_files[1]
#first 10 files
csv_files[1:10]
csv_files[c(1,3,5)]

c(1,3,5) # concatenate/combine
1:100
c(1:50,53,55,57)

as.numeric(c)
#try to turn into a number if there are characters and numbers in a vector

#remove any name or character from a vector 
mean(z, na.rm = TRUE)


?head(csv_files, 10)
6L +1


bird <- list.files(path = "Data", 
                   recursive = TRUE, 
                   pattern = "cleaned_bird_data.csv", 
                   full.names = TRUE)
file.copy(bird,".",overwrite = TRUE)
bird

dat <- read.csv(bird)
class(dat)
nrow(dat)
ncol(dat)
dim(dat)
c(1,3,5)
# rows 1, 3, 5
dat[c(1,3,5),]
dat$Egg_mass
dat
dat$Egg_mass
dat[,"Egg_mass"]
keepers <- dat$Egg_mass > 10
big_egg_mamas <- dat[keepers,]
is.na(dat$Egg_mass)

# subset where egg_mass is greater than 10 AND is not NA?

big_egg_mamas <- 
  dat[dat$Egg_mass > 10 & !is.na(dat$Egg_mass),]
plot(big_egg_mamas$Egg_mass)
plot(density(big_egg_mamas$Egg_mass))
summary(big_egg_mamas$Egg_mass)

str(dat)


summary(dat$mass)
summary(dat$tarsus)

biggmassbuddies <-
dat$mass > median(dat$mass,na.rm = TRUE) &
dat$tarsus > median(dat$tarsus,na.rm = TRUE)
plot(dat[biggmassbuddies,"Egg_mass"])
file.remove("./cleaned_bird_data.csv")
file.remove("Bird_Measurements.csv")
