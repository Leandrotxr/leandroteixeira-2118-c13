clc;
clear;

%% EXERCICIO 1

M1 = 2;
B1 = 3;

M2 = 4;
B2 = 6;

G1 = tf(1, [M1 B1]);
G2 = tf(1, [M2 B2]);

disp('Funcao de transferencia - Sistema 1:');
G1

disp('Funcao de transferencia - Sistema 2:');
G2

t = 0:0.01:20;

[y1, t1] = step(G1, t);
[y2, t2] = step(G2, t);

u = ones(size(t));

figure;

plot(t1, y1, 'LineWidth', 1.5);
hold on;

plot(t2, y2, 'LineWidth', 1.5);

plot(t, u, '--', 'LineWidth', 1.2);

xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');
title('Comparacao dos Sistemas Massa-Atrito');
legend('Sistema 1', 'Sistema 2', 'Forca unitaria');
grid on;

axes('Position', [0.58 0.58 0.28 0.28]);

plot(t1(t1 <= 5), y1(t1 <= 5), 'LineWidth', 1.2);
hold on;
plot(t2(t2 <= 5), y2(t2 <= 5), 'LineWidth', 1.2);

xlim([0 5]);
grid on;

title('Zoom - primeiros 5 segundos');
xlabel('Tempo (s)');
ylabel('Velocidade');

figure;

subplot(2,1,1);

