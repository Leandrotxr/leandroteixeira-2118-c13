clc;
clear;

%% 1. Operações básicas
a = 12;
b = 5;

fprintf('--- 1. Operações básicas ---\n');
fprintf('Soma: %d\n', a + b);
fprintf('Subtração: %d\n', a - b);
fprintf('Multiplicação: %d\n', a * b);
fprintf('Divisão: %.2f\n', a / b);
fprintf('Potência: %.0f\n\n', a ^ b);

%% 2. Raiz, arredondamento e resto
fprintf('--- 2. Funções básicas ---\n');
fprintf('Raiz de 144: %.0f\n', sqrt(144));
fprintf('Round(7.6): %.0f\n', round(7.6));
fprintf('Ceil(4.01): %.0f\n', ceil(4.01));
fprintf('Resto de 250/17: %.0f\n\n', mod(250,17));

%% 3. MDC e MMC
fprintf('--- 3. MDC e MMC ---\n');
fprintf('MDC(24,36): %.0f\n', gcd(24,36));
fprintf('MMC(12,18): %.0f\n\n', lcm(12,18));

%% 4. Exponencial e trigonometria
fprintf('--- 4. Exponencial e trigonometria ---\n');
fprintf('e^2: %.4f\n', exp(2));
fprintf('sen(30°): %.4f\n', sin(deg2rad(30)));
fprintf('cos(60°): %.4f\n', cos(deg2rad(60)));
fprintf('tan(45°): %.4f\n\n', tan(deg2rad(45)));

%% 5. Vetores
fprintf('--- 5. Vetores ---\n');
v1 = 1:10;
v2 = 10:-1:1;
pares = 0:2:20;
v3 = linspace(0,100,5);

disp('1 até 10:'); disp(v1);
disp('10 até 1:'); disp(v2);
disp('Pares 0 a 20:'); disp(pares);
disp('Linspace:'); disp(v3);

%% 6. Acesso a vetor
fprintf('\n--- 6. Acesso ---\n');
v = [4 8 15 16 23 42];

fprintf('Primeiro: %d\n', v(1));
fprintf('Último: %d\n', v(end));
disp('Posições 2 a 4:'); disp(v(2:4));
disp('Posições 1,3,6:'); disp(v([1 3 6]));

%% 7. Informações vetor
fprintf('\n--- 7. Info vetor ---\n');
v = [5 10 15 20 25];

fprintf('Qtd: %d\n', length(v));
disp('Dimensão:'); disp(size(v));
fprintf('Soma: %d\n', sum(v));
fprintf('Média: %.2f\n', mean(v));
fprintf('Máximo: %d\n', max(v));
fprintf('Mínimo: %d\n', min(v));

%% 8. Linha vs coluna
fprintf('\n--- 8. Linha x Coluna ---\n');
v = [10 20 30 40];

v_col = v';
disp('Vetor coluna:');
disp(v_col);

disp('Size do vetor linha:');
disp(size(v));

disp('Size do vetor coluna:');
disp(size(v_col));

%% 9. Matrizes
fprintf('\n--- 9. Matrizes ---\n');
A = [3 6 9; 2 4 8; 1 5 7];

fprintf('Elemento (2,3): %d\n', A(2,3));
disp('Primeira linha:'); disp(A(1,:));
disp('Segunda coluna:'); disp(A(:,2));
disp('Dimensão:'); disp(size(A));

%% 10. Operações com matrizes
fprintf('\n--- 10. Operações com matrizes ---\n');
A = [1 2; 3 4];
B = [2 0; 1 5];

disp('A + B:'); disp(A + B);
disp('A * B:'); disp(A * B);
disp('Transposta de A:'); disp(A');

disp('Zeros 3x3:'); disp(zeros(3,3));
disp('Uns 2x4:'); disp(ones(2,4));
disp('Identidade 4x4:'); disp(eye(4));
disp('Aleatória 3x3:'); disp(rand(3,3));