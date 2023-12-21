% Run these tests with 
% runMyTests
% OR
% results = runtests(tLibrary)
% table(results)
classdef FunctionTests < matlab.unittest.TestCase

    methods(Test)
        function RunShowTaylor(testCase)
            % Test that correct answers are marked correct
            T = ShowTaylor(@cos,3,[-2,2],0);
            % T should be 1-x^2/2
            syms x
            E = str2sym("1-x^2/2");
            verifyTrue(testCase,isAlways(T==E))
        end

    end % methods

end % classdef