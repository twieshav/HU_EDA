## Data Visualization

## boxplot
boxplot(state[["Population"]]/1000000, ylab="Population (millions)")

## Frequency table
table(pop_freq)

## Histogram
hist(state[["Murder.Rate"]], freq=FALSE)

## Density estimate
lines(density(state[["Murder.Rate"]]), lwd=3, col="blue")

## Barplot
barplot(as.matrix(dfw)/6, cex.axis=.5)

## Table of correlations
library(corrplot)
corrplot(cor(etfs), method = "ellipse")

## Scatterplot with axis names
plot(telecom$T, telecom$VZ, xlab="T", ylab="VZ")

## Hexagonal binning
ggplot(kc_tax0, (aes(x=SqFtTotLiving, y=TaxAssessedValue))) +
  stat_binhex(colour="white") +
  theme_bw() +
  scale_fill_gradient(low="white", high="black") +
  labs(x="Finished Square Feet", y="Tax Assessed Value")

## Contour plot
ggplot(kc_tax0, aes(SqFtTotLiving, TaxAssessedValue)) +
  theme_bw() +
  geom_point( alpha=0.1) +
  geom_density2d(colour="white") +
  labs(x="Finished Square Feet", y="Tax Assessed Value")

## Contingency table - a table of counts by category
library(descr)
x_tab <- CrossTable(lc_loans$grade, lc_loans$status,
                    prop.c=FALSE, prop.chisq=FALSE, prop.t=FALSE)

## Violin plot
ggplot(data=airline_stats, aes(airline, pct_carrier_delay)) +
  ylim(0, 50) +
  geom_violin() +
  labs(x="", y="Daily % of Delayed Flights")

## Charts comparing multiple variables using hexagonal binning
ggplot(subset(kc_tax0, ZipCode %in% c(98188, 98105, 98108, 98126)),
       aes(x=SqFtTotLiving, y=TaxAssessedValue)) +
  stat_binhex(colour="white") +
  theme_bw() +
  scale_fill_gradient( low="white", high="blue") +
  labs(x="Finished Square Feet", y="Tax Assessed Value") +
  facet_wrap("ZipCode")

## Geometric mapping
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

## Geometric plotting with colors varying by class
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

## Geometric mapping with size aesthetic
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

  # Change transparency of points
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
  #Change shape of points
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
  ## Make all points the same color
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

## show different subsets of the data
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

## Facet using a combination of two variables
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

## Geometric object plot with smooth lines
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

## Geometric object plot with different line types for variables
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

## Multiple geometric functions on the same plot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

## geometric point and smooth lines together
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

## barplot chart
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

## statistical summary in chart
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

## Colored bars bar chart
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

## stacked colored bars
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

##colored stacks the same height
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

## overlapping objects beside one another
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

## horizontal boxplots
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()

## view spatial data
ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap()

##