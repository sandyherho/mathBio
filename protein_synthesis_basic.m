clear all; close all; clc

tMax1=5e3; dt=0.01; tMax2=tMax1*dt;
p=1; k=0.1;
E=zeros(1, tMax1);

%% Euler
for t=1:tMax1-1
    E(t+1) = (p-k*E(t)) * dt + E(t);
end
E1 = zeros(1, tMax2);

%% Exact
for t2=1:tMax2
    E1(t2) = E((t2 -1) / dt + 1);
end

t2 = 1:tMax2;
E2(1,:) = (1 - exp(-k*(t2 -1))) * p/k;

%% Plot
plot(t2, E1, "ro", t2, E2, "b*")
grid on
xlabel("$t$", Interpreter="latex")
ylabel("$E(t)$", Interpreter="latex")
legend("Euler", "Exact")