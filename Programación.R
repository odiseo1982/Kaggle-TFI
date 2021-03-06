# Paquetes
library(randomForest)
library(MASS)

# Cargando datos
setwd('C:/...')						# Directorio de trabajo, que es la carpeta donde se almacenan los datos de entrenamiento y prueba.
train = read.csv('train.csv')
train$edad = as.numeric((Sys.Date()-as.Date(train$Open.Date,'%m/%d/%Y'))/365)
train$tipoFC = 0
train[train$Type == 'FC','tipoFC'] = 1
train1 = train
test = read.csv('test.csv')
test$edad = as.numeric((Sys.Date()-as.Date(test$Open.Date,'%m/%d/%Y'))/365)
test$tipoFC = 0
test[test$Type == 'FC','tipoFC'] = 1
test1 = test
sapply(train,class)
sapply(test,class)

# Comparación de variables
table(train$City.Group); table(test$City.Group)
table(train$Type); table(test$Type)
table(train$P1); table(test$P1)
table(train$P2); table(test$P2)
table(train$P3); table(test$P3)
table(train$P4); table(test$P4)
table(train$P5); table(test$P5)
table(train$P6); table(test$P6)
table(train$P7); table(test$P7)
table(train$P8); table(test$P8)
table(train$P9); table(test$P9)
table(train$P10); table(test$P10)
table(train$P11); table(test$P11)
table(train$P12); table(test$P12)
table(train$P13); table(test$P13)
table(train$P14); table(test$P14)
table(train$P15); table(test$P15)
table(train$P16); table(test$P16)
table(train$P17); table(test$P17)
table(train$P18); table(test$P18)
table(train$P19); table(test$P19)
table(train$P20); table(test$P20)
table(train$P21); table(test$P21)
table(train$P22); table(test$P22)
table(train$P23); table(test$P23)
table(train$P24); table(test$P24)
table(train$P25); table(test$P25)
table(train$P26); table(test$P26)
table(train$P27); table(test$P27)
table(train$P28); table(test$P28)
table(train$P29); table(test$P29)
table(train$P30); table(test$P30)
table(train$P31); table(test$P31)
table(train$P32); table(test$P32)
table(train$P33); table(test$P33)
table(train$P34); table(test$P34)
table(train$P35); table(test$P35)
table(train$P36); table(test$P36)
table(train$P37); table(test$P37)

# Generando variables
train1$P1 = factor(train1$P1)
train1$P5[train1$P5 == 8] = 6
train1$P5 = factor(train1$P5)
train1$P6 = factor(train1$P6)
train1$P7 = factor(train1$P7)
train1$P8 = factor(train1$P8)
train1$P9 = factor(train1$P9)
train1$P10 = factor(train1$P10)
train1$P11 = factor(train1$P11)
train1$P12 = factor(train1$P12)
train1$P14 = factor(train1$P14)
train1$P15 = factor(train1$P15)
train1$P16[train1$P16 == 9] = 15
train1$P16 = factor(train1$P16)
train1$P17 = factor(train1$P17)
train1$P18 = factor(train1$P18)
train1$P19 = factor(train1$P19)
train1$P20 = factor(train1$P20)
train1$P21 = factor(train1$P21)
train1$P22 = factor(train1$P22)
train1$P23 = factor(train1$P23)
train1$P24 = factor(train1$P24)
train1$P25 = factor(train1$P25)
train1$P30 = factor(train1$P30)
train1$P31 = factor(train1$P31)
train1$P32 = factor(train1$P32)
train1$P33 = factor(train1$P33)
train1$P35[train1$P35 == 3] = 15
train1$P35 = factor(train1$P35)
train1$P36 = factor(train1$P36)
train1$P37 = factor(train1$P37)
test1$P1[test1$P1 == 15] = 12
test1$P1 = factor(test1$P1)
test1$P5 = factor(test1$P5)
test1$P6 = factor(test1$P6)
test1$P7[test1$P7 == 6] = 10
test1$P7 = factor(test1$P7)
test1$P8 = factor(test1$P8)
test1$P9[test1$P9 == 6] = 10
test1$P9 = factor(test1$P9)
test1$P10 = factor(test1$P10)
test1$P11 = factor(test1$P11)
test1$P12 = factor(test1$P12)
test1$P14 = factor(test1$P14)
test1$P15[test1$P15 == 6] = 10
test1$P15 = factor(test1$P15)
test1$P16[test1$P16 == 6] = 15
test1$P16 = factor(test1$P16)
test1$P17[test1$P17 == 12] = 15
test1$P17 = factor(test1$P17)
test1$P18[test1$P18 == 2] = 12
test1$P18[test1$P18 == 15] = 12
test1$P18 = factor(test1$P18)
test1$P19 = factor(test1$P19)
test1$P20 = factor(test1$P20)
test1$P21[test1$P21 == 12] = 15
test1$P21 = factor(test1$P21)
test1$P22 = factor(test1$P22)
test1$P23 = factor(test1$P23)
test1$P24 = factor(test1$P24)
test1$P25[test1$P25 == 6] = 10
test1$P25 = factor(test1$P25)
test1$P30[test1$P30 == 2] = 25
test1$P30 = factor(test1$P30)
test1$P31 = factor(test1$P31)
test1$P32 = factor(test1$P32)
test1$P33[test1$P33 == 1] = 0
test1$P33 = factor(test1$P33)
test1$P35 = factor(test1$P35)
test1$P36[test1$P36 == 1] = 0
test1$P36[test1$P36 == 8] = 20
test1$P36 = factor(test1$P36)
test1$P37 = factor(test1$P37)

