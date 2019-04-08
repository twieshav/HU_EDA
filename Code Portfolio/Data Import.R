# Data Import

## Read in a data file
read.csv()
  # If the first row are not headings, use:
read_csv("1,2,3\n4,5,6", col_names = FALSE)

## Read tab delimited files
read_tsv()

## Turn a vector into a logical vector
str(parse_logical(c("TRUE", "FALSE", "NA")))
  #Can also use to turn character into integer or date
  
## Turn a number value into plain integer
  str(parse_logical(c("TRUE", "FALSE", "NA")))

## Loading objects into a file
load(file = "myimage.RData")

## Read in a .txt file
read.table(file = "mydata.txt", sep, header)
  # sep=:," for comma separated, and "/t" for tab separated

## Check all objects in a workspace
ls()

## Remove an object from directory
rm(a, b, ..)

## Remove all objects from a workspace
rm(list = ls())

## Set working directory
setwd(file = "dir)

## Create new objects in a data frame
a <- data.frame("sex" = c("m", "f", "m"),
                "age" = c(19, 43, 25),
      "favorite.movie" = c("Moon", "The Goonies", "Spice World"))


