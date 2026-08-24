clc;
clear;

%% Exercício 1

t = 0:0.1:10;

senoide = 2 * sin(3 * t);

cossenoide = 2 * cos(3 * t);

figure;
plot(t, senoide, 'b', 'LineWidth', 1.5);
hold on;
plot(t, cossenoide, 'r', 'LineWidth', 1.5);

xlabel('Tempo (s)');
ylabel('Amplitude');
title('Senoide e Cossenoide');
legend('Senoide', 'Cossenoide');
grid on;

quantidade = length(t);

fprintf('Quantidade de elementos do vetor de tempo: %d\n', quantidade);

%% Exercício 2 

a = input('Digite o valor do coeficiente a: ');

x = -10:0.1:10;

y = a * x + 2;

if a > 0
    fprintf('O coeficiente a é positivo.\n');
elseif a < 0
    fprintf('O coeficiente a é negativo.\n');
else
    fprintf('O coeficiente a é igual a zero.\n');
end

figure;
plot(x, y, 'b', 'LineWidth', 1.5);
xlabel('x');
ylabel('y');
title('Funç ão y = ax + 2');
grid on;

axes('Position', [0.60 0.60 0.28 0.28]);

x_zoom = -2:0.01:2;
y_zoom = a * x_zoom + 2;

plot(x_zoom, y_zoom, 'r', 'LineWidth', 1.5);
grid on;

xlabel('x');
ylabel('y');
title('Região -2 \leq x \leq 2');

%% Exercício 3 

valores = zeros(1, 5);

for i = 1:5
    valores(i) = 3 * i;
end

dobro = 2 * valores;

figure;

subplot(2,1,1);
plot(valores, 'o-', 'LineWidth', 1.5);
xlabel('Posição');
ylabel('Valor');
title('Cinco primeiros múltiplos de 3');
grid on;

subplot(2,1,2);
plot(dobro, 'o-', 'LineWidth', 1.5);
xlabel('Posição');
ylabel('Valor');
title('Dobro dos múltiplos de 3');
grid on;


%% Exercício 4 
t = 0.1:0.1:1000;

y = 50000 * exp(-0.05 * t);

figure;

subplot(2,1,1);
plot(t, y, 'LineWidth', 1.5);
xlabel('Tempo (t)');
ylabel('y');
title('Escala comum');
grid on;

subplot(2,1,2);
semilogy(t, y, 'LineWidth', 1.5);
xlabel('Tempo (t)');
ylabel('y (escala logarítmica)');
title('Escala logarítmica no eixo vertical');
grid on;


%% Exercício 5 

x = 1:0.1:10;
y = 1:0.1:20;

[X, Y] = meshgrid(x, y);

Z = sin(X) + cos(Y);

figure;

subplot(1,2,1);

surf(X, Y, Z);

xlabel('X');
ylabel('Y');
zlabel('Z');

title('Superfície z = sen(x) + cos(y)');

shading interp;
colormap(gca, hot);
colorbar;

subplot(1,2,2);

contour(X, Y, Z, 20);

xlabel('X');
ylabel('Y');

title('Curvas de nível');

grid on;
colorbar;