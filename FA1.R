library(ggplot2)
library(dplyr)
library(magrittr)
library(stringr)

df1 = data.frame(x = cytof_one_experiment$NKp30)
df2 = cytof_one_experiment$NKp44
df3 = cytof_one_experiment$KIR2DL1

ggplot(df1) + 
  stat_ecdf(
    color = "blue", 
    alpha = 0.5, 
    aes(x = x))
ggplot(df1) + 
  geom_density(
    color = "green", 
    fill = "chartreuse", 
    linewidth = 1, 
    alpha = 0.5, 
    aes(x = x)) + 
  geom_vline(
    aes(xintercept = mean(x)), 
    color = "blue", 
    linetype = "dashed", 
    size = 1)

df23 = qqplot(df2, 
              df3, 
              plot.it = FALSE)
qq.df = as.data.frame(df23)
ggplot(qq.df, 
       aes(x = x,
           y = y)) + 
geom_point() +
  geom_abline(
    slope = 1,
    intercept = 0) +
  xlab("df2") + 
  ylab("df3")

