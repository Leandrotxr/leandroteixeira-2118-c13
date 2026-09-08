clc;
clear;

%% Exercício 1

K = 1.8;
tau = 1.2;

% Funcao de transferencia
G = tf(K,[tau 1]);

% Caracteristicas
polo = -1/tau;
tempo_subida = 2.2*tau;       
tempo_acomodacao = 4*tau;     
ganho_regime = dcgain(G);
valor_final = K;

fprintf('\n========== EXERCICIO 1 ==========\n');
fprintf('Ganho K = %.4f\n',K);
fprintf('Constante de tempo = %.4f s\n',tau);
fprintf('Funcao de transferencia:\n');
disp(G);

fprintf('Polo = %.4f\n',polo);
fprintf('Tempo de subida = %.4f s\n',tempo_subida);
fprintf('Tempo de acomodacao = %.4f s\n',tempo_acomodacao);
fprintf('Ganho em regime permanente = %.4f\n',ganho_regime);
fprintf('Valor final = %.4f\n',valor_final);

% Resposta ao degrau unitario
t = linspace(0,8,2000);

[y,t] = step(G,t);

figure;
plot(t,y,'LineWidth',1.5);
title('Resposta ao degrau unitario');
xlabel('Tempo (s)');
ylabel('Saida');
legend('G(s) = 1.8/(1.2s + 1)');
grid on;

% Degrau de amplitude 2.5
amplitude = 2.5;

[y2,t2] = step(amplitude*G,t);

valor_final_2 = dcgain(amplitude*G);

fprintf('\nPara degrau de amplitude %.2f:\n',amplitude);
fprintf('Novo valor final = %.4f\n',valor_final_2);

figure;
plot(t2,y2,'LineWidth',1.5);
title('Degrau de amplitude 2.5');
xlabel('Tempo (s)');
ylabel('Saida');
legend('Resposta');
grid on;

% Quanto menor a constante de tempo, mais rapida e a resposta.
% Quanto mais a esquerda estiver o polo, mais rapida tende a ser a resposta.

%% Exercício 2

GA = tf(25,[1 3 25]);
GB = tf(25,[1 10 25]);
GC = tf(25,[1 16 25]);

sistemas = {GA,GB,GC};
nomes = {'Sistema A','Sistema B','Sistema C'};

fprintf('\n========== EXERCICIO 2 ==========\n');

for i = 1:3

    G = sistemas{i};

    [num,den] = tfdata(G,'v');

    wn = sqrt(den(3));
    zeta = den(2)/(2*wn);
    polos = pole(G);
    ganho = dcgain(G);

    if zeta < 1
        tipo = 'Subamortecido';
    elseif zeta == 1
        tipo = 'Criticamente amortecido';
    else
        tipo = 'Superamortecido';
    end

    fprintf('\n%s\n',nomes{i});

    fprintf('Funcao de transferencia:\n');
    disp(G);

    fprintf('Polos:\n');
    disp(polos);

    fprintf('Frequencia natural = %.4f rad/s\n',wn);
    fprintf('Coeficiente de amortecimento = %.4f\n',zeta);
    fprintf('Tipo de resposta = %s\n',tipo);
    fprintf('Ganho em regime permanente = %.4f\n',ganho);

end

% Respostas ao degrau
t = linspace(0,8,2000);

figure;
hold on;

for i = 1:3
    [y,t] = step(sistemas{i},t);
    plot(t,y,'LineWidth',1.5);
end

title('Exercicio 2 - Resposta ao degrau');
xlabel('Tempo (s)');
ylabel('Saida');
legend(nomes);
grid on;

hold off;

% Posicao dos polos
figure;
hold on;

for i = 1:3

    p = pole(sistemas{i});

    plot(real(p),imag(p),'x',...
        'MarkerSize',10,...
        'LineWidth',2);

end

xline(0,'--');
yline(0,'--');

title('Exercicio 2 - Posicao dos polos');
xlabel('Parte real');
ylabel('Parte imaginaria');
legend(nomes);
grid on;

hold off;

fprintf('\nSistema escolhido: Sistema B\n');

% O Sistema B e escolhido porque nao apresenta sobressinal.
% Alem disso, ele e mais rapido que o Sistema C, que tambem nao apresenta sobressinal.

%% Exercício 3

G1 = tf(16,[1 2.8 16]);
G2 = tf(25,[1 6.5 25]);

sistemas = {G1,G2};
nomes = {'Sistema 1','Sistema 2'};

fprintf('\n========== EXERCICIO 3 ==========\n');

