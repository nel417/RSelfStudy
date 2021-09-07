#import
library(mlbench)
library(caret)

#load data
data(BostonHousing)

#view head
head(BostonHousing)

#check NaNs
sum(is.na(BostonHousing))

set.seed(100)


TrainingIndex <- createDataPartition(BostonHousing$medv, p=0.9, list = FALSE)
TrainingSet <- BostonHousing[TrainingIndex,]
TestingSet <- BostonHousing[-TrainingIndex,]


Model <- train(medv ~ ., data = TrainingSet,
               method = 'lm',
               na.action = na.omit,
               preProcess=c('scale', 'center'),
               treControl= trainControl(method='none')
)

Model.training <-predict(Model,TrainingSet)
Model.testing <-predict(Model, TestingSet)

#plotting
plot(TrainingSet$medv, Model.training, col = 'blue')
plot(TestingSet$medv, Model.testing, col = 'blue')


#performance
  summary(Model)




