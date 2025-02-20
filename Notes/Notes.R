getwd()
list.files(path = "Data", pattern = ".csv", all.files = TRUE, 
          full.names = TRUE, recursive = TRUE, ignore.case = TRUE)
csv_files <- list.files(path = "Data", pattern = ".csv", all.files = TRUE, 
                        full.names = TRUE, recursive = TRUE, ignore.case = TRUE)
class(csv_files)
length(csv_files)
csv_files[1]
csv_files[1:10]
csv_files[c(1,3,5)]

bird <- list.files(path = "Data", recursive = TRUE, pattern = "cleaned_bird_data.csv",
                   full.names = TRUE)
brid
bird
file.copy(bird, ".", overwrite = TRUE)
bird
dat <- read.csv(bird)
class(dat)
dim(bird)
dim(dat)
dat[c(1:30,45,70),]
dat$wing
wing <- dat$wing
wing
tail <- dat$tail
is.na(dat$wing)
keepers <- dat$wing > 10 
big_dudes <- dat[dat$dat$wing >10 & !is.na(dat$wing),]
plot(big_dudes$wing)
plot(big_dudes)
summary(big_dudes)
str(dat)
file.remove("./cleaned_bird_data.csv")
