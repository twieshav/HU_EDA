#Data Transformation

## Check number of rows
nrow(df)

## Check number of columns
ncol(df)

## Check the classes of column variables
str(df)

## Look at top 6 rows
head(df)
# Can also limit to the columns of interest
head(df [, c(1:3, 15)])
#to look at top 10
head( df, 10)

## Look at bottom 6 rows
tail(df)
# Limit to columns same way as head function

## Filter observations with a certain value (and include corresponding column values)
library(dplyr)
filter(df, colname == value
       + select(col1, col2, col3))

## Filter for multiple values

filter(df, Col1 == "36" 
       +        & Col2 == "033" 
       +        & Col3 == "2014-09-30") %>%
  +         select(Date.Local, Time.Local, 
                   +                Sample.Measurement) %>% 
  +         as.data.frame

#### OR

filter(ozone, State.Name == "California" & County.Name == "Mariposa") %>% nrow

## Review number of unique values
select(df, Colname) %>% unique %>% nrow

#or to list them out
unique(df$colname)

## Summary of quartiles
summary(df$colname)

## to get quantiles in 10%
quantile(df$colname, seq(0, 1, 0.1))

# rank variables based on factors
ranking <- group_by(ozone, State.Name, County.Name) %>%
  +         summarize(ozone = mean(Sample.Measurement)) %>%
  +         as.data.frame %>%
  +         arrange(desc(ozone))

## Create a new dataset with random variables
set.seed(10234)
N <- nrow(ozone)
idx <- sample(N, N, replace = TRUE)
ozone2 <- ozone[idx, ]

## Coompare two value sets
cbind(head(ranking, 10),
      +       head(ranking2, 10))

## Create vectors as rows
cbind(a, b, c)

## Create vectors as columns
rbind(a, b, c)

## Create a matrix
matrix(x, nrow, ncol, byrow)

##Create a data frame out of a data set
data.frame("age" = c(19, 21), 
           sex = c("m", "f"))

## When R strings a factors (that is creates factors for a data column, thus preventing you from adding a new one)
stringsAsFactors = FALSE

## View the entire file in a new window
View(x)

##Show row (or colun) names
rownames(), colnames()

## Change name of a column
names(df)[1] <- "a"
# Where 1 is the column number

## slice into new dataframe
df[1:5, 2]

##slice based on factors
ToothGrowth.OJ.a <- ToothGrowth[ToothGrowth$supp == "OJ" &
                                  ToothGrowth$dose < 1, ]

#create a subset based on factors (similar to dataframe)
subset(x = ToothGrowth,
       subset = len < 20 &
         supp == "OJ" &
         dose >= 1)
## Compute cases per time period
count(year, wt = cases)

##Gather columns with repeated data to create new variable
gather(`1999`, `2000`, key = "year", value = "cases")

## Tidy a column with 2 seperate variables listed into separate columns
spread(key = type, value = count)
# Can also use
separate(rate, into = c("cases", "population"))

## To unite two columns into a single column
unite(new, century, year)

## To remove missing values
na.rm = TRUE

## Filter data to find relevant values
filter(flights, month == 1, day == 1)
# & is “and”, | is “or”, and ! is “not”

# Check if there are missing values
is.na(x)

## Change the order of rows
arrange(flights, year, month, day)

## Reorder a column in descending order
arrange(flights, desc(dep_delay))

## Rename a value
rename(flights, tail_num = tailnum)

## Add new variables
mutate(flights_sml,
       gain = dep_delay - arr_delay,
       hours = air_time / 60,
       gain_per_hour = gain / hours
       
       ## Find the mean
       mean(state[["Population"]])
       
       ##Find the trimmed mean
       mean(state[["Population"]], trim=0.1)
       ## You can change the trim but 0.1 is popular to diminish outliers
       
       ##Find the median
       median(state[["Population"]])
       
       ## Standard Deviation
       sd(state[["Population"]])
       
       ## Inter-quartile range
       IQR(state[["Population"]])
       
       ## Calculate median absolute deviation from the mean
       mad(state[["Population"]])
       