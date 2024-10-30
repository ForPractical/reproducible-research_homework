virus <- read.csv("question-5-data/Cui_etal2014.csv")
View(virus)

virus$logVolume <- log(virus$Virion.volume..nm.nm.nm.)

virus$logGenome <- log(virus$Genome.length..kb.)

model1 <- lm (logVolume~logGenome, data=virus)
summary(model1)

summary(virus)
nrow(virus)
ncol(virus)

ggplot(virus, aes(x = logGenome, y = logVolume)) +
  geom_point() +  # Scatter plot of points
  geom_smooth(method = "lm", color = "blue", fill = "gray", linetype = "solid") +  # Linear regression with confidence interval
  labs(x = "log [Genome length (kb)]",
       y = "log [Virion volume (nm3)]") +
  theme_minimal()