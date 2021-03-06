library(caTools)

setwd("/Users/savioabuga/Documents/Study/AnalyticsEdge/")

framingham = read.csv("Unit3/Data/framingham.csv")
str(framingham)

set.seed(1000)

split = sample.split(framingham$TenYearCHD, SplitRatio = 0.65)

train = subset(framingham, split == TRUE)
test = subset(framingham, split == FALSE)

framinghamLog = glm(TenYearCHD ~ ., data = train, family = binomial)
summary(framinghamLog)

predictTest = predict(framinghamLog, type="response", newdata = test)

table()