for i = 1:2

    G = sistemas{i};

    % Informacoes da resposta
    info = stepinfo(G,'SettlingTimeThreshold',0.02);

    [num,den] = tfdata(G,'v');

    wn = sqrt(den(3));
    zeta = den(2)/(2*wn);

    polos = pole(G);
    valor_final = dcgain(G);

    % Tempo para atingir 50% do valor final
    tt = linspace(0,8,20000);
    [yy,tt] = step(G,tt);

    indice = find(yy >= 0.5*valor_final,1);

    tempo_50 = tt(indice);

    fprintf('\n%s\n',nomes{i});

    fprintf('Valor final = %.4f\n',valor_final);
    fprintf('Tempo para atingir 50%% = %.4f s\n',tempo_50);
    fprintf('Tempo de subida = %.4f s\n',info.RiseTime);
    fprintf('Tempo de pico = %.4f s\n',info.PeakTime);
    fprintf('Valor do primeiro pico = %.4f\n',info.Peak);
    fprintf('Maximo sobressinal = %.4f %%\n',info.Overshoot);
    fprintf('Tempo de acomodacao (2%%) = %.4f s\n',info.SettlingTime);
    fprintf('Frequencia natural = %.4f rad/s\n',wn);
    fprintf('Coeficiente de amortecimento = %.4f\n',zeta);

    fprintf('Polos:\n');
    disp(polos);

end

% Comparacao das respostas
t = linspace(0,8,2000);

figure;
hold on;

for i = 1:2

    [y,t] = step(sistemas{i},t);

    plot(t,y,'LineWidth',1.5);

end

title('Exercicio 3 - Comparacao das respostas');
xlabel('Tempo (s)');
ylabel('Saida');
legend(nomes);
grid on;

hold off;

% Verificacao dos requisitos
info1 = stepinfo(G1,'SettlingTimeThreshold',0.02);
info2 = stepinfo(G2,'SettlingTimeThreshold',0.02);

fprintf('\n========== VERIFICACAO DOS REQUISITOS ==========\n');

fprintf('Sistema 1:\n');
fprintf('Sobressinal = %.2f %%\n',info1.Overshoot);
fprintf('Tempo de acomodacao = %.4f s\n',info1.SettlingTime);

if info1.Overshoot < 10 && info1.SettlingTime < 1.5
    fprintf('Sistema 1 ATENDE aos requisitos.\n');
else
    fprintf('Sistema 1 NAO atende aos requisitos.\n');
end

fprintf('\nSistema 2:\n');
fprintf('Sobressinal = %.2f %%\n',info2.Overshoot);
fprintf('Tempo de acomodacao = %.4f s\n',info2.SettlingTime);

if info2.Overshoot < 10 && info2.SettlingTime < 1.5
    fprintf('Sistema 2 ATENDE aos requisitos.\n');
else
    fprintf('Sistema 2 NAO atende aos requisitos.\n');
end

% O Sistema 1 apresenta maior oscilacao e maior sobressinal.
% O Sistema 2 apresenta menor sobressinal e atende aos requisitos da aplicacao.

%% Exercício 4

% Configuracoes
zeta = [0.35 0.55 0.70 0.80];
wn = [6 5 4 3.2];

nomes = {
    'Configuracao A'
    'Configuracao B'
    'Configuracao C'
    'Configuracao D'
};

sistemas = cell(1,4);

fprintf('\n========== EXERCICIO 4 ==========\n');

for i = 1:4

    % Forma padrao:
    % G(s) = wn^2 / (s^2 + 2*zeta*wn*s + wn^2)

    sistemas{i} = tf(wn(i)^2,...
        [1 2*zeta(i)*wn(i) wn(i)^2]);

    info = stepinfo(sistemas{i},...
        'SettlingTimeThreshold',0.02);

    fprintf('\n%s\n',nomes{i});

    fprintf('Zeta = %.2f\n',zeta(i));
    fprintf('Wn = %.2f rad/s\n',wn(i));

    fprintf('Funcao de transferencia:\n');
    disp(sistemas{i});

    fprintf('Polos:\n');
    disp(pole(sistemas{i}));

    fprintf('Maximo sobressinal = %.4f %%\n',info.Overshoot);
    fprintf('Tempo de subida = %.4f s\n',info.RiseTime);
    fprintf('Tempo de pico = %.4f s\n',info.PeakTime);
    fprintf('Tempo de acomodacao = %.4f s\n',info.SettlingTime);
    fprintf('Valor final = %.4f\n',dcgain(sistemas{i}));

end

% Respostas ao degrau
t = linspace(0,8,2000);

figure;
hold on;

for i = 1:4

    [y,t] = step(sistemas{i},t);

    plot(t,y,'LineWidth',1.5);

end

title('Exercicio 4 - Respostas ao degrau');
xlabel('Tempo (s)');
ylabel('Saida');
legend(nomes);
grid on;

hold off;

% Verificacao dos requisitos
fprintf('\n========== REQUISITOS ==========\n');

