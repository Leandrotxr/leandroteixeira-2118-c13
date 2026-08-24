clc;
clear;

%% Exercício 1 

M = 2;
B = 3;
K = 8;

num = 1;
den = [M B K];

G = tf(num, den);

disp('Função de transferência:');
G

figure;
step(G, 15);

xlabel('Tempo (s)');
ylabel('Deslocamento');
title('Resposta ao Degrau - Sistema Massa-Mola-Amortecedor');
grid on;

%% Exercício 2

R = 1000;
tau = 2;

C = tau / R;

num = 1;
den = [R*C 1];

G = tf(num, den);

fprintf('Valor da capacitância C = %.4f F\n', C);

disp('Função de transferência:');
G

figure;
step(G, 10);

xlabel('Tempo (s)');
ylabel('Tensão');
title('Resposta ao Degrau - Circuito RC');
grid on;

%% Exercício 3 

M = 4;
F = 1;
v_estavel = 0.5;

B = F / v_estavel;

num = 1;
den = [M B];

G = tf(num, den);

fprintf('Coeficiente de atrito B = %.2f\n', B);

disp('Função de transferência:');
G

figure;
step(G);

xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');
title('Resposta à Força de 1 N - Sistema Massa-Atrito');
grid on;