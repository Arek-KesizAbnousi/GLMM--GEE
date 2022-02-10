library(faraway)

data(potuse)
index=which(potuse$count>0)
data=potuse[index,]
data$y76=as.integer(data$year.76>1)
data$y77=as.integer(data$year.77>1)
data$y78=as.integer(data$year.78>1)
data$y79=as.integer(data$year.79>1)
data$y80=as.integer(data$year.80>1)
count=sum(data$count)
index_sex=which(data$sex==1)
count_sex=sum(data$count[index_sex])
index_sex1=which(data$sex==2)
count_sex1=sum(data$count[index_sex1])
sex=rep(1:2,c(5*count_sex,5*count_sex1))
id=rep(1:count,each=5)
id=as.factor(id)
t=rep(1:5,times=count)
y76=rep(data$y76,data$count)
y77=rep(data$y77,data$count)
y78=rep(data$y78,data$count)
y79=rep(data$y79,data$count)
y80=rep(data$y80,data$count)
y=as.matrix(cbind(y76,y77,y78,y79,y80))
y=as.vector(t(y))
potuse_data=data.frame(y=y,sex=sex,id=id,t=t)

#GLMM FIT

#FULL MODEL

library(lme4)

complete_model=glmer(y~as.factor(sex)+t+(1|id),data=potuse_data,family=binomial)
summary(complete_model)

#REDUCED MODEL


complete_model=glmer(y~as.factor(sex)+t+(1|id),data=potuse_data,family=binomial)
summary(complete_model)


#Reduced Model(without the effect of t)

reduced_model=glmer(y~as.factor(sex)+(1|id),data=potuse_data,family=binomial)
summary(reduced_model)

anova(reduced_model,complete_model)



#GEE FIT

library(gee)

Gee_model_ind=gee(y~sex+t,id=id,data=potuse_data,family=binomial,corstr="independence",scale.fix=TRUE)

summary(Gee_model_ind)

# Instead of indpendence, the model with exchangeable working correlation is given by

Gee_model_exc=gee(y~sex+t,id=id,data=potuse_data,family=binomial,corstr="exchangeable",scale.fix=TRUE)
summary(Gee_model_exc)