validas = [];

for i = 1:4

    info = stepinfo(sistemas{i},...
        'SettlingTimeThreshold',0.02);

    if info.Overshoot < 10 && info.SettlingTime < 1.5

        validas(end+1) = i;

        fprintf('%s ATENDE aos requisitos.\n',nomes{i});

    else

        fprintf('%s NAO atende aos requisitos.\n',nomes{i});

    end

end

% Escolha da configuracao com menor tempo de subida
tempos_subida = [];

for i = 1:length(validas)

    info = stepinfo(sistemas{validas(i)},...
        'SettlingTimeThreshold',0.02);

    tempos_subida(i) = info.RiseTime;

end

[menor_tempo,posicao] = min(tempos_subida);

melhor = validas(posicao);

fprintf('\nMelhor configuracao: %s\n',nomes{melhor});
fprintf('Tempo de subida = %.4f s\n',menor_tempo);

% Os graficos mostram que o aumento do amortecimento reduz o sobressinal.
% A configuracao escolhida e a que atende aos dois requisitos e apresenta menor tempo de subida.

%% Exercício 5

% Equipamento A - primeira ordem
GA = tf(2,[1.2 1]);

% Equipamento B - segunda ordem
GB = tf(32,[1 5.6 16]);

fprintf('\n========== EXERCICIO 5 ==========\n');

%% Equipamento A

infoA = stepinfo(GA,...
    'SettlingTimeThreshold',0.02);

poloA = pole(GA);
ganhoA = dcgain(GA);
valor_final_A = ganhoA;

fprintf('\nEquipamento A - Primeira ordem\n');

fprintf('Polo:\n');
disp(poloA);

fprintf('Ganho em regime permanente = %.4f\n',ganhoA);
fprintf('Valor final = %.4f\n',valor_final_A);
fprintf('Tempo de subida = %.4f s\n',infoA.RiseTime);
fprintf('Tempo de acomodacao = %.4f s\n',infoA.SettlingTime);

%% Equipamento B

infoB = stepinfo(GB,...
    'SettlingTimeThreshold',0.02);

poloB = pole(GB);

[num,den] = tfdata(GB,'v');

wnB = sqrt(den(3));
zetaB = den(2)/(2*wnB);

ganhoB = dcgain(GB);
valor_final_B = ganhoB;

fprintf('\nEquipamento B - Segunda ordem\n');

fprintf('Polos:\n');
disp(poloB);

fprintf('Ganho em regime permanente = %.4f\n',ganhoB);
fprintf('Valor final = %.4f\n',valor_final_B);
fprintf('Tempo de subida = %.4f s\n',infoB.RiseTime);
fprintf('Tempo de acomodacao = %.4f s\n',infoB.SettlingTime);
fprintf('Frequencia natural = %.4f rad/s\n',wnB);
fprintf('Coeficiente de amortecimento = %.4f\n',zetaB);
fprintf('Tempo de pico = %.4f s\n',infoB.PeakTime);
fprintf('Valor do primeiro pico = %.4f\n',infoB.Peak);
fprintf('Maximo sobressinal = %.4f %%\n',infoB.Overshoot);

%% Resposta ao degrau unitario

t = linspace(0,8,2000);

[yA,tA] = step(GA,t);
[yB,tB] = step(GB,t);

figure;
hold on;

plot(tA,yA,'LineWidth',1.5);
plot(tB,yB,'LineWidth',1.5);

title('Exercicio 5 - Degrau unitario');
xlabel('Tempo (s)');
ylabel('Saida');
legend('Equipamento A','Equipamento B');
grid on;

hold off;

%% Degrau de amplitude 1.5

amplitude = 1.5;

[yA15,tA15] = step(amplitude*GA,t);
[yB15,tB15] = step(amplitude*GB,t);

valor_final_A15 = dcgain(amplitude*GA);
valor_final_B15 = dcgain(amplitude*GB);

fprintf('\nPara degrau de amplitude 1.5:\n');

fprintf('Equipamento A - valor final = %.4f\n',...
    valor_final_A15);

fprintf('Equipamento B - valor final = %.4f\n',...
    valor_final_B15);

figure;
hold on;

plot(tA15,yA15,'LineWidth',1.5);
plot(tB15,yB15,'LineWidth',1.5);

title('Exercicio 5 - Degrau de amplitude 1.5');
xlabel('Tempo (s)');
ylabel('Saida');
legend('Equipamento A','Equipamento B');
grid on;

hold off;

% O Equipamento B apresenta uma resposta mais rapida que o Equipamento A.
% O Equipamento A nao possui sobressinal, enquanto o Equipamento B possui sobressinal.
% Em regime permanente, os dois equipamentos possuem o mesmo ganho e atingem o mesmo valor final.