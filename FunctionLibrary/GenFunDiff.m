function [myFun,type] = GenFunDiff(var,bds,prevType)
% GenFunDiff generates a random function with a simple derivative
%
% Inputs: var is the independent variable
%         bds is a 1x2 vector of increasing integer values that set
%             the range for the coefficients
%         prevType is an integer that identifies the type of function
%             created last
% Outputs: myFun is the generated symbolic function
syms h(t)                    % Create a symbolic function h(t)
params = randi(bds,[1 4]);   % Randomly choose parameter values
shift = randi([0 bds(2)],1); % Randomly choose a shift that may be 0
sgns = randi([0 1],[1 3]);   % Randomly choose +/- signs
type = randi([1 6],1);       % Randomly choose the function type

% For readability, create parameters a,b,c, and d
a = (-1)^sgns(1)*params(1);
b = (-1)^sgns(2)*params(2);
c = max(params(3),params(4));  % c > 0, it is only used as a denominator
d = (-1)^sgns(3)*shift;

switch type
    case 1
        h(t) = a*t^(b);
    case 2
        h(t) = a*t^(b/c);
    case 3
        h(t) = a*exp(b*t);
        if prevType ~= 3
            disp("Remember that exp(x) is the notation for e^x in MATLAB.")
        end
    case 4
        h(t) = a*log(abs(b)*t);
        if prevType ~= 4
            disp("Remember that log(x) is the notation for a natural logarithm in MATLAB.")
        end
    case 5
        h(t) = a*sin(b*t+d);
    case 6
        h(t) = a*cos(b*t+d);
end

myFun = h(var);
end
% <matlab:ShareFeedback Share your feedback>

%[appendix]{"version":"1.0"}
%---
