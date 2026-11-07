function [myFun, varChoice] = GenFunType(varOpts, probType)
% genProbType sets up a variable and generates a randomized function
%
% Inputs: varOpts is an array of possible variables
%         probType is a string that identifies the function type
% Outputs: myFun is a symbolic function
%          varChoice is the independent variable
%          probType is an integer tracking the type of question asked
%          [a, b] are the bounds for the definite integral, if required

% Randomly select a variable from the set varOpts
varChoice = varOpts(randi([1 length(varOpts)], 1));

% Use GenFunDiff to generate simple functions
% GenFunDiff is defined in FunctionLibrary
% The inputs to GenFunDiff are the variable varChoice, a range of values
% from which to select coefficients and a value indicating which warnings
% have already been printed during problem generation
switch probType
    case 1 % Simple derivative
        myFun = GenFunDiff(varChoice,[1,10],[]);  % Generate myFun
    case 2 % Product rule derivative
        syms p(x) q(x)
        [p(x),oldType] = GenFunDiff(x,[1,7],[]);
        q(x) = GenFunDiff(x,[1, 7],oldType);
        myFun = p(varChoice)*q(varChoice);        % Generate myFun
    case 3 % Chain rule derivative
        syms p(x) q(x)
        [p(x),oldType] = GenFunDiff(x,[1,3],[]);
        q(x) = GenFunDiff(x,[1,5],oldType);
        myFun = p(q(varChoice));                 % Generate myFun
end
end

%[appendix]{"version":"1.0"}
%---
