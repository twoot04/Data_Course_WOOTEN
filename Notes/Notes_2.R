list.files(path = "Data", pattern = ".csv", all.files = TRUE,
           full.names = TRUE, recursive = TRUE, ignore.case = TRUE)
csv_files <- list.files(path = "Data", pattern = ".csv", all.files = TRUE,
                        full.names = TRUE, recursive = TRUE, ignore.case = TRUE)
length(csv_files)
read.csv("wingspan_vs_mass.csv")
df <- list.files(path = "Data", 
                   recursive = TRUE, 
                   pattern = "wingspan_vs_mass.csv", 
                   full.names = TRUE)
df
head(df,5)
dat(df)
dat <- read.csv(df)
dat
head(dat, 5)
list.files(path = "Data", pattern = "^b", all.files = TRUE,
           full.names = FALSE, recursive = TRUE, ignore.case = FALSE)

files <- list.files(pattern = "^b") 
lapply(files, function("Data") {
  cat(paste0("Data", file, "\n")) 
  cat(readLines(file, n = 1), "\n\n") 
})
?lapply
files <- list.files(pattern = "^b") 

for (file in files) {
  cat(paste0("File: ", file, "\n"))   
  first_line <- readLines(file, n = 1) 
  cat(paste0("First Line: ", first_line, "\n\n")) 
}

first_line
file

dat <- "data-shell/creatures/basilisk.dat"
dat_2 <- "data-shell/data/pdb/benzaldehyde.pdb"
dat_3 <- "Messy_Take2/b_df.csv"
nrow(dat)
nrow(dat_3)
read(dat)
read.csv(dat_3)
