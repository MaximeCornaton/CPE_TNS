clear all

db=70;
[x,nue]=audioread('signal10.wav');

sgram(x,nue,db,1);

