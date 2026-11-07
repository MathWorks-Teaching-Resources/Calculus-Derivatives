function [myFun, varChoice, probType] = GenFun(varOpts,types)
% GenProb randomly selects a problem type and calls genProbType
%
% Inputs: varOpts is an array of possible variables
% Outputs: myFun is a symbolic function
%          varChoice is the independent variable
%          probType is an integer tracking the type of question asked

% Determine a problem type randomly from the set [1,2,3]
% Type 1 is a simple derivative, Type 2 is a product rule and
% Type 3 is a chain rule
probType = randi(types,1);
[myFun,varChoice] = GenFunType(varOpts,probType);
end

%[appendix]{"version":"1.0"}
%---
