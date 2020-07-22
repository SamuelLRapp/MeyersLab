sqrt(4)

a<-4

dat2<-c(1,2,5,10)
se_dat2 <- sd(dat2)/sqrt(4)
se_dat2

mean(dat)
dat

#standard error
#standard deviation/square root of the sample  size
se_dat <- sd(dat)/sqrt(4)
se_dat


#making our own functions
name_of_function <- function(x)
{
#code goes here  
#e.g doing  calculation with variable x
return(output)
}

  
#sqaure()  sqaures a number
sqaure <- function(x)
{
  #sqaure function takes a number and sqaures it
  #input: number int
  #output: input^2
output <- x^2
  return(output)
}

sqaure(5)

Stand_error <- function(dat)
{
  #takes in a set/list of data and returns the standard error
  return(sd(dat)/sqrt(length(dat)))
}

se(dat)
standard_error(dat)
se_dat <- sd(dat)/sqrt(4)

standard_error(c(1,2,5,10))
 
#test zone
dat2 <- c(1,2,10,50,100,200)
new <- sd(dat2)/sqrt(6)
new
vs
SE2(dat2)

sqaure_new<-function(num, power=2)
{
  result <- num^power
    return(result)
}

sqaure_new(2,3)
sqaure_new(2)
sqaure_new(4,2)
sqaure_new(4)


#only run once
install.packages('ggplot2')
#but run for every file here.
library(ggplot2)
#lubridate // TidyVerse
install.packages('gglot')

mammals <- read.csv(file.choose()) # opens a open file import function
plot(adult_head_body_len_mm ~ adult_body_mass_g, data=mammals)
ggplot(data=mammals, aes(x=adult_body_mass_g, y=adult_head_body_len_mm)) + geom_point()

ggplot(mammals, aes(x=adult_body_mass_g, y=adult_head_body_len_mm, color =order)) + geom_point()

?gglot()

?aes()

myPlot <- ggplot(mammals, aes(x=habitat, y = adult_body_mass_g, fill = habitat )) + geom_boxplot() + scale_y_log10()+geom_jitter(alpha=.2, aes(color = order)) +scale_fill_manual(values = c('dodgerblue','forestgreen')) + labs(x = 'Habitat', y ='Adult body mass(g)', title= 'Body Mass by Habitat')+theme_bw()

#reordering factor levels
#what are legends...
?scale_fill()
#can save a plot to a variable/name and keep adding to it that way
install.packages('ggThemeAssist')

myPlot <- myPlot + geom_boxplot()
ggplot2
myPlot + theme(panel.grid.major = element_line(linetype = "dashed"), 
    panel.background = element_rect(fill = NA), 
    plot.background = element_rect(fill = "antiquewhite"))
myplot