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

    methods(TestMethodTeardown)

        function cleanUpFigures(testCase)
            figures = findall(groot, 'Type', 'figure');
            figures = flipud(figures);
            if ~isempty(figures)
                for iFigure = 1:size(figures, 1)
                    if ~isempty(figures(iFigure).Number)
                        figDiag = matlab.unittest.diagnostics.FigureDiagnostic(figures(iFigure), 'Formats', 'png');
                        log(testCase, 1, figDiag);
                    end
                end
            end

            % Cleanup avoids cross-test contamination in desktop and CI runs.
            close all force
            if any(matlab.addons.installedAddons().Name == "Simulink")
                bdclose all
            end
        end
    end  % TestMethodTeardown

end % classdef