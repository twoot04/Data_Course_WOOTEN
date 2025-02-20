getwd()
list.files(path = "Data", pattern = ".csv", all.files = TRUE, 
           full.names = TRUE, recursive = TRUE, ignore.case = TRUE)
csv_files <- list.files(path = "Data", pattern = ".csv", all.files = TRUE, 
                        full.names = TRUE, recursive = TRUE, ignore.case = TRUE)
head(5)
head(,5)
head(5,3)
class(csv_files)
length(csv_files)
csv_files[1:40]
csv_files[c(1:5,9,11)]
as.numeric(c)
head(csv_files, 14)
dat <- read.csv("1620_scores.csv")
dat
dat[,dat$Species_number]
dat[,"Species_Number"]
dat$Species_number
the_homeboys <- dat[dat$Species_number > 100,]
dat$mass
bulking <- dat$mass
big_bois <- dat[dat$mass >100 & !is.na(dat$mass),]
summary(dat$mass)
summary(dat$Species_number)
dat$mass > median(dat$Species_number, na.rm = TRUE)
file.remove("./Data/cleaned_bird_data.csv")
