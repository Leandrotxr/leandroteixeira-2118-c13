clc;
clear;

%% 1. Entrada e saída
fprintf('--- 1. Entrada e saída ---\n');

cidade = input('Digite o nome da cidade: ', 's');

fprintf('Cidade escolhida: %s\n', cidade);


%% 2. if, elseif e else
fprintf('\n--- 2. IF ---\n');

x = 7;

if x > 10
    disp('Maior que 10');
elseif x == 10
    disp('Igual a 10');
else
    disp('Menor que 10');
end


%% 3. for
fprintf('\n--- 3. FOR ---\n');

for i = 1:5
    resultado = i * 3;
    fprintf('i = %d -> %d\n', i, resultado);
end


%% 4. while
fprintf('\n--- 4. WHILE ---\n');

x = 0;
i = 0;

while i < 5
    x = x + 1;
    i = i + 1;

    fprintf('Iteração %d -> x = %d\n', i, x);
end


%% 5. switch e função
fprintf('\n--- 5. SWITCH ---\n');

opcao = 2;

switch opcao
    case 1
        disp('Opcao A');
    case 2
        disp('Opcao B');
    case 3
        disp('Opcao C');
    otherwise
        disp('Opcao invalida');
end


fprintf('\n--- 6. FUNÇÃO ---\n');

valor = 5;
resultado = funcao_triplo(valor);

fprintf('Triplo de %d = %d\n', valor, resultado);


%% FUNÇÃO LOCAL
function resultado = funcao_triplo(valor)
resultado = valor * 3;
end