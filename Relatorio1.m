clc;
clear;

%% ================== EXERCÍCIO 1 ==================
fprintf('\n--- EXERCÍCIO 1 ---\n');

valores = zeros(1,3);

for i = 1:3
    valores(i) = input('Digite um valor: ');
end

media = mean(valores);
maior = max(valores);
menor = min(valores);

fprintf('Media: %.f\n', media);
fprintf('Maior: %.f\n', maior);
fprintf('Menor: %.f\n', menor);

if media >= 8
    disp('Resultado alto');
elseif media >= 5
    disp('Resultado intermediário');
else
    disp('Resultado baixo');
end

fprintf('Media: %.2f\n', media);

%% ================== EXERCÍCIO 2 ==================
fprintf('\n--- EXERCÍCIO 2 ---\n');

A = [3 8 2 10 5 7 1 6];
B = zeros(size(A));

for i = 1:length(A)
    if A(i) >= 6
        B(i) = A(i) * 2;
    else
        B(i) = A(i) + 3;
    end
end

disp(A);
disp(B);

fprintf('Soma B: %.f\n', sum(B));
fprintf('Media B: %.2f\n', mean(B));
fprintf('Maior B: %.f\n', max(B));
fprintf('Menor B: %.f\n', min(B));

%% ================== EXERCÍCIO 3 ==================
fprintf('\n--- EXERCÍCIO 3 ---\n');

A = [14 7 20 9 6 11 18 5];
B = zeros(size(A));
cont = 0;

for i = 1:length(A)
    if rem(A(i),2) == 0
        B(i) = A(i);
        cont = cont + 1;
    else
        B(i) = 0;
    end
end

disp(B);
fprintf('Quantidade de pares: %d\n', cont);

%% ================== EXERCÍCIO 4 ==================
fprintf('\n--- EXERCÍCIO 4 ---\n');

x = input('Digite o primeiro valor: ');
y = input('Digite o segundo valor: ');

disp('1 - Soma');
disp('2 - Subtracao');
disp('3 - Multiplicacao');
disp('4 - Divisao');

op = input('Escolha: ');

switch op
    case 1
        fprintf('Resultado: %.2f\n', x + y);
    case 2
        fprintf('Resultado: %.2f\n', x - y);
    case 3
        fprintf('Resultado: %.2f\n', x * y);
    case 4
        if y == 0
            disp('Erro: divisao por zero');
        else
            fprintf('Resultado: %.2f\n', x / y);
        end
    otherwise
        disp('Opcao invalida');
end

%% ================== EXERCÍCIO 5 ==================
fprintf('\n--- EXERCÍCIO 5 ---\n');

soma = 0;
contador = 0;

while soma <= 4
    r = rand;
    soma = soma + r;
    contador = contador + 1;
    fprintf('Valor: %.2f | Soma: %.2f\n', r, soma);
end

if contador > 8
    disp('Muitas repeticoes');
else
    disp('Poucas repeticoes');
end

fprintf('Total de repeticoes: %d\n', contador);

%% ================== EXERCÍCIO 6 ==================
fprintf('\n--- EXERCÍCIO 6 ---\n');

A = [2 7 4 9;
     6 1 8 3];

B = zeros(size(A));

for j = 1:size(A,1)
    for i = 1:size(A,2)
        if A(j,i) > 5
            B(j,i) = A(j,i) * 2;
        else
            B(j,i) = A(j,i) + 5;
        end
    end
end

fprintf('Matriz A:\n');
disp(A);
fprintf('Matriz B:\n');
disp(B);
fprintf('Matriz B transposta:\n');
disp(B');
fprintf('Primeira linha de B:\n');
disp(B(1,:));
fprintf('Terceira coluna de B:\n');
disp(B(:,3));

%% ================== EXERCÍCIO 7 ==================
fprintf('\n--- EXERCÍCIO 7 ---\n');

A = [5 12 7 3 9 14];

[soma, media] = analisa_vetor(A);

if media >= 8
    disp('Media elevada');
else
    disp('Media abaixo de 8');
end

fprintf('Soma: %.2f\n', soma);
fprintf('Media: %.2f\n', media);

%% ================== EXERCÍCIO 8 ==================
fprintf('\n--- EXERCÍCIO 8 ---\n');

A = [1 5 3 8;
     6 2 7 4];

B = zeros(size(A));

B = transforma_matriz(A, B);

disp(B);

%% ================== EXERCÍCIO 9 ==================
fprintf('\n--- EXERCÍCIO 9 ---\n');

a = input('Digite valor 1: ','s');
b = input('Digite valor 2: ','s');

disp(a);
disp(b);

num1 = str2num(a);
num2 = str2num(b);

soma = num1 + num2;
mult = num1 * num2;

fprintf('Soma: %.2f\n', soma);
fprintf('Multiplicacao: %.2f\n', mult);

if soma > 20
    disp('Soma alta');
elseif soma == 20
    disp('Soma igual a 20');
else
    disp('Soma baixa');
end

%% ================== EXERCÍCIO 10 ==================
fprintf('\n--- EXERCÍCIO 10 ---\n');

dados = [12 18 10 25 15];

fprintf('Soma: %.2f\n', sum(dados));
fprintf('Media: %.2f\n', mean(dados));
fprintf('Maior: %.2f\n', max(dados));
fprintf('Menor: %.2f\n', min(dados));

media = mean(dados);
cont = 0;

for i = 1:length(dados)
    if dados(i) >= media
        cont = cont + 1;
    end
end

disp('1 - Barras');
disp('2 - Pizza');

op = input('Escolha: ');

switch op
    case 1
        bar(dados);
        title('Grafico de Barras');
    case 2
        pie3(dados);
        title('Grafico de Pizza');
    otherwise
        warning('Nenhum grafico criado');
end

if cont > length(dados)/2
    disp('Maioria acima ou igual a media');
else
    disp('Menos da metade acima ou igual a media');
end

%% ================== FUNÇÕES ==================
function [soma, media] = analisa_vetor(v)
    soma = sum(v);
    media = mean(v);
end

function B = transforma_matriz(A, B)
    for j = 1:size(A,1)
        for i = 1:size(A,2)
            if A(j,i) >= 5
                B(j,i) = A(j,i)*2*exp(1);
            else
                B(j,i) = A(j,i)*2;
            end
        end
    end
end