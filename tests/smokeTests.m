% Run these tests with runMyTests
classdef smokeTests < matlab.unittest.TestCase

    methods(Test)

        function runTayPoly(testCase)
            import matlab.unittest.diagnostics.FigureDiagnostic;
            testCase.log("Running TaylorPolynomials.mlx")
            fig = figure;
            testCase.addTeardown(@close,fig)
            TaylorPolynomials
        end

        function runDerDef(testCase)
            import matlab.unittest.diagnostics.FigureDiagnostic;
            testCase.log("Running derivativeDefintion.mlx")
            fig = figure;
            testCase.addTeardown(@close,fig)
            derivativeDefinition
            testCase.log(3,FigureDiagnostic(fig))
        end

        function runRulesPowers(testCase)
            import matlab.unittest.diagnostics.FigureDiagnostic;
            fig = figure;
            testCase.addTeardown(@close,fig)
            testCase.log("Running derivativeRulesPowers.mlx")
            derivativeRulesPowers
        end

        function runTran(testCase)
            import matlab.unittest.diagnostics.FigureDiagnostic;
            testCase.log("Running derivativeRulesTranscendentals.mlx")
            fig = figure;
            testCase.addTeardown(@close,fig)
            derivativeRulesTranscendentals
            testCase.log(3,FigureDiagnostic(fig))
        end

        function runComb(testCase)
            import matlab.unittest.diagnostics.FigureDiagnostic;
            testCase.log("Running derivativeRulesCombinations.mlx")
            fig = figure;
            testCase.log(3,FigureDiagnostic(fig))
            testCase.addTeardown(@close,fig)
            derivativeRulesCombinations
        end

        function runFlashcards(testCase)
            CalculusFlashcards
        end

    end

end