# Seleccion de variables mediante regresiones lineales
summary(lm(revenue ~ poly(edad,2),data = train1))
summary(lm(revenue ~ City.Group,data = train1))
summary(lm(revenue ~ tipoFC,data = train1))
summary(lm(revenue ~ P1,data = train1))
summary(lm(revenue ~ poly(P2,2),data = train1))
summary(lm(revenue ~ poly(P3,2),data = train1))
summary(lm(revenue ~ poly(P4,2),data = train1))
summary(lm(revenue ~ P5,data = train1))
summary(lm(revenue ~ P6,data = train1))
summary(lm(revenue ~ P7,data = train1))
summary(lm(revenue ~ P8,data = train1))
summary(lm(revenue ~ P9,data = train1))
summary(lm(revenue ~ P10,data = train1))
summary(lm(revenue ~ P11,data = train1))
summary(lm(revenue ~ P12,data = train1))
summary(lm(revenue ~ poly(P13,2),data = train1))
summary(lm(revenue ~ P14,data = train1))
summary(lm(revenue ~ P15,data = train1))
summary(lm(revenue ~ P16,data = train1))
summary(lm(revenue ~ P17,data = train1))
summary(lm(revenue ~ P18,data = train1))
summary(lm(revenue ~ P19,data = train1))
summary(lm(revenue ~ P20,data = train1))
summary(lm(revenue ~ P21,data = train1))
summary(lm(revenue ~ P22,data = train1))
summary(lm(revenue ~ P23,data = train1))
summary(lm(revenue ~ P24,data = train1))
summary(lm(revenue ~ P25,data = train1))
summary(lm(revenue ~ poly(P26,2),data = train1))
summary(lm(revenue ~ poly(P27,2),data = train1))
summary(lm(revenue ~ poly(P28,2),data = train1))
summary(lm(revenue ~ poly(P29,2),data = train1))
summary(lm(revenue ~ P30,data = train1))
summary(lm(revenue ~ P31,data = train1))
summary(lm(revenue ~ P32,data = train1))
summary(lm(revenue ~ P33,data = train1))
summary(lm(revenue ~ poly(P34,2),data = train1))
summary(lm(revenue ~ P35,data = train1))
summary(lm(revenue ~ P36,data = train1))
summary(lm(revenue ~ P37,data = train1))
summary(lm(log(revenue) ~ poly(edad,2),data = train1))
summary(lm(log(revenue) ~ City.Group,data = train1))
summary(lm(log(revenue) ~ tipoFC,data = train1))
summary(lm(log(revenue) ~ P1,data = train1))
summary(lm(log(revenue) ~ poly(P2,2),data = train1))
summary(lm(log(revenue) ~ poly(P3,2),data = train1))
summary(lm(log(revenue) ~ poly(P4,2),data = train1))
summary(lm(log(revenue) ~ P5,data = train1))
summary(lm(log(revenue) ~ P6,data = train1))
summary(lm(log(revenue) ~ P7,data = train1))
summary(lm(log(revenue) ~ P8,data = train1))
summary(lm(log(revenue) ~ P9,data = train1))
summary(lm(log(revenue) ~ P10,data = train1))
summary(lm(log(revenue) ~ P11,data = train1))
summary(lm(log(revenue) ~ P12,data = train1))
summary(lm(log(revenue) ~ poly(P13,2),data = train1))
summary(lm(log(revenue) ~ P14,data = train1))
summary(lm(log(revenue) ~ P15,data = train1))
summary(lm(log(revenue) ~ P16,data = train1))
summary(lm(log(revenue) ~ P17,data = train1))
summary(lm(log(revenue) ~ P18,data = train1))
summary(lm(log(revenue) ~ P19,data = train1))
summary(lm(log(revenue) ~ P20,data = train1))
summary(lm(log(revenue) ~ P21,data = train1))
summary(lm(log(revenue) ~ P22,data = train1))
summary(lm(log(revenue) ~ P23,data = train1))
summary(lm(log(revenue) ~ P24,data = train1))
summary(lm(log(revenue) ~ P25,data = train1))
summary(lm(log(revenue) ~ poly(P26,2),data = train1))
summary(lm(log(revenue) ~ poly(P27,2),data = train1))
summary(lm(log(revenue) ~ poly(P28,2),data = train1))
summary(lm(log(revenue) ~ poly(P29,2),data = train1))
summary(lm(log(revenue) ~ P30,data = train1))
summary(lm(log(revenue) ~ P31,data = train1))
summary(lm(log(revenue) ~ P32,data = train1))
summary(lm(log(revenue) ~ P33,data = train1))
summary(lm(log(revenue) ~ poly(P34,2),data = train1))
summary(lm(log(revenue) ~ P35,data = train1))
summary(lm(log(revenue) ~ P36,data = train1))
summary(lm(log(revenue) ~ P37,data = train1))

# Modelo predictivo
modLogLin = log(revenue) ~ poly(edad,4)+P6+P17+P21+P23				# This variables are selected through univariate log lin regresion models
modArbolLogLin = log(revenue) ~ edad+City.Group+tipoFC+
  P1+P2+P3+P4+P5+P6+P7+P8+P9+P10+
  P11+P12+P13+P14+P15+P16+P17+P18+P19+P20+
  P21+P22+P23+P24+P25+P26+P27+P28+P29+P30+
  P31+P32+P33+P34+P35+P36+P37+modAux

# Predicción árbol aleatorio log lineal - 1'750.599. Min: 1'796.696, max: 9'498.914
regresion = lm(modLogLin,data = train1)
train1$modAux = predict.lm(regresion,data = train1)
arbol = randomForest(modArbolLogLin,data = train1)
varImpPlot(arbol)
test1$modAux = predict.lm(regresion,newdata = test1)
salida = exp(predict(arbol,newdata = test1))
salida = data.frame(Id = test$Id,Prediction = salida)
write.csv(salida,'salida.csv')