plot(t1, y1, 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');
title('Sistema 1 - Massa-Atrito');
grid on;

subplot(2,1,2);

plot(t2, y2, 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');
title('Sistema 2 - Massa-Atrito');
grid on;

%% EXERCICIO 2

R = 2000;
tau = 2.5;

C = tau / R;

G = tf(1, [R*C 1]);

fprintf('Capacitancia C = %.6f F\n', C);
fprintf('Capacitancia C = %.2f mF\n', C*1000);

disp('Funcao de transferencia:');
G

figure;

step(G, 15);

xlabel('Tempo (s)');
ylabel('Tensao');
title('Resposta ao Degrau - Circuito RC');
grid on;

Rteste = 100:100:10000;

tauteste = Rteste * C;

figure;

subplot(2,2,1);

plot(Rteste, tauteste, 'LineWidth', 1.5);

xlabel('Resistencia (\Omega)');
ylabel('Constante de tempo (s)');
title('Escala comum');
grid on;

subplot(2,2,2);

semilogy(Rteste, tauteste, 'LineWidth', 1.5);

xlabel('Resistencia (\Omega)');
ylabel('Constante de tempo (s)');
title('Escala logaritmica no eixo Y');
grid on;

subplot(2,2,3);

semilogx(Rteste, tauteste, 'LineWidth', 1.5);

xlabel('Resistencia (\Omega)');
ylabel('Constante de tempo (s)');
title('Escala logaritmica no eixo X');
grid on;

subplot(2,2,4);

loglog(Rteste, tauteste, 'LineWidth', 1.5);

xlabel('Resistencia (\Omega)');
ylabel('Constante de tempo (s)');
title('Escala logaritmica nos dois eixos');
grid on;

%% EXERCICIO 3

t = (0:25)';

u = [0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]';

y = [0.008 0.012 0.006 0.010 0.020 0.382 0.671 0.903 ...
     1.082 1.226 1.335 1.425 1.492 1.547 1.587 1.618 ...
     1.642 1.660 1.674 1.684 1.692 1.698 1.702 1.706 ...
     1.709 1.711]';

Ts = 1;

figure;

subplot(2,1,1);

plot(t, u, 'LineWidth', 1.5);

xlabel('Tempo (s)');
ylabel('Entrada');
title('Entrada u');
grid on;

subplot(2,1,2);

plot(t, y, 'LineWidth', 1.5);

xlabel('Tempo (s)');
ylabel('Saida');
title('Saida y');
grid on;

figure;

plot3(t, u, y, 'o-', 'LineWidth', 1.2);

xlabel('Tempo (s)');
ylabel('Entrada u');
zlabel('Saida y');

title('Dados Experimentais em 3D');

grid on;

dados = iddata(y, u, Ts);

modelo = tfest(dados, 1, 0);

disp('Funcao de transferencia estimada:');
modelo

figure;

compare(dados, modelo);

grid on;

figure;

step(modelo, 25);

xlabel('Tempo (s)');
ylabel('Saida');
title('Resposta ao Degrau - Modelo Identificado');
grid on;

%% EXERCICIO 4

R1 = 1000;
tau1 = 1.2;

R2 = 2000;
tau2 = 2.8;

R3 = 3000;
tau3 = 3.9;

R4 = 5000;
tau4 = 7.0;

C1 = tau1 / R1;
C2 = tau2 / R2;
C3 = tau3 / R3;
C4 = tau4 / R4;

fprintf('C1 = %.6f F\n', C1);
fprintf('C2 = %.6f F\n', C2);
fprintf('C3 = %.6f F\n', C3);
fprintf('C4 = %.6f F\n', C4);

R = [R1 R2 R3 R4];

tau = [tau1 tau2 tau3 tau4];

C = [C1 C2 C3 C4];

figure;

plot3(R, tau, C, 'o-', 'LineWidth', 1.5);

xlabel('Resistencia (\Omega)');
ylabel('Constante de tempo (s)');
zlabel('Capacitancia (F)');

title('Analise dos quatro circuitos RC');

grid on;

G3 = tf(1, [R3*C3 1]);

disp('Funcao de transferencia do Experimento 3:');
G3

figure;

step(G3, 20);

xlabel('Tempo (s)');
ylabel('Tensao');
title('Resposta ao Degrau - Experimento 3');
grid on;

axes('Position', [0.58 0.58 0.28 0.28]);

step(G3, 5);

xlim([0 5]);

title('Zoom - primeiros 5 segundos');
xlabel('Tempo (s)');
ylabel('Tensao');
grid on;

%% EXERCICIO 5

M = 3;
B = 5;

GA = tf(1, [M B]);

R = 1500;
tau = 3;

C = tau / R;

GB = tf(1, [R*C 1]);

tC = (0:20)';

uC = [0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]';

yC = [0.010 0.006 0.012 0.018 0.408 0.706 0.934 1.103 ...
      1.229 1.322 1.391 1.441 1.479 1.505 1.526 1.540 ...
      1.551 1.558 1.564 1.568 1.571]';

Ts = 1;

dadosC = iddata(yC, uC, Ts);

GC = tfest(dadosC, 1, 0);

disp('==========================================');
disp('SISTEMA A - CAIXA BRANCA');
disp('==========================================');

disp('Funcao de transferencia:');
GA

disp('==========================================');
disp('SISTEMA B - CAIXA CINZA');
disp('==========================================');

fprintf('Capacitancia C = %.6f F\n', C);
fprintf('Capacitancia C = %.2f mF\n', C*1000);

disp('Funcao de transferencia:');
GB

disp('==========================================');
disp('SISTEMA C - CAIXA PRETA');
disp('==========================================');

disp('Funcao de transferencia estimada:');
GC

figure;

subplot(3,1,1);

step(GA, 20);

xlabel('Tempo (s)');
ylabel('Saida');
title('Sistema A - Caixa Branca');
grid on;

subplot(3,1,2);

step(GB, 20);

xlabel('Tempo (s)');
ylabel('Saida');
title('Sistema B - Caixa Cinza');
grid on;

subplot(3,1,3);

step(GC, 20);

xlabel('Tempo (s)');
ylabel('Saida');
title('Sistema C - Caixa Preta');
grid on;

figure;

subplot(2,1,1);

plot(tC, uC, 'LineWidth', 1.5);

xlabel('Tempo (s)');
ylabel('Entrada');
title('Sistema C - Entrada');
grid on;

subplot(2,1,2);

plot(tC, yC, 'LineWidth', 1.5);

xlabel('Tempo (s)');
ylabel('Saida');
title('Sistema C - Saida');
grid on;


figure;

compare(dadosC, GC);

grid on;

% =========================================================
% CLASSIFICACAO DOS SISTEMAS
% =========================================================

% Sistema A: caixa branca porque o modelo e os parametros
% fisicos do sistema sao conhecidos.

% Sistema B: caixa cinza porque parte do conhecimento do
% modelo e utilizada junto com um parametro experimental.

% Sistema C: caixa preta porque o modelo e obtido a partir
% dos dados experimentais, sem conhecimento previo completo.