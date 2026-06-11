clc;
clear;
close all;

J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;

s = tf('s');

G = K/((J*s+b)*(L*s+R)+K^2);

Kp = 100;
Ki = 200;
Kd = 10;

C = pid(Kp,Ki,Kd);

T = feedback(C*G,1);

step(T)
grid on
title('PID Controlled DC Motor Speed Response')

stepinfo(T)