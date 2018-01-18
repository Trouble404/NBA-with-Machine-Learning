import numpy as np
import pandas
from keras.layers import *
from keras.models import Sequential, Model



#load dataset
df = pandas.read_csv("04-12_NBA_rookies_data_without3PP.csv", header=None)
df1 = pandas.read_csv("04-12_NBA_rookies_label.csv",header=None)
df_test = pandas.read_csv("prediction_data.csv",header=None)
df1_test = pandas.read_csv("rookies_name.csv",header=None)
ds = df.values
ds1 = df1.values
ds_test = df_test.values
ds1_test = df1_test.values
x_train = ds[:,0:24]
y_train = ds1[:,1]
x_test = ds_test[:,0:24]
y_test = ds1_test[:,0]

dim = x_train.shape[1]
model = Sequential()
model.add(Dense(100, input_dim=dim, activation='tanh'))
model.add(Dropout(0.5))
model.add(Dense(2, activation='softmax'))

model.compile(loss='sparse_categorical_crossentropy', optimizer='rmsprop',metrics=["accuracy"])


idx = list(range(x_train.shape[0]))
np.random.shuffle(idx)
hist = model.fit(x_train[idx],y_train[idx],validation_split=0.2,epochs=120,shuffle=True)
dnn_predict = model.predict_classes(x_test)
print(sum(dnn_predict))
print(y_test[dnn_predict == 1])
