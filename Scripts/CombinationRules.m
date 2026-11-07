%[text] # Derivative Rules for Combinations of Functions
%[text] [⇦ Main Menu](file:../MainMenu.m)
%[text] As presented in [Derivative Rules for Powers](file:./PowerRules.m) and [Derivative Rules for Transcendental Functions](file:./TranscendentalsRules.m)
%[text]{"align":"center"} $\\begin{array}{clc} \\text{\\underline{Power \\& Linearity Rules}} & \\hspace{0.3in} & \\text{\\underline{Transcendental Rules}} \\\\\[1em\] \\displaystyle\\frac{d}{dx}\\left\[x^n\\right\] = nx^{n-1}\\quad\\text{for constant }n && \\displaystyle\\frac{d}{dx}\\left\[\\sin(x)\\right\] = \\cos(x) \\hspace{0.2in} \\displaystyle\\frac{d}{dx}\\left\[e^x\\right\] = e^x \\\\\[1em\] \\displaystyle\\frac{d}{dx}\\left\[cf(x)\\right\] = c\\frac{df}{dx}\\quad\\text{for constant }c && \\displaystyle\\frac{d}{dx}\\left\[\\cos(x)\\right\] = -\\sin(x) \\hspace{0.2in}  \\displaystyle\\frac{d}{dx}\\left\[\\ln(x)\\right\] = \\frac{1}{x} \\\\\[1em\] \\displaystyle\\frac{d}{dx}\\left\[f(x)+g(x)\\right\] = \\frac{df}{dx}+\\frac{dg}{dx} & {} & {} \\end{array}${"altText":"Power and linearity rules: d\/dx \[x^n\] = n x^(n-1), for constant n; d\/dx \[c f(x)\] = c df\/dx, for constant c; d\/dx \[f(x)+g(x)\] = df\/dx + dg\/dx. Transcendental rules: d\/dx \[sin(x)\] = cos(x); d\/dx \[cos(x)\] = -sin(x); d\/dx \[e^x\] = e^x; d\/dx \[ln(x)\] = 1\/x."}
%[text] With the exception of polynomials, however, most common functions are still missing from this list of rules. This script will present the two remaining fundamental rules for computing the derivatives of combinations of functions and present applications of these rules to a variety of mathematical and real-world situations.
%[text:tableOfContents]{"heading":"Table of Contents"}
%[text] %[text:anchor:H_51183E7B] **Before you get started:**
%[text] %[text:anchor:H_BF646A47] This live script is intended to be used with the code hidden. On the **View** tab of the MATLAB toolstrip, in the **View** section, select **Hide Code**.  Alternately, select **Hide Code** using the icon ![live script code hidden icon](text:image:1249) at the top right of the Live Editor pane.
%[text] ![Lightbulb mark](text:image:2a00) Although the code is hidden, some interactivity requires familiarity with MATLAB. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2 hour online tutorial that teaches the essentials of MATLAB.
%[text] ![Warning symbol](text:image:907e)   For an optimal experience, follow the instructions and steps in the given sequence. Proceed to a new section only after completing the preceding one. Some sections depend on variables created in prior sections and will generate errors if run out of order.
%[text] ## Chain Rule
%[text] Consider two functions $y = f(x)${"altText":"y = f(x)"} and $z = g(x)${"altText":"z = g(x)"}. After forming a new function $y\_2 = f(z) = f(g(x))${"altText":"y\_2 = f(z) = f(g(x))"} by composing $(f \\circ g)(x)${"altText":"(f composed with g)(x)"}, what is the derivative? 
%[text] ### Derivation of the Chain Rule
%[text] %[text:anchor:H_E603E829] The answer depends on being a bit more specific. What is the independent variable in the question about the derivative of a function created by composing two functions? If it is $z${"altText":"z"} there is nothing new going on:
%[text]{"align":"center"} $\\frac{dy\_2}{dz} = \\frac{d}{dz}\\left\[f(z)\\right\] = \\frac{df}{dz} = f'(z)${"altText":"(dy\_2)\/(dz) = (d)\/(dz)\[f(z)\] = (df)\/(dz) = f'(z)"}
%[text] If it is $x${"altText":"x"}, though, then:
%[text]{"align":"center"} $\\frac{dy\_2}{dx} = \\frac{d}{dx}\\left\[(f\\circ g)(x)\\right\] = \\lim\_{\\Delta x \\to 0} \\frac{f(g(x+\\Delta x))-f(g(x))}{\\Delta x}${"altText":"(dy\_2)\/(dx) = (d)\/(dx)\[(f composed with g)(x)\] = limit as Delta x -\> 0 of (f(g(x+Delta x))-f(g(x)))\/(Delta x)"} 
%[text]{"align":"center"}  $=\\lim\_{\\Delta x\\to 0} \\left(\\frac{f((g(x+\\Delta x)-g(x))+g(x))-f(g(x))}{g(x+\\Delta x)-g(x)}\\right)\\left(\\frac{g(x+\\Delta x)-g(x)}{\\Delta x}\\right)${"altText":"= limit as Delta x -\> 0 of ((f((g(x+Delta x)-g(x))+g(x))-f(g(x)))\/(g(x+Delta x)-g(x)))((g(x+Delta x)-g(x))\/(Delta x))"}
%[text] Let $\\Delta g = g(x+\\Delta x) -g(x)${"altText":"Delta g = g(x+Delta x) -g(x)"} denote the change in the $g${"altText":"g"} value as a function of the change in the $x${"altText":"x"} value $\\Delta x${"altText":"Delta x"}. Then:
%[text]{"align":"center"} $\\frac{dy\_2}{dx} =\\lim\_{\\Delta x \\to 0}\\left(\\frac{f(g+\\Delta g)-f(g)}{\\Delta g}\\right)\\left(\\frac{g(x+\\Delta x)-g(x)}{\\Delta x}\\right)${"altText":"(dy\_2)\/(dx) = limit as Delta x -\> 0 of ((f(g+Delta g)-f(g))\/(Delta g))((g(x+Delta x)-g(x))\/(Delta x))"} 
%[text] Note that $\\lim\_{\\Delta x \\to 0} \\Delta g = \\lim\_{\\Delta x \\to 0} g(x+\\Delta x)-g(x) = 0${"altText":"limit as Delta x -\> 0 of Delta g = limit as Delta x -\> 0 of g(x+Delta x)-g(x) = 0"}, so:
%[text]{"align":"center"}  $\\frac{dy\_2}{dx} = \\left(\\lim\_{\\Delta g \\to 0} \\frac{f(g+\\Delta g)-f(g)}{\\Delta g}\\right)\\left(\\lim\_{\\Delta x \\to 0}\\frac{g(x+\\Delta x)-g(x)}{\\Delta x}\\right)${"altText":"(dy\_2)\/(dx) = (limit as Delta g -\> 0 of (f(g+Delta g)-f(g))\/(Delta g))(limit as Delta x -\> 0 of (g(x+Delta x)-g(x))\/(Delta x))"}
%[text]{"align":"center"} $=\\frac{df}{dg}\\cdot \\frac{dg}{dx}${"altText":"=(df)\/(dg) \* (dg)\/(dx)"} 
%[text]{"align":"center"}  $=f'(g)\\cdot g'(x) = f'(g(x))\\cdot g'(x)${"altText":"=f'(g) \* g'(x) = f'(g(x)) \* g'(x)"} 
%[text] 
%[text] Visualize the chain rule by setting up functions `f(x)` and `g(x)` as well as choosing upper and lower bounds for the domain:
syms x                         % Create a symbolic variable x
figure 
f(x) =  x^3;   % User-defined function f(x), by default x^3 %[control:editfield:701e]{"position":[8,12]}
g(x) =  -.4*x+2;   % User-defined function g(x), by default -.4*x+2 %[control:editfield:8255]{"position":[8,16]}
a = -5;      % User-defined value of a, by default -5 %[control:editfield:0126]{"position":[5,7]}
b = 5;      % User-defined value of b, by default 5 %[control:editfield:3d7f]{"position":[5,6]}
if a < b                       % Check if a < b to ensure that instructions were followed
    bds = [a, b];
else                           % If ~(a<b), set the default bounds and warn the user
    bds = [-5, 5];
    disp("Your lower bound is not lower than your upper bound. Using default bounds of [-5, 5].")
end
                     % Run this section %[control:button:121b]{"position":[1,2]}
% Set up and display the user-defined functions to the user
fx = f(x);                     % Set up the function to display its value
gx = g(x);                     % Set up the function to display its value
disp("The original functions are:")
displayFormula("f(x) = fx")
displayFormula("g(x) = gx")
% Then set up and display the combined function
disp("Combining the functions through composition:")
fg = f(g(x));                    % Set up the function to display its value
displayFormula("f(g(x)) = fg")   % Display the composed result
disp("Therefore,")
fg0 = f(g(bds(1)));              % Set up the function to display its value
g0 = g(bds(1));                  % Set up the function to display its value
a0 = bds(1);                     % Set up the point to display its value
displayFormula("g(a0) = g0")       % Display the result of evaluating g() at a point
disp("and")
displayFormula("f(g(a0)) = fg0") % Display the result of evaluating f(g()) at a point
ShowChainRule(@(x)f(x),@(x)g(x),bds,"f","g");
%%
%[text] Then animate this plot by observing how the derivative of the combined function `f(g(x))` relates to the derivatives of each subcomponent `f(g)` and `g(x)`.
                  % Run this section %[control:button:90d4]{"position":[1,2]}
if ~exist("f","var") || ~exist("g","var") || ~exist("bds","var")
    % If the previous section hasn't run, set up the default values for the required variables
    syms x
    f(x) = x^3;
    g(x) = -.4*x+2;
    bds = [-5 5];
end
[fh,gh,bds,gMin,gMax,cT,pf,pfT,pfg,pfgT,pg,pgT] = ShowChainRule(@(x)f(x),@(x)g(x),bds,"f","g");
AnimateChainRule(fh,gh,bds,gMin,gMax,cT,pf,pfT,pfg,pfgT,pg,pgT);
% AnimateChainRule is defined in Local Helper Functions
% AnimateChainRule loops over 100 values in bds to show how the derivative
% of the composite function is the product of the derivatives df/dg and
% dg/dx, such as when both left-hand tangents have negative slope but the
% right-hand tangent has a positive slope, etc.
%%
%[text] ### Application: Pendulum
%[text]{"align":"center"} ![A pendulum deflected by a small angle theta from equilibrium](text:image:3e86)
%[text] It can be shown that for small angles, the angle as a function of time for a pendulum is:
%[text]{"align":"center"} $\\theta(t) = \\theta\_0 \\enspace \\cos \\left(t\\sqrt{\\frac{g}{L}} \\right)${"altText":"theta(t) = theta\_0 cos (tsqrt((g)\/(L)) )"}
%[text] where $g${"altText":"g"} is acceleration due to gravity, $L${"altText":"L"} is the length of the pendulum, and $\\theta\_0${"altText":"theta\_0"} is the initial angle of the pendulum. The angular velocity of the pendulum, $\\omega(t)${"altText":"omega(t)"}, can be found by taking the derivative of $\\theta(t)${"altText":"theta(t)"} with respect to $t${"altText":"t"}. 
%[text] ![](text:image:1709) **Exercise 1**.
%[text] 1. Find the expression for angular velocity $\\frac{d\\theta}{dt} = \\omega(t)${"altText":"(dtheta)\/(dt) = omega(t)"}.
%[text] 2.  Based on your knowledge of a pendulum, where would you expect the angular velocity to be zero? After thinking about this, use the expression you just found for $\\omega(t)${"altText":"omega(t)"}and find a time (other than $t = 0${"altText":"t = 0"}) where the pendulum is at rest. At this time, what is the value of $\\theta(t)${"altText":"theta(t)"}? Is it where you would expect it to be?
%[text] 3. Similarly, the angular acceleration, $\\alpha(t)${"altText":"alpha(t)"}, of the pendulum can be found as the derivative of the angular velocity with respect to time. Find the expression for angular acceleration $\\frac{d^2\\theta}{dt^2}=\\alpha(t)${"altText":"(d^2theta)\/(dt^2)=alpha(t)"}.  \
%%
SelectedPendulumAnswers= false; %[control:checkbox:90c4]{"position":[26,31]}
ShowPendulumAnswers(SelectedPendulumAnswers);
%%
%[text] ### Application: Related Rates
%[text] Consider a classic vinyl record that rotates at 45 rotations per minute on its record player.
% This code draws a tight black spiral with a tight red spiral inside to
% produce the idea of a vinyl record
figure
recFig = DrawRecord;      % DrawRecord is in Local Helper Functions
  %[control:button:156a]{"position":[1,2]}
%%
%[text] This rotational speed means that $\\frac{d\\theta}{dt}${"altText":"(dtheta)\/(dt)"} is a constant. In fact, 45 rotations per minute means 
%[text]{"align":"center"} $\\frac{d\\theta}{dt}${"altText":"(dtheta)\/(dt)"} = $\\left(45\\frac{\\text{rotations}}{\\text{minute}}\\right)\\left(2\\pi \\text{ radians }\\right)\\left(\\frac{1 \\text{ minute}}{60 \\text{ seconds}}\\right)${"altText":"(45(rotations)\/(minute))(2pi radians )((1 minute)\/(60 seconds))"} = $\\frac{3\\pi}{2}${"altText":"(3pi)\/(2)"} radians per second.
%[text] Place a needle near the outer edge of the record with $\\theta = 0${"altText":"theta = 0"} radians and follow its path along $r(\\theta) = \\left(7-\\frac{7}{80}\\theta\\right)${"altText":"r(theta) = (7-(7)\/(80)theta)"} inches and observe it as it progresses towards the inner edge. This path is traced out by the yellow star in the plot below.
thetaN = linspace(0,23*pi,184);
if exist("recFig","var")                     % Check if the record figure has been generated locally
    hold on
    pN = plot(recFig.CurrentAxes,0,7,"y*");  % If so, plot a new point on top of the same figure of the record
    hold off
elseif ~exist("recFigWPt","var")             % Check if the record animation has been run locally
    figure
    recFigWPt = DrawRecord;                  % If not, generate a local figure of the record
    hold on
    pN = plot(0,7,"y*");                     % Then add the point on top of the record figure
    hold off
end
for k = 1:184                                % Animate the position of the needle as the record plays
    pN.XData = (7-7/80*thetaN(k))*cos(thetaN(k));
    pN.YData = (7-7/80*thetaN(k))*sin(thetaN(k));
    drawnow
end
hold off
  %[control:button:07d9]{"position":[1,2]}
%[text] The needle, represented by the yellow star, moves towards the center of the record as time progresses. Use calculus to compute the rate at which $r${"altText":"r"}, the distance from the needle to the center, is changing after 45 seconds of playing time. 
%%
%[text] ![](text:image:8c41) **Exercise 2**.
%[text] 1. What is the angle, $\\theta${"altText":"theta"}, after 45 seconds of playing time? Please give your answer in radians. \
theta = 0;         % User-input solution for theta(45 seconds) in radians %[control:editfield:6040]{"position":[9,10]}
%[text]          2\. What is the angular speed, $\\frac{dr}{d\\theta}${"altText":"(dr)\/(dtheta)"}, after 45 seconds of playing time? Please give your answer in inches per radian.
AngularSpeed = 0;  % User-input solution for dr/dtheta in inches/radian %[control:editfield:3cb2]{"position":[16,17]}
%[text]          3\. What is the linear speed, $\\frac{dr}{dt}${"altText":"(dr)\/(dt)"}, after 45 seconds of playing time? Please give your answer in inches per second.
LinearSpeed = 0;   % User-input solution for dr/dt in inches/second %[control:editfield:048a]{"position":[15,16]}
CheckSpeed(theta,AngularSpeed,LinearSpeed);   % CheckSpeed is defined in Local Helper Functions
% CheckSpeed compares the input solutions of theta, AngularSpeed, and
% LinearSpeed to their correct values and displays feedback. When correct,
% the feedback includes the solution with appropriate units
                           % Run this section %[control:button:9fb0]{"position":[1,2]}
%%
%[text] ### Practice Chain Rule Problems
%[text] Generate randomized practice problems. First, click **Initialize Values** once to get started. Then each time you want a new problem, click the **Generate Problem** button each time to create a new problem. After solving the problem, input your solution as MATLAB code and click the **Check Answer** button.  
%[text] ![](text:image:8279) **Pro-tip**. The variable you use in the solution matters, as does appropriate use of parentheses and multiplication operators. MATLAB syntax is `exp(7*t^(2/3))` for $e^{7t^{2/3}}${"altText":"e^(7t^(2\/3))"}, `sin(7*cos(4*r-6))` for $\\sin(7\\cos(4r-6))${"altText":"sin(7cos(4r-6))"} and `log(z/2)` for $\\ln\\left(\\frac{z}{2}\\right)${"altText":"ln((z)\/(2))"}.
% Clear variables
clear MyFun VarChoice MyAnswer TotPRProbs TotCRProbs TotMDProbs                        
syms t r x z                         % Declare symbolic variables
VarOpts = [t r x z];                 % Define the list of variables to use in the problems
ErrorCount = 0;                      % Initialize a count of errors
TotCRProbs = 0;                      % Initialize a count of total problems attempted
TotAttempts = 0;                     % Initialize a count of total solutions offered
AdjustCount = 0;                     % Preserve the counts if the user resubmits a solution
LastFive = zeros(1,5);               % Initialize a matrix to record the last five solution results
                         % Run this section %[control:button:0ee1]{"position":[1,2]}
disp("Values initialized for Chain Rule Practice.")
%[text]{"align":"center"} \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
%%
%[text] Generate a chain rule problem:
% Check if the previous section has run
% If not, provide inging. If so, generate a problem.
if ~exist("TotCRProbs","var")
    warning("You must initialize values before you can generate a problem.")
else
    [MyFun,VarChoice] = GenProbType(VarOpts,3);  % GenProbType is defined in Local Helper Functions
    % GenProbType sets up a variable and generates a randomized function
    TotCRProbs = TotCRProbs+1;               % Increase the count of total problems attempted
end
                       % Run this section %[control:button:97ab]{"position":[1,2]}
%%
MyAnswer = r;     % User-defined solution, default value t %[control:editfield:8498]{"position":[12,13]}
TotAttempts = TotAttempts + 1;       % Updates count of total attempts at solution
[LastFive,ErrorCount,TotAttempts,AdjustCount] = ResubmissionCheck(TotAttempts,TotCRProbs,AdjustCount,MyFun,VarChoice,MyAnswer,3,ErrorCount,LastFive);
% ResubmissionCheck is defined in Local Helper Functions
% ResubmissionCheck records the attempt and provides appropriate feedback
                          % Run this section %[control:button:7abb]{"position":[1,2]}
%%
%[text] Once you have completed sufficient practice, track the overall results of your practice here:
                        % Run this section %[control:button:8db3]{"position":[1,2]}
AnalyzeResults(TotCRProbs,ErrorCount,TotAttempts,AdjustCount,LastFive)
% AnalyzeResults is defined in Local Helper Functions
% Compute the percentage of initially correct solutions out of the total
% problems attempted, subsequent attempts are not scored
%%
%[text] #### Practice App
%[text] If you would prefer to practice in the Calculus Flashcards app, you can start it by clicking on the image below or clicking the Run Calculus Flashcards App button. You should set it for "Chain Rule" in the Derivatives section. The app will open in a new window.
%[text]{"align":"center"} [![Calculus Flashcards app settings screen](text:image:8bda)](<matlab: CalculusFlashcards>)
  %[control:button:5ee8]{"position":[1,2]}
run("CalculusFlashcards")
%%
%[text] ## Product Rule
syms x                                   % Create a symbolic variable
f = symfun(3*x+1,x);      % User-defined symbolic function, default is 3*x+1 %[control:editfield:5f42]{"position":[12,17]}
g = symfun(2*x^2-x+2,x);      % User-defined symbolic function, default is 2*x^2-x+2 %[control:editfield:71d0]{"position":[12,21]}
pt = 3;         % User-selected pt value, default is 3 %[control:slider:990f]{"position":[6,7]}
h = 0.05;         % User-selected step size h, default is 0.05 %[control:slider:650b]{"position":[5,9]}
                        % Run this section with options selected by the user %[control:button:163a]{"position":[1,2]}
%[text] Select the desired features using the check boxes. `Show animation` cycles through all three individual labels and closes with all labels on. `Show axes` allows explicit investigations of the scale of each component by providing axis labels.
ShowAnimation = false; ShowAxes = true; %[control:checkbox:0af9]{"position":[17,22]} %[control:checkbox:1823]{"position":[35,39]}
%[text] To focus on a particular component or two without the animation, select the corresponding check box. 
ShowFG = false ; ShowChange = false; Showdfdg = false; %[control:checkbox:0571]{"position":[10,15]} %[control:checkbox:6158]{"position":[31,36]} %[control:checkbox:2f9d]{"position":[49,54]}
% If no check boxes are selected, show a simple diagram of the product rule
if ~any([ShowAnimation ShowFG ShowChange Showdfdg])
    try
    ShowProductRule(prAx,f,g,pt,h,cols,ShowAxes);
    catch
        [prAx,cols,bkcol] = ShowProductRuleBasic(f,g,pt,h);
        ShowProductRule(prAx,f,g,pt,h,cols,ShowAxes);
    end
    % ShowProductRule is defined in Local Helper Functions
    % ShowProductRule takes two functions, a point, a step size, a set of
    %     colors, and a flag indicating whether to show the axes of the graph
    %     It generates an image consisting of four colored rectangles:
    %     The first is col1 and represents f*g
    %     The second and third are col3 and represent f*dg and g*df
    %     The fourth is col2 and represents dg*df
end
% If ShowAnimation is selected, animate the figure
if ShowAnimation
    if any([ShowFG ShowChange Showdfdg])
        disp("When the animation is set to run, the individual selections are ignored by the script.")
        disp("To focus on individual selections, please unselect the 'Show animation' check box.")
    end
    try
        AnimateProductRule(prAx,f,g,pt,h,cols,bkcol,ShowAxes) %#ok<*UNRCH>
    catch
        [prAx,cols,bkcol] = ShowProductRuleBasic(f,g,pt,h);
        AnimateProductRule(prAx,f,g,pt,h,cols,bkcol,ShowAxes) %#ok<*UNRCH>
    end
    % AnimateProductRule is defined in Local Helper Functions
    % AnimateProductRule shows the basic product rule visualization and each
    % annotated component for a short time, then finishes with the fully
    % annotated plot
else
    % If any of the annotation boxes are selected, first generate the product
    % rule visualization, then annotate as requested
    if any([ShowFG ShowChange Showdfdg])
        try 
            ShowProductRule(prAx,f,g,pt,h,cols,ShowAxes)
        catch
            [prAx,cols,bkcol] = ShowProductRuleBasic(f,g,pt,h);
            ShowProductRule(prAx,f,g,pt,h,cols,ShowAxes);
        end
        % ShowProductRule is defined in Local Helper Functions
        % ShowProductRule takes two functions, a point, a step size, a set of
        %     colors, and a flag indicating whether to show the axes of the graph
        %     It generates an image consisting of four colored rectangles:
        %     The first is col1 and represents f*g
        %     The second and third are col3 and represent f*dg and g*df
        %     The fourth is col2 and represents dg*df
    end
    % Annotate with Area = f(x)*g(x)
    if ShowFG && ~any([ShowChange Showdfdg])
        AnnProdfg(f,g,pt,h,0)
    elseif ShowFG
        AnnProdfg(f,g,pt,h,1)
    end
    % Annotate with f(x)*dg + g(x)*df
    if ShowChange
        AnnProdChange(f,g,pt,h,cols{3},bkcol)
    end
    % Annotate with df*dg
    if Showdfdg
        AnnProddfdg(f,g,pt,h,cols{2},bkcol)
    end
end
%%
%[text] ### Practice Product Rule Problems
%[text] Generate randomized practice problems. First, click **Initialize Values** once to get started. Then each time you want a new problem, click the **Generate Problem** button each time to create a new problem. After solving the problem, input your solution as MATLAB code and click the **Check Answer** button.  
%[text] ![](text:image:460a) **Pro-tip**. The variable you use in the solution matters, as does appropriate use of parentheses and multiplication operators. MATLAB syntax is `exp(7*t^(2/3))` for $e^{7t^{2/3}}${"altText":"e^(7t^(2\/3))"}, `sin(7*cos(4*r-6))` for $\\sin(7\\cos(4r-6))${"altText":"sin(7cos(4r-6))"} and `log(z/2)` for $\\ln\\left(\\frac{z}{2}\\right)${"altText":"ln((z)\/(2))"}.
% Clear variables
clear MyFun VarChoice MyAnswer TotPRProbs TotCRProbs TotMDProbs
syms t r x z                         % Declare symbolic variables
VarOpts = [t r x z];                 % Define the list of variables to use in the problems
ErrorCount = 0;                      % Initialize a count of errors
TotPRProbs = 0;                      % Initialize a count of total problems attempted
TotAttempts = 0;                     % Initialize a count of total solutions offered
AdjustCount = 0;                     % Preserve the counts if the user resubmits a solution
LastFive = zeros(1,5);               % Initialize a matrix to record the last five solution results
  %[control:button:97f1]{"position":[1,2]}
disp("Values initialized for Product Rule Practice.")
%[text]{"align":"center"} \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
%%
%[text] Generate a product rule problem:
% Check if the previous section has run
% If not, provide warning. If so, generate a problem.
if ~exist("TotPRProbs","var")
    warning("You must initialize values before you can generate a problem.")
else
    [MyFun,VarChoice] = GenProbType(VarOpts,2);  % GenProbType is defined in Local Helper Functions
    % GenProbType sets up a variable and generates a randomized function
    TotPRProbs = TotPRProbs+1;               % Increase the count of total problems attempted
end
                          % Run this section %[control:button:5719]{"position":[1,2]}
%%
MyAnswer = r;     % User-defined solution, default value r %[control:editfield:4517]{"position":[12,13]}
TotAttempts = TotAttempts + 1;       % Updates count of total attempts at solution
[LastFive,ErrorCount,TotAttempts,AdjustCount] = ResubmissionCheck(TotAttempts,TotPRProbs,AdjustCount, ...
    MyFun,VarChoice,MyAnswer,2,ErrorCount,LastFive);
% ResubmissionCheck is defined in Local Helper Functions
% ResubmissionCheck records the attempt and provides appropriate feedback
                          % Run this section %[control:button:89e1]{"position":[1,2]}
%%
%[text] Once you have completed sufficient practice, track the overall results of your practice here:
                     % Run this section %[control:button:7cb4]{"position":[1,2]}
AnalyzeResults(TotPRProbs,ErrorCount,TotAttempts,AdjustCount,LastFive)
% AnalyzeResults is defined in Local Helper Functions
% Compute the percentage of initially correct solutions out of the total
% problems attempted, subsequent attempts are not scored
%%
%[text] #### Practice App
%[text] If you would prefer to practice in the Calculus Flashcards app, you can start it by clicking on the image below or clicking the Run Calculus Flashcards App button. You should set it for "Product Rule" in the Derivatives section. The app will open in a new window.
%[text]{"align":"center"} [![Calculus Flashcards app setting screen](text:image:1f46)](<matlab: CalculusFlashcards>)
  %[control:button:386e]{"position":[1,2]}
run("CalculusFlashcards")
%%
%[text] ### Application: Quotient Rule
%[text] One common combination of functions that deserves mention is $\\frac{f(x)}{g(x)}${"altText":"(f(x))\/(g(x))"} for some functions $f(x)${"altText":"f(x)"} and $g(x)${"altText":"g(x)"} where $g(x)\\neq 0${"altText":"g(x) != 0"}. Take the derivative:
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[\\frac{f(x)}{g(x)}\\right\] =  \\frac{d}{dx}\\left\[f(x)\\cdot \\left(\\frac{1}{g(x)}\\right)\\right\] = \\frac{d}{dx}\\left\[f(x)\\cdot \\left(g(x)\\right)^{-1}\\right\]${"altText":"(d)\/(dx)\[(f(x))\/(g(x))\] = (d)\/(dx)\[f(x) \* ((1)\/(g(x)))\] = (d)\/(dx)\[f(x) \* (g(x))^(-1)\]"} 
%[text] Applying the product rule, 
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[\\frac{f(x)}{g(x)}\\right\] = \\frac{d}{dx}\\left\[f(x)\\right\]\\cdot \\left(g(x)\\right)^{-1}+f(x)\\cdot\\left(\\frac{d}{dx}\\left\[\\left(g(x)\\right)^{-1}\\right\]\\right)${"altText":"(d)\/(dx)\[(f(x))\/(g(x))\] = (d)\/(dx)\[f(x)\] \* (g(x))^(-1)+f(x) \* ((d)\/(dx)\[(g(x))^(-1)\])"}.      
%[text] Applying the chain rule,
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[\\frac{f(x)}{g(x)}\\right\] = \\frac{d}{dx}\\left\[f(x)\\right\]\\cdot (g(x))^{-1} + f(x)\\left(-(g(x))^{-2}\\frac{d}{dx}\\left\[g(x)\\right\]\\right)${"altText":"(d)\/(dx)\[(f(x))\/(g(x))\] = (d)\/(dx)\[f(x)\] \* (g(x))^(-1) + f(x)(-(g(x))^(-2)(d)\/(dx)\[g(x)\])"}
%[text] and simplifying:
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[\\frac{f(x)}{g(x)}\\right\] = \\frac{f'(x)}{g(x)}-\\frac{f(x)g'(x)}{(g(x))^2} = \\frac{f'(x)g(x)-f(x)g'(x)}{(g(x))^2}${"altText":"(d)\/(dx)\[(f(x))\/(g(x))\] = (f'(x))\/(g(x))-(f(x)g'(x))\/((g(x))^2) = (f'(x)g(x)-f(x)g'(x))\/((g(x))^2)"}.         
%%
%[text] ### Practice Mixed Derivative Problems
%[text] Generate randomized practice problems. First, click **Initialize Values** once to get started. Then each time you want a new problem, click the **Generate Problem** button each time to create a new problem. After solving the problem, input your solution as MATLAB code and click the **Check Answer** button. 
%[text] ![](text:image:813c) **Pro-tip**. The variable you use in the solution matters, as does appropriate use of parentheses and multiplication operators. MATLAB syntax is `exp(7*t^(2/3))` for $e^{7t^{2/3}}${"altText":"e^(7t^(2\/3))"}, `sin(7*cos(4*r-6))` for $\\sin(7\\cos(4r-6))${"altText":"sin(7cos(4r-6))"} and `log(z/2)` for $\\ln\\left(\\frac{z}{2}\\right)${"altText":"ln((z)\/(2))"}.
% Clear variables
clear MyFun VarChoice MyAnswer TotPRProbs TotCRProbs TotMDProbs
syms t r x z                         % Declare symbolic variables
VarOpts = [t r x z];                 % Define the list of variables to use in the problems
MaxProbIdx = 3;                      % Track the number of different types of problems offered
ErrorCount = zeros(MaxProbIdx,1);    % Initialize a count of errors by problem type
TotMDProbs = zeros(MaxProbIdx,1);    % Initialize a count of total problems attempted by problem type
TotAttempts = zeros(MaxProbIdx,1);   % Initialize a count of total solutions offered by problem type
AdjustCount = zeros(MaxProbIdx,1);   % Preserve the counts if the user resubmits a solution
LastFive = zeros(MaxProbIdx,5);      % Initialize a matrix to record the last five solution results
                         % Run this section %[control:button:2170]{"position":[1,2]}
disp("Values initialized for Mixed Derivative Practice.")
%[text]{"align":"center"} \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
%%
%[text] Generate a randomized derivative problem:
% Check if the previous section has run
% If not, provide warning. If so, generate a problem.
if ~exist("TotMDProbs","var")
    warning("You must initialize values before you can generate a problem.")
else
    [MyFun,VarChoice,ProbType] = GenProb(VarOpts);  % GenProb is defined in Local Helper Functions
    % GenProb selects a problem type, sets up a variable and generates a randomized function
    TotMDProbs(ProbType) = TotMDProbs(ProbType)+1;  % Increase the count of total problems attempted
end
  %[control:button:554e]{"position":[1,2]}
%%
MyAnswer = r;      % User-defined solution, default value r %[control:editfield:05b4]{"position":[12,13]}
TotAttempts(ProbType) = TotAttempts(ProbType) + 1;       % Updates count of total attempts at solution
[LastFive,ErrorCount,TotAttempts,AdjustCount] = ResubmissionCheck(TotAttempts,TotMDProbs,AdjustCount, ...
    MyFun,VarChoice,MyAnswer,ProbType,ErrorCount,LastFive);
% ResubmissionCheck is defined in Local Helper Functions
% ResubmissionCheck records the attempt and provides appropriate feedback
                           % Run othns section %[control:button:3d7e]{"position":[1,2]}
%%
%[text] Once you have completed sufficient practice, track the overall results of your practice here:
                         % Run this section %[control:button:83f6]{"position":[1,2]}
GiveFeedback(ErrorCount,TotMDProbs,LastFive)
%%
%[text] #### Practice App
%[text] If you would prefer to practice in the Calculus Flashcards app, you can start it by clicking on the image below or clicking the Run Calculus Flashcards App button. You should set it for "All Derivatives" in the Derivatives section. The app will open in a new window.
%[text]{"align":"center"} [![Calculus Flashcards app settings screen](text:image:33aa)](<matlab: CalculusFlashcards>)
  %[control:button:3461]{"position":[1,2]}
run("CalculusFlashcards")
%%
%[text] [⇦ Main Menu](file:../MainMenu.m)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] ## Local Helper Functions
%[text] If you wish to see the details of the code, select the **View** tab and switch to **Output Inline**. Alternately, select **Output inline** using the icon ![live script output inline icon](text:image:2596) at the top right of the Live Editor pane.
%[text] **Functions related to the Chain Rule**
%[text] Two main functions in this section lay out the basic chain rule visualization and animate the visualization by updating the relevant tangent lines.
function [fh,gh,bds,gMin,gMax,crTitle,pf,pfTitle,pfg,pfgTitle,pg,pgTitle] = ShowChainRule(fh,gh,bds,fstr,gstr)
syms x                      % Create a symbolic variable
% Compute the derivative of f and g as symbolic functions
df(x) = diff(fh(x),x);
dg(x) = diff(gh(x),x);
% Calculate the total length of the interval
bdsDiff = bds(2)-bds(1);
% Numerically determine the ranges for f and g over domain bds
% This allows aesthetically pleasing choices for the window sizes
xVals = bds(1):bdsDiff/1000:bds(2);
gVals = double(gh(xVals));
fVals = double(fh(gVals));
gMin = min(gVals);
gMax = max(gVals);
fMin = min(fVals);
fMax = max(fVals);
fdiff = .1*(fMax-fMin);
gdiff = .1*(gMax-gMin);

% Calculate the derivatives df/dg, dg/dx and df/dx at bds(1) as numbers
dfdg = double(df(gVals(1)));
dgdx = double(dg(xVals(1)));
dfdx = dfdg*dgdx;

% Create the basic figure with handles to the components that will be updated
% in the animation: crTitle, pf, pfTitle, pfg, pfgTitle, pg, and pgTitle
tLayout = tiledlayout(2,2);       % Set up a 2x2 tiled layout
crTitle = title(tLayout,"When $x_0$ = "+bds(1)+", then $\frac{df}{dg}\frac{dg}{dx} = ($" ...
    +dfdg+"$)\cdot($"+dgdx+"$) = $"+dfdx,"Interpreter","latex");
xlabel(tLayout,"$"+fstr+"("+gstr+"(x))$","Interpreter","latex")
nexttile(tLayout,1)              % This tile is in the top left corner
fplot(x,fh(x),[gMin gMax])
hold on
pf = plot([gMin,gMax],[dfdg*(gMin-gVals(1))+fVals(1),dfdg*(gMax-gVals(1))+fVals(1)]);
hold off
xlabel("$g$","Interpreter","latex")
ylabel("$f(g)$","Interpreter","latex")
pfTitle = title("$\frac{df}{dg} = $" + dfdg,"Interpreter","latex");
ylim([fMin-fdiff fMax+fdiff])    % Expand the window for better viewing
nexttile(tLayout,2,[2 1])        % This tile is the entire right half of the figure
fplot(x,fh(gh(x)),bds)
hold on
pfg = plot(bds,[fVals(1) dfdg*dg(bds(1))*bdsDiff+fVals(1)]);
hold off
xlabel("$x$","Interpreter","latex")
ylabel("$f(g(x))$","Interpreter","latex")
pfgTitle = title("$\frac{df}{dx} = $"+dfdx,"Interpreter","latex");
ylim([fMin-fdiff fMax+fdiff])    % Expand the window for better viewing
nexttile(tLayout,3)              % This tile is in the bottom left corner
fplot(x,gh(x),bds)
hold on
pg = plot(bds,[gVals(1) dg(bds(1))*bdsDiff+gVals(1)]);
hold off
xlabel("$x$","Interpreter","latex")
ylabel("$g(x)$","Interpreter","latex")
pgTitle = title("$\frac{dg}{dx} = $" + dgdx,"Interpreter","latex");
ylim([gMin-gdiff gMax+gdiff])    % Expand the window for better viewing
end

function AnimateChainRule(fh,gh,bds,gMin,gMax,crTitle,pf,pfTitle,pfg,pfgTitle,pg,pgTitle)
syms x                      % Create a symbolic variable
% Compute the derivative of f and g as symbolic functions
df(x) = diff(fh(x),x);
dg(x) = diff(gh(x),x);
% Loop over 100 steps covering the domain and plot the
for x0 = linspace(bds(1),bds(2),100)

    dgdx = double(dg(x0));
    fpt = double(fh(gh(x0)));
    gpt = double(gh(x0));
    dfdg = double(df(gpt));
    dfdx = dfdg*dgdx;
    crTitle.String = "When $x_0$ = "+x0+", then $\frac{df}{dg}\frac{dg}{dx} = ($" ...
        +dfdg+"$)\cdot($"+dgdx+"$) = $"+dfdx;
    pf.YData = [dfdg*(gMin-gpt)+fh(gpt) dfdg*(gMax-gpt)+fh(gpt)];
    pfTitle.String = "$\frac{df}{dg} = $" + dfdg;
    pfg.YData = [dfdx*(bds(1)-x0)+fpt dfdx*(bds(2)-x0)+fpt];
    pfgTitle.String = "$\frac{df}{dx} = $"+dfdx;
    pg.YData = [dgdx*(bds(1)-x0)+gpt dgdx*(bds(2)-x0)+gpt];
    pgTitle.String = "$\frac{dg}{dx} = $" + dgdx;
    drawnow
end
crTitle.String = "When $x_0$ = "+bds(2)+", then $\frac{df}{dg}\frac{dg}{dx} = ($" ...
    +dfdg+"$)\cdot($"+dgdx+"$) = $"+dfdx;
drawnow
end
%[text] **Show answers to Exercises**
function ShowPendulumAnswers(click)
% ShowPendulumAnswers displays the solutions and commentary to the pendulum
% exercise, including demonstrating the use of units with symbolic results
u = symunit;
if ~click
    clear tOmegaIsZero omega alpha theta_0 g L
else
    syms theta_0 t g L omega theta %#ok<NASGU> 
    assume(t > 0 & g/L > 0)
    thetaFunc = theta_0 * cos(t * sqrt(g/L));
    disp("The answer to Exercise 1.1 is:")
    disp(" ")
    omegaAns = diff(thetaFunc,t); 
    displayFormula("omega(t) = omegaAns")
    disp(" ")
    disp("The answer to Exercise 1.2 is: ")
    disp(" ")
    tOmegaIsZeroAns = u.sec * solve(omegaAns == 0,'ReturnConditions',false);
    pendulumStoppedAngleAns = subs(thetaFunc,t,separateUnits(tOmegaIsZeroAns)); %#ok<NASGU>
    displayFormula("t_0=tOmegaIsZeroAns")
    displayFormula("theta(t_0) = pendulumStoppedAngleAns")
    disp("The pendulum will stop at the same angle that it was released from, but on the other side!")
    disp("Any time the pendulum reaches this angle (the maximum angle), it should be at rest.")
    disp(" ")
    disp("The answer to Exercise 1.3 is: ")
    disp(" ")
    alphaAns = diff(omegaAns,t); %#ok<NASGU>
    displayFormula("alpha(t) = alphaAns")
end
end

function recFig = DrawRecord
recFig = gcf;
recFig.Color = [0.2 0.2 0.2];
theta = linspace(0,25*pi,10000);
plot(7/80*(theta(1:800)+1).*sin(6*theta(1:800)),7/80*(theta(1:800)+1).*cos(6*theta(1:800)),"r-")
hold on
plot(7/80*(theta+6.726).*sin(6*(theta)),7/80*(theta+6.726).*cos(6*(theta)),"k-")
hold off
axis equal off
title("A representation of a classic 7 inch 45")
recFig.CurrentAxes.Title.Color = [0.851 0.851 0.851];
end

function CheckSpeed(thetaAns,drdtheta,drdt)
syms dr dt d theta %#ok<NASGU> 
u = symunit;
drVal = -21*pi*u.in;
dtVal = 160*u.s;
drdtVal = drVal/dtVal; %#ok<NASGU>
thetaVal = 45*45*2*pi/60;
thetaValU = thetaVal*u.rad; %#ok<NASGU>
dthetadtAnsU = 3*pi/2*u.rad/u.s; %#ok<NASGU>
drdthetaAns = -7/80;
drdthetaAnsU = -7/80*u.in/u.rad; %#ok<NASGU>
answer = -7/80*(1/2)*((thetaVal+6.726)^2)^(-1/2)*2*(thetaVal+6.726)*45*2*pi/60;
if abs(thetaAns-thetaVal) < 1e-14     % A small tolerance to account for computational differences
    disp("Exercise 2.1. Is correct.")
    displayFormula("theta = thetaValU")
else
    disp("Exercise 2.1. Is incorrect.")
end
disp(" ")                              % Include a blank line between solution 2.1 and 2.2
if abs(drdtheta-drdthetaAns) < 1e-14  % A small tolerance to account for computational differences
    disp("Exercise 2.2. Is correct.")
    displayFormula("dr/(d*theta) = drdthetaAnsU")
elseif abs(drdtheta+drdthetaAns) < 1e-14
    disp("Exercise 2.2. Is incorrect. If r is getting larger, the derivative should be positive,")
    disp("and if r is getting smaller the derivative should be negative.")
else
    disp("Exercise 2.2. Is incorrect.")
    disp("Try simplifying before you compute the derivative.")
    disp("Remember that your answer should be exact.")
end
disp(" ")                              % Include a blank line between solution 2.2 and 2.3
if abs(drdt-answer) < 1e-14           % A small tolerance to account for computational differences
    disp("Exercise 2.3. Is correct.")
    displayFormula("dr/dt = (dr/(d*theta))*(d*theta/dt)")
    displayFormula("d*theta/dt = dthetadtAnsU")
    displayFormula("dr/dt = drdtVal")
elseif abs(drdt+answer) < 1e-14
    disp("Exercise 2.3. Is incorrect. If r is getting larger, the derivative should be positive,")
    disp("and if r is getting smaller the derivative should be negative.")
else
    disp("Exercise 2.3. Is incorrect. Remember to apply the chain rule:")
    displayFormula("dr/dt = (dr/(d*theta))*(d*theta/dt)")
end
end
%[text] **Functions related to the Product Rule** 
%[text] To properly interact with different parts of the window and different orientations of the rectangles representing the product rule, this section includes many small helper functions as well as the primary functions that are called from the main script.
function [fx,fxph,gx,gxph] = CalcPointVals(f,g,pt,h)
% CalcPointVals takes two functions, f and g, a point pt and a step size h and returns
% each function evaluated at both pt and pt+h as numerical values
%
% Inputs:
% f and g are function handles, pt is a point, h is a step size
% Outputs:
% fx = f(pt), fxph = f(pt+h), gx = g(pt), gxph = g(pt+h) all as numbers
fx = double(f(pt));
fxph = double(f(pt+h));
gx = double(g(pt));
gxph = double(g(pt+h));
end

function [zxs,zys,fxs,fxphs,gxs,gxphs] = CalcScaledPointVals(fx,fxph,gx,gxph,ax)
% CalcScaledPointVals takes the values f(x), f(x+h), g(x), g(x+h) and an
% axis handle ax and returns scaled values required to draw the rectangles
%
% Inputs:
%    fx = f(pt), fxph = f(pt+h), gx = g(pt), gxph = g(pt+h) as numbers
%    ax is an axis handle
% Outputs:
%    (zxs,zys) are the scaled coordinates of the origin (0,0)
%    fxs,fxphs,gxs,gxphs are the scaled coordinates of fx,fxph,gx,gxph,
%    respectively
xlimits = ax.XLim;                  % Identify the x limits of the axes ax
ylimits = ax.YLim;                  % Identify the y limits of the axes ax
xMin = xlimits(1);                  % The minimum x value, for readability
xMax = xlimits(2);                  % The maximum x value, for readibility
yMin = ylimits(1);                  % The minimum y value, for readibility
yMax = ylimits(2);                  % The maximum y value, for readibility
axInnerPosition = ax.InnerPosition; % Identify the area available for plotting inside the axes ax
yScale = axInnerPosition(4);        % Extract the height (length in the y-direction)
xScale = axInnerPosition(3);        % Extract the width (length in the x-direction)
x0 = axInnerPosition(1);            % Extract the x-coordinate of the lower-left corner
y0 = axInnerPosition(2);            % Extract the y-coordinate of the lower-left corner
% Calculate the scaled coordinates of the corners of the rectangle
zxs = (0-xMin)/(xMax-xMin)*xScale+x0;       % x=0
zys = (0-yMin)/(yMax-yMin)*yScale+y0;       % y=0
fxs = (fx-xMin)/(xMax-xMin)*xScale+x0;      % x=f(pt)
gxs = (gx-yMin)/(yMax-yMin)*yScale+y0;      % y=g(pt)
fxphs = (fxph-xMin)/(xMax-xMin)*xScale+x0;  % x=f(pt+h)
gxphs = (gxph-yMin)/(yMax-yMin)*yScale+y0;  % y=g(pt+h)
end

function [prAxes,cols,bkcol] = ShowProductRuleBasic(f,g,pt,h) 
% ShowProductRule takes two functions, a point, a step size, and a set of colors
%     It generates an image consisting of four colored rectangles:
%     The first is col1 and represents f*g
%     The second and third are col3 and represent f*dg and g*df
%     The fourth is col2 and represents dg*df
% f and g are function handles
% pt is a point value
% h is a step size
% cols is a length 3 vector of colors
[fx,fxph,gx,gxph] = CalcPointVals(f,g,pt,h);    % CalcPointVals is defined in Local Helper Functions
figure
prAxes = gca;
col = colororder;
col1 = col(1,:);
col2 = col(2,:);
col3 = col(5,:);
bkcol = prAxes.GridColor;
cols = {col1,col2,col3};
[xstart,ystart,dx,dy] = findCoords(0,0,fx,gx);  % findCoords is defined in Local Helper Functions
% Plot a rectangle representing f*g
rectangle("Position",[xstart,ystart,dx,dy],"FaceColor",col1,"EdgeColor",bkcol)
[xstart,ystart,dx,dy] = findCoords(fx,0,fxph-fx,gx);       % findCoords is defined in Local Helper Functions
% Plot a rectangle representing df*g
rectangle("Position",[xstart,ystart,dx,dy],"FaceColor",col3,"EdgeColor",bkcol)
[xstart,ystart,dx,dy] = findCoords(0,gx,fx,gxph-gx);       % findCoords is defined in Local Helper Functions
% Plot a rectangle representing f*dg
rectangle("Position",[xstart,ystart,dx,dy],"FaceColor",col3,"EdgeColor",bkcol)
[xstart,ystart,dx,dy] = findCoords(fx,gx,fxph-fx,gxph-gx); % findCoords is defined in Local Helper Functions
% Plot a rectangle representing df*dg
rectangle("Position",[xstart,ystart,dx,dy],"FaceColor",col2,"EdgeColor",bkcol)
% Add title and x- and y-labels to the plot
title("Product Rule")
xlabel("$f(x)$","Interpreter","latex")
ylabel("$g(x)$","Interpreter","latex")
end

function ShowProductRule(prAxes,f,g,pt,h,cols,showAxes)
% ShowProductRule takes a figure handle, two functions, a point, a step size, a set of
%     colors, and a flag indicating whether to show the axes of the graph
%     It generates an image consisting of four colored rectangles:
%     The first is col1 and represents f*g
%     The second and third are col3 and represent f*dg and g*df
%     The fourth is col2 and represents dg*df
% prAx is an axis handle and f and g are function handles
% pt is a point value
% h is a step size
% cols is a length 3 vector of colors
% showAxes is a boolean
col1 = cols{1};
col2 = cols{2};
col3 = cols{3};
[fx,fxph,gx,gxph] = CalcPointVals(f,g,pt,h);    % CalcPointVals is defined in Local Helper Functions
fgCol = prAxes.Color;
scatter(prAxes,[0 fx fx 0], [0 0 gx gx],MarkerEdgeColor=fgCol) % plot the four corners of the rectangle to generate a plot
[xstart,ystart,dx,dy] = findCoords(0,0,fx,gx);  % findCoords is defined in Local Helper Functions
% Plot a rectangle representing f*g
rectangle("Position",[xstart,ystart,dx,dy],"FaceColor",col1,"EdgeColor","k")
[xstart,ystart,dx,dy] = findCoords(fx,0,fxph-fx,gx);       % findCoords is defined in Local Helper Functions
% Plot a rectangle representing df*g
rectangle("Position",[xstart,ystart,dx,dy],"FaceColor",col3,"EdgeColor","k")
[xstart,ystart,dx,dy] = findCoords(0,gx,fx,gxph-gx);       % findCoords is defined in Local Helper Functions
% Plot a rectangle representing f*dg
rectangle("Position",[xstart,ystart,dx,dy],"FaceColor",col3,"EdgeColor","k")
[xstart,ystart,dx,dy] = findCoords(fx,gx,fxph-fx,gxph-gx); % findCoords is defined in Local Helper Functions
% Plot a rectangle representing df*dg
rectangle("Position",[xstart,ystart,dx,dy],"FaceColor",col2,"EdgeColor","k")
% Add title and x- and y-labels to the plot
title("Product Rule")
xlabel("$f(x)$","Interpreter","latex")
ylabel("$g(x)$","Interpreter","latex")
% If not requested, hide the axes
if ~showAxes
    axis off
end
end

function mpt = findMidPt(opt1,opt2)
% findMidPt takes two points, opt1 and opt2, and returns their midpoint mpt
%     This function is defined for readability of the code
mpt = .5*(opt2+opt1);
end

function mpt = findMidCoord(opt1,opt2,shift)
% findMidCoord takes a pair of points, opt1 and opt2, and a shift and returns one point
if shift < 0
    % Return the largest value of the left/down-shifted midpoint or
    % most negative original point
    mpt = max([findMidPt(opt1,opt2)+shift min([opt1 opt2])]);
elseif shift == 0
    % Return a value that is centered between opt1 and opt2 if the distance
    % between them is at least .2. If the points are too close, shift
    % closer to the left/bottom to allow space for annotation, but do not
    % move further than the smaller of opt1 and opt2
    %    mpt = max([min([findMidPt(opt1,opt2) max([opt1 opt2])-.1]) 0]);
    mpt = max([min([findMidPt(opt1,opt2) max([opt1 opt2])-.1]) min([opt1,opt2])]);
else
    warning("This code was not designed for positive shifts.")
end
end

function [xpt,ypt] = findMidCoords(xopt1,xopt2,yopt1,yopt2,xshift,yshift)
% findMidCoords applies findMidCoord to both x- and y-coordinates at once
xpt = findMidCoord(xopt1,xopt2,xshift);
ypt = findMidCoord(yopt1,yopt2,yshift);
end

function [xpt,ypt,zxs,zys] = setMidPts(f,g,pt,h)
% setMidPts takes the functions f and g, the point pt and step size h and
% returns a scaled coordinates for an approximate midpoint and origin
%
% Inputs:
% f and g are function handles, pt is a point, h is a step size
% Outputs:
% (xpt,ypt) are scaled coordinates between the origin and (f(pt),g(pt))
ax = gca;      % Define a handle to the current axis
[fx,fxph,gx,gxph] = CalcPointVals(f,g,pt,h);
% CalcPointVals is defined in Local Helper Functions
% CalcPointVals takes two functions, f and g, a point pt and a step size h and returns
% each function evaluated at both pt and pt+h as numerical values
[zxs,zys,fxs,~,gxs] = CalcScaledPointVals(fx,fxph,gx,gxph,ax);
% CalcScaledPointVals is defined in Local Helper Functions
% CalcScaledPointVals takes the values f(x), f(x+h), g(x), g(x+h) and an
% axis handle ax and returns scaled values required to draw the rectangles
[xpt,ypt] = findMidCoords(zxs,fxs,zys,gxs,-.1,-.1);
% findMidCoords is defined in Local Helper Functions
% findMidCoords applies findMidCoord to both x- and y-coordinates at once
end

function [fLxs,fFxs,gLxs,gFxs] = setBndryPts(f,g,pt,h)
% setBndryPts takes two functions f and g, a point pt and a step size h and
% returns the ordered values of f(pt), f(pt+h) and g(pt), g(pt+h) such that
% fLxs and gLxs are closer to while fFxs and gFxs are farther from the origin
ax = gca;
[fx,fxph,gx,gxph] = CalcPointVals(f,g,pt,h);
[zxs,zys,fxs,fxphs,gxs,gxphs] = CalcScaledPointVals(fx,fxph,gx,gxph,ax);
% Determine whether f(pt+h) or f(pt) is closer to 0
if abs(fxphs-zxs)>abs(fxs-zxs)
    fLxs = fxs;
    fFxs = fxphs;
else
    fLxs = fxphs;
    fFxs = fxs;
end
% Determine whether g(pt+h) or g(pt) is closer to 0
if abs(gxphs-zys)>abs(gxs-zys)
    gLxs = gxs;
    gFxs = gxphs;
else
    gLxs = gxphs;
    gFxs = gxs;
end
end

function AnnProdfg(f,g,pt,h,choice)
% AnnProdfg annotates the rectangle representing f*g
[xpt,ypt,zxs] = setMidPts(f,g,pt,h);
if choice
    % When multiple annotations are present, don't center the annotation
    [~,fLxs,xNpt,yNpt] = offsetPtCoordinates(f,g,pt,h);
    if fLxs>xNpt     % Shift away from the df*g annotation
        xReal = findMidPt(zxs,xNpt);
    else             % Shift less away from the df*g annotation
        xReal = findMidPt(xNpt,xpt);
    end
    % Adjust to y = yNpt-.025 to line up with the df*g annotation
    % Note that the height of the textbox is .05 scaled units
    % The width of the textbox is .216 scaled units
    % There are no checks here to prevent horizontal overlap so far
    dim = [xReal yNpt-.025 .216 .05];
else

    % setMidPts is defined in Local Helper Functions
    % setMidPts takes the functions f and g, the point pt and step size h and
    % returns a scaled coordinates for an approximate midpoint and origin
    dim = [xpt ypt .216 .05];
end
annotation("textbox",dim,"String","Area = $f(x)\cdot g(x)$","Interpreter","latex")
end

function AnnProddfdg(f,g,pt,h,col2,bkcol)
% AnnProddfdg annotates the rectangle representing df*dg
[xpt,ypt] = setMidPts(f,g,pt,h);
% setMidPts is defined in Local Helper Functions
% setMidPts takes the functions f and g, the point pt and step size h and
% returns a scaled coordinates for an approximate midpoint and origin
[fLxs,fFxs,gLxs,gFxs] = setBndryPts(f,g,pt,h);
% setBndryPts is defined in Local Helper Functions
% setBndryPts takes two functions f and g, a point pt and a step size h and
% returns the ordered values of f(pt), f(pt+h) and g(pt), g(pt+h) such that
% fLxs and gLxs are closer to while fFxs and gFxs are farther from the origin
[xUpt,yUpt] = findMidCoords(xpt,fFxs,ypt,gFxs,0,0);
% findMidCoords and findMidCoord are defined in Local Helper Functions
% findMidCoords applies findMidCoord to both x- and y-coordinates at once
annotation("textarrow",[xUpt fLxs],[yUpt gLxs],"String","$\Delta f \cdot \Delta g$","Color",col2,...
    "TextEdgeColor",col2,"TextColor",bkcol,"Interpreter","latex")
end

function AnnProdChange(f,g,pt,h,col3,bkcol)
% AnnProdChange annotates the pair of rectangles representing f*dg and g*df

% Determine coordinates using offsetPtCoordinates
[xUpt,fLxs,xNpt,yNpt,yUpt,gLxs] = offsetPtCoordinates(f,g,pt,h);
% Annotate the plot
annotation("textarrow",[xUpt fLxs],[yNpt yNpt],"String","$\Delta f \cdot g(x)$","Color",col3,...
    "TextEdgeColor",col3,"TextColor",bkcol,"Interpreter","latex")
annotation("textarrow",[xNpt xNpt],[yUpt gLxs],"String","$f(x) \cdot \Delta g$","Color",col3,...
    "TextEdgeColor",col3,"TextColor",bkcol,"Interpreter","latex")
end

function [xUpt,fLxs,xNpt,yNpt,yUpt,gLxs] = offsetPtCoordinates(f,g,pt,h)
% offsetPtCoordinates calculates reasonable positions for annotation

[xpt,ypt,zxs,zys] = setMidPts(f,g,pt,h);
% setMidPts is defined in Local Helper Functions
% setMidPts takes the functions f and g, the point pt and step size h and
% returns a scaled coordinates for an approximate midpoint and origin

[fLxs,fFxs,gLxs,gFxs] = setBndryPts(f,g,pt,h);
% setBndryPts is defined in Local Helper Functions
% setBndryPts takes two functions f and g, a point pt and a step size h and
% returns the ordered values of f(pt), f(pt+h) and g(pt), g(pt+h) such that
% fLxs and gLxs are closer to while fFxs and gFxs are farther from the origin

[xUpt,yUpt] = findMidCoords(xpt,fFxs,ypt,gFxs,0,0);
% findMidCoods and findMidCoord are defined in Local Helper Functions
% findMidCoords applies findMidCoord to both x- and y-coordinates at once

% Calculate reasonable choices of coordinates to position the annotations
% vertically and horizontally
if fLxs > xpt && gLxs > ypt
    yNpt = ypt;
    xNpt = xpt;
elseif fLxs < xpt && gLxs > ypt
    yNpt = ypt;
    xNpt = findMidPt(xpt,zxs);
elseif fLxs > xpt && gLxs < ypt
    yNpt = findMidPt(ypt,zys);
    xNpt = xpt;
else
    yNpt = findMidPt(ypt,zys);
    xNpt = findMidPt(xpt,zxs);
end
end

function AnimateProductRule(prAxes,f,g,pt,h,cols,bkcol,showAxes) %#ok<DEFNU> 
% AnimateProductRule shows the basic product rule visualization and each
% annotated component for a short time, then finishes with the fully
% annotated plot
ShowProductRule(prAxes,f,g,pt,h,cols,showAxes)  % ShowProductRule is defined in Local Helper Functions
% ShowProductRule takes a figure handle, two functions, a point, a step size, a set of
%     colors, and a flag indicating whether to show the axes of the graph
%     It generates an image consisting of four colored rectangles:
%     The first is col1 and represents f*g
%     The second and third are col3 and represent f*dg and g*df
%     The fourth is col2 and represents dg*df
pause(2)           % Pause for 2 seconds
col1 = cols{1};
col2 = cols{2};
col3 = cols{3};
ShowProductRule(prAxes,f,g,pt,h,{col1 "none" "none"},showAxes)
% ShowProductRule with only f*g colored
AnnProdfg(f,g,pt,h,0)      % Annotate f*g
pause(3)                   % Pause for 3 seconds
% ShowProductRule with only df*dg colored
ShowProductRule(prAxes,f,g,pt,h,{"none" col2 "none"},showAxes)
AnnProddfdg(f,g,pt,h,col2,bkcol) % Annotate df*dg
pause(3)                   % Pause for 3 seconds
% ShowProductRule with only f*dg and df*g colored
ShowProductRule(prAxes,f,g,pt,h,{"none" "none" col3},showAxes)
AnnProdChange(f,g,pt,h,col3,bkcol) % Annotate f*dg and g*df
pause(3)                   % Pause for 3 seconds
% ShowProductRule with everything colored and annotated
ShowProductRule(prAxes,f,g,pt,h,cols,showAxes)
AnnProdfg(f,g,pt,h,1)
AnnProddfdg(f,g,pt,h,col2,bkcol)
AnnProdChange(f,g,pt,h,col3,bkcol)
end

function [x0,y0,dx,dy] = findCoords(x0,y0,dx,dy)
% findCoords takes two points (x0,y0) and (x0+dx,y0+dy)
% and ensures that the output is the same two points with positive
% dx and dy such that x0<x0+dx and y0<y0+dy
if dx < 0
    x0 = double(x0+dx);
    dx = double(abs(dx));
end
if dy < 0
    y0 = double(y0+dy);
    dy = double(abs(dy));
end
end
%[text] **Functions related to Problem Generation and Analysis**
%[text] These functions generate randomized problems, account for different types of interactions with the user, and provide feedback and analysis to facilitate learning, including identifying which types of problems, if any, a user is struggling with.
function [MyFun, VarChoice, ProbType] = GenProb(varOpts)
% GenProb randomly selects a problem type and calls GenProbType
%
% Inputs: varOpts is an array of possible variables
% Outputs: MyFun is a symbolic function
%          VarChoice is the independent variable
%          ProbType is an integer tracking the type of question asked

% Determine a problem type randomly from the set [1,2,3]
% Type 1 is a simple derivative, Type 2 is a product rule and
% Type 3 is a chain rule
ProbType = randi([1 3],1);
[MyFun,VarChoice] = GenProbType(varOpts,ProbType);
end

function [MyFun, VarChoice] = GenProbType(varOpts, ProbType)
% GenProbType sets up a variable and generates a randomized function
%
% Inputs: varOpts is an array of possible variables
%         ProbType is a string that identifies the function type
% Outputs: MyFun is a symbolic function
%          VarChoice is the independent variable
%          ProbType is an integer tracking the type of question asked
%          [a, b] are the bounds for the definite integral, if required

% Randomly select a variable from the set varOpts
VarChoice = varOpts(randi([1 length(varOpts)], 1));

% Use genFunDiff to generate simple functions
% genFunDiff is defined in Local Helper Functions
% The inputs to genFunDiff are the variable VarChoice, a range of values
% from which to select coefficients and a value indicating which warnings
% have already been printed during problem generation
switch ProbType
    case 1 % Simple derivative
        MyFun = GenFunDiff(VarChoice,[1,10],[]);  % Generate MyFun
        % Display the derivative problem
        disp("Take the derivative with respect to: ")
        disp(VarChoice)
        disp(" of the function ")
        displayFormula("f(VarChoice) = MyFun")
    case 2 % Product rule derivative
        syms f(x) g(x)
        [f(x),oldType] = GenFunDiff(x,[1,7],[]);
        g(x) = GenFunDiff(x,[1, 7],oldType);
        MyFun = f(VarChoice)*g(VarChoice);        % Generate MyFun
        % Display the derivative problem
        disp("Take the derivative with respect to: ")
        disp(VarChoice)
        disp(" of the function ")
        displayFormula("f(VarChoice) = MyFun")
    case 3 % Chain rule derivative
        syms f(x) g(x)
        [f(x),oldType] = GenFunDiff(x,[1,3],[]);
        g(x) = GenFunDiff(x,[1,5],oldType);
        MyFun = f(g(VarChoice));                 % Generate MyFun
        % Display the derivative problem
        disp("Take the derivative with respect to: ")
        disp(VarChoice)
        disp(" of the function ")
        displayFormula("f(VarChoice) = MyFun")
end
end

function [MyFun,type] = GenFunDiff(var,bds,prevType)
% genFunDiff generates a random function with a simple derivative
%
% Inputs: var is the independent variable
%         bds is a 1x2 vector of increasing integer values that set
%             the range for the coefficients
%         prevType is an integer that identifies the type of function
%             created last
% Outputs: MyFun is the generated symbolic function
syms f(t)                    % Create a symbolic function f(t)
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
        f(t) = a*t^(b);
    case 2
        f(t) = a*t^(b/c);
    case 3
        f(t) = a*exp(b*t);
        if prevType ~= 3
            disp("Remember that exp(x) is the notation for e^x in MATLAB.")
        end
    case 4
        f(t) = a*log(abs(b)*t);
        if prevType ~= 4
            disp("Remember that log(x) is the notation for a natural logarithm in MATLAB.")
        end
    case 5
        f(t) = a*sin(b*t+d);
    case 6
        f(t) = a*cos(b*t+d);
end

MyFun = f(var);
end

function [lastFive,errorCount,totAttempts,adjustCount] = ResubmissionCheck(totAttempts, ...
    totProbs,adjustCount,MyFun,VarChoice,MyAnswer,ProbType,errorCount,lastFive)
if any(totAttempts > (totProbs + adjustCount))
    % Check if this is a resubmission after the solution has been provided
    % If so, provide feedback but do not record in errorCount or lastFive
    % If not, update the values of lastFive and errorCount using check1
    adjustCount = totAttempts-totProbs;
elseif any(totAttempts < (totProbs + adjustCount))
    % Check if this is a submission after the generation of multiple problems that were skipped
    % If so, add the skipped problems to errorCount and adjust the totAttempts
    % to compensate. Explain to the user that skipped problems count as incorrect.
    numSkipped = totProbs + adjustCount - totAttempts;
    errorCount = errorCount + numSkipped;
    totAttempts = totProbs + adjustCount;
    for k = 1:length(totProbs)
        if numSkipped(k) < 5
            lastFive(k,:) = [lastFive(k,1+numSkipped(k):5),zeros(1,numSkipped(k))];
        else
            lastFive(k,:) = zeros(1,5);
        end
    end
    if sum(numSkipped) > 1
        disp("The "+sum(numSkipped)+" problems generated without attempts at solution " + ...
            "have been included in the count of errors.")
        disp(" ")
    elseif sum(numSkipped) == 1
        disp("The problem generated without an attempt at solution has been " + ...
            "included in the count of errors.")
        disp(" ")
    end
end

if length(totProbs)>1
    [lastFive,errorCount] = Check(MyFun,VarChoice,MyAnswer,ProbType,errorCount,lastFive);
else
    [lastFive,errorCount] = Check1(MyFun,VarChoice,MyAnswer,errorCount,lastFive);
    % check1 generates correct answers by differentiating MyFun with respect to VarChoice and compares
    % the result to MyAnswer before updating the integer errorCount and matrix lastFive
end
end

function [lastFive,errorCount] = Check(MyFunc,myVar,MyAnswer,ProbType,errorCount,lastFive)
% check generates correct answers by differentiating or integrating
%
% Inputs: MyFunc is the symbolic function to differentiate or integrate
%         myVar is the independent variable
%         MyAnswer is the symbolic test function or number
%         ProbType is an integer that tracks the question asked
%         errorCount is a matrix tracking errors by ProbType
%         lastFive is a matrix tracking success on the last five problems
%                  of each ProbType
% Output: updated lastFive and errorCount including analysis of MyAnswer
[smLastFive,smErrorCount] = Check1(MyFunc,myVar,MyAnswer,errorCount(ProbType,:),lastFive(ProbType,:)); 
% Restrict to a single known problem type and call check1
lastFive(ProbType,:) = smLastFive;       % Update the full matrix
errorCount(ProbType,:) = smErrorCount;   % Update the full matrix
end

function [lastFive,errorCount] = Check1(MyFunc,myVar,MyAnswer,errorCount,lastFive)
% check1 generates correct answers by differentiating and updates
%        errorCount and lastFive
%
% Inputs: MyFunc is the symbolic function to differentiate or integrate
%         myVar is the independent variable
%         MyAnswer is the symbolic test function or number
%         errorCount is an integer tracking total incorrect attempts
%         lastFive is a vector tracking the last five attempts
% Output: correctAnswer is a symbolic function that is the
%         solution to ProbType applied to MyFunc(myVar) with bds
syms df dt dr dz dx t r z x %#ok<NASGU> 
correctAnswer = diff(MyFunc,myVar);
lastFive(1:4) = lastFive(2:5);
disp("When simplified, MyAnswer is: ")
disp(MyAnswer)
if correctAnswer == MyAnswer
    disp("That answer is correct.")
    lastFive(5) = 1;
elseif simplify(correctAnswer-MyAnswer) == 0
    disp("That answer is correct. Another equivalent form is:")
    switch myVar
        case x
            displayFormula("df/dx = correctAnswer")
        case t
            displayFormula("df/dt = correctAnswer")
        case r
            displayFormula("df/dr = correctAnswer")
        case z
            displayFormula("df/dz = correctAnswer")
        otherwise
            correctAnswer %#ok<NOPRT>
    end
else
    disp("That is incorrect. The correct answer is:");
    switch myVar
        case x
            displayFormula("df/dx = correctAnswer")
        case t
            displayFormula("df/dt = correctAnswer")
        case r
            displayFormula("df/dr = correctAnswer")
        case z
            displayFormula("df/dz = correctAnswer")
        otherwise
            correctAnswer %#ok<NOPRT>
    end
    errorCount = errorCount+1;
    disp("Please try again with a new problem.")
    lastFive(5) = 0;
end
end

function GiveFeedback(errorCount,totProbs,lastFive)
% GiveFeedback breaks down all the problems attempted since the last reset
% and presents feedback to the user by problem type.
pctTypeWrong = zeros(size(errorCount));  
idx = totProbs>0;
pctTypeWrong(idx) = errorCount(idx)./totProbs(idx)*100;
overallRight = (1-sum(errorCount)/sum(totProbs))*100;
% Check if the user has completed at least five problems of each type
if min(totProbs) >= 5
    % If so, breakdown their feedback overall and by last 5 of each type
    lastCorrect = sum(lastFive,2);
    grammarChoice = lastCorrect == 1;
    grammarIdx = grammarChoice + 1;
    grammarOpt = ["were" "was"];
    str = compose("My overall success rate is %.1f%% on %i total problems \n\n" + ...
        "Breaking down by type: \n\nSimple derivatives: \n %i problem(s) of which %.1f%% were wrong. \n " + ...
        "Of the last five, %i %s correct. \n\n" + ...
        "Product Rule derivatives: \n %i problem(s) of which %.1f%% were wrong. \n " + ...
        "Of the last five, %i %s correct. \n\n" + ...
        "Chain Rule derivatives: \n %i problem(s) of which %.1f%% were wrong. \n " + ...
        "Of the last five, %i %s correct." ...
        ,overallRight, sum(totProbs),totProbs(1),pctTypeWrong(1),lastCorrect(1),grammarOpt(grammarIdx(1)) ...
        ,totProbs(2),pctTypeWrong(2),lastCorrect(2),grammarOpt(grammarIdx(2)),totProbs(3),pctTypeWrong(3) ...
        ,lastCorrect(3),grammarOpt(grammarIdx(3)));
else
    % If not yet at 5 across the board, give a simpler breakdown
    str = compose("My overall success rate is %.1f%% on %i total problems \n\n" + ...
        "Breaking down by type: \n\n Simple derivatives: \n %i problem(s) of which %.1f%% were wrong.\n\n" + ...
        "Product Rule derivatives: \n %i problem(s) of which %.1f%% were wrong. \n\n" + ...
        "Chain Rule derivatives: \n %i problem(s) of which %.1f%% were wrong." ...
        ,overallRight, sum(totProbs),totProbs(1),pctTypeWrong(1),totProbs(2),pctTypeWrong(2) ...
        ,totProbs(3),pctTypeWrong(3));
end

disp(str)
if min(totProbs) < 5 || min(pctTypeWrong)>15
    % Encourage additional practice when either too few problems have been completed
    % or a high error rate applies across all problem types.
    disp(" ")
    disp("It is probably a good idea to keep practicing.")
    disp("Can you get 5 problems right of each type?")
elseif min(totProbs)>= 5 && max(pctTypeWrong)>10
    % If sufficient problems have been completed, check which problem types
    % are associated with the highest error rate
    [~,idx] = max(pctTypeWrong);
    strChoice = ["simple derivatives","product rule derivatives","chain rule derivatives"];
    disp(" ")
    disp("Perhaps you want to review " + strChoice(idx) + " since you are having particular trouble with them?")
    disp("Of the last five " + strChoice(idx) + " that you have done, you scored " + sum(lastFive(idx,:))  + "/5.")
    if sum(lastFive(idx,:)) == 5
        % Check if there has been improvement over time with respect to the
        % problem type. If so, check which problem type is recently giving
        % the most trouble.
        disp("You seem to have figured " + strChoice(idx) + " out better.")
        [minVal,mIdx] = min(sum(lastFive,2));
        if minVal < 5
            disp("Perhaps you should work on " + strChoice(mIdx) + "now?")
        end
    end
elseif max(pctTypeWrong) > 0
    % For low levels of error, ask the user to determine if it is worth
    % worrying about
    disp("Is there a particular type of problem you are struggling with?")
else
    % If the user has made no errors and done plenty of problems, comment
    % favorably
    disp("Good work! Practice is what builds fluency and you appear to have been doing the work.")
end
end

function AnalyzeResults(totProbs,errorCount,totAttempts,adjustCount,lastFive)
% AnalyzeResults provides feedback in the single problem type case
%    totProbs, errorCount, totAttempts and adjustCount are integers
%    lastFive is a vector
overallRight = (1-errorCount/totProbs)*100;
if totAttempts > totProbs
    % If the user has resubmitted after seeing the solution, respond
    disp("Why are you resubmitting after you know the solution?")
    disp("Resubmissions are not included in your statistics.")
    if adjustCount > 1
        % If the user is repeatedly resubmitting, encourage them to use
        % this problem generator as intended by starting over
        disp("You have resubmitted "+sum(adjustCount)+" times.")
        disp("Please consider restarting the count using the `Initialize Values' button.")
    end
end
if totProbs >= 5
    lastCorrect = sum(lastFive);
    % If more than 5 problems have been attempted, provide grammatically
    % appropriate feedback on success rates
    if lastCorrect > 1
        str = compose("The overall success rate is %.1f%% on %i total problems. \n\n" + ...
            "Of the last five, %i were correct.",overallRight,totProbs,lastCorrect);
    elseif lastCorrect == 1
        str = compose("The overall success rate is %.1f%% on %i total problems. \n\n" + ...
            "Of the last five, one was correct.",overallRight,totProbs);
    elseif lastCorrect == 0
        str = compose("The overall success rate is %.1f%% on %i total problems. \n\n" + ...
            "Of the last five, none were correct.",overallRight,totProbs);
    end
else
    % If fewer than 5 problems have been attempted, encourage persistence
    if totProbs == 1
        str = compose("The overall success rate is %i%% on a single problem. \n\n" + ...
            "Please do at least five problems.",overallRight);
    else
        str = compose("The overall success rate is %.1f%% on %i total problems. \n\n" + ...
            "Please do at least five problems.",overallRight,totProbs);
    end
end
disp(str)
end

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"hidecode","rightPanelPercent":40}
%---
%[text:image:1249]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j4gbEASHJNlwZYtW\/93dHTixDCDQTRMDKRn8FhATBDNmTOH\/CAiBI4cOQI2HETTLBW9fv2a\/FRUtPXVf\/WeuyRhkB6iLQBp2HLvP0kYpGfUglELhpMFNM9oNKlw6FHp06TZAgAoeVix9Bg9oQAAAABJRU5ErkJggg==","width":24}
%---
%[text:image:2a00]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:907e]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[control:editfield:701e]
%   data: {"defaultValue":" x^3","label":"f(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:8255]
%   data: {"defaultValue":" -.4*x+2","label":"g(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:0126]
%   data: {"defaultValue":-5,"label":"Lower bound for x: ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:3d7f]
%   data: {"defaultValue":5,"label":"Upper bound for x: ","run":"Nothing","valueType":"Double"}
%---
%[control:button:121b]
%   data: {"label":"Run to set up initial plot","run":"Section"}
%---
%[control:button:90d4]
%   data: {"label":"Animate Chain Rule","run":"Section"}
%---
%[text:image:3e86]
%   data: {"align":"baseline","height":131,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAALgAAAKkCAYAAACzuPUOAAAXoklEQVR42u3dvY4cRRuGYQYQHxMZhCxCECs5JdjEmQnYhMQBIpiIDJE5dEiGyIiJyEk4AAJOAIkjQJwBHMJ+qpXGWtYzU\/1T1V319nVLLRDGa2vnnt6ap+up94033njj1uUKfL1xC0SE4CA4QHCA4ADBAYIDBAfBCY5zfPvtt7fffffd7Y8\/\/nj7+++\/3\/77778ER7i73+2bb7756t\/ffffd208\/\/fT2cDjcSU9wdMnff\/+dfQROcHRLkjcneHoTEBxdktbd95cmpy5rcHT9AfOS3GkdTnB0SxL4kuBPnz4lOPolpSW5NTjB0S1DigQER5cMSVAIjm75+eefswkKwdEt6fH8JbE\/\/vhjgqNfcgnK8dcJji55\/PjxRcGPd3iCo0suyZ3W5mmNTnB0yZ9\/\/jlokxXB0SW\/\/vrroPSE4OiSXIKy3+8Jjn65ubkZtMmK4OiSXESYdhkSHN2SS1DSPnGCo0vG1NQIju4Yssnq2KwnOLojl6Dc94Tg6I4xNTWCoztyCcqXX35JcPRLrqaWljAER5ekD49jDvohOLpiSIKSNmIRHF0y9qAfgqMrhtTUCI5uySUon332GcHRLx988MHgBIXg6I7cB8xUUyM4umRIgvLwLHCCoxuG1tQIji7JJShpfU5wdEtKSMaeBU5wdMPxKLahCQrB0RWX5N7tdq9qagRHdww96Ifg6JIxNTWCoztyCUraI35OHIKjeVJLZ8o0NYKjC3KbrNLIboKjW3Lr71MRIcHRBWNrag9\/H8HRfYJyah59+n3Pnj0jONpm6jx6gqMLps6jJzhCJCgPa2oER1eMrakRHF2R+4CZihAER9gE5f5BPwRHVwyZR3\/pzUFwNE1uk1WadkxwdMv19fWkiJDg6IIpNTWCI0SCcpxHT3B0ydSaGsHRBUMO+jlVUyM4QiQo52pqBEcXTK2pERxdMHQePcERMkE5ddAPwdEFY+bRExzdMbWmRnB0k6BM3WRFcDTP1JoawREiQbk\/j57g6I4x8+gJjq4YctDPuZoawREiQTlXUyM4mmdOTY3gaJ6x8+gJjlAJyrmDfgiOLph60A\/B0dOLPXgePcHRDXNragRH00yZR09whElQTs2jJzi6Yco8eoKjG66urmbV1AiObhOUITU1gqNZStTUCI5mmTqPnuAIkaCMff0JjqaYe9APwdE0JWpqBEezlKipERxNMnUePcERJkHJHfRDcDRLeoCz2+2KJSgER1O8ePGiSE2N4OgyQRlaUyM4mqRUTY3gaPkFnnXQD8HRbYIyNiIkOJohlYhL7kEhOJqiZE2N4GiOkjU1gqM55syjJzi6TlBy8+gJjqYpedAPwdEcpWtqBEdXCUpuHj3B0TSla2oER1PMnUdPcHSboMyJCAmO1Sl90A\/B0V2CMramRnA0Q6qplZimRnA0SYl59ARHtwnKzc0NwdEvpQ\/6IThafFGL1tQIjm4SlCHz6AmOJik1j57gaJJS8+gJji4TlLkRIcGxKo8fP66aoBAczSYoc2pqBMfq1KypERyrU3IePcHRXYKy3+8Jjn5Je0xqJygEx2rUrKk9XAoRHM0lKGPm0eeWQiXiRoJjMLVragTHqtQ86IfgaD5BKfkaExyLU7umRnA0naCMnUdPcDRF7ZoawbEaNebRExxdJShza2oEx2rUPuiH4FiVJWpqBEezCcqUefQERzPUmEdPcLT2Ip69StTUCI5mE5SSESHBsShL1dQIjiYTlKnz6AmOJqg1j57gaIJa8+gJjuYTlN1uV6ymRnAszlIH\/RAcq7BkTY3gaC5BmTOPnuBYnZrz6AmO1cltsjocDgQneMwEpVZESHAswtI1NYKjuQRlzjx6gmNVlq6pERyLsuRBPwRHcwlK6ZoawbEoS9fUCI41Xrhq8+gJjqYTlJIH\/RAci7LEPHqCYzXWqKkRHItxfX29WkRIcFRnjZoawdFEglJqHj3BsQpr1dQIjkUYctBPjZoawdFEglKrpkZwLMJaNTWCYxGWmkdPcDSZoNQ46IfgWIQl59ETHIuzZk2N4FhErDU3WREcVVmzpkZwrJ6glJxHT3AszpLz6AmORRly0E\/NmhrBsXqCUrOmRnBUZe2aGsFRXaol59ETHE0lKDUP+iE4qrPmQT8Ex1Iv1GLz6AmOxWihpkZwVGONefQERzMJSu2DfgiOqqwxj57gWIyrq6vVa2oExyoJylI1NYKjCq3U1AiOKqw1j57gaCJBWeO1IziK0cJBPwRHNVqpqREcVWilpkZwFGfNefQERxMJyhIH\/RAcVUgPcHa7XVMJCsFRjBcvXjRTUyM4Fk9QlqypERzFaammRnDUenFWP+iH4FglQVkjIiQ4ipBKxK3tQSE4ikrUUk3tPindIThm0VpN7T7Pnj1bbXlE8CCsPY+e4FgtQVliHj3BUY3WDvohOIrSYk2N4FgsQVliHj3BUY0Wa2oERzFamEdPcKySoKwdERIcs2jxoB+CY9EEZY2aGsFRhFRTa2WaGsFRnFbm0RMcqyQoNzc3BCd4v7R40A\/BUfoFaa6mRnAskqAsNY+e4ChOS\/PoCY7itDSPnuBYPEFpISIkOCbTck2N4KiaoKxdUyM4ZtF6TY3gmEVr8+gJjkUTlP1+T3CC90vaY9JDgkJwTKL1mhrBUTVBWXoePcFRjB5qagTHZFo\/6IfgqJqgtPb6EByj6KGmRnBUS1DWmEdPcBSjh5oawTGJVufRExyLJSgt1NQIjkn0cNAPwTGZXmpqBEeVBGWtefQERxFanUdPcJR8Ac5erdTUCI4qCUqLIhEcg+ippkZwFE9Q1pxHT3DMpuV59ATHbHo56IfgKJ6g7Ha7pmpqBMcoequpERyj6K2mRnAUTVDWnkdPcMyi9Xn0BMcscpusDocDwQkeM0FpOSIkOLL0WFMjOIomKGvPoyc4JtNjTY3gGEzuoJ+rqyuCEzxugtJiTY3gGEyPNTWCY+w3vel59ARHtQSltYN+CI7B9DKPnuCYRK81NYJjENfX191usiI4svRaUyM4ZicoLc2jJzhG09M8eoJjNEMO+mm1pkZwzE5QWq6pERxZeq6pERxZeppHT3AUT1BaPeiH4MjS80E\/BEeW3mtqBMdFeq+pERwX6W0ePcFRNEFpbR49wTGK3ubRExyDGXLQT+s1NYJjVoLSek3tPh999FE3f1+CL0CEmtpDaXr6uxK8Mj3Ooyc4iiUoqcZGcIJ3S+8H\/RAcQ77JXc2jJzgGEaWmRnCcpNd59ATHICIc9ENwnKXXefQExyDSYfYRamoEx6VvcPc1NYLjNSLV1AiO1+h5Hj3BkSWXoPT6fSc47ohy0A\/BcZJINTWC4zUi1dQIjv\/Q+zx6guMikQ76ITheIz3A2e124RIUguOOaDU1guM\/9D6PnuC4SLSaGsFx6hsb4qAfguM\/DElQeo0ICY67EnHEPSgExx0Ra2oExysi1tQIjldEmEdPcOS+qaFqagTHHREP+iE4XhG1pkZw3BFlHj3BcZKoNTWC444o8+gJjkvf0LARIcE3TNSDfgiOOyLX1AiOUPPoCY7XyM2jf\/LkCcEJ3i+5BOXtt9++G6L64sWLu8JDrw98CL5Rhhz0kx7lp3+mcdjHXPwofC\/rc4JvlCk1tfTB9L7w6Q7\/\/Pnzu\/+Wfq3FuzzBJSiT59Gn\/yc1gtJd\/Sj9o0eP7v49\/bej+GvKT\/ANUnMefVq6HO\/0R\/GP8o+50nLo+HunXOmN1lsaRPBC9HDQz\/HOP\/U6fkYguAQl5CYrS5QNE72mRnAJysWaWm\/z6AmO\/yQfW9hkRfCNEnEePcExOEHZ7\/cEJ3i\/3NzcbCZBIfgG2UJNjeAbJvpBPwTfMFupqRF8o2ylpkbwjRJ1Hj3BcUeuphYtQSH4xlhjHv0\/\/\/xz+8MPP9x+8803J\/\/M9Gs\/\/fQTwQk+nyXn0f\/xxx+3X3311ag94El2ghN8EkvOo0+iji04HK9PPvnk7s1BcBRPUIbU1HLLkc8\/\/\/y1r\/v+++\/fSZ9+\/eEbIQl96u\/yyy+\/EBzDqX3QT5L3+vr6ta+Z1t45Xr58efLvU2JtTvCNULumdkruMWvqc8ua3377jeCYn6DMmUd\/6g485M79kFNJS1re\/PXXXwTHZWrNo09r5VNSPlxvD13mpN\/78Oulnw4Ex5Bv3tlrSk3tnJBz4r5zS5WpX5PgEpTJEeG5D4dT7t65N83UnwoE3wA1amppXXzq66SHO3M598aZchcnuARl0jz6S4\/e55KSk1Nfe8pdnOAboPQ8+nPLiHSVegp57uuPfQMRfAOUPujn3AfBJGUpzu1jSU8+CY7BCcputxtdUzv1UGdunDf0TTT24Q\/Bg1O6pnbuw+XUhztj1+HpSh9CCY47Ss+jv3RnLbndNa3zz\/05Y5ZCBN94gjJ2Hv2lPd6liwvnPmiO+TBL8OCUnkd\/Sbq5G6Mecmrr7difFgQPTm6T1eFwGPy10l3z0teasynqFOey9jHrfYJvOEEZGxGmJcilrzXnEf0pzj3RHJrYpA\/YaZQJwYNSuqZ2Sbgar0uu+jbkA3aa10PwDScoYw76ufQBc+wDmBI\/MXJLIoIHp3RN7dwDnrUEz32oJXhwcgf9XF1dFUtQUuJRmksPe4bEkgTfeIIypqZ26cHLWoLnokKCB6dkTe3SI\/rSj+mHCp57ZE\/w4EyZR3+OXAa+huC5P5PgG09Qxhz0k5NtjYvgG6b0PHqCE7wpStfUCE7wpriUWU\/ZZDV3PTyF3JNMgm+Y0jU1ghO8mwRlyjz6nOAljosgOMEHUWMefU7wGg96Lm2X9aBnwww56GdMTS2Re9BDcII3k6CMraklco\/qa2y2yo1AsRdlo5SuqR25tNmq5JkoRy5V1uwm3DC15tHnosfS5P48+8ElKEXn0eeWDKU7mXN\/YhA8IDXn0ediu5LT0XJv1CEfagkekJrz6E9Nc6gxGW1IajPkdCuCB6TmNLVcklLyZKtc7j7kzUTwgNSeR3\/pg1\/Jx\/Uljqgg+AYTlLnz6C+tw0s+7Ll0RMXQbQEED0jtefSXmj1LnA8+5gxEggdjyEE\/Y2pqU5YptSc8jBljQvANJihz59HnliklPmhe+ikxZp1P8GCUrqldSlPO3WFLbJu99AYa8zCJ4MGoPY9+iIRT51ne59welLEpDcE3lqCUnKFz6S4+5yD8Sw94xm4FIHgwas2jP8e5rHrO1tmSQ2AJHowa8+inLiem3MXTHfrUT4WpP3kIHogaNbU5Uqa7+Ni1+KnsO33tqbsUCR6IGvPoh3Ju30i68w6V\/NyH1jm5OsE3lKBMmUc\/hnM7DdOdPCfpuaeWc4daETwQpefRl7yTHyO+hzsA0107vQFOLUtKTGwjeCDSYfY1ampjSXfrXNUsV2Qo1Qwi+EYSlDk1tamkFOVS5ezUUqb0IFmCB6FmTa3E2vzcUiTd6dOvlR4gS\/BglJ5HH+n7QvANJChb\/Z4RPAhpHPfaCQrBCV6N2jU1ghN8VWrX1AhO8NUoPY+e4ATvLkGZetAPwQm+OukBzm63k6AQPCZL1tQITvDmEpQx8+gJTvDmWLqmRnCCr\/FNqXrQD8EJ3myCstWIkOABSCVie1AIvtkEpXZNjeAEr0oLNTWCE7wapefRE5zg3SQoa9TUCE7wYqx10A\/BCb7Yi6emRvDNJihT5tETnODNUGsePcEJ3gS15tETnODNJygiQoJ3TcsH\/RCc4IskKFutqRE8ADXn0ROc4KtTex49wQnedIJyc3PDboL3y36\/l6AQPC5qagTfdIJSYh49wQm+CkvNoyc4wVfBQT8E33SCIiIkeNeoqRF8swlKWpvXmEdPcIIvgpoawUOz5jx6ghN89QQlPeEEwbsl7TGRoAwnfR55\/vw5wXtBTW38T7yeUqXNC+6gH4KHRU2N4OE\/MKmpEXyzCYqIkOBdo6ZG8E0nKFudR0\/wIJhHT\/CwmEdP8M0nKGpqBO8WB\/0QPPwLpaZG8M0mKFueR0\/wAJhHT\/DQ5D5gqqkRPHSCIiIkeLeoqRF80wnK1ufRE7xzzKMneGgc9EPwzSYou91OTY3g\/aKmRvDQmEdP8E0nKObRE7xrzKMneGhym6wOhwOLCR4zQRERErxr1NQIvvkExUE\/BO8WNTWChyZ30M\/V1RWDCR43QVFTI3jXqKkRPDTm0RN80wmKg34I3i3m0RM8\/AujpkbwsFxfX9tkRfC4qKkRfLMJinn0BO8a8+gJHvpFGXLQj5oawcMmKGpqBO8aNTWCh35RzKMn+KYTFAf9ELxbHPRD8NCCq6kRPLTgamoEDy24efQEDy24efQEDy24efQEDyv4kIN+1NQIHjpBUVMjeLeoqRE8tODm0RM8tOC5BCXV2EDwbnHQD8FDC66mRvCwgqupETy04ObREzy04A76IXhowc2jJ3howdNh9mpqBA8ruJoawcMKrqZG8NCCm0dP8NCC5xIUESHBuyaN45agEDys4GpqBA8tuJoawcMKbh49wUML7qAfgocWPD3A2e12EhSCxxRcTY3goQU3j57goQVXUyN4aMEd9EPwsIIPSVBEhATvllQitgelLs+fP++qrB1KcDW1+jx79qyrn4KhBFdTI3howc2jJ3howdXUCB5WcAf9EDy04GpqBA8tuHn0BA8tuHn0BA8tuHn0BA8teG79LSIkeLc46IfgoQVXUyN4aMHNoyd4aMHNoyd4aMFzCcrNzQ0zCd4v+\/1egkLwuIKrqRE8rODm0RM8tODm0RM8tOAO+iF4aMFzCYqIkOBdC66mRvDQgptHT\/CwgqupETy04ObREzy04LkEJT3hBMG7FTztMZGgEDys4GpqBA8tuIN+CB5WcDU1gocWXE2N4KEFN4+e4KEFV1MjeGjBzaMneGjBzaMneFjBzaMneGjB1dQIHlpwB\/0QPLTgamoEDy24efQEDy24efQEDy147gOmmhrBuxXcPHqChxZcTY3goQU3j57goQU3j57goQV30A\/BQwt+Se7dbqemRvB+BVdTI3howc2jJ3howc2jJ3howc2jJ3howXObrA6HAwMJ3q\/g5tETPKzgamoEDy24g34IHlpwNTWChxY8d9DP1dUV+wjer+BqagQPLbiaGsFDC24ePcHDCu6gH4KHFtw8eoKHFlxNjeChBb++vrbJiuBxBVdTI3howc2jJ3hYwc2jJ3howYcc9KOmRvBuBVdTI3howdXUCB5acPPoCR5acPPoCR5WcAf9EDy04Pc3WZ3bi6KmRvDmBU\/fsJSWpNLCuTX3e++9d\/v48ePbDz\/88Padd96xyYrgbQuevkkpIclNLL50PX361D5wgrclePrm5JKRsVfaTehxPcFXFTytlUuLfap47EMnwRcXPEV5\/\/vf\/6rKff96+fIlEyvx6NGjrj7YVxc89ySyxpUSl7SH3B6VOsL09vetIniS68mTJ3dTF5YW\/DjtIf35JCd4FcHXlPt4vfXWWyQneHnB07Jkbbkf3slB8GIfKFsQ++Ga3KYsgs9mSPtmzUuESPBZ1M65517pUb\/1OMEnMaRa1sJSRQOf4JNIm6BaFzxd+\/3eXZzg4xhydmBLd3H7Vgg+OhbsRfB0pYOEQPDBzNnyutalKEHwcMuT+w9\/dDkJPojcuSWtXkaeEHwQrWffjlwm+CzBcye\/tnyB4EO\/QJeXD5oEDy24vSkEJzgITnCCE7zBy+hBgmdJm5ekKAQPK3ivOXh6Y4LgWVIVrEfB07ESIHiWHooOig8En\/wFUnnAB0yChxU8kTYu2YdC8LCCp4ZMT8sTZxcSfDTprmgPCsHDCp4+tJ0bM9LS3ftwOLCU4NNI5460LHg6wtndm+CTab2+pqZG8NmkBz+tHLzpwQ7Biwt+PBc8HV3ssB+ChxP8KHkrqUpad3uoQ\/DiXzhJtfZOQ3ITvOqMnjXHmKQ3F7kJXn0IVZL8iy++MIAqCF9\/\/TXBT5F2Haa7as27eVqSfP\/99yzE8oIf7+ZpH0gSsZTox6en6QBQD3GwquD3RU+P9o9PPqc+4k9JTcrdiY2mBH+YtiTZ07p5yCm1qSKX\/n+NeHQh+CmSvA8vIIzgAMEBgoPgBAfBAYIDBAcIDhAcIDgITnAQHCA4QHCA4ADBgeGCu1xRr\/8DcX8aXBZ8UqMAAAAASUVORK5CYII=","width":36}
%---
%[text:image:1709]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:checkbox:90c4]
%   data: {"defaultValue":false,"label":"Select this check box to see answers","run":"Section"}
%---
%[control:button:156a]
%   data: {"label":"Generate Image","run":"Section"}
%---
%[control:button:07d9]
%   data: {"label":"Add the needle's movement","run":"Section"}
%---
%[text:image:8c41]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:editfield:6040]
%   data: {"defaultValue":"0","label":"The angle is ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:3cb2]
%   data: {"defaultValue":"0","label":"The angular speed is","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:048a]
%   data: {"defaultValue":"0","label":"The linear speed is ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:9fb0]
%   data: {"label":"Check","run":"Section"}
%---
%[text:image:8279]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[control:button:0ee1]
%   data: {"label":"Initialize Values","run":"Section"}
%---
%[control:button:97ab]
%   data: {"label":"Generate Problem","run":"Section"}
%---
%[control:editfield:8498]
%   data: {"defaultValue":"r","label":"Enter the derivative here: ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:7abb]
%   data: {"label":"Check Answer","run":"Section"}
%---
%[control:button:8db3]
%   data: {"label":"Analyze Results","run":"Section"}
%---
%[text:image:8bda]
%   data: {"align":"baseline","height":326,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAzIAAAJ1CAYAAAACH8VNAABKAklEQVR42u3d\/688310X8P0\/jMEfiBaNSkxEjRo+aRGtdPVaRQkIUcFPP1gI8k3qdQsWNDRqit8Q3+5NxC9UqsEC2oh7A4WatkAbpILX3rYIfuy70lbkXSzYFMp4Z3dn95wz55yZ3bt7vz4+ySOf93u\/zM7M7rzOec45M+\/Jb\/icL2wAAADuk4mdAAAACDIAAACCDAAAgCADAAAIMgAAAIIMAADA9YPMZ\/yx55vf9ae+Yi+\/+RVfakcDAAA3H2Q+65Vf3rz5pz\/S\/Juf\/F\/Nd737afNP3\/li8+Rt\/735hz\/0geYNi\/c1r\/8P722+5d9dNK\/9tz\/VfMO\/eU\/zNf\/qJ5qv+Bfvbr70H\/9Q8ztf8eftaAAA4OaDzCuf\/yvNP5y\/seofzL+r+fv\/5Luav\/eP\/0Xzd7\/jnzdv+Ef\/rHnDt39n89IveJUdDQAA3HyQ+bq\/8Yam9t+nPvWp5pOf\/NXm\/33iE80v\/\/IvN7\/0S\/+3+cVnz5r\/\/Qu\/0PzpL\/86OxoAAHYw9r+7tt4\/efG+5qu+9duLz7fPta+5E0GmDTE\/9ANva9799X+wefbzPx+FmI989H+PCDKvab7jxWCBL35f8\/Lq67+9OW8+1HzHq\/bd6Ou+P1xO\/N\/PfPdrrrH8Q63X8T7rq99+tZFv\/3bFBQDgBoLMIV5z09qg8slP\/L9smKk9d+NBpg0xL\/7Cx5vXvOKLmw\/\/p89s\/tuTfxCFmP\/18x+uB5lXfV\/zM1fLOX99\/Nh3vP6+BJncch5okGm\/qxff1Zy\/eFPrCAAgyNy3IFMKLIcOMaODzNd8y9\/JhpiL\/\/kLzR\/+m9\/fzH\/HS5qPvuMzm3d9ycuiEPP06Yeaz3\/ha6sjMeevv+kOvyCzz2e9\/Ls\/tBxx6v6vwAAACDJjwswxQszoIPPVr\/tbvRDz5re+p\/ndX\/r3mukf+PzmBz7r05uP\/vPf3vyXP\/6S5gNvf8cmxLz4Pz\/Y\/Mnnv7oyGvOu5quHpjJ1\/22mNKWd8Hhq2ioYpa8J\/176c\/r33HJ3DzL5bais8+tXo1TbqWq17azvo\/O3f+jqwfU+flW43O\/bYTu716xfvxyZCaf\/1dZ7aJsAAHiIQSYMM8cIMaODzFd90+uXO+rXPvXrzbte\/KXmW99y2bz0G7+3+ezP+8rmqz7t05t3fvZvaT761z6j+dkvfknzjm987SbE\/OzP\/Y\/mT3zZV1WmKg1dDzMURFad8H7n+ABB5vXvGrgepH+NTD5EjV32enndPmlfswl6pe2s7aM0UGxDSjuq0ozezvS7CkJNbr2XgSlej\/xzAAAunBdkjhxkvvK137rcUWc\/\/L7mlf\/0vzWf\/0\/+c\/MFf\/sHmi\/4PZ\/XvOE3fVrz05\/3kuajf+Ulzc9\/xUua85f+\/ubnfu7nliHmZ\/77zzZ\/\/C985d4jMqvOfPdfJnwUl3GAILMewSiHh5FTy3LbkF320LoU9tXQPvqcyijKqO38wt50smUQKo6QrUaJSqFu+xwAAKaWHTnIvPqv\/c3ldLKPfeyXmn+5eFfzJfMfb75o+hebv\/4bf2PzHz7zNzcvfvFLmo+c\/rbmPd\/6Z5ofefnva9793d+9DDHve\/8Hmumfe\/V+18hEnfdwFOCGgkzYad93allxG3LL3iPIjNlHQ0Fm1Hbm\/us+Nz\/VL79N+14XBQAgyLjYf48g8+V\/9Vs2\/07Mxz\/+8ebyve9tfuRfv6n58T\/0W5oPfvlvaz7yNZ\/RvOu7\/vYyuPzoj\/xI8x+\/6ZuWf37v5fuaV3zJXxocccnetax9rjhdaWhqWdJhXn5O+f3515VHJEYHmeI25JY9fL1Obx1G7aOBqWVD2xl+xueUwkqwblG4qj0HAMBDCzJ37vbLr\/qGv977xy4\/8tGPNv\/jTX+6+dgbf2vzn\/\/l6XIqWTed7D3v+alliPmvF+9t\/uiffWH4+osm9+\/IBBehR7f9zXfSexerh1Ou3v6u8ihM6XXRlK0xoz4DNwwItyG77KHRodx2jt1H8WdGF\/sPbGc7FSw37Ww7vSy8sUB6w4DacwAAPKTrelp37h\/E\/Itf\/41RiOlusXzx49\/X\/Ni\/\/zvNBz7wM5sQ043EtCHmp376vzZ\/5Iue92N80Gq3cr7JW0oDAPCYjAoyX\/Z139gLMeEtlksh5iff81PNH\/lCQUaQsZ8AALiFIPN7\/9SXLQPJPj7zFV9kRwsy9hMAADcfZAAAAAQZAAAAQQYAABBkAAAABBkAAABBBgAAEGQAAAAEGQAAgOMGmcnX\/CAAAMD9IcgAAACCDAAAgCADAAAgyAAAAIIMAACAIAMAACDIAAAAggwAAIAgAwAAcLQg8+53vxsAAOCojhJkfviHf7h59uwZGd\/5nd\/Z\/OiP\/iiPiO\/cPgIADkuQEWTQSbePAABBRpARZNBJt48AAEFGkEEn3T4CABBkBBl00u0jAECQEWQEGXTS7SMA4PEFmUUzm0yaycasWYx538W8mW5e2y5j2swv2j9fNvOTSTM7v+9BZt68EO2Xtefnh\/sBfP\/rmucmLzTz9M8HWW5\/3Z\/75rfsuKy3NK972aR54Wxg3R9gJ33+\/NU+e9nrmrdc+7Mr+3CX34cgAwAIMv0QMz273Dx2eTYdF2aKQeahjMisgkzcAb1Gp\/QmO6rL5T7XvO770+1JHxNkivvvZS80L7xs1\/114CBjRAYAEGRqYSQNIKtwsxlRWb4mHa0JR3H+cvOak+7P7bKCEZl12JmdbkcFwpGaVWhavW92evXn08XqufPZ7iNENxJkVmfqlyMb67Dw3MvadVx36M9eiEZAoveGoyTLM\/3hiM\/V+9Ng0Hv9+vHwM0ojBtkgE3So22VcddKfC5eRXe76Pd+8XZfNqE66vju8fznaMQn2W2\/fHT4g7dJJf8s3P7dcz\/b\/0QjceptfeD7\/HS9fv9mGbv9v9\/vmt5N8zmYEKB31i\/bxajn7j64JMgDAgxqRWYWONGCUQs2iDSQn8+Zy7NSydQjqRnz67+\/esw5GyyATj+60YSccMbrdIBM8tg4am+eT8LDs1G469PFoSByGclPLaq+PO8jZqW65IBM+tgwNwfPRtoTL7TrP4Tqu39db99x6rf+chKVVJ3z13OrP8faGHfyb76S369WtS7te\/XAZhY9o27avXT4X7INtgAxDXvB95B4P9nEcqpL1EmQAgEd7sX80AhKEmuXjwYhIGF5GB5lgxKdd3jrILEdjuhGY6O\/Hn6Z2nWtk4hGJytSjsHMadVRHXCNTeH0cjoaW21\/3TehKOt295WyeD8NGOYSV1yt5fzKKsx2h2Gfa25E66ctpZdttadexFFaL+z8KHuHUsiCAhJ8z4vfRGx0ytQwAEGQq082SgLOdPrZLkAmCUBBklqMz2SCTTGfrRnDuyNSy2jUi0fSgYIpVr6M\/EGRKr4+nLlWmYe0SsnKft1mX\/vUdxSCTXa\/k\/cUgU5lKd8Od9Oy2ZKd65UZScu+L90EXjNJRp\/Bza8EvO21RkAEAHl2QaYNFECbC6WbLIBIEj73uWlYJMuURmfhzSo\/fuSBTG+U45IjMmLPyOwaZ8SMywd9HjRbsEGT22c6Dd9JL0wkz0+mS\/ZaGwfyIzPo9z78umL5W2WfFGyocZwRLkAEA7t1dy6LrY5ajMPG1K93z0R3NrhlkitfIJO+5W9fIjA0yybUhSbDYXD9RCjLV1yePFwPSDkFm6BqZ3HYMrW8wtWwwyCSP39o1MmkYrYS3epBZT0vMBZnuuWzoKV8jE4c+18gAAKaWZf4dmeT6lOiuZeFz3fva0NHdNCB\/17JskInuWjZr5sHIy\/bx+zS1LJxadNURPRtzV6\/uOpzMXctKdycbc3evXYPMDncdK4WS\/HqNH5GJpnTd0tSy7QX6uelmhe+o912utz+5Tig7PS\/72ylNLYuv2TK1DAAQZO6EVfg59MjL9YIMD8nd+c6Pf2MDQQYAEGSOKb2RwIGvgxFkuHOd9OT2zfYRACDI3PsRmZulwybIYB8BAIKMIINOun0EAAgygowgg066fQQACDIIMjrpvnP7CAAQZAQZdNLtIwBAkDlKkPme7\/keoaXgzW9+c\/PWt76VR8R3bh8BAId1tCADAABwTIIMAAAgyNipAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwf4LM2GUCAAAPnyADAAAIMoIMAAAgyAgyAACAIAMAAAgyggwAACDICDIAAIAgAwAACDKCDAAAIMgIMgAAwOMOMrssE4C7Te0HUPsfVZB59uwZAPec2g+g9gsyAAgyAAgyggwAggwAgowgA4AgA6D2CzJ+BACCDACCjCDDPXR5Nm0mk0kzOV30nlucTpbPTc8u91j2opm1y53MmsWY11\/Mm2n7+pN5c1l4Tbc+s\/NrbHP3OaHMto\/dd9t9s+P2giBzP2rjJFMHR9Sru23PenU+i+rlQWryTX6P6+8rrt13az0PuV6HXebx2rjud5Q91hBkNGaM69inxemGO+Y3EWTaRjgNMRu7becxGh0QZO6IQq3YHO+PMch0+2TPEz+347KZn8TbeVdr92NtU9IQI8wIMhoz9iz0SUBIGq307GTYgG8K8OlsHYqmzfwi01D2OgfBc0HHYH6aL2a5IBMXwVqj3K1PWiAzjw+sS35f5DoG232bW79twzXfrMNq31U6VPe244Qgc\/86V5ta0x2H3fEXBpngGO11vtIR4E0I6GrD9njvj473O+G1EaNewCh+di7IlOv1cpsKtXu4Jif1bESdD2tydhlD+2FTI9PlTJrPff5zx7023FebdZ41s5NKJ7taqwf275j2ILvv1s+H33Ww7v1wNLBvd92GgTZu8\/s4C3+LmXY\/ep\/ZDYKMxox9zz5uilYSbgbOTo7q2OemdIVFt\/R80EimjWb2TE6po187m5gW04F1GRdk0gLfbzh6y0m3YWifgSBz5OlIhc5UsUZkOp6F47v7jH49S+pQ7ngfO2JUrI\/HCTKls+uboDO430p1s\/A9VPfD2CDTf119X2aC1WCtHh9kitte\/E6nvce7\/R0HmYF9u\/M2DLdxpd9DtQ3r9UcQZDRmjJ5mkJ7dGWg80tGawbM3lalkm88sn6GMG8318jMjQ7mpZ\/Vh++TM54h1KZ\/pWi8jU4xLy+jvgxEdGRBkbmDK7cBZ+kynLe3Ub2tEcoIoOr4XvbPwtXqWdoKHr29MR953DDKFk0HRNufajdJIVia4rNarPgq1+\/S3\/nb1andvXw63B8XfS7FW7xBkSicUe+vRn02Qfu\/5IDPQJo\/dhhFt3CbIdMscCCm9MI8gozFj16kUbcErdvoLUxXyry8FmeTsV9rAZYf0V6\/JN5rj5tbuFWRyUzGSs6mlIJO\/nmdoGWlD0z\/jZd4wgsxNn+Cp1KviiZRC\/Ys6r0E9WC+vm57bPr+qIaXOc3\/dtrVmh88+YJDJ19hCba2cgKpNYx4dPHcIMuWRkOTEXnU9hmr1+CATthnRuvbWozw9MR9khvbtbtswpo3rv6Z\/ArI3CmokRpDRmHG96WXdPOCgAU0bsMKITLVwl0ZgKh2DfYNMdSrGLlPLciNMI4NM\/mzqrkFmIPyBIHPDF\/+XO7fxMV84lpPOaxdWZqfT+NrCq0AzG3OsZzvwYz57OMiURi6KIzLZUaLdg8yoa22ejWubrhdkkrZmVN0t1erx6xHuv0MHmXH7dtw2jGnjdgky9eCOIKMxY+8C3C9Gw9OsykWv1ygecGrZ2O0rXljau17nZqaWDQeZZ8ULhEHtP9YNUMLjLHlsRId8eHpXeo1HfKZ7txHY\/Nny3aeW9ad8HWVq2cgpwUOj6UNt035Ty3a\/o+bwb2h4\/46eWnaAILPbTIV0G3afWjYmyCDIaMw46P32y3eh2W9q2d4Xtu96sX+tkz\/29ssj1iXenva9+1\/sXwwypfXVCCDI3Fgt3G9q2ZgL7vMnUrafXa5lxfUbunlKcYSgVK8yQSZYt70v9h+ckjeurg9fTF4OMv3aPf67Ht22ZELJ6JvmlC7G3zvIDOzbwW3Y\/2L\/4SDjJJ0gI8hw0Atca1Ob2kITd7jHXSMTF722sEVDyQe5\/fKIf2NmzD+IufMtQnNBZpfbL1dGZGq3rAZB5ubCTGXaa3FkoXoL5MLIx9DNVsas3863X05ff\/V48SL4cpDZ5fbL5f1Wu\/6nNpOg3zblrxdKa3fuM\/P\/NMDlqOmHhVo9sH93uf3y\/iMyA\/u2ug3XuP2yICPICDJwC4HOyAeCDACCjCADggwIMgAIMoIMCDKg9gOo\/YIMAIIMAIKMIAOAIAOAIHPoIAPAw6D2A6j9RmQAMCIDgBEZQQYAQQYAQUaQAUCQAVD7BRkABBkABBlBBgBBBgBBRpABQJABQJDRmAEIMgAIMoIMAIIMAIKMIAOAIAOAIKMxA9CYqf0AgowgA4AgA4AgI8gAIMgAIMhozAA0Zmo\/gNovyAAgyAAgyAgyAAgyAAgyggyAxkztB1D7BRkABBkABBlBBgBBBgBBRpABQJABUPsFGQAEGQAEGUEGAEEGAEFGkAFAkAFAkNGY7e1DH\/pQ87a3va1505ve1Mzn86X2z+1j7XP2EX6LCDI4hvH9I8gIMnfKT\/zETywLTVtk3ve+9zUf\/OAHl9o\/t4+1z7Wvsa\/wW0SQwTGM7x9BRpC5M0XnjW9847LIfOxjH2s++clPNr\/+67++1P65fax9rn3N0YrP+ayZnMybS9+H3+Jt\/xYrFqeTZnp26bsSZDjSMTw\/mTST00Xy+GXhcR5eDV80s0n\/u748m\/r+1X5Bhvzwb3t25AMf+MCyyJT+a59rX9O+1rAwj\/W3KMgIMhz7GF51ZGfnSSfWia5H9f1PJtNmfiHIqP2CDAPaYd5WWHS+7du+rXn5y1++1P45LD7d62udu6jgtCMty6K0smmcliMw02baPt42UNGIzPrsW\/qei\/nV62fNIjuKE79HZ\/Nh\/BZrDeHwb3H1mwg7RL0zvNnf2NXvcvlc8Fvrftd+X4IMR21Ptu1Gd\/y1HdugU7s8RrtjNzhGo8fjTjD3p4Z33\/fsNA6vvSAT9i2EXEFGkHm82ovvXnzxxajRee655yJh49O+tn1PeVpY0Hlcdwq7BiU6q7YsQkFjEyyj7YxmX1cJMnGRawth3Anl\/v0Wh\/7L\/haXv7\/17+Xq91EKHPXfWCn8GJERZDh6exK0I+2xFh9z8WjN9jhOTlq0x7Sz9\/e0hnfBNf5OozY+qtOmHar9gsyj1g7tfuITn9gUlvasWdrwtI91\/7Wvbd8TLScMLGnYKAWe6Ixb+Fx6Fn3boI0PMjyE3+LQf9nfYvd7XI72lcLs0G+sfDZXkBFkOHJ70hthSWp+bxSm\/Xtt9JX7VcODEbjg++7N9AhHYdLfBYKMIPO4Cs+v\/dqvjW542tf2C8+2EUkDxfKMWTC1LAoyaSFa\/r0\/P3rTeaxOLYs\/S4N2\/3+LQ\/\/lf4tjAscOvzFBRpDhhtuTyvGWTFWOp5F111ZMdGrvdQ2PpxJ2v4Gwb9G7ZmqgbiPICDIPfCj4Ix\/5yOipAO1rc1MBuiLTFp1oeL8UPIpBZvyITPkC0GRONffytzj0X+m3uJpWMt9OMdt5REaQEWS4zfakGmTGXA\/hLpj3uIbnrolaXzNjREbtF2TIXZz3jne8IyoupYsz2\/\/a12YvzhycBrCexzoYZMZevxAvrz+PWlF7CL\/F2n\/532Lw3S+nmOU7M6OvwxJkBBluvj0pHm\/xaOrqBhzt8Zp0fl0jc89reOaOZeEtmV0jo\/YLMqS3SxxzFqV9TfmWt7liEt4Z6qownQedxEqQKd5RKrpz1NXyzsL3hNMKTC17rL\/FdJ58+dqpkXfGy408umuZIMOR25PKiYPS3cmiaWdOZN3f7z83oyLTv3DXMrVfkKHT\/QNWteLTPndb\/wghfot+ixoztd8xjO8ftV+QoVh82rMj73znO5dF5lOf+tRS++f2sfY5RQe\/RQQZHMP4\/hFkBJk7OSzczldtL75rC02r\/XP72E3\/C+r4LfotovY7hvH9o\/YLMgAIMgAIMoIMAIIMAIKMIAOAIAOg9gsyfgQAggwAgowgA4AgA4AgI8gAIMgAIMhozAAEGQAEmfsdZAB4GNR+ALX\/0QQZAADg4RNkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAAAAEFGkAEAAAQZQQYAAHiYQQYAAGAfggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAAAgyAAAAIKMIAMAAAgyAAAAggwAAMD9CjLPnj0DAADuKUEGAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQEGQAAEGQEGQAAQJARZAAAAEFGkAEAAEFGkAEAAAQZQQYAABBkBBkAABBkBBkAAECQEWQAAABBRpABAABBRpABAAAEGUEGAAAQZAQZAABAkPHlAwCAICPIAAAAgowgAwAACDKCDAAACDKCDAAAIMgIMgAAgCAjyAAAgCAjyAAAAIKMIHP\/LJrZZNJMUqeL1fMX82Y6mTWLe7RNi9NJMz27vMb+mDbzi\/5zl2fTo+6X5fJP5s3lPu8\/yPqsfguz8yN9N+ezwvZdNvOTY31u+fu8l0Z9z5X9eaeP59V673\/s7r6d0TFd\/H0e6Lffrc91PuexfH8H+twb+37HHIsjPn9M29W+pl3edtsG2vBD151D\/gaXy+qv+z6\/ofK+O2b7ErYz7T65ic8SZAQZRnReg4NRkLkfQeZovwVB5v4RZPYKMscUBpkb2C5B5g4GmQO1XWGQWb12oA2\/sRMo+y43rc\/71ey7E2QeW3sjyAgydzLIBEUhKWDt4\/mzJslZoaBzEL4n6jREZ2PKRXLX98cFbVXEuvfH2xmu8\/ZsyurvSTFadkSCdVjvl3nbUGZeX95PuQ7O6v2z0zDIlNc7uz\/C72nZYE9X+6ZbXrj+UWMefM7prBBk1g3B2XZ\/b7Zp3RBNT4LvoPS9rjsS89P0uaSh2eX9F5l1ym1b+\/38q6Qj0753+ffK9lV\/p\/F3NNiBO898\/mZ5heMn3b\/J8Xi5+f2Fv8Gh7yvZp7nfRbTNIxvmcFnh72i53Ve\/rcKxtfk9r1+T3Y+V9ckea73jYbttm85tekwnr6std3Zaqin5dZ6dFkZkCtu1qmHz7W+icAIl+\/33Op1dJyv\/exx1PBXrR+37q9XeZ8Ntx3V\/N4Xvt19\/ajV7fSydzkaNdCx6v4vyiEz43XWfF7Vd6+8i3W+XZ7PVfrha3uq5MW14UqNLx2r6m1yub9JOpr+v3uuHfzP1IJPus3FtWfGYSduXHd5\/mWvfs8fs1Wecrpa1OL1fJ34FGUHmgQaZ4LGgaEUjBlGRTc6IhcUpKt7h2Yr4c5cNQK7Y7fH+sDFYPh42jGln7zw9c7fLiEzyOevPL++nfEcn3IfhNmTXu7Q\/0o5br\/DG290tO9rv6wJfCjJxUAk\/N3zP6nvJ7Zdu+f3vJvwuKr+LaP2SdSqe8Q6\/z\/i73Z7RrGxfZX3is\/mFzmJldGj7\/srxk+7f3vecnGQIllf+vnLbGf4uMg3\/0KhF0iGJjoHc97Ze3qqjEAfgUiDNrU\/u\/b2R5FKQqZyxry+38PvO1NXodb31KW\/X6vWZ3+AO3\/\/g9zf2eMrVqRHfX7n2VkZT0rbjWr+bzPdbW16lbYt\/y7uM2BeCTPSb3NaF0gnE67fhaQ0pHKtJjcquT+8ETOn1+TZnMMj0fgP9EJH7DovHTG+GSaUtTE\/Ghc\/tWxsRZASZ27lGpn9msz98Xx7KDYpbaTg\/7XiWCvce79+uV1rgx0yZ2yXIBK9LOiej9lO6bZu\/V9a7tD8qHZzelLVSR6o4BF\/ZpnQ\/ZM\/WhY1S7jtLtq\/0u8h03IojDYXvs5uWEYfiyvZV1mf3aUnh59SmOwTrPLR\/s7\/Poe8rc2Ki+ru45jTC3O8x6CAMHyvl9cm9Pxwx3TfI1JebO+4HpuJk16e+XeFva7Oeo77\/MKSHv\/l6DS0eT7k61au16TIqNWxs2L\/27yYXZHLLq9Xs9LlS+1CvnWntLq3vdlRgl+lJY9rwyvKKAWvENTKF15dry7hrZOLRk\/6ofOm3mD1mgu+gtl7x++snnVwDI8gIMvdgatmzQmezeEFhMlQ9SYtAWlx7r5\/Uz3Tt8P60Mc0W+FFn8He4RibpnIy58LJcVOsNU3Z\/DHXcestrXzu2s9F\/vHjmsLdfK6G2GGQKv4vM1J9dg8zmDNpmWtnA9g38ThdjphjlfkO1KV61aULR3zO\/tUJjWwwy2d9FbtrluDnq0bIKnaNxHchaZy3e\/vD12f27c5AZudw9T7T0z8YPTY8tfX7p+w+nTVZGCkceT706Nerk1kDnujIlsXS87\/O7qV0jky4vX7PTY6nUPizq03LP67+v+BhaTVkef63R2DZ8+FgtXqdZCDKl19dry9DUsvJvtPxbrBwzaZAprFf8\/lKQ2a82IsgIMncoyJTPII8p9rvdwWXfO8DEjWmhSB5kRKYcZEadsamOyIw5I1cYYap03OoBZeyITPD3akd7YERm8\/eRv4tDBJl1xy7uKFS2b\/TvdOR31q1nNCWhcvxU9m\/aqJc7evnva\/SI0ph9UDtzWvk9jj2zXlqffUZkwjOv+43IjAgyo0Zk6tvVu84w+fzy9x+MOJ5Vpr6MPZ72HpEZU8Mqv\/0D\/G52CTL5mj02yBxyRGaX\/bdHkNnhWL3WiMyY2rJjkNllRCY3Hay2XuODzI61EUFGkLkrQSY3lzY\/jWB11mNVBLKNa+bag2jOc7Egjnt\/8RqZaH5t5v0DIWJckKntp9q+r1wjE6x3cX\/UGpeksShezzN0jUw0h7x2YXH9GpnoepOBa2Si38VBgkw6l3pg+0b+zsZdIxOfRU+vK8odP+ODzPosYXiGeej7Kv4uCqNYo4NM5rqCUoc7cy1G\/1gpr8\/oa2SS7\/N618iMCDJJmMxfI1Peruj1Y65ZTLYrPCterO1jj6fKdQm1769ce8vtT\/Tbv\/bvZmyQqdXssUEmt73t6\/JBJvd57WvC72D81NXrBJla7SsE+KEakpmCWbyWbNcgM3iNTOaYKV4jU762thxk9qiNCDKCzN0JMrU7iMXTnRZB8a\/c2WnUnZF2f3\/trmXDd6PqXp9Zn24KxIgzs8U7rVWmVSzvMlW4a9ng9gydJYumbxTuvLW+o0\/xrGJw557sxedDd\/lK7xpUmtpV+l3sFWQy32dv\/1S2r\/o7jafPVPdJb9pF\/Hzx+KmOeCVTHNJRweCuZcV1K\/0uCo8Pje5t9tH5+BHCRXAXqeKUmuLvd8RdyzKf0ZsSu+NdyxZjzshGdwCbb4Nu7\/qhwtSyq99j\/a5zpe9\/5C1zdzmexty1rDDSOXRXv+Jv\/5C\/m8z3W15e5Y5X1ZGS3F3ayqPNud9Xru0ad13RLlPLKsdq8bvufmuZu5aVfhuVY3bvILPDXceK+7F2zI0ZkRmzXff03+ATZAQZeHz\/Lsk91J\/Wcfjte7i34Lxq4J2BvOP\/FtYN\/xs5AIKMIAOCzM1sR\/8M+qG37wF39jf\/dgV3OcjE02wABBlBBgAAEGQEGQAAQJARZAAAQJARZAAAAEFGkAEAAAQZQQYAAAQZQQYAABBkBBkAAECQEWQAAECQEWQAAABBRpABAAAEGUEGAAAEGUEGAAAQZAQZAABAkBFkAABAkBFkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAQZAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQAAAAEGQAAQJARZAAAAEEGAABAkAEAAAQZQQYAABBkAAAABBkAAABBBgAAEGQEGQAAQJABAAAQZAAAAEFGkAEAAAQZAAAAQQYAABBkBBkAAECQAQAAEGQAAABBRpABAAAEGQAAAEEGAAAQZG44yIxdLgAA8HAJMgAAgCAjyAAAAIKMIAMAAAgyAA\/f2Yeb8n+\/8n+arz3YZz1tLtaLvfixyuu+9\/80v7h81a82P\/i9t7FP3t\/84K80A\/\/d1roBIMgAMBxkDhpmBBkABBlBBuDQQebDT+PnfuzjB+6035cgE\/va9\/\/qEUanABBkBBmA4wSZXvAI\/v7hj2\/GJrahpD+SEQeWcHnbP7f\/\/eL73z8cZDaP59a3W177nnDZ3TJyj+0XZAaDX+Z10ahXJhBtPqMU9NJtNyIEIMgACDJjR2Ti8DH8XBpSyq+JXpcLMj\/28YFpb5Vl\/8qvJiGg\/e\/jzdm+IzKb9YuX0e3HbjvGXntUel1\/f5jeBiDIADD+GplNwAnCQjKqsF1G0LmvBaFsR3793l6Q2Y705EZ\/0tGizfqG4af32PgQ0J9alluf7vO327\/drlwgWz+WC0XpY8lIT\/j50UgWAIIMgCCT6yiXrnEpPZ52uAuvS4NL8e+1dcwtu\/bYdYJM8FgakIJRrfxIV7xP0ill2RGXdPtdqwMgyABQu0Zm7MX65XAQT7cqvS55fMcgs1rv3LLHPrbHxf7RqEluhKY\/1Sz3eD3IbJdXel31pgkACDIAgsxdGJGphY8bDjJheHl\/\/ZqZUSMyu4yyhFPmjM4ACDIAgsy+QeZA18j0LqbvXyOTu14nvkbmpoJMf5SkNPIy7hqZYJ9uXrPal9nPT17jdwwgyAAIMnsEmdr0r5u9a9nNBZmhWzpXb6KQu5Zmn\/02+J0BIMgACDID\/6Dlkf8dmTTMRMHiNoJMZjSpsF+jsJLZz2mY6d+NrB9m3LEMQJABgD3Ub4M8PiACIMgIMgAcXTo6kr9ORZABEGQEGQDu5EhMbYqaIAMgyAgyAACAIAMAAAgyggwAACDIHGoFAAAABBkAAECQEWQAAABBBgAAQJABAAAEGUEGAAAQZAAAAAQZAABAkBFkAAAAQQYAAECQAQAAEGQAAABB5qaCzLNnz4AHQPEFtPmgzRdkAEUNEGQAQUaQAQQZQJABBBlFDRBkAG0+aPMFGUBRAwQZQJARZB6xRTObTJpJxuz8+stfnB5uWdv1nTWL9d8vz6bL5U\/PLn2XihogyHBNXbu6W7t92cxPps384nbX\/fB9DgQZRe3eBpm7FxC6dd0GGRQ1QJDhNoNMG2LatlmQQZBR1O5KODifrcNMWJiS0HO62L7+Yt5M28dOZs3sZBuCoqKyXmYUjrrP6Za1+dxOt179wNUuMxqRGbP82jbkPv9k3lz6nQgygCDzSIPMph0\/W7fzUdvchZj+CdBuOf2+RLzc1XPrtnnT5m77JrPTsL3O9wWKQUabLsgIMo80yPQKQn7kZhMaLsICty1a2WUEhSR6vreM4eIVTy0bWP7O21AIOwgygCDzyIJMvm3MB5k4xKTh51n\/+ZPp+mRoGmTCNr\/\/Welyx\/cpfM+CjCDz4INMfbSjKyjr920KRnzWJT07svp795qBqWKbUZ7+GZrSNTLV5Y\/dBkVOkAEEGUEmDjLpzIlN25xOLUva1l77uw0p3Wdsgk0myJSnifWntGWDjDZdkBFkBJn82ZWggPRCR32YtzgVLHcmZocgU1v+4DZUhsgRZABB5lFPLTtP2uhikKlce9uGimx\/oTy1bFG5FiadthavqzZdkBFkTC1LpnAV7242NsgExWp+mozgpMvYY0SmtvzBbRgMUggygCAjyOwdZNr37B1kSiM\/pSCjTRdkBJnHG2Q2U8VK07KGpoGVi0p0JiV4fWl0ZbcgU17+4Dbc4TuxKGqAIMP9CDKZqWWFWRfDU8uCZRRPbg4FGW26ICPIuP1y6XXF0ZNKUQkuwAtDRXHEpHDxXzjlLQonheUPbkPvjmnO3ggygCAjyIwLMtvpY6X2vBdcBi\/2zwSZ4vTwZ9k7pWrTBRlBxj+IWXht7UxJ7exI6axIXAzb9ywq08OKQaZ61qWyDdXbPyPIAIKMIJO7Q2jUdq4vrk\/DSjobYjt7om1nx10jEy2z\/ZxkpsXg7Ze16YKMIAMIMoAgw362Jy17\/\/yB0RJtviADCDKAIMNdVfq3adxVTJsvyACCDCDIcC9GZfxDldp8QQZQ1ABBBhBkBBlAkAEEGUCQAQAAMCIDODsDGJEBjMgIMoAgAwgygCCjqAGCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ0QZABtviADCDKAIAMIMoIMIMgA2nxAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNVDUALT5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw\/afEFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQMEGUCbL8gAggwgyACCjCADCDKANh8QZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDRQ1AG0+aPMFGUCQAQQZQJARZABBBhBkAEFGUQMEGUCbD9p8QQZQ1ABBBhBkBJlb8eTJk704OFDUAEFG2w+CjCBzq8Xs6dOnO1HMUNQAQUbbD4KMIHPrxWzX\/2rFbHE6aSYn8+YyfPxi3kwns2bR\/vl81n8+4\/JsOup1z0qfs4d23adnl6u\/j1xPFDVAkHnsbf+yzZxMm\/lF+PhlMz+ZNLPzSvs8st2O2udj0\/5r8wWZR1rM2oJ0MmtmJ0kxu6kgc003WigRZABB5kEEmTawTJvZ6TRpQ0cEmbvYPgsy2nxB5nEWszZ8tIVmGUJOF7sHmeUZncnyrE5bELevWxXD1XProrhZ7tVnLp+7Wv7mc4LimSmCy\/WbTDaf1Yau8LHl67r1TNc3KsaF9epGprrPCPcFggwgyDy4k5hX7WQvrOw4IrNsb9uToQPtc9RfSGeBLJrZpu29WlY3SpT2F9JlhG142O5Hr9k\/iCHICDJ3vpitzsisRmLaQhIc8GOCzPI1XSFZB4T165ahoAsD4fB19J74c+IwtdgWs+X7t+sWLjs\/tSx4b7Lc4npF2xjuFwQZQJB5mCcxu3Zxe1JvjyCT9gNy7fM6lKza1f7ruj+vAlCtv5C07WF4KbT\/Zm1o8wWZh1rMujMyQUDIBYxikEkfjwpJrTAGIaFXEIdHgdJg0g8yq89bPR6O9FTWy7C0IAMIMo\/uJOa6\/ducRNwnyGxfU2qfe1PPC8EjOomZ9hdqfZDi8tDmCzIPtpjF07WSKVUjgky9ME16y14WtLQwRn\/fFqB4bm08HSxcz9LF\/pti2lt+Yb2eFYbCEWQAQeahncTstYXx9OvdppZt+wHVIJP7zF5YSYNM\/PnRFPBwilq4HuH2OUGpzRdkHmoxS0cnKgVkrxGZwhmRapDpCt8iOluUBqbhEZlgudGZprFnavrX6yDIAILMQwgy0RTr3jWpRwwy2WtPh0Zkgs9PRn\/yIzLlGRxo8wWZh1TM0oIQdOB7IyfFaVdhGKpcIxPOcx0IMpuL9NLCuPn7elRlKMgEozi9C\/oz6xUXO9fICDKAIPNYTmKG7exxgkw6TSz8Zx\/q18iUgkzc59isR\/Ie18ho8wWZB1rMcmdktkUkvJvY2LuWXRW+s\/Cam3g6WFzMKkFmXWTjwhNOCVuPsoRTyNK7lqXbkglr\/SlkpccRZABB5iGfxAxP7B0uyETtc\/VuYts2fnrVjyhPLQvb6avXnOfXI5rGZmqZNl+QeQT\/KBYIMoAgo+2\/baWghTZfkFHMHBwoaoAgo+2\/O9Kb+ZjWjSDzKILMPhwcKGqAIKPtB0FGkAEEGUCQAQQZRQ0QZABtPmjzBRk\/BlDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ1Amw\/afEEGEGQAQQYQZAQZQJABBBlAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNUAnDdDmgzZfkAEUNUCQAQQZQQYQZABBBhBkFDVAkAG0+aDNF2QARQ0QZABBRpABBBlAkAEEGUUNEGQAbT4gyChqoKgBggygzRdkAEEGEGQAQUaQAQQZQJsPCDKKGihqgCADaPMFGUCQAQQZQJARZABBBtDmA4KMogaKGoA2H7T5ggwgyACCDCDICDKAIAMIMoAgo6iBogagzQdtviADKGqAIAMIMoIMIMgAggwgyChqgCADaPNBmy\/IAIoaIMgAgowgAwgygCADCDKKGiDIANp80OYLMooaKGqAIANo8wUZ4MEVNfsWHM+AICPIADo+gOMZEGQUNUDHBxzPjmdQIwQZQFFTI8DxDAgyggyg4wM4ngFBRlEDdHzupot5M51MmknOyby5POZnn8+WnzM9uzz+9h17W3A8A4KMogaKmhpxR4JM63Rxv4MMjmdAkBFkAB2fBxxkeiMWi2a2DDOzZrF+7PJsWhyx6Z6bns3X72tNm\/lFbpnr5WaDzGUzPwnD1Pbzt89dLfdstnnN6v3h+4L3RNuXLrv\/+ngb0\/XH8QwIMooaoONzv4LM+Sw7YtOFkF7I6YWdUogIg0zpNV2gKD8\/PSmMJO0QZPLbEAYpHM+AIKOoATo+92JqWXHaVxds1oFhEwK64LJZbhqEtsFgcZp8RveazEjP6nO2QaR7T7eMzXvSZQwGtXREJwgupr45ngFBRlEDdHzuW5ApTKtKX58Emf7oSjzaEYWCJCh0oWR2ngkc0YjKdt16y02DSzbIBFPcNtcAhdPebvA6Icez4xnUCEEGUNTUiANMLQuCSi50bDr1hRGZ6wSZ7jXHDTLB9LJSuLnpu7c5nh3PoEYIMoCipkYc4BqZzTSwbWBIR0viKV\/DQaY\/taw\/TWz81LL9g8xmKlrv2pfM1DIcz4Ago6gBOj7362L\/9NqTbQDIT7saDDIHvdh\/3yBTGnVZLa90w4J4hAjHMyDIKGqAjs89uGtZFxIWyW2Vh6aO5UY4kmWcXeP2y0cIMrm7r7nQ3\/EMCDKKGqDjA45nxzOoEYKMHwMoamoEOJ4BNUKQAXR8AMczIMgIMoCODzieHc+AIKOogaKmRoDjGVAjBBngoRc14GFQK0GbL8gAzuACjmdAkBFkAB0fwPEMCDKKGihqagQ4nh3PoEYIMvfPkydP9uLgQFHT8QHHs\/YeBBlB5lYL29OnT3eisKGoCTLgeNbegyAjyNx6YRvz3\/n5eXN5ebn8c7+wLZrZZNJMErPzfdbpspmf7PveKxfzZjqZNYv0z7fhfLbeF9NmfjG8vyYn8+by0Otwl\/aHjg\/geL7z7X34Xy7ILE4nzfTscvDzxr7uYO3todpQbbcaIcg8rMLWhpjnnnuueeUrX7kMM6UgE4WP5YF3jUByiIP\/ll2eTQtFPLO\/HsH+0PEBHM+CzF0PMtpuNUKQeUCFrQsxrfl8Xh2RSQ\/uthhEhWVzliM8g7EagZmeTNejONsRmbQILpd3uugva\/PZ4dmSqwKwKQT9UZ5o2dn1Sj+jUlAy71+ua\/dYt86jimG6ru1r12eF1tszOy2Meq3D43Y9SvvjWXW7l\/vmdJYsa\/tcebt0fADH86MKMssAcdUunUyiUYywDRxsa8O26qrtidu8q1BxErTB2bY\/CTKPsu1ef\/7pLLv+D6HtFmQUtZ0LWy7E7BJk+kOj3TDt6oBbHUzhn5NiEJ1hCR6PlpUEpsJwbBSCegUmt17Ba2pnaKKRp3hb4s88VDHcNgrLwrTZP\/H6bhqa0vB0Zb1XBS\/zut73kQ676\/gAjudHF2QqbcnmdcW2dt3mhO1m0uZt2sNa279pnx5r273+cxTm1st9IG23IKOoVQtbG1Re+9rXDoaYfYNMdnRm+ff1iMym0BQCS22YNTxISwf\/8qAO\/hyefcmuV1xcRg9nB58zVAzjebbdtg0Vw2Cd0jNQuWH12v4orHfYqJSDpaImyIDjWZCZRaMeYbsXvm58W1tp82rt76Nvu9O+VPD5D6TtFmQUtWJha697aa9\/aUNLG2ZqIWanIJMWhmwBSA\/+8O\/bP6eFJRomDYdXixfIbQ\/qXnEtFabecG9+Lm30XHEU6HDD04tMIe6tx0AxrK13PKUvXp\/sdAFFTZABx\/Mjnlq2bUuqQSbX1vbCSqXNq7X9vROaj63trnz+A2m7BRlFrVrYwjBTCzH7XiNTLgy1ILN9X1u8ormwhaJQu9PHqqguomHV8npltiX3umuc1RlVDGujUkcckSkFmYPdXU7HB3A8P64gU2wPRwaZWttfaAMfT9tdDzIPoe0WZBS1wcLWjsS89KUvXYaYV7\/61TsUthF3LUvOumzniNaDzPbMSqmYJfNCa7cs7C6Q653NyKxX8t6bnmdbni9cC3DJdrTL2PMamVyQibfHNTKCDDieBZlxQabcBxi6RmZk29+tx6Ntu8tB5qG03YKMojaqsLVhphZirvXvyGTvJDIQZHo3Awge6+6Qcp5OISvc6WP9XK+oFe5wEg2F1+aXFu7Esl8xjIfFp2fzUcPT5fWo7I\/aXcuyIzLhfje1TJABx7MgUw4yXRuavWtZpm0ebPNqbX86XevRtd21EZmH0XYLMoraUQsb6PjYt+B41t5fSzp9DAQZRU2QAR0fcDwLMnevvY9HCyaTxzXtCUFGkDlAYduHgwNFTZABx7P2HgQZQQbQ8QEcz4Ago6gBOj7geHY8gxohyPgxgKKmRoDjGVAjBBlAxwdwPAOCjCAD6PiA49nxDAgyihooane1Rrj7EAgygCCjqIGidi+DzNOnT3ciyOB41uaDGiHIAIrarQeZw\/3Ddut\/kO50ET\/e\/gvbJ\/Pmcv387HxovRbNbDLmdc8Kn7PPvmg\/s\/sH9Mau520r7aeR638xb6Y39S+f3+RnCTKAICPIAILMTkGmDRKns6vOddJhvakgc+1QcN\/+JfBr7idBRpABBBlFDRQ1QeZZszhddarb\/0\/PLncMMuvRnMlkHYaC1y07wevnws7wcrnT1XPt8rvPSUdmok70qvM\/6SxHj4LPXoaZ7Xqm23J5Nt2OOJXWK1pesi\/SgBesy2Z7l+t\/tQ+idRqxn3IjMuttn52mnxPuh\/W6F7dnvd3rdZmdbvfBcv+cTIPtjLd98z1E38HI\/eN4BgQZQQbQ8Tl+kFlsR2LaTmsYJEYEmbZDvOn0rjv4YYe7e0\/\/dUEnf\/M58ejKNnysPn\/TcV52rrvXFaaWRaEoXP\/yekVhJ9wvvRGKZB2z2x9P1yvvp1qQ2W5z9P5MwMvu595+KqxP9\/do2+NAtRi7fxzPgCAjyAA6PjcSZJbTyhZBRzoXMEpBJn08CRJhRzfsfKfPJZ8TjhDkR4HC8FIIMmEnvvbZxY76Htf3JMtOg1h2P1WDTO672H97wr\/HwWV4ZGjv\/eN4BgQZQQbQ8TlGkFkEU5d6U4YGg0x6rUcaZNJlrzvm6RSy4O+bznJ6bUZveQNBJvhz1AGvrVeyP0rXsPT2WRhkgu3afm5lP40IEMNBJr89aVhJg0w0NSyanhZsf7IeY\/aP4xkQZAQZQMfnuEEmPeuf6yRfZ0SmdCeySpDZfH40UpQGgREjMkHHvbsGaLc7pBVuIlAcTaoFmX1HZEYGmcL2DI3IbINMMnWvth538CYL2nxAkFHUQFF7ZEEmur4jN8oy4hqZ8jUicfhYXXRe6HxnrmeZ9IJLuqzhILMdZQg74uX1ijv3hWtAoiCzXtfBIFPbT9cMMrX9PHCNTDHIhOsXfNao\/eN4BgQZQQbQ8Tl2kInPwmcu4N\/1rmVXr52flu5aVrjeoxQAinffatd50ZtClt61LFq39LqO0nold0Yb3N72vefl0ZF4RKSyn3YNMpv1zN21LB4l2e63WTOvTS0Lp6itR7GWz1fuHGdqGSDICDKAjs8t3rWMx+GyGFwdz9p80OYLMoCOjyDD3ZHeCOAO3nHM8QwIMoIM8AiDzD58\/zietfmgRggygKKmRoDjGRBkBBlAxwdwPAOCjKIG6PiA49nxDGqEIOPHAIqaGgGOZ0CNEGQAHR\/A8QwIMoIMoOMDjmfHMyDIKGqgqKkR4HgG1AhBBtDxARzPgCAjyAA6PuB4djwDgoyiBoqaGgGOZ8czqBGCDKDjAzieAUFGkAF0fADHMyDIKGqgqKkR4Hh2PIMaIcgAOj6A4xkQZASZG\/DkyZO9ODhQ1HR8wPGsvQdBRpC51cL29OnTnShsKGqCDDietfcgyAgyt17Ydv2vX9gWzWwyaSap08W93z+XZ9NmcjJvLtPnLubNdDJt5hf99yxOJ8307PL467dch1mzSP+8y7ZlvrfZ+Yj3n8\/y+0XHB3A8P+D2ftXG7d\/eXzbzk\/V7vvI1I9qt1etX7VLb18i3uzVj2+Qba7vveRuqRggyDzbIxB3gsPg8riBzK\/YNMum2tcV1zHIEGUEGHM+PN8hEwWUdTkaFmba\/sFtbFb9XkEGQUdRuJMgkRWHZ0e7O3nRFLC5Kccc6DELBGZzwc9ZhYnoyKXS+k5GirsiuO\/2z08IoxLIz3z4+vXrNNUZkRn\/OJPmMeHs3z6Xbuwkv4XbOmr+bFON2v+aKcz6kBd9JGo7CwpsU4fAMXfhZ0Zm7OzJCp0aAToogc8ggk2kTi23+ZNO+zt8atDHLNuWqvTwJnr8I+wJhuxg\/NzSbIOqLFD4nnKEQvTbbRgfbcTpL2sykTxIuI1zHtD3t7SsEGUXtloNM+Njqz11xWBbB9QHc\/rl73+K0LQBhwVv9OSqaywM+LBql4rUqcHGQit+XW594mesiea0gU\/ucpBivtzFuJIL9mG5vaWpZFDLaZefXc3BEZmSQiZYTruPI9dDxARzP9zzI9KaAhW172I4WTpatO\/NR27v8jPLUsmLfYCjIZD8nd\/J1uI1eBaBCnyTpJ0Rt5aZ97J\/QvbFRITVCkFHY6tfIxAUh6BAHB\/fywO6K1em8WVz9fdMJXj6ehqSgqO00vWvRO2uyeV9lpKE4\/Ds6yOQ\/pxciisPMle0tXiMTDN23jxeGr\/PXyBSWX9xPSWAMt\/+ODp2rEaCTIsgcMcikU5R77VMpyGzfE\/UNskGm0jcYDDK5z4lfV26j0+ltlb5FbTpZcXkIMoranZlaVr7uIjnw24O5\/X9bTK5e2xaS7VmJSkgaui4kGdKdjJgyNTpg7DC1rPg5ve0KQ0nmAvxsIMyPnnQjXbWzO+m29hqnHYJM6cLP7HC9jg\/geH5gQSboB\/Ta3vAkWSXIBO3R2CBTPIFanVqW+5xMkMm10b22vzIdO3djhNxJ07DNd92MIKOo3cEgUxmRWRWpq+fWAWb53Ok8mIZUOVtRDTLpOu137cdRg0z2mpF0hCMdkRkXZFYjWvPqdK7+1LJ4CmC6zPyw+NibOtydmz+oEaCTIsgc8RqZ6mj8IYPMuJGMvYNMto0eGpFJ2uGxfY3M+iDIKGp3JchUrpHZXhsTzFld\/r0wUhDOQd0hyPTnsRaKS\/S+Q1wjU\/ic5P3bfZIEmXA+7y5BpjtbVTm7M+4amcK+KI5ibb\/ruCC7RgZwPD+Ou5bl2t8RU8t2CjKVvsEBgky5jR66RqYUZAptaOaEoWtkBBlF7c4FmdIdTPJnLfq3QIynLxWvvalcAzI9W5RHNnKjMN2UrrPCNSaZ6V9dMRsVZGp3KgkfvyqWxeX15h1PBvbjmLuWxQ3Sdh9ebdvZuLuWxeFlYmoZ4Hh+aEFm6N+RidrIESMYo4JM16bk71pWamPGBpmuvcvetSx3onD52nllallyp7Xz\/PZG09hMLRNkFLXbKWzcNS4g1PEBx7PjWXt\/VGP\/7TUEGUFGYWOk5LbP6PiA49nxrL0\/hPQGN04YCjKCzK0Xtn04OFDUgIdKe6+9R5svyACCDCDIAIKMIAMIMoAgAwgyihooagDafNDmCzKAIAMIMoAgI8gAggwgyACCjKIGippOGqDNB22+IAMoaoAgAwgyggwgyACCDCDIKGqAIANo80GbL8gAihogyACCjCADCDKAIAMIMooaIMgA2nxAkFHUQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNQBtPmjzBRlAkAEEGUCQEWQAQQYQZABBRlEDRQ1Amw\/afEEGUNQAQQYQZAQZQJABBBlAkFHUAEEG0OaDNl+QARQ1QJABBBlBBhBkAEEGEGQUNUCQAbT5oM0XZPwYQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyBzGkydP9uLgQFEDBBntPQgygsytFranT5\/uRGFDUQMEGe09CDKCzK0Xtl3\/Kxa281kzmUw2pmeX8XMn8+Zyl\/W7mDfTyaxZ7PyeSbQeS6eL43weihogyDyy9n5xGrexs\/Njtunr95T+vM\/70eYLMgpbP8RMm\/lF99hlMz8Jwsw+QWYfy0IVrkdr0czGFFpFTlEDEGSq7f0yxITt+foE4lHa2NJ79gkyaPMFGYUtX9iS0JIrIOsgM9+cxQkLyypo9EZPeu+fNbOT7nVpWKkFmVXhXa3fal23Bbf97PXr04IXjjDdRAhDkAEEmXvY3i\/DzbLtHm5j52fTTDu+el88oyPsG1y1zZs2uvR4OgNkxOt6bfx6\/U9nu83oQJARZO5xYSuEh9y0s1VxWxesoOhtimK4rDTIZN+\/64jMyCATLafyeShqgCDziEZkLrsgkm0Th9rY7fuWy1kHiOWfN8tr3zMwnaw2ZSycAVJ9T7lPsnl\/b7YJ2nxB5oEGmYGh22Ux2L4mLlpp6CgFmRHvL1wjsz17NC7IhAX2RqfGIcgAgsxdvya2NJNisI0NQ8H2uXqbfoQgk7bpmz5GOuIUrL\/2U5svyDzyEZmgaERFK7lJwKQUZErvr61LEoB2CjK9QGSeraIGCDKCTHm62Q7Tt5OQEN5AYPP+IwWZ3snKzXOV9dd+avMFmUd2jUw4PFwMIumF+JURmX2CTO\/CxKRIFaaylUeMUNQAQeaxtvdBu55ON8tdI9NrY4P2uXgStDblezjIRCFlzxEZQUabL8i4a1l8XcnIILMaCTlskMldIxPN0R28RiZzlxYUNUCQeax3LYva31UbG47IlNvY7UnPMHBsb8iz7zUySRt\/zWtkBBltviDj35GJC10liITTuKZni20ROViQ6T4jLmCrz5uPu2uZaWWKGiDIaO+z\/45MNCNjoI3d3rWsfPfSOEjk7joWPB71I64+6yzsL5TeP3DXMkFGmy\/IPPY5syDIAIKM9h4EGUFGYQNBBhBktPcgyChq28K2DwcHihogyGjvQZARZABBBhBkAEFGUQMEGUCbD9p8QcaPARQ1QJABtPmCDCDIAIIMIMgIMoAgA2jzAUFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQPQ5oM2X5ABBBlAkAEEGUEGEGQAQQYQZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDdBJA7T5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw8IMooaKGqAIANo8wUZQJABBBlAkBFkAEEG0OYDgoyiBooaIMgA2nxBBhBkAEEGEGQEGUCQAbT5gCCjqIGiBqDNB22+IAMIMoAgAwgyggwgyACCDCDIKGqgqAFo80GbL8gAihogyACCjCADCDKAIAMIMopazZMnT\/bi4EBRAwQZ7T0IMoLMrRa2p0+f7kRhQ1EDBBntPQgygsytF7Zd\/+sXtkUzm0yaSep0ce31uzybNpOTeXO51\/vb9Zo284vMcxfzZrrvOi\/fO2sWCoSiBggyj6q9f9YsTifN9Oxy8PPGvu4gwnb5oG30ZTM\/mTSz8\/2X0e6HXl9jr\/Wr9GkQZASZ6weZ+EC\/\/sF\/\/CCTPpfbDkFGUQMEGe39vQkyB3WgIJOcJF32bXY+2SvICDKK2g0GmaCIrUPD9CQ4CxGNiCTF53y2fnzazE67IJMWk\/SADkeF2uWtXt8tp3fgZ4NMWHgrn5cWzM36Tq4RuhBkAEHmngWZtv07mTWzpL1ddtTX7WL02mxbGbTfp7OkrU36DuEyNv2OpP0f1Uav2\/jT2cCMjPXrzrZ9lm570qDWbnMuuOWCzGq\/deuSzGrpXhtt\/19uXpP2aaJ94eSqICPIHDjIBI+tQ0scCuJisDmgo9euw8hgkImf257puM6IzMggEy1nvb4HmFKHIAMIMvciyKRt9roNjF5XaSvDjv4qAIVtbdAOJ+12NGOjNLUs16dYflbYv+i2I9df6E6KZtr8KIy0r8v3N3JBZvvYavnZ\/ZTtO3WfEfdvSiEKQUaQucY1MvkClhnRKBaG8O87jJBc4xqZbSEY93m9qW\/p+iPIAILMgw4y2\/Y3nDIVvq7cVuZmV8QjMsWpVGF7WwoyuT5FMGtj2+aX+gvp68Ltat8TfGah7c9eI1PsJ9S2vxxkEGQEmSNMLSvOXU0KX3hAlotdJVj0lrfHNTK9ZewQZA5yER+CDCDI3MepZds2uxpkcm1lrbOeOUnZCwUDQabXp9g8NzRdvXyNTLhd7Z\/b52ojItmpZdnp9MnUsd72J+sYnpB1AlWQEWRuMMgcYkSmN\/x6zSCTTnEb+Xn7XbCHIAMIMo8syGTbyqERmcpJ0AOMyIwNMulsjWj7T+fFaWXDQSbtP9WCXLlPoy8iyAgyNxlkatfIZK5TCYNMdh5t8vnbMzDXv0amPG83d41Mui0IMoAgI8jU2sr6NTKlIJNc47LnNTJjg0z8OZkbDVXa\/V2CTHX7KyHHNTKCjCBzo0Fm7F3L1ncKSW4EsLqWZV4eYk0L3Q53LVsVkf6d1aLPq90RxbQyQQYQZASZzXSy7F3LMic3B9va9G6k5+Hz3TJ2vGvZ2KllwV3Lindo3SvIpHd4W2zXq7j9\/TvDOYEqyAgy1yxsoKgBgoz2\/lqK17zeVS66F2QEGYUNBBlAkHmE7X04ylKYQXFXrWdtmNIlyAgyt1zY9uHgQFEDBBntPQgyggwgyACCDCDIKGqAIANo80GbL8j4MYCiBggygDZfkAEEGUCQAQQZQQYQZABtPiDIKGqgqAGCDKDNF2QAQQYQZABBRpABBBlAmw8IMooaKGoA2nzQ5gsygCADCDKAICPIAIIMIMgAggwAAIAgAwAACDKCDAAAIMgAAAAIMgAAgCAjyAAAAIIMAACAIAMAAAgyggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwh4MMAADAnSDIAAAAggwAAIAgAwAAIMgAAACCDAAAgCADAAAgyAAAAA\/L\/wdCDxQclZwmpwAAAABJRU5ErkJggg==","width":424}
%---
%[control:button:5ee8]
%   data: {"label":"Run Calculus Flashcards App","run":"Section"}
%---
%[control:editfield:5f42]
%   data: {"defaultValue":"3*x+1","label":"f(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:71d0]
%   data: {"defaultValue":"2*x^2-x+2","label":"g(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:slider:990f]
%   data: {"defaultValue":3,"label":"Choose x point: ","max":5,"min":-5,"run":"Section","runOn":"ValueChanged","step":0.2}
%---
%[control:slider:650b]
%   data: {"defaultValue":0.05,"label":"Step size","max":0.1,"min":-0.1,"run":"Section","runOn":"ValueChanged","step":0.01}
%---
%[control:button:163a]
%   data: {"label":"Visualize Product Rule","run":"Section"}
%---
%[control:checkbox:0af9]
%   data: {"defaultValue":false,"label":"Show animation","run":"Section"}
%---
%[control:checkbox:1823]
%   data: {"defaultValue":true,"label":"Show axes","run":"Section"}
%---
%[control:checkbox:0571]
%   data: {"defaultValue":false,"label":"Show f(x)*g(x)","run":"Section"}
%---
%[control:checkbox:6158]
%   data: {"defaultValue":false,"label":"Show df*g+f*df","run":"Section"}
%---
%[control:checkbox:2f9d]
%   data: {"defaultValue":false,"label":"Show df*dg","run":"Section"}
%---
%[text:image:460a]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[control:button:97f1]
%   data: {"label":"Initialize Values","run":"Section"}
%---
%[control:button:5719]
%   data: {"label":"Generate Problem","run":"Section"}
%---
%[control:editfield:4517]
%   data: {"defaultValue":"r","label":"My Answer = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:89e1]
%   data: {"label":"Check Answer","run":"Section"}
%---
%[control:button:7cb4]
%   data: {"label":"Analyze Results","run":"Section"}
%---
%[text:image:1f46]
%   data: {"align":"baseline","height":326,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAzIAAAJ1CAYAAAACH8VNAABKAklEQVR42u3d\/688310X8P0\/jMEfiBaNSkxEjRo+aRGtdPVaRQkIUcFPP1gI8k3qdQsWNDRqit8Q3+5NxC9UqsEC2oh7A4WatkAbpILX3rYIfuy70lbkXSzYFMp4Z3dn95wz55yZ3bt7vz4+ySOf93u\/zM7M7rzOec45M+\/Jb\/icL2wAAADuk4mdAAAACDIAAACCDAAAgCADAAAIMgAAAIIMAADA9YPMZ\/yx55vf9ae+Yi+\/+RVfakcDAAA3H2Q+65Vf3rz5pz\/S\/Juf\/F\/Nd737afNP3\/li8+Rt\/735hz\/0geYNi\/c1r\/8P722+5d9dNK\/9tz\/VfMO\/eU\/zNf\/qJ5qv+Bfvbr70H\/9Q8ztf8eftaAAA4OaDzCuf\/yvNP5y\/seofzL+r+fv\/5Luav\/eP\/0Xzd7\/jnzdv+Ef\/rHnDt39n89IveJUdDQAA3HyQ+bq\/8Yam9t+nPvWp5pOf\/NXm\/33iE80v\/\/IvN7\/0S\/+3+cVnz5r\/\/Qu\/0PzpL\/86OxoAAHYw9r+7tt4\/efG+5qu+9duLz7fPta+5E0GmDTE\/9ANva9799X+wefbzPx+FmI989H+PCDKvab7jxWCBL35f8\/Lq67+9OW8+1HzHq\/bd6Ou+P1xO\/N\/PfPdrrrH8Q63X8T7rq99+tZFv\/3bFBQDgBoLMIV5z09qg8slP\/L9smKk9d+NBpg0xL\/7Cx5vXvOKLmw\/\/p89s\/tuTfxCFmP\/18x+uB5lXfV\/zM1fLOX99\/Nh3vP6+BJncch5okGm\/qxff1Zy\/eFPrCAAgyNy3IFMKLIcOMaODzNd8y9\/JhpiL\/\/kLzR\/+m9\/fzH\/HS5qPvuMzm3d9ycuiEPP06Yeaz3\/ha6sjMeevv+kOvyCzz2e9\/Ls\/tBxx6v6vwAAACDJjwswxQszoIPPVr\/tbvRDz5re+p\/ndX\/r3mukf+PzmBz7r05uP\/vPf3vyXP\/6S5gNvf8cmxLz4Pz\/Y\/Mnnv7oyGvOu5quHpjJ1\/22mNKWd8Hhq2ioYpa8J\/176c\/r33HJ3DzL5bais8+tXo1TbqWq17azvo\/O3f+jqwfU+flW43O\/bYTu716xfvxyZCaf\/1dZ7aJsAAHiIQSYMM8cIMaODzFd90+uXO+rXPvXrzbte\/KXmW99y2bz0G7+3+ezP+8rmqz7t05t3fvZvaT761z6j+dkvfknzjm987SbE\/OzP\/Y\/mT3zZV1WmKg1dDzMURFad8H7n+ABB5vXvGrgepH+NTD5EjV32enndPmlfswl6pe2s7aM0UGxDSjuq0ozezvS7CkJNbr2XgSlej\/xzAAAunBdkjhxkvvK137rcUWc\/\/L7mlf\/0vzWf\/0\/+c\/MFf\/sHmi\/4PZ\/XvOE3fVrz05\/3kuajf+Ulzc9\/xUua85f+\/ubnfu7nliHmZ\/77zzZ\/\/C985d4jMqvOfPdfJnwUl3GAILMewSiHh5FTy3LbkF320LoU9tXQPvqcyijKqO38wt50smUQKo6QrUaJSqFu+xwAAKaWHTnIvPqv\/c3ldLKPfeyXmn+5eFfzJfMfb75o+hebv\/4bf2PzHz7zNzcvfvFLmo+c\/rbmPd\/6Z5ofefnva9793d+9DDHve\/8Hmumfe\/V+18hEnfdwFOCGgkzYad93allxG3LL3iPIjNlHQ0Fm1Hbm\/us+Nz\/VL79N+14XBQAgyLjYf48g8+V\/9Vs2\/07Mxz\/+8ebyve9tfuRfv6n58T\/0W5oPfvlvaz7yNZ\/RvOu7\/vYyuPzoj\/xI8x+\/6ZuWf37v5fuaV3zJXxocccnetax9rjhdaWhqWdJhXn5O+f3515VHJEYHmeI25JY9fL1Obx1G7aOBqWVD2xl+xueUwkqwblG4qj0HAMBDCzJ37vbLr\/qGv977xy4\/8tGPNv\/jTX+6+dgbf2vzn\/\/l6XIqWTed7D3v+alliPmvF+9t\/uiffWH4+osm9+\/IBBehR7f9zXfSexerh1Ou3v6u8ihM6XXRlK0xoz4DNwwItyG77KHRodx2jt1H8WdGF\/sPbGc7FSw37Ww7vSy8sUB6w4DacwAAPKTrelp37h\/E\/Itf\/41RiOlusXzx49\/X\/Ni\/\/zvNBz7wM5sQ043EtCHmp376vzZ\/5Iue92N80Gq3cr7JW0oDAPCYjAoyX\/Z139gLMeEtlksh5iff81PNH\/lCQUaQsZ8AALiFIPN7\/9SXLQPJPj7zFV9kRwsy9hMAADcfZAAAAAQZAAAAQQYAABBkAAAABBkAAABBBgAAEGQAAAAEGQAAgOMGmcnX\/CAAAMD9IcgAAACCDAAAgCADAAAgyAAAAIIMAACAIAMAACDIAAAAggwAAIAgAwAAcLQg8+53vxsAAOCojhJkfviHf7h59uwZGd\/5nd\/Z\/OiP\/iiPiO\/cPgIADkuQEWTQSbePAABBRpARZNBJt48AAEFGkEEn3T4CABBkBBl00u0jAECQEWQEGXTS7SMA4PEFmUUzm0yaycasWYx538W8mW5e2y5j2swv2j9fNvOTSTM7v+9BZt68EO2Xtefnh\/sBfP\/rmucmLzTz9M8HWW5\/3Z\/75rfsuKy3NK972aR54Wxg3R9gJ33+\/NU+e9nrmrdc+7Mr+3CX34cgAwAIMv0QMz273Dx2eTYdF2aKQeahjMisgkzcAb1Gp\/QmO6rL5T7XvO770+1JHxNkivvvZS80L7xs1\/114CBjRAYAEGRqYSQNIKtwsxlRWb4mHa0JR3H+cvOak+7P7bKCEZl12JmdbkcFwpGaVWhavW92evXn08XqufPZ7iNENxJkVmfqlyMb67Dw3MvadVx36M9eiEZAoveGoyTLM\/3hiM\/V+9Ng0Hv9+vHwM0ojBtkgE3So22VcddKfC5eRXe76Pd+8XZfNqE66vju8fznaMQn2W2\/fHT4g7dJJf8s3P7dcz\/b\/0QjceptfeD7\/HS9fv9mGbv9v9\/vmt5N8zmYEKB31i\/bxajn7j64JMgDAgxqRWYWONGCUQs2iDSQn8+Zy7NSydQjqRnz67+\/esw5GyyATj+60YSccMbrdIBM8tg4am+eT8LDs1G469PFoSByGclPLaq+PO8jZqW65IBM+tgwNwfPRtoTL7TrP4Tqu39db99x6rf+chKVVJ3z13OrP8faGHfyb76S369WtS7te\/XAZhY9o27avXT4X7INtgAxDXvB95B4P9nEcqpL1EmQAgEd7sX80AhKEmuXjwYhIGF5GB5lgxKdd3jrILEdjuhGY6O\/Hn6Z2nWtk4hGJytSjsHMadVRHXCNTeH0cjoaW21\/3TehKOt295WyeD8NGOYSV1yt5fzKKsx2h2Gfa25E66ctpZdttadexFFaL+z8KHuHUsiCAhJ8z4vfRGx0ytQwAEGQq082SgLOdPrZLkAmCUBBklqMz2SCTTGfrRnDuyNSy2jUi0fSgYIpVr6M\/EGRKr4+nLlWmYe0SsnKft1mX\/vUdxSCTXa\/k\/cUgU5lKd8Od9Oy2ZKd65UZScu+L90EXjNJRp\/Bza8EvO21RkAEAHl2QaYNFECbC6WbLIBIEj73uWlYJMuURmfhzSo\/fuSBTG+U45IjMmLPyOwaZ8SMywd9HjRbsEGT22c6Dd9JL0wkz0+mS\/ZaGwfyIzPo9z78umL5W2WfFGyocZwRLkAEA7t1dy6LrY5ajMPG1K93z0R3NrhlkitfIJO+5W9fIjA0yybUhSbDYXD9RCjLV1yePFwPSDkFm6BqZ3HYMrW8wtWwwyCSP39o1MmkYrYS3epBZT0vMBZnuuWzoKV8jE4c+18gAAKaWZf4dmeT6lOiuZeFz3fva0NHdNCB\/17JskInuWjZr5sHIy\/bx+zS1LJxadNURPRtzV6\/uOpzMXctKdycbc3evXYPMDncdK4WS\/HqNH5GJpnTd0tSy7QX6uelmhe+o912utz+5Tig7PS\/72ylNLYuv2TK1DAAQZO6EVfg59MjL9YIMD8nd+c6Pf2MDQQYAEGSOKb2RwIGvgxFkuHOd9OT2zfYRACDI3PsRmZulwybIYB8BAIKMIINOun0EAAgygowgg066fQQACDIIMjrpvnP7CAAQZAQZdNLtIwBAkDlKkPme7\/keoaXgzW9+c\/PWt76VR8R3bh8BAId1tCADAABwTIIMAAAgyNipAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwf4LM2GUCAAAPnyADAAAIMoIMAAAgyAgyAACAIAMAAAgyggwAACDICDIAAIAgAwAACDKCDAAAIMgIMgAAwOMOMrssE4C7Te0HUPsfVZB59uwZAPec2g+g9gsyAAgyAAgyggwAggwAgowgA4AgA6D2CzJ+BACCDACCjCDDPXR5Nm0mk0kzOV30nlucTpbPTc8u91j2opm1y53MmsWY11\/Mm2n7+pN5c1l4Tbc+s\/NrbHP3OaHMto\/dd9t9s+P2giBzP2rjJFMHR9Sru23PenU+i+rlQWryTX6P6+8rrt13az0PuV6HXebx2rjud5Q91hBkNGaM69inxemGO+Y3EWTaRjgNMRu7becxGh0QZO6IQq3YHO+PMch0+2TPEz+347KZn8TbeVdr92NtU9IQI8wIMhoz9iz0SUBIGq307GTYgG8K8OlsHYqmzfwi01D2OgfBc0HHYH6aL2a5IBMXwVqj3K1PWiAzjw+sS35f5DoG232bW79twzXfrMNq31U6VPe244Qgc\/86V5ta0x2H3fEXBpngGO11vtIR4E0I6GrD9njvj473O+G1EaNewCh+di7IlOv1cpsKtXu4Jif1bESdD2tydhlD+2FTI9PlTJrPff5zx7023FebdZ41s5NKJ7taqwf275j2ILvv1s+H33Ww7v1wNLBvd92GgTZu8\/s4C3+LmXY\/ep\/ZDYKMxox9zz5uilYSbgbOTo7q2OemdIVFt\/R80EimjWb2TE6po187m5gW04F1GRdk0gLfbzh6y0m3YWifgSBz5OlIhc5UsUZkOp6F47v7jH49S+pQ7ngfO2JUrI\/HCTKls+uboDO430p1s\/A9VPfD2CDTf119X2aC1WCtHh9kitte\/E6nvce7\/R0HmYF9u\/M2DLdxpd9DtQ3r9UcQZDRmjJ5mkJ7dGWg80tGawbM3lalkm88sn6GMG8318jMjQ7mpZ\/Vh++TM54h1KZ\/pWi8jU4xLy+jvgxEdGRBkbmDK7cBZ+kynLe3Ub2tEcoIoOr4XvbPwtXqWdoKHr29MR953DDKFk0HRNufajdJIVia4rNarPgq1+\/S3\/nb1andvXw63B8XfS7FW7xBkSicUe+vRn02Qfu\/5IDPQJo\/dhhFt3CbIdMscCCm9MI8gozFj16kUbcErdvoLUxXyry8FmeTsV9rAZYf0V6\/JN5rj5tbuFWRyUzGSs6mlIJO\/nmdoGWlD0z\/jZd4wgsxNn+Cp1KviiZRC\/Ys6r0E9WC+vm57bPr+qIaXOc3\/dtrVmh88+YJDJ19hCba2cgKpNYx4dPHcIMuWRkOTEXnU9hmr1+CATthnRuvbWozw9MR9khvbtbtswpo3rv6Z\/ArI3CmokRpDRmHG96WXdPOCgAU0bsMKITLVwl0ZgKh2DfYNMdSrGLlPLciNMI4NM\/mzqrkFmIPyBIHPDF\/+XO7fxMV84lpPOaxdWZqfT+NrCq0AzG3OsZzvwYz57OMiURi6KIzLZUaLdg8yoa22ejWubrhdkkrZmVN0t1erx6xHuv0MHmXH7dtw2jGnjdgky9eCOIKMxY+8C3C9Gw9OsykWv1ygecGrZ2O0rXljau17nZqaWDQeZZ8ULhEHtP9YNUMLjLHlsRId8eHpXeo1HfKZ7txHY\/Nny3aeW9ad8HWVq2cgpwUOj6UNt035Ty3a\/o+bwb2h4\/46eWnaAILPbTIV0G3afWjYmyCDIaMw46P32y3eh2W9q2d4Xtu96sX+tkz\/29ssj1iXenva9+1\/sXwwypfXVCCDI3Fgt3G9q2ZgL7vMnUrafXa5lxfUbunlKcYSgVK8yQSZYt70v9h+ckjeurg9fTF4OMv3aPf67Ht22ZELJ6JvmlC7G3zvIDOzbwW3Y\/2L\/4SDjJJ0gI8hw0Atca1Ob2kITd7jHXSMTF722sEVDyQe5\/fKIf2NmzD+IufMtQnNBZpfbL1dGZGq3rAZB5ubCTGXaa3FkoXoL5MLIx9DNVsas3863X05ff\/V48SL4cpDZ5fbL5f1Wu\/6nNpOg3zblrxdKa3fuM\/P\/NMDlqOmHhVo9sH93uf3y\/iMyA\/u2ug3XuP2yICPICDJwC4HOyAeCDACCjCADggwIMgAIMoIMCDKg9gOo\/YIMAIIMAIKMIAOAIAOAIHPoIAPAw6D2A6j9RmQAMCIDgBEZQQYAQQYAQUaQAUCQAVD7BRkABBkABBlBBgBBBgBBRpABQJABQJDRmAEIMgAIMoIMAIIMAIKMIAOAIAOAIKMxA9CYqf0AgowgA4AgA4AgI8gAIMgAIMhozAA0Zmo\/gNovyAAgyAAgyAgyAAgyAAgyggyAxkztB1D7BRkABBkABBlBBgBBBgBBRpABQJABUPsFGQAEGQAEGUEGAEEGAEFGkAFAkAFAkNGY7e1DH\/pQ87a3va1505ve1Mzn86X2z+1j7XP2EX6LCDI4hvH9I8gIMnfKT\/zETywLTVtk3ve+9zUf\/OAHl9o\/t4+1z7Wvsa\/wW0SQwTGM7x9BRpC5M0XnjW9847LIfOxjH2s++clPNr\/+67++1P65fax9rn3N0YrP+ayZnMybS9+H3+Jt\/xYrFqeTZnp26bsSZDjSMTw\/mTST00Xy+GXhcR5eDV80s0n\/u748m\/r+1X5Bhvzwb3t25AMf+MCyyJT+a59rX9O+1rAwj\/W3KMgIMhz7GF51ZGfnSSfWia5H9f1PJtNmfiHIqP2CDAPaYd5WWHS+7du+rXn5y1++1P45LD7d62udu6jgtCMty6K0smmcliMw02baPt42UNGIzPrsW\/qei\/nV62fNIjuKE79HZ\/Nh\/BZrDeHwb3H1mwg7RL0zvNnf2NXvcvlc8Fvrftd+X4IMR21Ptu1Gd\/y1HdugU7s8RrtjNzhGo8fjTjD3p4Z33\/fsNA6vvSAT9i2EXEFGkHm82ovvXnzxxajRee655yJh49O+tn1PeVpY0Hlcdwq7BiU6q7YsQkFjEyyj7YxmX1cJMnGRawth3Anl\/v0Wh\/7L\/haXv7\/17+Xq91EKHPXfWCn8GJERZDh6exK0I+2xFh9z8WjN9jhOTlq0x7Sz9\/e0hnfBNf5OozY+qtOmHar9gsyj1g7tfuITn9gUlvasWdrwtI91\/7Wvbd8TLScMLGnYKAWe6Ixb+Fx6Fn3boI0PMjyE3+LQf9nfYvd7XI72lcLs0G+sfDZXkBFkOHJ70hthSWp+bxSm\/Xtt9JX7VcODEbjg++7N9AhHYdLfBYKMIPO4Cs+v\/dqvjW542tf2C8+2EUkDxfKMWTC1LAoyaSFa\/r0\/P3rTeaxOLYs\/S4N2\/3+LQ\/\/lf4tjAscOvzFBRpDhhtuTyvGWTFWOp5F111ZMdGrvdQ2PpxJ2v4Gwb9G7ZmqgbiPICDIPfCj4Ix\/5yOipAO1rc1MBuiLTFp1oeL8UPIpBZvyITPkC0GRONffytzj0X+m3uJpWMt9OMdt5REaQEWS4zfakGmTGXA\/hLpj3uIbnrolaXzNjREbtF2TIXZz3jne8IyoupYsz2\/\/a12YvzhycBrCexzoYZMZevxAvrz+PWlF7CL\/F2n\/532Lw3S+nmOU7M6OvwxJkBBluvj0pHm\/xaOrqBhzt8Zp0fl0jc89reOaOZeEtmV0jo\/YLMqS3SxxzFqV9TfmWt7liEt4Z6qownQedxEqQKd5RKrpz1NXyzsL3hNMKTC17rL\/FdJ58+dqpkXfGy408umuZIMOR25PKiYPS3cmiaWdOZN3f7z83oyLTv3DXMrVfkKHT\/QNWteLTPndb\/wghfot+ixoztd8xjO8ftV+QoVh82rMj73znO5dF5lOf+tRS++f2sfY5RQe\/RQQZHMP4\/hFkBJk7OSzczldtL75rC02r\/XP72E3\/C+r4LfotovY7hvH9o\/YLMgAIMgAIMoIMAIIMAIKMIAOAIAOg9gsyfgQAggwAgowgA4AgA4AgI8gAIMgAIMhozAAEGQAEmfsdZAB4GNR+ALX\/0QQZAADg4RNkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAAAAEFGkAEAAAQZQQYAAHiYQQYAAGAfggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAAAgyAAAAIKMIAMAAAgyAAAAggwAAMD9CjLPnj0DAADuKUEGAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQEGQAAEGQEGQAAQJARZAAAAEFGkAEAAEFGkAEAAAQZQQYAABBkBBkAABBkBBkAAECQEWQAAABBRpABAABBRpABAAAEGUEGAAAQZAQZAABAkPHlAwCAICPIAAAAgowgAwAACDKCDAAACDKCDAAAIMgIMgAAgCAjyAAAgCAjyAAAAIKMIHP\/LJrZZNJMUqeL1fMX82Y6mTWLe7RNi9NJMz27vMb+mDbzi\/5zl2fTo+6X5fJP5s3lPu8\/yPqsfguz8yN9N+ezwvZdNvOTY31u+fu8l0Z9z5X9eaeP59V673\/s7r6d0TFd\/H0e6Lffrc91PuexfH8H+twb+37HHIsjPn9M29W+pl3edtsG2vBD151D\/gaXy+qv+z6\/ofK+O2b7ErYz7T65ic8SZAQZRnReg4NRkLkfQeZovwVB5v4RZPYKMscUBpkb2C5B5g4GmQO1XWGQWb12oA2\/sRMo+y43rc\/71ey7E2QeW3sjyAgydzLIBEUhKWDt4\/mzJslZoaBzEL4n6jREZ2PKRXLX98cFbVXEuvfH2xmu8\/ZsyurvSTFadkSCdVjvl3nbUGZeX95PuQ7O6v2z0zDIlNc7uz\/C72nZYE9X+6ZbXrj+UWMefM7prBBk1g3B2XZ\/b7Zp3RBNT4LvoPS9rjsS89P0uaSh2eX9F5l1ym1b+\/38q6Qj0753+ffK9lV\/p\/F3NNiBO898\/mZ5heMn3b\/J8Xi5+f2Fv8Gh7yvZp7nfRbTNIxvmcFnh72i53Ve\/rcKxtfk9r1+T3Y+V9ckea73jYbttm85tekwnr6std3Zaqin5dZ6dFkZkCtu1qmHz7W+icAIl+\/33Op1dJyv\/exx1PBXrR+37q9XeZ8Ntx3V\/N4Xvt19\/ajV7fSydzkaNdCx6v4vyiEz43XWfF7Vd6+8i3W+XZ7PVfrha3uq5MW14UqNLx2r6m1yub9JOpr+v3uuHfzP1IJPus3FtWfGYSduXHd5\/mWvfs8fs1Wecrpa1OL1fJ34FGUHmgQaZ4LGgaEUjBlGRTc6IhcUpKt7h2Yr4c5cNQK7Y7fH+sDFYPh42jGln7zw9c7fLiEzyOevPL++nfEcn3IfhNmTXu7Q\/0o5br\/DG290tO9rv6wJfCjJxUAk\/N3zP6nvJ7Zdu+f3vJvwuKr+LaP2SdSqe8Q6\/z\/i73Z7RrGxfZX3is\/mFzmJldGj7\/srxk+7f3vecnGQIllf+vnLbGf4uMg3\/0KhF0iGJjoHc97Ze3qqjEAfgUiDNrU\/u\/b2R5FKQqZyxry+38PvO1NXodb31KW\/X6vWZ3+AO3\/\/g9zf2eMrVqRHfX7n2VkZT0rbjWr+bzPdbW16lbYt\/y7uM2BeCTPSb3NaF0gnE67fhaQ0pHKtJjcquT+8ETOn1+TZnMMj0fgP9EJH7DovHTG+GSaUtTE\/Ghc\/tWxsRZASZ27lGpn9msz98Xx7KDYpbaTg\/7XiWCvce79+uV1rgx0yZ2yXIBK9LOiej9lO6bZu\/V9a7tD8qHZzelLVSR6o4BF\/ZpnQ\/ZM\/WhY1S7jtLtq\/0u8h03IojDYXvs5uWEYfiyvZV1mf3aUnh59SmOwTrPLR\/s7\/Poe8rc2Ki+ru45jTC3O8x6CAMHyvl9cm9Pxwx3TfI1JebO+4HpuJk16e+XeFva7Oeo77\/MKSHv\/l6DS0eT7k61au16TIqNWxs2L\/27yYXZHLLq9Xs9LlS+1CvnWntLq3vdlRgl+lJY9rwyvKKAWvENTKF15dry7hrZOLRk\/6ofOm3mD1mgu+gtl7x++snnVwDI8gIMvdgatmzQmezeEFhMlQ9SYtAWlx7r5\/Uz3Tt8P60Mc0W+FFn8He4RibpnIy58LJcVOsNU3Z\/DHXcestrXzu2s9F\/vHjmsLdfK6G2GGQKv4vM1J9dg8zmDNpmWtnA9g38ThdjphjlfkO1KV61aULR3zO\/tUJjWwwy2d9FbtrluDnq0bIKnaNxHchaZy3e\/vD12f27c5AZudw9T7T0z8YPTY8tfX7p+w+nTVZGCkceT706Nerk1kDnujIlsXS87\/O7qV0jky4vX7PTY6nUPizq03LP67+v+BhaTVkef63R2DZ8+FgtXqdZCDKl19dry9DUsvJvtPxbrBwzaZAprFf8\/lKQ2a82IsgIMncoyJTPII8p9rvdwWXfO8DEjWmhSB5kRKYcZEadsamOyIw5I1cYYap03OoBZeyITPD3akd7YERm8\/eRv4tDBJl1xy7uKFS2b\/TvdOR31q1nNCWhcvxU9m\/aqJc7evnva\/SI0ph9UDtzWvk9jj2zXlqffUZkwjOv+43IjAgyo0Zk6tvVu84w+fzy9x+MOJ5Vpr6MPZ72HpEZU8Mqv\/0D\/G52CTL5mj02yBxyRGaX\/bdHkNnhWL3WiMyY2rJjkNllRCY3Hay2XuODzI61EUFGkLkrQSY3lzY\/jWB11mNVBLKNa+bag2jOc7Egjnt\/8RqZaH5t5v0DIWJckKntp9q+r1wjE6x3cX\/UGpeksShezzN0jUw0h7x2YXH9GpnoepOBa2Si38VBgkw6l3pg+0b+zsZdIxOfRU+vK8odP+ODzPosYXiGeej7Kv4uCqNYo4NM5rqCUoc7cy1G\/1gpr8\/oa2SS7\/N618iMCDJJmMxfI1Peruj1Y65ZTLYrPCterO1jj6fKdQm1769ce8vtT\/Tbv\/bvZmyQqdXssUEmt73t6\/JBJvd57WvC72D81NXrBJla7SsE+KEakpmCWbyWbNcgM3iNTOaYKV4jU762thxk9qiNCDKCzN0JMrU7iMXTnRZB8a\/c2WnUnZF2f3\/trmXDd6PqXp9Zn24KxIgzs8U7rVWmVSzvMlW4a9ng9gydJYumbxTuvLW+o0\/xrGJw557sxedDd\/lK7xpUmtpV+l3sFWQy32dv\/1S2r\/o7jafPVPdJb9pF\/Hzx+KmOeCVTHNJRweCuZcV1K\/0uCo8Pje5t9tH5+BHCRXAXqeKUmuLvd8RdyzKf0ZsSu+NdyxZjzshGdwCbb4Nu7\/qhwtSyq99j\/a5zpe9\/5C1zdzmexty1rDDSOXRXv+Jv\/5C\/m8z3W15e5Y5X1ZGS3F3ayqPNud9Xru0ad13RLlPLKsdq8bvufmuZu5aVfhuVY3bvILPDXceK+7F2zI0ZkRmzXff03+ATZAQZeHz\/Lsk91J\/Wcfjte7i34Lxq4J2BvOP\/FtYN\/xs5AIKMIAOCzM1sR\/8M+qG37wF39jf\/dgV3OcjE02wABBlBBgAAEGQEGQAAQJARZAAAQJARZAAAAEFGkAEAAAQZQQYAAAQZQQYAABBkBBkAAECQEWQAAECQEWQAAABBRpABAAAEGUEGAAAEGUEGAAAQZAQZAABAkBFkAABAkBFkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAQZAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQAAAAEGQAAQJARZAAAAEEGAABAkAEAAAQZQQYAABBkAAAABBkAAABBBgAAEGQEGQAAQJABAAAQZAAAAEFGkAEAAAQZAAAAQQYAABBkBBkAAECQAQAAEGQAAABBRpABAAAEGQAAAEEGAAAQZG44yIxdLgAA8HAJMgAAgCAjyAAAAIKMIAMAAAgyAA\/f2Yeb8n+\/8n+arz3YZz1tLtaLvfixyuu+9\/80v7h81a82P\/i9t7FP3t\/84K80A\/\/d1roBIMgAMBxkDhpmBBkABBlBBuDQQebDT+PnfuzjB+6035cgE\/va9\/\/qEUanABBkBBmA4wSZXvAI\/v7hj2\/GJrahpD+SEQeWcHnbP7f\/\/eL73z8cZDaP59a3W177nnDZ3TJyj+0XZAaDX+Z10ahXJhBtPqMU9NJtNyIEIMgACDJjR2Ti8DH8XBpSyq+JXpcLMj\/28YFpb5Vl\/8qvJiGg\/e\/jzdm+IzKb9YuX0e3HbjvGXntUel1\/f5jeBiDIADD+GplNwAnCQjKqsF1G0LmvBaFsR3793l6Q2Y705EZ\/0tGizfqG4af32PgQ0J9alluf7vO327\/drlwgWz+WC0XpY8lIT\/j50UgWAIIMgCCT6yiXrnEpPZ52uAuvS4NL8e+1dcwtu\/bYdYJM8FgakIJRrfxIV7xP0ill2RGXdPtdqwMgyABQu0Zm7MX65XAQT7cqvS55fMcgs1rv3LLHPrbHxf7RqEluhKY\/1Sz3eD3IbJdXel31pgkACDIAgsxdGJGphY8bDjJheHl\/\/ZqZUSMyu4yyhFPmjM4ACDIAgsy+QeZA18j0LqbvXyOTu14nvkbmpoJMf5SkNPIy7hqZYJ9uXrPal9nPT17jdwwgyAAIMnsEmdr0r5u9a9nNBZmhWzpXb6KQu5Zmn\/02+J0BIMgACDID\/6Dlkf8dmTTMRMHiNoJMZjSpsF+jsJLZz2mY6d+NrB9m3LEMQJABgD3Ub4M8PiACIMgIMgAcXTo6kr9ORZABEGQEGQDu5EhMbYqaIAMgyAgyAACAIAMAAAgyggwAACDIHGoFAAAABBkAAECQEWQAAABBBgAAQJABAAAEGUEGAAAQZAAAAAQZAABAkBFkAAAAQQYAAECQAQAAEGQAAABB5qaCzLNnz4AHQPEFtPmgzRdkAEUNEGQAQUaQAQQZQJABBBlFDRBkAG0+aPMFGUBRAwQZQJARZB6xRTObTJpJxuz8+stfnB5uWdv1nTWL9d8vz6bL5U\/PLn2XihogyHBNXbu6W7t92cxPps384nbX\/fB9DgQZRe3eBpm7FxC6dd0GGRQ1QJDhNoNMG2LatlmQQZBR1O5KODifrcNMWJiS0HO62L7+Yt5M28dOZs3sZBuCoqKyXmYUjrrP6Za1+dxOt179wNUuMxqRGbP82jbkPv9k3lz6nQgygCDzSIPMph0\/W7fzUdvchZj+CdBuOf2+RLzc1XPrtnnT5m77JrPTsL3O9wWKQUabLsgIMo80yPQKQn7kZhMaLsICty1a2WUEhSR6vreM4eIVTy0bWP7O21AIOwgygCDzyIJMvm3MB5k4xKTh51n\/+ZPp+mRoGmTCNr\/\/Welyx\/cpfM+CjCDz4INMfbSjKyjr920KRnzWJT07svp795qBqWKbUZ7+GZrSNTLV5Y\/dBkVOkAEEGUEmDjLpzIlN25xOLUva1l77uw0p3Wdsgk0myJSnifWntGWDjDZdkBFkBJn82ZWggPRCR32YtzgVLHcmZocgU1v+4DZUhsgRZABB5lFPLTtP2uhikKlce9uGimx\/oTy1bFG5FiadthavqzZdkBFkTC1LpnAV7242NsgExWp+mozgpMvYY0SmtvzBbRgMUggygCAjyOwdZNr37B1kSiM\/pSCjTRdkBJnHG2Q2U8VK07KGpoGVi0p0JiV4fWl0ZbcgU17+4Dbc4TuxKGqAIMP9CDKZqWWFWRfDU8uCZRRPbg4FGW26ICPIuP1y6XXF0ZNKUQkuwAtDRXHEpHDxXzjlLQonheUPbkPvjmnO3ggygCAjyIwLMtvpY6X2vBdcBi\/2zwSZ4vTwZ9k7pWrTBRlBxj+IWXht7UxJ7exI6axIXAzb9ywq08OKQaZ61qWyDdXbPyPIAIKMIJO7Q2jUdq4vrk\/DSjobYjt7om1nx10jEy2z\/ZxkpsXg7Ze16YKMIAMIMoAgw362Jy17\/\/yB0RJtviADCDKAIMNdVfq3adxVTJsvyACCDCDIcC9GZfxDldp8QQZQ1ABBBhBkBBlAkAEEGUCQAQAAMCIDODsDGJEBjMgIMoAgAwgygCCjqAGCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ0QZABtviADCDKAIAMIMoIMIMgA2nxAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNVDUALT5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw\/afEFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQMEGUCbL8gAggwgyACCjCADCDKANh8QZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDRQ1AG0+aPMFGUCQAQQZQJARZABBBhBkAEFGUQMEGUCbD9p8QQZQ1ABBBhBkBJlb8eTJk704OFDUAEFG2w+CjCBzq8Xs6dOnO1HMUNQAQUbbD4KMIHPrxWzX\/2rFbHE6aSYn8+YyfPxi3kwns2bR\/vl81n8+4\/JsOup1z0qfs4d23adnl6u\/j1xPFDVAkHnsbf+yzZxMm\/lF+PhlMz+ZNLPzSvs8st2O2udj0\/5r8wWZR1rM2oJ0MmtmJ0kxu6kgc003WigRZABB5kEEmTawTJvZ6TRpQ0cEmbvYPgsy2nxB5nEWszZ8tIVmGUJOF7sHmeUZncnyrE5bELevWxXD1XProrhZ7tVnLp+7Wv7mc4LimSmCy\/WbTDaf1Yau8LHl67r1TNc3KsaF9epGprrPCPcFggwgyDy4k5hX7WQvrOw4IrNsb9uToQPtc9RfSGeBLJrZpu29WlY3SpT2F9JlhG142O5Hr9k\/iCHICDJ3vpitzsisRmLaQhIc8GOCzPI1XSFZB4T165ahoAsD4fB19J74c+IwtdgWs+X7t+sWLjs\/tSx4b7Lc4npF2xjuFwQZQJB5mCcxu3Zxe1JvjyCT9gNy7fM6lKza1f7ruj+vAlCtv5C07WF4KbT\/Zm1o8wWZh1rMujMyQUDIBYxikEkfjwpJrTAGIaFXEIdHgdJg0g8yq89bPR6O9FTWy7C0IAMIMo\/uJOa6\/ducRNwnyGxfU2qfe1PPC8EjOomZ9hdqfZDi8tDmCzIPtpjF07WSKVUjgky9ME16y14WtLQwRn\/fFqB4bm08HSxcz9LF\/pti2lt+Yb2eFYbCEWQAQeahncTstYXx9OvdppZt+wHVIJP7zF5YSYNM\/PnRFPBwilq4HuH2OUGpzRdkHmoxS0cnKgVkrxGZwhmRapDpCt8iOluUBqbhEZlgudGZprFnavrX6yDIAILMQwgy0RTr3jWpRwwy2WtPh0Zkgs9PRn\/yIzLlGRxo8wWZh1TM0oIQdOB7IyfFaVdhGKpcIxPOcx0IMpuL9NLCuPn7elRlKMgEozi9C\/oz6xUXO9fICDKAIPNYTmKG7exxgkw6TSz8Zx\/q18iUgkzc59isR\/Ie18ho8wWZB1rMcmdktkUkvJvY2LuWXRW+s\/Cam3g6WFzMKkFmXWTjwhNOCVuPsoRTyNK7lqXbkglr\/SlkpccRZABB5iGfxAxP7B0uyETtc\/VuYts2fnrVjyhPLQvb6avXnOfXI5rGZmqZNl+QeQT\/KBYIMoAgo+2\/baWghTZfkFHMHBwoaoAgo+2\/O9Kb+ZjWjSDzKILMPhwcKGqAIKPtB0FGkAEEGUCQAQQZRQ0QZABtPmjzBRk\/BlDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ1Amw\/afEEGEGQAQQYQZAQZQJABBBlAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNUAnDdDmgzZfkAEUNUCQAQQZQQYQZABBBhBkFDVAkAG0+aDNF2QARQ0QZABBRpABBBlAkAEEGUUNEGQAbT4gyChqoKgBggygzRdkAEEGEGQAQUaQAQQZQJsPCDKKGihqgCADaPMFGUCQAQQZQJARZABBBtDmA4KMogaKGoA2H7T5ggwgyACCDCDICDKAIAMIMoAgo6iBogagzQdtviADKGqAIAMIMoIMIMgAggwgyChqgCADaPNBmy\/IAIoaIMgAgowgAwgygCADCDKKGiDIANp80OYLMooaKGqAIANo8wUZ4MEVNfsWHM+AICPIADo+gOMZEGQUNUDHBxzPjmdQIwQZQFFTI8DxDAgyggyg4wM4ngFBRlEDdHzupot5M51MmknOyby5POZnn8+WnzM9uzz+9h17W3A8A4KMogaKmhpxR4JM63Rxv4MMjmdAkBFkAB2fBxxkeiMWi2a2DDOzZrF+7PJsWhyx6Z6bns3X72tNm\/lFbpnr5WaDzGUzPwnD1Pbzt89dLfdstnnN6v3h+4L3RNuXLrv\/+ngb0\/XH8QwIMooaoONzv4LM+Sw7YtOFkF7I6YWdUogIg0zpNV2gKD8\/PSmMJO0QZPLbEAYpHM+AIKOoATo+92JqWXHaVxds1oFhEwK64LJZbhqEtsFgcZp8RveazEjP6nO2QaR7T7eMzXvSZQwGtXREJwgupr45ngFBRlEDdHzuW5ApTKtKX58Emf7oSjzaEYWCJCh0oWR2ngkc0YjKdt16y02DSzbIBFPcNtcAhdPebvA6Icez4xnUCEEGUNTUiANMLQuCSi50bDr1hRGZ6wSZ7jXHDTLB9LJSuLnpu7c5nh3PoEYIMoCipkYc4BqZzTSwbWBIR0viKV\/DQaY\/taw\/TWz81LL9g8xmKlrv2pfM1DIcz4Ago6gBOj7362L\/9NqTbQDIT7saDDIHvdh\/3yBTGnVZLa90w4J4hAjHMyDIKGqAjs89uGtZFxIWyW2Vh6aO5UY4kmWcXeP2y0cIMrm7r7nQ3\/EMCDKKGqDjA45nxzOoEYKMHwMoamoEOJ4BNUKQAXR8AMczIMgIMoCODzieHc+AIKOogaKmRoDjGVAjBBngoRc14GFQK0GbL8gAzuACjmdAkBFkAB0fwPEMCDKKGihqagQ4nh3PoEYIMvfPkydP9uLgQFHT8QHHs\/YeBBlB5lYL29OnT3eisKGoCTLgeNbegyAjyNx6YRvz3\/n5eXN5ebn8c7+wLZrZZNJMErPzfdbpspmf7PveKxfzZjqZNYv0z7fhfLbeF9NmfjG8vyYn8+by0Otwl\/aHjg\/geL7z7X34Xy7ILE4nzfTscvDzxr7uYO3todpQbbcaIcg8rMLWhpjnnnuueeUrX7kMM6UgE4WP5YF3jUByiIP\/ll2eTQtFPLO\/HsH+0PEBHM+CzF0PMtpuNUKQeUCFrQsxrfl8Xh2RSQ\/uthhEhWVzliM8g7EagZmeTNejONsRmbQILpd3uugva\/PZ4dmSqwKwKQT9UZ5o2dn1Sj+jUlAy71+ua\/dYt86jimG6ru1r12eF1tszOy2Meq3D43Y9SvvjWXW7l\/vmdJYsa\/tcebt0fADH86MKMssAcdUunUyiUYywDRxsa8O26qrtidu8q1BxErTB2bY\/CTKPsu1ef\/7pLLv+D6HtFmQUtZ0LWy7E7BJk+kOj3TDt6oBbHUzhn5NiEJ1hCR6PlpUEpsJwbBSCegUmt17Ba2pnaKKRp3hb4s88VDHcNgrLwrTZP\/H6bhqa0vB0Zb1XBS\/zut73kQ676\/gAjudHF2QqbcnmdcW2dt3mhO1m0uZt2sNa279pnx5r273+cxTm1st9IG23IKOoVQtbG1Re+9rXDoaYfYNMdnRm+ff1iMym0BQCS22YNTxISwf\/8qAO\/hyefcmuV1xcRg9nB58zVAzjebbdtg0Vw2Cd0jNQuWH12v4orHfYqJSDpaImyIDjWZCZRaMeYbsXvm58W1tp82rt76Nvu9O+VPD5D6TtFmQUtWJha697aa9\/aUNLG2ZqIWanIJMWhmwBSA\/+8O\/bP6eFJRomDYdXixfIbQ\/qXnEtFabecG9+Lm30XHEU6HDD04tMIe6tx0AxrK13PKUvXp\/sdAFFTZABx\/Mjnlq2bUuqQSbX1vbCSqXNq7X9vROaj63trnz+A2m7BRlFrVrYwjBTCzH7XiNTLgy1ILN9X1u8ormwhaJQu9PHqqguomHV8npltiX3umuc1RlVDGujUkcckSkFmYPdXU7HB3A8P64gU2wPRwaZWttfaAMfT9tdDzIPoe0WZBS1wcLWjsS89KUvXYaYV7\/61TsUthF3LUvOumzniNaDzPbMSqmYJfNCa7cs7C6Q653NyKxX8t6bnmdbni9cC3DJdrTL2PMamVyQibfHNTKCDDieBZlxQabcBxi6RmZk29+tx6Ntu8tB5qG03YKMojaqsLVhphZirvXvyGTvJDIQZHo3Awge6+6Qcp5OISvc6WP9XK+oFe5wEg2F1+aXFu7Esl8xjIfFp2fzUcPT5fWo7I\/aXcuyIzLhfje1TJABx7MgUw4yXRuavWtZpm0ebPNqbX86XevRtd21EZmH0XYLMoraUQsb6PjYt+B41t5fSzp9DAQZRU2QAR0fcDwLMnevvY9HCyaTxzXtCUFGkDlAYduHgwNFTZABx7P2HgQZQQbQ8QEcz4Ago6gBOj7geHY8gxohyPgxgKKmRoDjGVAjBBlAxwdwPAOCjCAD6PiA49nxDAgyihooane1Rrj7EAgygCCjqIGidi+DzNOnT3ciyOB41uaDGiHIAIrarQeZw\/3Ddut\/kO50ET\/e\/gvbJ\/Pmcv387HxovRbNbDLmdc8Kn7PPvmg\/s\/sH9Mau520r7aeR638xb6Y39S+f3+RnCTKAICPIAILMTkGmDRKns6vOddJhvakgc+1QcN\/+JfBr7idBRpABBBlFDRQ1QeZZszhddarb\/0\/PLncMMuvRnMlkHYaC1y07wevnws7wcrnT1XPt8rvPSUdmok70qvM\/6SxHj4LPXoaZ7Xqm23J5Nt2OOJXWK1pesi\/SgBesy2Z7l+t\/tQ+idRqxn3IjMuttn52mnxPuh\/W6F7dnvd3rdZmdbvfBcv+cTIPtjLd98z1E38HI\/eN4BgQZQQbQ8Tl+kFlsR2LaTmsYJEYEmbZDvOn0rjv4YYe7e0\/\/dUEnf\/M58ejKNnysPn\/TcV52rrvXFaaWRaEoXP\/yekVhJ9wvvRGKZB2z2x9P1yvvp1qQ2W5z9P5MwMvu595+KqxP9\/do2+NAtRi7fxzPgCAjyAA6PjcSZJbTyhZBRzoXMEpBJn08CRJhRzfsfKfPJZ8TjhDkR4HC8FIIMmEnvvbZxY76Htf3JMtOg1h2P1WDTO672H97wr\/HwWV4ZGjv\/eN4BgQZQQbQ8TlGkFkEU5d6U4YGg0x6rUcaZNJlrzvm6RSy4O+bznJ6bUZveQNBJvhz1AGvrVeyP0rXsPT2WRhkgu3afm5lP40IEMNBJr89aVhJg0w0NSyanhZsf7IeY\/aP4xkQZAQZQMfnuEEmPeuf6yRfZ0SmdCeySpDZfH40UpQGgREjMkHHvbsGaLc7pBVuIlAcTaoFmX1HZEYGmcL2DI3IbINMMnWvth538CYL2nxAkFHUQFF7ZEEmur4jN8oy4hqZ8jUicfhYXXRe6HxnrmeZ9IJLuqzhILMdZQg74uX1ijv3hWtAoiCzXtfBIFPbT9cMMrX9PHCNTDHIhOsXfNao\/eN4BgQZQQbQ8Tl2kInPwmcu4N\/1rmVXr52flu5aVrjeoxQAinffatd50ZtClt61LFq39LqO0nold0Yb3N72vefl0ZF4RKSyn3YNMpv1zN21LB4l2e63WTOvTS0Lp6itR7GWz1fuHGdqGSDICDKAjs8t3rWMx+GyGFwdz9p80OYLMoCOjyDD3ZHeCOAO3nHM8QwIMoIM8AiDzD58\/zietfmgRggygKKmRoDjGRBkBBlAxwdwPAOCjKIG6PiA49nxDGqEIOPHAIqaGgGOZ0CNEGQAHR\/A8QwIMoIMoOMDjmfHMyDIKGqgqKkR4HgG1AhBBtDxARzPgCAjyAA6PuB4djwDgoyiBoqaGgGOZ8czqBGCDKDjAzieAUFGkAF0fADHMyDIKGqgqKkR4Hh2PIMaIcgAOj6A4xkQZASZG\/DkyZO9ODhQ1HR8wPGsvQdBRpC51cL29OnTnShsKGqCDDietfcgyAgyt17Ydv2vX9gWzWwyaSap08W93z+XZ9NmcjJvLtPnLubNdDJt5hf99yxOJ8307PL467dch1mzSP+8y7ZlvrfZ+Yj3n8\/y+0XHB3A8P+D2ftXG7d\/eXzbzk\/V7vvI1I9qt1etX7VLb18i3uzVj2+Qba7vveRuqRggyDzbIxB3gsPg8riBzK\/YNMum2tcV1zHIEGUEGHM+PN8hEwWUdTkaFmba\/sFtbFb9XkEGQUdRuJMgkRWHZ0e7O3nRFLC5Kccc6DELBGZzwc9ZhYnoyKXS+k5GirsiuO\/2z08IoxLIz3z4+vXrNNUZkRn\/OJPmMeHs3z6Xbuwkv4XbOmr+bFON2v+aKcz6kBd9JGo7CwpsU4fAMXfhZ0Zm7OzJCp0aAToogc8ggk2kTi23+ZNO+zt8atDHLNuWqvTwJnr8I+wJhuxg\/NzSbIOqLFD4nnKEQvTbbRgfbcTpL2sykTxIuI1zHtD3t7SsEGUXtloNM+Njqz11xWBbB9QHc\/rl73+K0LQBhwVv9OSqaywM+LBql4rUqcHGQit+XW594mesiea0gU\/ucpBivtzFuJIL9mG5vaWpZFDLaZefXc3BEZmSQiZYTruPI9dDxARzP9zzI9KaAhW172I4WTpatO\/NR27v8jPLUsmLfYCjIZD8nd\/J1uI1eBaBCnyTpJ0Rt5aZ97J\/QvbFRITVCkFHY6tfIxAUh6BAHB\/fywO6K1em8WVz9fdMJXj6ehqSgqO00vWvRO2uyeV9lpKE4\/Ds6yOQ\/pxciisPMle0tXiMTDN23jxeGr\/PXyBSWX9xPSWAMt\/+ODp2rEaCTIsgcMcikU5R77VMpyGzfE\/UNskGm0jcYDDK5z4lfV26j0+ltlb5FbTpZcXkIMoranZlaVr7uIjnw24O5\/X9bTK5e2xaS7VmJSkgaui4kGdKdjJgyNTpg7DC1rPg5ve0KQ0nmAvxsIMyPnnQjXbWzO+m29hqnHYJM6cLP7HC9jg\/geH5gQSboB\/Ta3vAkWSXIBO3R2CBTPIFanVqW+5xMkMm10b22vzIdO3djhNxJ07DNd92MIKOo3cEgUxmRWRWpq+fWAWb53Ok8mIZUOVtRDTLpOu137cdRg0z2mpF0hCMdkRkXZFYjWvPqdK7+1LJ4CmC6zPyw+NibOtydmz+oEaCTIsgc8RqZ6mj8IYPMuJGMvYNMto0eGpFJ2uGxfY3M+iDIKGp3JchUrpHZXhsTzFld\/r0wUhDOQd0hyPTnsRaKS\/S+Q1wjU\/ic5P3bfZIEmXA+7y5BpjtbVTm7M+4amcK+KI5ibb\/ruCC7RgZwPD+Ou5bl2t8RU8t2CjKVvsEBgky5jR66RqYUZAptaOaEoWtkBBlF7c4FmdIdTPJnLfq3QIynLxWvvalcAzI9W5RHNnKjMN2UrrPCNSaZ6V9dMRsVZGp3KgkfvyqWxeX15h1PBvbjmLuWxQ3Sdh9ebdvZuLuWxeFlYmoZ4Hh+aEFm6N+RidrIESMYo4JM16bk71pWamPGBpmuvcvetSx3onD52nllallyp7Xz\/PZG09hMLRNkFLXbKWzcNS4g1PEBx7PjWXt\/VGP\/7TUEGUFGYWOk5LbP6PiA49nxrL0\/hPQGN04YCjKCzK0Xtn04OFDUgIdKe6+9R5svyACCDCDIAIKMIAMIMoAgAwgyihooagDafNDmCzKAIAMIMoAgI8gAggwgyACCjKIGippOGqDNB22+IAMoaoAgAwgyggwgyACCDCDIKGqAIANo80GbL8gAihogyACCjCADCDKAIAMIMooaIMgA2nxAkFHUQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNQBtPmjzBRlAkAEEGUCQEWQAQQYQZABBRlEDRQ1Amw\/afEEGUNQAQQYQZAQZQJABBBlAkFHUAEEG0OaDNl+QARQ1QJABBBlBBhBkAEEGEGQUNUCQAbT5oM0XZPwYQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyBzGkydP9uLgQFEDBBntPQgygsytFranT5\/uRGFDUQMEGe09CDKCzK0Xtl3\/Kxa281kzmUw2pmeX8XMn8+Zyl\/W7mDfTyaxZ7PyeSbQeS6eL43weihogyDyy9n5xGrexs\/Njtunr95T+vM\/70eYLMgpbP8RMm\/lF99hlMz8Jwsw+QWYfy0IVrkdr0czGFFpFTlEDEGSq7f0yxITt+foE4lHa2NJ79gkyaPMFGYUtX9iS0JIrIOsgM9+cxQkLyypo9EZPeu+fNbOT7nVpWKkFmVXhXa3fal23Bbf97PXr04IXjjDdRAhDkAEEmXvY3i\/DzbLtHm5j52fTTDu+el88oyPsG1y1zZs2uvR4OgNkxOt6bfx6\/U9nu83oQJARZO5xYSuEh9y0s1VxWxesoOhtimK4rDTIZN+\/64jMyCATLafyeShqgCDziEZkLrsgkm0Th9rY7fuWy1kHiOWfN8tr3zMwnaw2ZSycAVJ9T7lPsnl\/b7YJ2nxB5oEGmYGh22Ux2L4mLlpp6CgFmRHvL1wjsz17NC7IhAX2RqfGIcgAgsxdvya2NJNisI0NQ8H2uXqbfoQgk7bpmz5GOuIUrL\/2U5svyDzyEZmgaERFK7lJwKQUZErvr61LEoB2CjK9QGSeraIGCDKCTHm62Q7Tt5OQEN5AYPP+IwWZ3snKzXOV9dd+avMFmUd2jUw4PFwMIumF+JURmX2CTO\/CxKRIFaaylUeMUNQAQeaxtvdBu55ON8tdI9NrY4P2uXgStDblezjIRCFlzxEZQUabL8i4a1l8XcnIILMaCTlskMldIxPN0R28RiZzlxYUNUCQeax3LYva31UbG47IlNvY7UnPMHBsb8iz7zUySRt\/zWtkBBltviDj35GJC10liITTuKZni20ROViQ6T4jLmCrz5uPu2uZaWWKGiDIaO+z\/45MNCNjoI3d3rWsfPfSOEjk7joWPB71I64+6yzsL5TeP3DXMkFGmy\/IPPY5syDIAIKM9h4EGUFGYQNBBhBktPcgyChq28K2DwcHihogyGjvQZARZABBBhBkAEFGUQMEGUCbD9p8QcaPARQ1QJABtPmCDCDIAIIMIMgIMoAgA2jzAUFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQPQ5oM2X5ABBBlAkAEEGUEGEGQAQQYQZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDdBJA7T5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw8IMooaKGqAIANo8wUZQJABBBlAkBFkAEEG0OYDgoyiBooaIMgA2nxBBhBkAEEGEGQEGUCQAbT5gCCjqIGiBqDNB22+IAMIMoAgAwgyggwgyACCDCDIKGqgqAFo80GbL8gAihogyACCjCADCDKAIAMIMopazZMnT\/bi4EBRAwQZ7T0IMoLMrRa2p0+f7kRhQ1EDBBntPQgygsytF7Zd\/+sXtkUzm0yaSep0ce31uzybNpOTeXO51\/vb9Zo284vMcxfzZrrvOi\/fO2sWCoSiBggyj6q9f9YsTifN9Oxy8PPGvu4gwnb5oG30ZTM\/mTSz8\/2X0e6HXl9jr\/Wr9GkQZASZ6weZ+EC\/\/sF\/\/CCTPpfbDkFGUQMEGe39vQkyB3WgIJOcJF32bXY+2SvICDKK2g0GmaCIrUPD9CQ4CxGNiCTF53y2fnzazE67IJMWk\/SADkeF2uWtXt8tp3fgZ4NMWHgrn5cWzM36Tq4RuhBkAEHmngWZtv07mTWzpL1ddtTX7WL02mxbGbTfp7OkrU36DuEyNv2OpP0f1Uav2\/jT2cCMjPXrzrZ9lm570qDWbnMuuOWCzGq\/deuSzGrpXhtt\/19uXpP2aaJ94eSqICPIHDjIBI+tQ0scCuJisDmgo9euw8hgkImf257puM6IzMggEy1nvb4HmFKHIAMIMvciyKRt9roNjF5XaSvDjv4qAIVtbdAOJ+12NGOjNLUs16dYflbYv+i2I9df6E6KZtr8KIy0r8v3N3JBZvvYavnZ\/ZTtO3WfEfdvSiEKQUaQucY1MvkClhnRKBaG8O87jJBc4xqZbSEY93m9qW\/p+iPIAILMgw4y2\/Y3nDIVvq7cVuZmV8QjMsWpVGF7WwoyuT5FMGtj2+aX+gvp68Ltat8TfGah7c9eI1PsJ9S2vxxkEGQEmSNMLSvOXU0KX3hAlotdJVj0lrfHNTK9ZewQZA5yER+CDCDI3MepZds2uxpkcm1lrbOeOUnZCwUDQabXp9g8NzRdvXyNTLhd7Z\/b52ojItmpZdnp9MnUsd72J+sYnpB1AlWQEWRuMMgcYkSmN\/x6zSCTTnEb+Xn7XbCHIAMIMo8syGTbyqERmcpJ0AOMyIwNMulsjWj7T+fFaWXDQSbtP9WCXLlPoy8iyAgyNxlkatfIZK5TCYNMdh5t8vnbMzDXv0amPG83d41Mui0IMoAgI8jU2sr6NTKlIJNc47LnNTJjg0z8OZkbDVXa\/V2CTHX7KyHHNTKCjCBzo0Fm7F3L1ncKSW4EsLqWZV4eYk0L3Q53LVsVkf6d1aLPq90RxbQyQQYQZASZzXSy7F3LMic3B9va9G6k5+Hz3TJ2vGvZ2KllwV3Lindo3SvIpHd4W2zXq7j9\/TvDOYEqyAgy1yxsoKgBgoz2\/lqK17zeVS66F2QEGYUNBBlAkHmE7X04ylKYQXFXrWdtmNIlyAgyt1zY9uHgQFEDBBntPQgyggwgyACCDCDIKGqAIANo80GbL8j4MYCiBggygDZfkAEEGUCQAQQZQQYQZABtPiDIKGqgqAGCDKDNF2QAQQYQZABBRpABBBlAmw8IMooaKGoA2nzQ5gsygCADCDKAICPIAIIMIMgAggwAAIAgAwAACDKCDAAAIMgAAAAIMgAAgCAjyAAAAIIMAACAIAMAAAgyggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwh4MMAADAnSDIAAAAggwAAIAgAwAAIMgAAACCDAAAgCADAAAgyAAAAA\/L\/wdCDxQclZwmpwAAAABJRU5ErkJggg==","width":424}
%---
%[control:button:386e]
%   data: {"label":"Run Calculus Flashcards App","run":"Section"}
%---
%[text:image:813c]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[control:button:2170]
%   data: {"label":"Initialize Values","run":"Section"}
%---
%[control:button:554e]
%   data: {"label":"Generate Problem","run":"Section"}
%---
%[control:editfield:05b4]
%   data: {"defaultValue":"r","label":"My Answer = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:3d7e]
%   data: {"label":"Check Answer","run":"Section"}
%---
%[control:button:83f6]
%   data: {"label":"Analyze Results","run":"Section"}
%---
%[text:image:33aa]
%   data: {"align":"baseline","height":326,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAzIAAAJ1CAYAAAACH8VNAABKAklEQVR42u3d\/688310X8P0\/jMEfiBaNSkxEjRo+aRGtdPVaRQkIUcFPP1gI8k3qdQsWNDRqit8Q3+5NxC9UqsEC2oh7A4WatkAbpILX3rYIfuy70lbkXSzYFMp4Z3dn95wz55yZ3bt7vz4+ySOf93u\/zM7M7rzOec45M+\/Jb\/icL2wAAADuk4mdAAAACDIAAACCDAAAgCADAAAIMgAAAIIMAADA9YPMZ\/yx55vf9ae+Yi+\/+RVfakcDAAA3H2Q+65Vf3rz5pz\/S\/Juf\/F\/Nd737afNP3\/li8+Rt\/735hz\/0geYNi\/c1r\/8P722+5d9dNK\/9tz\/VfMO\/eU\/zNf\/qJ5qv+Bfvbr70H\/9Q8ztf8eftaAAA4OaDzCuf\/yvNP5y\/seofzL+r+fv\/5Luav\/eP\/0Xzd7\/jnzdv+Ef\/rHnDt39n89IveJUdDQAA3HyQ+bq\/8Yam9t+nPvWp5pOf\/NXm\/33iE80v\/\/IvN7\/0S\/+3+cVnz5r\/\/Qu\/0PzpL\/86OxoAAHYw9r+7tt4\/efG+5qu+9duLz7fPta+5E0GmDTE\/9ANva9799X+wefbzPx+FmI989H+PCDKvab7jxWCBL35f8\/Lq67+9OW8+1HzHq\/bd6Ou+P1xO\/N\/PfPdrrrH8Q63X8T7rq99+tZFv\/3bFBQDgBoLMIV5z09qg8slP\/L9smKk9d+NBpg0xL\/7Cx5vXvOKLmw\/\/p89s\/tuTfxCFmP\/18x+uB5lXfV\/zM1fLOX99\/Nh3vP6+BJncch5okGm\/qxff1Zy\/eFPrCAAgyNy3IFMKLIcOMaODzNd8y9\/JhpiL\/\/kLzR\/+m9\/fzH\/HS5qPvuMzm3d9ycuiEPP06Yeaz3\/ha6sjMeevv+kOvyCzz2e9\/Ls\/tBxx6v6vwAAACDJjwswxQszoIPPVr\/tbvRDz5re+p\/ndX\/r3mukf+PzmBz7r05uP\/vPf3vyXP\/6S5gNvf8cmxLz4Pz\/Y\/Mnnv7oyGvOu5quHpjJ1\/22mNKWd8Hhq2ioYpa8J\/176c\/r33HJ3DzL5bais8+tXo1TbqWq17azvo\/O3f+jqwfU+flW43O\/bYTu716xfvxyZCaf\/1dZ7aJsAAHiIQSYMM8cIMaODzFd90+uXO+rXPvXrzbte\/KXmW99y2bz0G7+3+ezP+8rmqz7t05t3fvZvaT761z6j+dkvfknzjm987SbE\/OzP\/Y\/mT3zZV1WmKg1dDzMURFad8H7n+ABB5vXvGrgepH+NTD5EjV32enndPmlfswl6pe2s7aM0UGxDSjuq0ozezvS7CkJNbr2XgSlej\/xzAAAunBdkjhxkvvK137rcUWc\/\/L7mlf\/0vzWf\/0\/+c\/MFf\/sHmi\/4PZ\/XvOE3fVrz05\/3kuajf+Ulzc9\/xUua85f+\/ubnfu7nliHmZ\/77zzZ\/\/C985d4jMqvOfPdfJnwUl3GAILMewSiHh5FTy3LbkF320LoU9tXQPvqcyijKqO38wt50smUQKo6QrUaJSqFu+xwAAKaWHTnIvPqv\/c3ldLKPfeyXmn+5eFfzJfMfb75o+hebv\/4bf2PzHz7zNzcvfvFLmo+c\/rbmPd\/6Z5ofefnva9793d+9DDHve\/8Hmumfe\/V+18hEnfdwFOCGgkzYad93allxG3LL3iPIjNlHQ0Fm1Hbm\/us+Nz\/VL79N+14XBQAgyLjYf48g8+V\/9Vs2\/07Mxz\/+8ebyve9tfuRfv6n58T\/0W5oPfvlvaz7yNZ\/RvOu7\/vYyuPzoj\/xI8x+\/6ZuWf37v5fuaV3zJXxocccnetax9rjhdaWhqWdJhXn5O+f3515VHJEYHmeI25JY9fL1Obx1G7aOBqWVD2xl+xueUwkqwblG4qj0HAMBDCzJ37vbLr\/qGv977xy4\/8tGPNv\/jTX+6+dgbf2vzn\/\/l6XIqWTed7D3v+alliPmvF+9t\/uiffWH4+osm9+\/IBBehR7f9zXfSexerh1Ou3v6u8ihM6XXRlK0xoz4DNwwItyG77KHRodx2jt1H8WdGF\/sPbGc7FSw37Ww7vSy8sUB6w4DacwAAPKTrelp37h\/E\/Itf\/41RiOlusXzx49\/X\/Ni\/\/zvNBz7wM5sQ043EtCHmp376vzZ\/5Iue92N80Gq3cr7JW0oDAPCYjAoyX\/Z139gLMeEtlksh5iff81PNH\/lCQUaQsZ8AALiFIPN7\/9SXLQPJPj7zFV9kRwsy9hMAADcfZAAAAAQZAAAAQQYAABBkAAAABBkAAABBBgAAEGQAAAAEGQAAgOMGmcnX\/CAAAMD9IcgAAACCDAAAgCADAAAgyAAAAIIMAACAIAMAACDIAAAAggwAAIAgAwAAcLQg8+53vxsAAOCojhJkfviHf7h59uwZGd\/5nd\/Z\/OiP\/iiPiO\/cPgIADkuQEWTQSbePAABBRpARZNBJt48AAEFGkEEn3T4CABBkBBl00u0jAECQEWQEGXTS7SMA4PEFmUUzm0yaycasWYx538W8mW5e2y5j2swv2j9fNvOTSTM7v+9BZt68EO2Xtefnh\/sBfP\/rmucmLzTz9M8HWW5\/3Z\/75rfsuKy3NK972aR54Wxg3R9gJ33+\/NU+e9nrmrdc+7Mr+3CX34cgAwAIMv0QMz273Dx2eTYdF2aKQeahjMisgkzcAb1Gp\/QmO6rL5T7XvO770+1JHxNkivvvZS80L7xs1\/114CBjRAYAEGRqYSQNIKtwsxlRWb4mHa0JR3H+cvOak+7P7bKCEZl12JmdbkcFwpGaVWhavW92evXn08XqufPZ7iNENxJkVmfqlyMb67Dw3MvadVx36M9eiEZAoveGoyTLM\/3hiM\/V+9Ng0Hv9+vHwM0ojBtkgE3So22VcddKfC5eRXe76Pd+8XZfNqE66vju8fznaMQn2W2\/fHT4g7dJJf8s3P7dcz\/b\/0QjceptfeD7\/HS9fv9mGbv9v9\/vmt5N8zmYEKB31i\/bxajn7j64JMgDAgxqRWYWONGCUQs2iDSQn8+Zy7NSydQjqRnz67+\/esw5GyyATj+60YSccMbrdIBM8tg4am+eT8LDs1G469PFoSByGclPLaq+PO8jZqW65IBM+tgwNwfPRtoTL7TrP4Tqu39db99x6rf+chKVVJ3z13OrP8faGHfyb76S369WtS7te\/XAZhY9o27avXT4X7INtgAxDXvB95B4P9nEcqpL1EmQAgEd7sX80AhKEmuXjwYhIGF5GB5lgxKdd3jrILEdjuhGY6O\/Hn6Z2nWtk4hGJytSjsHMadVRHXCNTeH0cjoaW21\/3TehKOt295WyeD8NGOYSV1yt5fzKKsx2h2Gfa25E66ctpZdttadexFFaL+z8KHuHUsiCAhJ8z4vfRGx0ytQwAEGQq082SgLOdPrZLkAmCUBBklqMz2SCTTGfrRnDuyNSy2jUi0fSgYIpVr6M\/EGRKr4+nLlWmYe0SsnKft1mX\/vUdxSCTXa\/k\/cUgU5lKd8Od9Oy2ZKd65UZScu+L90EXjNJRp\/Bza8EvO21RkAEAHl2QaYNFECbC6WbLIBIEj73uWlYJMuURmfhzSo\/fuSBTG+U45IjMmLPyOwaZ8SMywd9HjRbsEGT22c6Dd9JL0wkz0+mS\/ZaGwfyIzPo9z78umL5W2WfFGyocZwRLkAEA7t1dy6LrY5ajMPG1K93z0R3NrhlkitfIJO+5W9fIjA0yybUhSbDYXD9RCjLV1yePFwPSDkFm6BqZ3HYMrW8wtWwwyCSP39o1MmkYrYS3epBZT0vMBZnuuWzoKV8jE4c+18gAAKaWZf4dmeT6lOiuZeFz3fva0NHdNCB\/17JskInuWjZr5sHIy\/bx+zS1LJxadNURPRtzV6\/uOpzMXctKdycbc3evXYPMDncdK4WS\/HqNH5GJpnTd0tSy7QX6uelmhe+o912utz+5Tig7PS\/72ylNLYuv2TK1DAAQZO6EVfg59MjL9YIMD8nd+c6Pf2MDQQYAEGSOKb2RwIGvgxFkuHOd9OT2zfYRACDI3PsRmZulwybIYB8BAIKMIINOun0EAAgygowgg066fQQACDIIMjrpvnP7CAAQZAQZdNLtIwBAkDlKkPme7\/keoaXgzW9+c\/PWt76VR8R3bh8BAId1tCADAABwTIIMAAAgyNipAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwf4LM2GUCAAAPnyADAAAIMoIMAAAgyAgyAACAIAMAAAgyggwAACDICDIAAIAgAwAACDKCDAAAIMgIMgAAwOMOMrssE4C7Te0HUPsfVZB59uwZAPec2g+g9gsyAAgyAAgyggwAggwAgowgA4AgA6D2CzJ+BACCDACCjCDDPXR5Nm0mk0kzOV30nlucTpbPTc8u91j2opm1y53MmsWY11\/Mm2n7+pN5c1l4Tbc+s\/NrbHP3OaHMto\/dd9t9s+P2giBzP2rjJFMHR9Sru23PenU+i+rlQWryTX6P6+8rrt13az0PuV6HXebx2rjud5Q91hBkNGaM69inxemGO+Y3EWTaRjgNMRu7becxGh0QZO6IQq3YHO+PMch0+2TPEz+347KZn8TbeVdr92NtU9IQI8wIMhoz9iz0SUBIGq307GTYgG8K8OlsHYqmzfwi01D2OgfBc0HHYH6aL2a5IBMXwVqj3K1PWiAzjw+sS35f5DoG232bW79twzXfrMNq31U6VPe244Qgc\/86V5ta0x2H3fEXBpngGO11vtIR4E0I6GrD9njvj473O+G1EaNewCh+di7IlOv1cpsKtXu4Jif1bESdD2tydhlD+2FTI9PlTJrPff5zx7023FebdZ41s5NKJ7taqwf275j2ILvv1s+H33Ww7v1wNLBvd92GgTZu8\/s4C3+LmXY\/ep\/ZDYKMxox9zz5uilYSbgbOTo7q2OemdIVFt\/R80EimjWb2TE6po187m5gW04F1GRdk0gLfbzh6y0m3YWifgSBz5OlIhc5UsUZkOp6F47v7jH49S+pQ7ngfO2JUrI\/HCTKls+uboDO430p1s\/A9VPfD2CDTf119X2aC1WCtHh9kitte\/E6nvce7\/R0HmYF9u\/M2DLdxpd9DtQ3r9UcQZDRmjJ5mkJ7dGWg80tGawbM3lalkm88sn6GMG8318jMjQ7mpZ\/Vh++TM54h1KZ\/pWi8jU4xLy+jvgxEdGRBkbmDK7cBZ+kynLe3Ub2tEcoIoOr4XvbPwtXqWdoKHr29MR953DDKFk0HRNufajdJIVia4rNarPgq1+\/S3\/nb1andvXw63B8XfS7FW7xBkSicUe+vRn02Qfu\/5IDPQJo\/dhhFt3CbIdMscCCm9MI8gozFj16kUbcErdvoLUxXyry8FmeTsV9rAZYf0V6\/JN5rj5tbuFWRyUzGSs6mlIJO\/nmdoGWlD0z\/jZd4wgsxNn+Cp1KviiZRC\/Ys6r0E9WC+vm57bPr+qIaXOc3\/dtrVmh88+YJDJ19hCba2cgKpNYx4dPHcIMuWRkOTEXnU9hmr1+CATthnRuvbWozw9MR9khvbtbtswpo3rv6Z\/ArI3CmokRpDRmHG96WXdPOCgAU0bsMKITLVwl0ZgKh2DfYNMdSrGLlPLciNMI4NM\/mzqrkFmIPyBIHPDF\/+XO7fxMV84lpPOaxdWZqfT+NrCq0AzG3OsZzvwYz57OMiURi6KIzLZUaLdg8yoa22ejWubrhdkkrZmVN0t1erx6xHuv0MHmXH7dtw2jGnjdgky9eCOIKMxY+8C3C9Gw9OsykWv1ygecGrZ2O0rXljau17nZqaWDQeZZ8ULhEHtP9YNUMLjLHlsRId8eHpXeo1HfKZ7txHY\/Nny3aeW9ad8HWVq2cgpwUOj6UNt035Ty3a\/o+bwb2h4\/46eWnaAILPbTIV0G3afWjYmyCDIaMw46P32y3eh2W9q2d4Xtu96sX+tkz\/29ssj1iXenva9+1\/sXwwypfXVCCDI3Fgt3G9q2ZgL7vMnUrafXa5lxfUbunlKcYSgVK8yQSZYt70v9h+ckjeurg9fTF4OMv3aPf67Ht22ZELJ6JvmlC7G3zvIDOzbwW3Y\/2L\/4SDjJJ0gI8hw0Atca1Ob2kITd7jHXSMTF722sEVDyQe5\/fKIf2NmzD+IufMtQnNBZpfbL1dGZGq3rAZB5ubCTGXaa3FkoXoL5MLIx9DNVsas3863X05ff\/V48SL4cpDZ5fbL5f1Wu\/6nNpOg3zblrxdKa3fuM\/P\/NMDlqOmHhVo9sH93uf3y\/iMyA\/u2ug3XuP2yICPICDJwC4HOyAeCDACCjCADggwIMgAIMoIMCDKg9gOo\/YIMAIIMAIKMIAOAIAOAIHPoIAPAw6D2A6j9RmQAMCIDgBEZQQYAQQYAQUaQAUCQAVD7BRkABBkABBlBBgBBBgBBRpABQJABQJDRmAEIMgAIMoIMAIIMAIKMIAOAIAOAIKMxA9CYqf0AgowgA4AgA4AgI8gAIMgAIMhozAA0Zmo\/gNovyAAgyAAgyAgyAAgyAAgyggyAxkztB1D7BRkABBkABBlBBgBBBgBBRpABQJABUPsFGQAEGQAEGUEGAEEGAEFGkAFAkAFAkNGY7e1DH\/pQ87a3va1505ve1Mzn86X2z+1j7XP2EX6LCDI4hvH9I8gIMnfKT\/zETywLTVtk3ve+9zUf\/OAHl9o\/t4+1z7Wvsa\/wW0SQwTGM7x9BRpC5M0XnjW9847LIfOxjH2s++clPNr\/+67++1P65fax9rn3N0YrP+ayZnMybS9+H3+Jt\/xYrFqeTZnp26bsSZDjSMTw\/mTST00Xy+GXhcR5eDV80s0n\/u748m\/r+1X5Bhvzwb3t25AMf+MCyyJT+a59rX9O+1rAwj\/W3KMgIMhz7GF51ZGfnSSfWia5H9f1PJtNmfiHIqP2CDAPaYd5WWHS+7du+rXn5y1++1P45LD7d62udu6jgtCMty6K0smmcliMw02baPt42UNGIzPrsW\/qei\/nV62fNIjuKE79HZ\/Nh\/BZrDeHwb3H1mwg7RL0zvNnf2NXvcvlc8Fvrftd+X4IMR21Ptu1Gd\/y1HdugU7s8RrtjNzhGo8fjTjD3p4Z33\/fsNA6vvSAT9i2EXEFGkHm82ovvXnzxxajRee655yJh49O+tn1PeVpY0Hlcdwq7BiU6q7YsQkFjEyyj7YxmX1cJMnGRawth3Anl\/v0Wh\/7L\/haXv7\/17+Xq91EKHPXfWCn8GJERZDh6exK0I+2xFh9z8WjN9jhOTlq0x7Sz9\/e0hnfBNf5OozY+qtOmHar9gsyj1g7tfuITn9gUlvasWdrwtI91\/7Wvbd8TLScMLGnYKAWe6Ixb+Fx6Fn3boI0PMjyE3+LQf9nfYvd7XI72lcLs0G+sfDZXkBFkOHJ70hthSWp+bxSm\/Xtt9JX7VcODEbjg++7N9AhHYdLfBYKMIPO4Cs+v\/dqvjW542tf2C8+2EUkDxfKMWTC1LAoyaSFa\/r0\/P3rTeaxOLYs\/S4N2\/3+LQ\/\/lf4tjAscOvzFBRpDhhtuTyvGWTFWOp5F111ZMdGrvdQ2PpxJ2v4Gwb9G7ZmqgbiPICDIPfCj4Ix\/5yOipAO1rc1MBuiLTFp1oeL8UPIpBZvyITPkC0GRONffytzj0X+m3uJpWMt9OMdt5REaQEWS4zfakGmTGXA\/hLpj3uIbnrolaXzNjREbtF2TIXZz3jne8IyoupYsz2\/\/a12YvzhycBrCexzoYZMZevxAvrz+PWlF7CL\/F2n\/532Lw3S+nmOU7M6OvwxJkBBluvj0pHm\/xaOrqBhzt8Zp0fl0jc89reOaOZeEtmV0jo\/YLMqS3SxxzFqV9TfmWt7liEt4Z6qownQedxEqQKd5RKrpz1NXyzsL3hNMKTC17rL\/FdJ58+dqpkXfGy408umuZIMOR25PKiYPS3cmiaWdOZN3f7z83oyLTv3DXMrVfkKHT\/QNWteLTPndb\/wghfot+ixoztd8xjO8ftV+QoVh82rMj73znO5dF5lOf+tRS++f2sfY5RQe\/RQQZHMP4\/hFkBJk7OSzczldtL75rC02r\/XP72E3\/C+r4LfotovY7hvH9o\/YLMgAIMgAIMoIMAIIMAIKMIAOAIAOg9gsyfgQAggwAgowgA4AgA4AgI8gAIMgAIMhozAAEGQAEmfsdZAB4GNR+ALX\/0QQZAADg4RNkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAAAAEFGkAEAAAQZQQYAAHiYQQYAAGAfggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAAAgyAAAAIKMIAMAAAgyAAAAggwAAMD9CjLPnj0DAADuKUEGAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQEGQAAEGQEGQAAQJARZAAAAEFGkAEAAEFGkAEAAAQZQQYAABBkBBkAABBkBBkAAECQEWQAAABBRpABAABBRpABAAAEGUEGAAAQZAQZAABAkPHlAwCAICPIAAAAgowgAwAACDKCDAAACDKCDAAAIMgIMgAAgCAjyAAAgCAjyAAAAIKMIHP\/LJrZZNJMUqeL1fMX82Y6mTWLe7RNi9NJMz27vMb+mDbzi\/5zl2fTo+6X5fJP5s3lPu8\/yPqsfguz8yN9N+ezwvZdNvOTY31u+fu8l0Z9z5X9eaeP59V673\/s7r6d0TFd\/H0e6Lffrc91PuexfH8H+twb+37HHIsjPn9M29W+pl3edtsG2vBD151D\/gaXy+qv+z6\/ofK+O2b7ErYz7T65ic8SZAQZRnReg4NRkLkfQeZovwVB5v4RZPYKMscUBpkb2C5B5g4GmQO1XWGQWb12oA2\/sRMo+y43rc\/71ey7E2QeW3sjyAgydzLIBEUhKWDt4\/mzJslZoaBzEL4n6jREZ2PKRXLX98cFbVXEuvfH2xmu8\/ZsyurvSTFadkSCdVjvl3nbUGZeX95PuQ7O6v2z0zDIlNc7uz\/C72nZYE9X+6ZbXrj+UWMefM7prBBk1g3B2XZ\/b7Zp3RBNT4LvoPS9rjsS89P0uaSh2eX9F5l1ym1b+\/38q6Qj0753+ffK9lV\/p\/F3NNiBO898\/mZ5heMn3b\/J8Xi5+f2Fv8Gh7yvZp7nfRbTNIxvmcFnh72i53Ve\/rcKxtfk9r1+T3Y+V9ckea73jYbttm85tekwnr6std3Zaqin5dZ6dFkZkCtu1qmHz7W+icAIl+\/33Op1dJyv\/exx1PBXrR+37q9XeZ8Ntx3V\/N4Xvt19\/ajV7fSydzkaNdCx6v4vyiEz43XWfF7Vd6+8i3W+XZ7PVfrha3uq5MW14UqNLx2r6m1yub9JOpr+v3uuHfzP1IJPus3FtWfGYSduXHd5\/mWvfs8fs1Wecrpa1OL1fJ34FGUHmgQaZ4LGgaEUjBlGRTc6IhcUpKt7h2Yr4c5cNQK7Y7fH+sDFYPh42jGln7zw9c7fLiEzyOevPL++nfEcn3IfhNmTXu7Q\/0o5br\/DG290tO9rv6wJfCjJxUAk\/N3zP6nvJ7Zdu+f3vJvwuKr+LaP2SdSqe8Q6\/z\/i73Z7RrGxfZX3is\/mFzmJldGj7\/srxk+7f3vecnGQIllf+vnLbGf4uMg3\/0KhF0iGJjoHc97Ze3qqjEAfgUiDNrU\/u\/b2R5FKQqZyxry+38PvO1NXodb31KW\/X6vWZ3+AO3\/\/g9zf2eMrVqRHfX7n2VkZT0rbjWr+bzPdbW16lbYt\/y7uM2BeCTPSb3NaF0gnE67fhaQ0pHKtJjcquT+8ETOn1+TZnMMj0fgP9EJH7DovHTG+GSaUtTE\/Ghc\/tWxsRZASZ27lGpn9msz98Xx7KDYpbaTg\/7XiWCvce79+uV1rgx0yZ2yXIBK9LOiej9lO6bZu\/V9a7tD8qHZzelLVSR6o4BF\/ZpnQ\/ZM\/WhY1S7jtLtq\/0u8h03IojDYXvs5uWEYfiyvZV1mf3aUnh59SmOwTrPLR\/s7\/Poe8rc2Ki+ru45jTC3O8x6CAMHyvl9cm9Pxwx3TfI1JebO+4HpuJk16e+XeFva7Oeo77\/MKSHv\/l6DS0eT7k61au16TIqNWxs2L\/27yYXZHLLq9Xs9LlS+1CvnWntLq3vdlRgl+lJY9rwyvKKAWvENTKF15dry7hrZOLRk\/6ofOm3mD1mgu+gtl7x++snnVwDI8gIMvdgatmzQmezeEFhMlQ9SYtAWlx7r5\/Uz3Tt8P60Mc0W+FFn8He4RibpnIy58LJcVOsNU3Z\/DHXcestrXzu2s9F\/vHjmsLdfK6G2GGQKv4vM1J9dg8zmDNpmWtnA9g38ThdjphjlfkO1KV61aULR3zO\/tUJjWwwy2d9FbtrluDnq0bIKnaNxHchaZy3e\/vD12f27c5AZudw9T7T0z8YPTY8tfX7p+w+nTVZGCkceT706Nerk1kDnujIlsXS87\/O7qV0jky4vX7PTY6nUPizq03LP67+v+BhaTVkef63R2DZ8+FgtXqdZCDKl19dry9DUsvJvtPxbrBwzaZAprFf8\/lKQ2a82IsgIMncoyJTPII8p9rvdwWXfO8DEjWmhSB5kRKYcZEadsamOyIw5I1cYYap03OoBZeyITPD3akd7YERm8\/eRv4tDBJl1xy7uKFS2b\/TvdOR31q1nNCWhcvxU9m\/aqJc7evnva\/SI0ph9UDtzWvk9jj2zXlqffUZkwjOv+43IjAgyo0Zk6tvVu84w+fzy9x+MOJ5Vpr6MPZ72HpEZU8Mqv\/0D\/G52CTL5mj02yBxyRGaX\/bdHkNnhWL3WiMyY2rJjkNllRCY3Hay2XuODzI61EUFGkLkrQSY3lzY\/jWB11mNVBLKNa+bag2jOc7Egjnt\/8RqZaH5t5v0DIWJckKntp9q+r1wjE6x3cX\/UGpeksShezzN0jUw0h7x2YXH9GpnoepOBa2Si38VBgkw6l3pg+0b+zsZdIxOfRU+vK8odP+ODzPosYXiGeej7Kv4uCqNYo4NM5rqCUoc7cy1G\/1gpr8\/oa2SS7\/N618iMCDJJmMxfI1Peruj1Y65ZTLYrPCterO1jj6fKdQm1769ce8vtT\/Tbv\/bvZmyQqdXssUEmt73t6\/JBJvd57WvC72D81NXrBJla7SsE+KEakpmCWbyWbNcgM3iNTOaYKV4jU762thxk9qiNCDKCzN0JMrU7iMXTnRZB8a\/c2WnUnZF2f3\/trmXDd6PqXp9Zn24KxIgzs8U7rVWmVSzvMlW4a9ng9gydJYumbxTuvLW+o0\/xrGJw557sxedDd\/lK7xpUmtpV+l3sFWQy32dv\/1S2r\/o7jafPVPdJb9pF\/Hzx+KmOeCVTHNJRweCuZcV1K\/0uCo8Pje5t9tH5+BHCRXAXqeKUmuLvd8RdyzKf0ZsSu+NdyxZjzshGdwCbb4Nu7\/qhwtSyq99j\/a5zpe9\/5C1zdzmexty1rDDSOXRXv+Jv\/5C\/m8z3W15e5Y5X1ZGS3F3ayqPNud9Xru0ad13RLlPLKsdq8bvufmuZu5aVfhuVY3bvILPDXceK+7F2zI0ZkRmzXff03+ATZAQZeHz\/Lsk91J\/Wcfjte7i34Lxq4J2BvOP\/FtYN\/xs5AIKMIAOCzM1sR\/8M+qG37wF39jf\/dgV3OcjE02wABBlBBgAAEGQEGQAAQJARZAAAQJARZAAAAEFGkAEAAAQZQQYAAAQZQQYAABBkBBkAAECQEWQAAECQEWQAAABBRpABAAAEGUEGAAAEGUEGAAAQZAQZAABAkBFkAABAkBFkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAQZAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQAAAAEGQAAQJARZAAAAEEGAABAkAEAAAQZQQYAABBkAAAABBkAAABBBgAAEGQEGQAAQJABAAAQZAAAAEFGkAEAAAQZAAAAQQYAABBkBBkAAECQAQAAEGQAAABBRpABAAAEGQAAAEEGAAAQZG44yIxdLgAA8HAJMgAAgCAjyAAAAIKMIAMAAAgyAA\/f2Yeb8n+\/8n+arz3YZz1tLtaLvfixyuu+9\/80v7h81a82P\/i9t7FP3t\/84K80A\/\/d1roBIMgAMBxkDhpmBBkABBlBBuDQQebDT+PnfuzjB+6035cgE\/va9\/\/qEUanABBkBBmA4wSZXvAI\/v7hj2\/GJrahpD+SEQeWcHnbP7f\/\/eL73z8cZDaP59a3W177nnDZ3TJyj+0XZAaDX+Z10ahXJhBtPqMU9NJtNyIEIMgACDJjR2Ti8DH8XBpSyq+JXpcLMj\/28YFpb5Vl\/8qvJiGg\/e\/jzdm+IzKb9YuX0e3HbjvGXntUel1\/f5jeBiDIADD+GplNwAnCQjKqsF1G0LmvBaFsR3793l6Q2Y705EZ\/0tGizfqG4af32PgQ0J9alluf7vO327\/drlwgWz+WC0XpY8lIT\/j50UgWAIIMgCCT6yiXrnEpPZ52uAuvS4NL8e+1dcwtu\/bYdYJM8FgakIJRrfxIV7xP0ill2RGXdPtdqwMgyABQu0Zm7MX65XAQT7cqvS55fMcgs1rv3LLHPrbHxf7RqEluhKY\/1Sz3eD3IbJdXel31pgkACDIAgsxdGJGphY8bDjJheHl\/\/ZqZUSMyu4yyhFPmjM4ACDIAgsy+QeZA18j0LqbvXyOTu14nvkbmpoJMf5SkNPIy7hqZYJ9uXrPal9nPT17jdwwgyAAIMnsEmdr0r5u9a9nNBZmhWzpXb6KQu5Zmn\/02+J0BIMgACDID\/6Dlkf8dmTTMRMHiNoJMZjSpsF+jsJLZz2mY6d+NrB9m3LEMQJABgD3Ub4M8PiACIMgIMgAcXTo6kr9ORZABEGQEGQDu5EhMbYqaIAMgyAgyAACAIAMAAAgyggwAACDIHGoFAAAABBkAAECQEWQAAABBBgAAQJABAAAEGUEGAAAQZAAAAAQZAABAkBFkAAAAQQYAAECQAQAAEGQAAABB5qaCzLNnz4AHQPEFtPmgzRdkAEUNEGQAQUaQAQQZQJABBBlFDRBkAG0+aPMFGUBRAwQZQJARZB6xRTObTJpJxuz8+stfnB5uWdv1nTWL9d8vz6bL5U\/PLn2XihogyHBNXbu6W7t92cxPps384nbX\/fB9DgQZRe3eBpm7FxC6dd0GGRQ1QJDhNoNMG2LatlmQQZBR1O5KODifrcNMWJiS0HO62L7+Yt5M28dOZs3sZBuCoqKyXmYUjrrP6Za1+dxOt179wNUuMxqRGbP82jbkPv9k3lz6nQgygCDzSIPMph0\/W7fzUdvchZj+CdBuOf2+RLzc1XPrtnnT5m77JrPTsL3O9wWKQUabLsgIMo80yPQKQn7kZhMaLsICty1a2WUEhSR6vreM4eIVTy0bWP7O21AIOwgygCDzyIJMvm3MB5k4xKTh51n\/+ZPp+mRoGmTCNr\/\/Welyx\/cpfM+CjCDz4INMfbSjKyjr920KRnzWJT07svp795qBqWKbUZ7+GZrSNTLV5Y\/dBkVOkAEEGUEmDjLpzIlN25xOLUva1l77uw0p3Wdsgk0myJSnifWntGWDjDZdkBFkBJn82ZWggPRCR32YtzgVLHcmZocgU1v+4DZUhsgRZABB5lFPLTtP2uhikKlce9uGimx\/oTy1bFG5FiadthavqzZdkBFkTC1LpnAV7242NsgExWp+mozgpMvYY0SmtvzBbRgMUggygCAjyOwdZNr37B1kSiM\/pSCjTRdkBJnHG2Q2U8VK07KGpoGVi0p0JiV4fWl0ZbcgU17+4Dbc4TuxKGqAIMP9CDKZqWWFWRfDU8uCZRRPbg4FGW26ICPIuP1y6XXF0ZNKUQkuwAtDRXHEpHDxXzjlLQonheUPbkPvjmnO3ggygCAjyIwLMtvpY6X2vBdcBi\/2zwSZ4vTwZ9k7pWrTBRlBxj+IWXht7UxJ7exI6axIXAzb9ywq08OKQaZ61qWyDdXbPyPIAIKMIJO7Q2jUdq4vrk\/DSjobYjt7om1nx10jEy2z\/ZxkpsXg7Ze16YKMIAMIMoAgw362Jy17\/\/yB0RJtviADCDKAIMNdVfq3adxVTJsvyACCDCDIcC9GZfxDldp8QQZQ1ABBBhBkBBlAkAEEGUCQAQAAMCIDODsDGJEBjMgIMoAgAwgygCCjqAGCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ0QZABtviADCDKAIAMIMoIMIMgA2nxAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNVDUALT5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw\/afEFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQMEGUCbL8gAggwgyACCjCADCDKANh8QZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDRQ1AG0+aPMFGUCQAQQZQJARZABBBhBkAEFGUQMEGUCbD9p8QQZQ1ABBBhBkBJlb8eTJk704OFDUAEFG2w+CjCBzq8Xs6dOnO1HMUNQAQUbbD4KMIHPrxWzX\/2rFbHE6aSYn8+YyfPxi3kwns2bR\/vl81n8+4\/JsOup1z0qfs4d23adnl6u\/j1xPFDVAkHnsbf+yzZxMm\/lF+PhlMz+ZNLPzSvs8st2O2udj0\/5r8wWZR1rM2oJ0MmtmJ0kxu6kgc003WigRZABB5kEEmTawTJvZ6TRpQ0cEmbvYPgsy2nxB5nEWszZ8tIVmGUJOF7sHmeUZncnyrE5bELevWxXD1XProrhZ7tVnLp+7Wv7mc4LimSmCy\/WbTDaf1Yau8LHl67r1TNc3KsaF9epGprrPCPcFggwgyDy4k5hX7WQvrOw4IrNsb9uToQPtc9RfSGeBLJrZpu29WlY3SpT2F9JlhG142O5Hr9k\/iCHICDJ3vpitzsisRmLaQhIc8GOCzPI1XSFZB4T165ahoAsD4fB19J74c+IwtdgWs+X7t+sWLjs\/tSx4b7Lc4npF2xjuFwQZQJB5mCcxu3Zxe1JvjyCT9gNy7fM6lKza1f7ruj+vAlCtv5C07WF4KbT\/Zm1o8wWZh1rMujMyQUDIBYxikEkfjwpJrTAGIaFXEIdHgdJg0g8yq89bPR6O9FTWy7C0IAMIMo\/uJOa6\/ducRNwnyGxfU2qfe1PPC8EjOomZ9hdqfZDi8tDmCzIPtpjF07WSKVUjgky9ME16y14WtLQwRn\/fFqB4bm08HSxcz9LF\/pti2lt+Yb2eFYbCEWQAQeahncTstYXx9OvdppZt+wHVIJP7zF5YSYNM\/PnRFPBwilq4HuH2OUGpzRdkHmoxS0cnKgVkrxGZwhmRapDpCt8iOluUBqbhEZlgudGZprFnavrX6yDIAILMQwgy0RTr3jWpRwwy2WtPh0Zkgs9PRn\/yIzLlGRxo8wWZh1TM0oIQdOB7IyfFaVdhGKpcIxPOcx0IMpuL9NLCuPn7elRlKMgEozi9C\/oz6xUXO9fICDKAIPNYTmKG7exxgkw6TSz8Zx\/q18iUgkzc59isR\/Ie18ho8wWZB1rMcmdktkUkvJvY2LuWXRW+s\/Cam3g6WFzMKkFmXWTjwhNOCVuPsoRTyNK7lqXbkglr\/SlkpccRZABB5iGfxAxP7B0uyETtc\/VuYts2fnrVjyhPLQvb6avXnOfXI5rGZmqZNl+QeQT\/KBYIMoAgo+2\/baWghTZfkFHMHBwoaoAgo+2\/O9Kb+ZjWjSDzKILMPhwcKGqAIKPtB0FGkAEEGUCQAQQZRQ0QZABtPmjzBRk\/BlDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ1Amw\/afEEGEGQAQQYQZAQZQJABBBlAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNUAnDdDmgzZfkAEUNUCQAQQZQQYQZABBBhBkFDVAkAG0+aDNF2QARQ0QZABBRpABBBlAkAEEGUUNEGQAbT4gyChqoKgBggygzRdkAEEGEGQAQUaQAQQZQJsPCDKKGihqgCADaPMFGUCQAQQZQJARZABBBtDmA4KMogaKGoA2H7T5ggwgyACCDCDICDKAIAMIMoAgo6iBogagzQdtviADKGqAIAMIMoIMIMgAggwgyChqgCADaPNBmy\/IAIoaIMgAgowgAwgygCADCDKKGiDIANp80OYLMooaKGqAIANo8wUZ4MEVNfsWHM+AICPIADo+gOMZEGQUNUDHBxzPjmdQIwQZQFFTI8DxDAgyggyg4wM4ngFBRlEDdHzupot5M51MmknOyby5POZnn8+WnzM9uzz+9h17W3A8A4KMogaKmhpxR4JM63Rxv4MMjmdAkBFkAB2fBxxkeiMWi2a2DDOzZrF+7PJsWhyx6Z6bns3X72tNm\/lFbpnr5WaDzGUzPwnD1Pbzt89dLfdstnnN6v3h+4L3RNuXLrv\/+ngb0\/XH8QwIMooaoONzv4LM+Sw7YtOFkF7I6YWdUogIg0zpNV2gKD8\/PSmMJO0QZPLbEAYpHM+AIKOoATo+92JqWXHaVxds1oFhEwK64LJZbhqEtsFgcZp8RveazEjP6nO2QaR7T7eMzXvSZQwGtXREJwgupr45ngFBRlEDdHzuW5ApTKtKX58Emf7oSjzaEYWCJCh0oWR2ngkc0YjKdt16y02DSzbIBFPcNtcAhdPebvA6Icez4xnUCEEGUNTUiANMLQuCSi50bDr1hRGZ6wSZ7jXHDTLB9LJSuLnpu7c5nh3PoEYIMoCipkYc4BqZzTSwbWBIR0viKV\/DQaY\/taw\/TWz81LL9g8xmKlrv2pfM1DIcz4Ago6gBOj7362L\/9NqTbQDIT7saDDIHvdh\/3yBTGnVZLa90w4J4hAjHMyDIKGqAjs89uGtZFxIWyW2Vh6aO5UY4kmWcXeP2y0cIMrm7r7nQ3\/EMCDKKGqDjA45nxzOoEYKMHwMoamoEOJ4BNUKQAXR8AMczIMgIMoCODzieHc+AIKOogaKmRoDjGVAjBBngoRc14GFQK0GbL8gAzuACjmdAkBFkAB0fwPEMCDKKGihqagQ4nh3PoEYIMvfPkydP9uLgQFHT8QHHs\/YeBBlB5lYL29OnT3eisKGoCTLgeNbegyAjyNx6YRvz3\/n5eXN5ebn8c7+wLZrZZNJMErPzfdbpspmf7PveKxfzZjqZNYv0z7fhfLbeF9NmfjG8vyYn8+by0Otwl\/aHjg\/geL7z7X34Xy7ILE4nzfTscvDzxr7uYO3todpQbbcaIcg8rMLWhpjnnnuueeUrX7kMM6UgE4WP5YF3jUByiIP\/ll2eTQtFPLO\/HsH+0PEBHM+CzF0PMtpuNUKQeUCFrQsxrfl8Xh2RSQ\/uthhEhWVzliM8g7EagZmeTNejONsRmbQILpd3uugva\/PZ4dmSqwKwKQT9UZ5o2dn1Sj+jUlAy71+ua\/dYt86jimG6ru1r12eF1tszOy2Meq3D43Y9SvvjWXW7l\/vmdJYsa\/tcebt0fADH86MKMssAcdUunUyiUYywDRxsa8O26qrtidu8q1BxErTB2bY\/CTKPsu1ef\/7pLLv+D6HtFmQUtZ0LWy7E7BJk+kOj3TDt6oBbHUzhn5NiEJ1hCR6PlpUEpsJwbBSCegUmt17Ba2pnaKKRp3hb4s88VDHcNgrLwrTZP\/H6bhqa0vB0Zb1XBS\/zut73kQ676\/gAjudHF2QqbcnmdcW2dt3mhO1m0uZt2sNa279pnx5r273+cxTm1st9IG23IKOoVQtbG1Re+9rXDoaYfYNMdnRm+ff1iMym0BQCS22YNTxISwf\/8qAO\/hyefcmuV1xcRg9nB58zVAzjebbdtg0Vw2Cd0jNQuWH12v4orHfYqJSDpaImyIDjWZCZRaMeYbsXvm58W1tp82rt76Nvu9O+VPD5D6TtFmQUtWJha697aa9\/aUNLG2ZqIWanIJMWhmwBSA\/+8O\/bP6eFJRomDYdXixfIbQ\/qXnEtFabecG9+Lm30XHEU6HDD04tMIe6tx0AxrK13PKUvXp\/sdAFFTZABx\/Mjnlq2bUuqQSbX1vbCSqXNq7X9vROaj63trnz+A2m7BRlFrVrYwjBTCzH7XiNTLgy1ILN9X1u8ormwhaJQu9PHqqguomHV8npltiX3umuc1RlVDGujUkcckSkFmYPdXU7HB3A8P64gU2wPRwaZWttfaAMfT9tdDzIPoe0WZBS1wcLWjsS89KUvXYaYV7\/61TsUthF3LUvOumzniNaDzPbMSqmYJfNCa7cs7C6Q653NyKxX8t6bnmdbni9cC3DJdrTL2PMamVyQibfHNTKCDDieBZlxQabcBxi6RmZk29+tx6Ntu8tB5qG03YKMojaqsLVhphZirvXvyGTvJDIQZHo3Awge6+6Qcp5OISvc6WP9XK+oFe5wEg2F1+aXFu7Esl8xjIfFp2fzUcPT5fWo7I\/aXcuyIzLhfje1TJABx7MgUw4yXRuavWtZpm0ebPNqbX86XevRtd21EZmH0XYLMoraUQsb6PjYt+B41t5fSzp9DAQZRU2QAR0fcDwLMnevvY9HCyaTxzXtCUFGkDlAYduHgwNFTZABx7P2HgQZQQbQ8QEcz4Ago6gBOj7geHY8gxohyPgxgKKmRoDjGVAjBBlAxwdwPAOCjCAD6PiA49nxDAgyihooane1Rrj7EAgygCCjqIGidi+DzNOnT3ciyOB41uaDGiHIAIrarQeZw\/3Ddut\/kO50ET\/e\/gvbJ\/Pmcv387HxovRbNbDLmdc8Kn7PPvmg\/s\/sH9Mau520r7aeR638xb6Y39S+f3+RnCTKAICPIAILMTkGmDRKns6vOddJhvakgc+1QcN\/+JfBr7idBRpABBBlFDRQ1QeZZszhddarb\/0\/PLncMMuvRnMlkHYaC1y07wevnws7wcrnT1XPt8rvPSUdmok70qvM\/6SxHj4LPXoaZ7Xqm23J5Nt2OOJXWK1pesi\/SgBesy2Z7l+t\/tQ+idRqxn3IjMuttn52mnxPuh\/W6F7dnvd3rdZmdbvfBcv+cTIPtjLd98z1E38HI\/eN4BgQZQQbQ8Tl+kFlsR2LaTmsYJEYEmbZDvOn0rjv4YYe7e0\/\/dUEnf\/M58ejKNnysPn\/TcV52rrvXFaaWRaEoXP\/yekVhJ9wvvRGKZB2z2x9P1yvvp1qQ2W5z9P5MwMvu595+KqxP9\/do2+NAtRi7fxzPgCAjyAA6PjcSZJbTyhZBRzoXMEpBJn08CRJhRzfsfKfPJZ8TjhDkR4HC8FIIMmEnvvbZxY76Htf3JMtOg1h2P1WDTO672H97wr\/HwWV4ZGjv\/eN4BgQZQQbQ8TlGkFkEU5d6U4YGg0x6rUcaZNJlrzvm6RSy4O+bznJ6bUZveQNBJvhz1AGvrVeyP0rXsPT2WRhkgu3afm5lP40IEMNBJr89aVhJg0w0NSyanhZsf7IeY\/aP4xkQZAQZQMfnuEEmPeuf6yRfZ0SmdCeySpDZfH40UpQGgREjMkHHvbsGaLc7pBVuIlAcTaoFmX1HZEYGmcL2DI3IbINMMnWvth538CYL2nxAkFHUQFF7ZEEmur4jN8oy4hqZ8jUicfhYXXRe6HxnrmeZ9IJLuqzhILMdZQg74uX1ijv3hWtAoiCzXtfBIFPbT9cMMrX9PHCNTDHIhOsXfNao\/eN4BgQZQQbQ8Tl2kInPwmcu4N\/1rmVXr52flu5aVrjeoxQAinffatd50ZtClt61LFq39LqO0nold0Yb3N72vefl0ZF4RKSyn3YNMpv1zN21LB4l2e63WTOvTS0Lp6itR7GWz1fuHGdqGSDICDKAjs8t3rWMx+GyGFwdz9p80OYLMoCOjyDD3ZHeCOAO3nHM8QwIMoIM8AiDzD58\/zietfmgRggygKKmRoDjGRBkBBlAxwdwPAOCjKIG6PiA49nxDGqEIOPHAIqaGgGOZ0CNEGQAHR\/A8QwIMoIMoOMDjmfHMyDIKGqgqKkR4HgG1AhBBtDxARzPgCAjyAA6PuB4djwDgoyiBoqaGgGOZ8czqBGCDKDjAzieAUFGkAF0fADHMyDIKGqgqKkR4Hh2PIMaIcgAOj6A4xkQZASZG\/DkyZO9ODhQ1HR8wPGsvQdBRpC51cL29OnTnShsKGqCDDietfcgyAgyt17Ydv2vX9gWzWwyaSap08W93z+XZ9NmcjJvLtPnLubNdDJt5hf99yxOJ8307PL467dch1mzSP+8y7ZlvrfZ+Yj3n8\/y+0XHB3A8P+D2ftXG7d\/eXzbzk\/V7vvI1I9qt1etX7VLb18i3uzVj2+Qba7vveRuqRggyDzbIxB3gsPg8riBzK\/YNMum2tcV1zHIEGUEGHM+PN8hEwWUdTkaFmba\/sFtbFb9XkEGQUdRuJMgkRWHZ0e7O3nRFLC5Kccc6DELBGZzwc9ZhYnoyKXS+k5GirsiuO\/2z08IoxLIz3z4+vXrNNUZkRn\/OJPmMeHs3z6Xbuwkv4XbOmr+bFON2v+aKcz6kBd9JGo7CwpsU4fAMXfhZ0Zm7OzJCp0aAToogc8ggk2kTi23+ZNO+zt8atDHLNuWqvTwJnr8I+wJhuxg\/NzSbIOqLFD4nnKEQvTbbRgfbcTpL2sykTxIuI1zHtD3t7SsEGUXtloNM+Njqz11xWBbB9QHc\/rl73+K0LQBhwVv9OSqaywM+LBql4rUqcHGQit+XW594mesiea0gU\/ucpBivtzFuJIL9mG5vaWpZFDLaZefXc3BEZmSQiZYTruPI9dDxARzP9zzI9KaAhW172I4WTpatO\/NR27v8jPLUsmLfYCjIZD8nd\/J1uI1eBaBCnyTpJ0Rt5aZ97J\/QvbFRITVCkFHY6tfIxAUh6BAHB\/fywO6K1em8WVz9fdMJXj6ehqSgqO00vWvRO2uyeV9lpKE4\/Ds6yOQ\/pxciisPMle0tXiMTDN23jxeGr\/PXyBSWX9xPSWAMt\/+ODp2rEaCTIsgcMcikU5R77VMpyGzfE\/UNskGm0jcYDDK5z4lfV26j0+ltlb5FbTpZcXkIMoranZlaVr7uIjnw24O5\/X9bTK5e2xaS7VmJSkgaui4kGdKdjJgyNTpg7DC1rPg5ve0KQ0nmAvxsIMyPnnQjXbWzO+m29hqnHYJM6cLP7HC9jg\/geH5gQSboB\/Ta3vAkWSXIBO3R2CBTPIFanVqW+5xMkMm10b22vzIdO3djhNxJ07DNd92MIKOo3cEgUxmRWRWpq+fWAWb53Ok8mIZUOVtRDTLpOu137cdRg0z2mpF0hCMdkRkXZFYjWvPqdK7+1LJ4CmC6zPyw+NibOtydmz+oEaCTIsgc8RqZ6mj8IYPMuJGMvYNMto0eGpFJ2uGxfY3M+iDIKGp3JchUrpHZXhsTzFld\/r0wUhDOQd0hyPTnsRaKS\/S+Q1wjU\/ic5P3bfZIEmXA+7y5BpjtbVTm7M+4amcK+KI5ibb\/ruCC7RgZwPD+Ou5bl2t8RU8t2CjKVvsEBgky5jR66RqYUZAptaOaEoWtkBBlF7c4FmdIdTPJnLfq3QIynLxWvvalcAzI9W5RHNnKjMN2UrrPCNSaZ6V9dMRsVZGp3KgkfvyqWxeX15h1PBvbjmLuWxQ3Sdh9ebdvZuLuWxeFlYmoZ4Hh+aEFm6N+RidrIESMYo4JM16bk71pWamPGBpmuvcvetSx3onD52nllallyp7Xz\/PZG09hMLRNkFLXbKWzcNS4g1PEBx7PjWXt\/VGP\/7TUEGUFGYWOk5LbP6PiA49nxrL0\/hPQGN04YCjKCzK0Xtn04OFDUgIdKe6+9R5svyACCDCDIAIKMIAMIMoAgAwgyihooagDafNDmCzKAIAMIMoAgI8gAggwgyACCjKIGippOGqDNB22+IAMoaoAgAwgyggwgyACCDCDIKGqAIANo80GbL8gAihogyACCjCADCDKAIAMIMooaIMgA2nxAkFHUQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNQBtPmjzBRlAkAEEGUCQEWQAQQYQZABBRlEDRQ1Amw\/afEEGUNQAQQYQZAQZQJABBBlAkFHUAEEG0OaDNl+QARQ1QJABBBlBBhBkAEEGEGQUNUCQAbT5oM0XZPwYQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyBzGkydP9uLgQFEDBBntPQgygsytFranT5\/uRGFDUQMEGe09CDKCzK0Xtl3\/Kxa281kzmUw2pmeX8XMn8+Zyl\/W7mDfTyaxZ7PyeSbQeS6eL43weihogyDyy9n5xGrexs\/Njtunr95T+vM\/70eYLMgpbP8RMm\/lF99hlMz8Jwsw+QWYfy0IVrkdr0czGFFpFTlEDEGSq7f0yxITt+foE4lHa2NJ79gkyaPMFGYUtX9iS0JIrIOsgM9+cxQkLyypo9EZPeu+fNbOT7nVpWKkFmVXhXa3fal23Bbf97PXr04IXjjDdRAhDkAEEmXvY3i\/DzbLtHm5j52fTTDu+el88oyPsG1y1zZs2uvR4OgNkxOt6bfx6\/U9nu83oQJARZO5xYSuEh9y0s1VxWxesoOhtimK4rDTIZN+\/64jMyCATLafyeShqgCDziEZkLrsgkm0Th9rY7fuWy1kHiOWfN8tr3zMwnaw2ZSycAVJ9T7lPsnl\/b7YJ2nxB5oEGmYGh22Ux2L4mLlpp6CgFmRHvL1wjsz17NC7IhAX2RqfGIcgAgsxdvya2NJNisI0NQ8H2uXqbfoQgk7bpmz5GOuIUrL\/2U5svyDzyEZmgaERFK7lJwKQUZErvr61LEoB2CjK9QGSeraIGCDKCTHm62Q7Tt5OQEN5AYPP+IwWZ3snKzXOV9dd+avMFmUd2jUw4PFwMIumF+JURmX2CTO\/CxKRIFaaylUeMUNQAQeaxtvdBu55ON8tdI9NrY4P2uXgStDblezjIRCFlzxEZQUabL8i4a1l8XcnIILMaCTlskMldIxPN0R28RiZzlxYUNUCQeax3LYva31UbG47IlNvY7UnPMHBsb8iz7zUySRt\/zWtkBBltviDj35GJC10liITTuKZni20ROViQ6T4jLmCrz5uPu2uZaWWKGiDIaO+z\/45MNCNjoI3d3rWsfPfSOEjk7joWPB71I64+6yzsL5TeP3DXMkFGmy\/IPPY5syDIAIKM9h4EGUFGYQNBBhBktPcgyChq28K2DwcHihogyGjvQZARZABBBhBkAEFGUQMEGUCbD9p8QcaPARQ1QJABtPmCDCDIAIIMIMgIMoAgA2jzAUFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQPQ5oM2X5ABBBlAkAEEGUEGEGQAQQYQZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDdBJA7T5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw8IMooaKGqAIANo8wUZQJABBBlAkBFkAEEG0OYDgoyiBooaIMgA2nxBBhBkAEEGEGQEGUCQAbT5gCCjqIGiBqDNB22+IAMIMoAgAwgyggwgyACCDCDIKGqgqAFo80GbL8gAihogyACCjCADCDKAIAMIMopazZMnT\/bi4EBRAwQZ7T0IMoLMrRa2p0+f7kRhQ1EDBBntPQgygsytF7Zd\/+sXtkUzm0yaSep0ce31uzybNpOTeXO51\/vb9Zo284vMcxfzZrrvOi\/fO2sWCoSiBggyj6q9f9YsTifN9Oxy8PPGvu4gwnb5oG30ZTM\/mTSz8\/2X0e6HXl9jr\/Wr9GkQZASZ6weZ+EC\/\/sF\/\/CCTPpfbDkFGUQMEGe39vQkyB3WgIJOcJF32bXY+2SvICDKK2g0GmaCIrUPD9CQ4CxGNiCTF53y2fnzazE67IJMWk\/SADkeF2uWtXt8tp3fgZ4NMWHgrn5cWzM36Tq4RuhBkAEHmngWZtv07mTWzpL1ddtTX7WL02mxbGbTfp7OkrU36DuEyNv2OpP0f1Uav2\/jT2cCMjPXrzrZ9lm570qDWbnMuuOWCzGq\/deuSzGrpXhtt\/19uXpP2aaJ94eSqICPIHDjIBI+tQ0scCuJisDmgo9euw8hgkImf257puM6IzMggEy1nvb4HmFKHIAMIMvciyKRt9roNjF5XaSvDjv4qAIVtbdAOJ+12NGOjNLUs16dYflbYv+i2I9df6E6KZtr8KIy0r8v3N3JBZvvYavnZ\/ZTtO3WfEfdvSiEKQUaQucY1MvkClhnRKBaG8O87jJBc4xqZbSEY93m9qW\/p+iPIAILMgw4y2\/Y3nDIVvq7cVuZmV8QjMsWpVGF7WwoyuT5FMGtj2+aX+gvp68Ltat8TfGah7c9eI1PsJ9S2vxxkEGQEmSNMLSvOXU0KX3hAlotdJVj0lrfHNTK9ZewQZA5yER+CDCDI3MepZds2uxpkcm1lrbOeOUnZCwUDQabXp9g8NzRdvXyNTLhd7Z\/b52ojItmpZdnp9MnUsd72J+sYnpB1AlWQEWRuMMgcYkSmN\/x6zSCTTnEb+Xn7XbCHIAMIMo8syGTbyqERmcpJ0AOMyIwNMulsjWj7T+fFaWXDQSbtP9WCXLlPoy8iyAgyNxlkatfIZK5TCYNMdh5t8vnbMzDXv0amPG83d41Mui0IMoAgI8jU2sr6NTKlIJNc47LnNTJjg0z8OZkbDVXa\/V2CTHX7KyHHNTKCjCBzo0Fm7F3L1ncKSW4EsLqWZV4eYk0L3Q53LVsVkf6d1aLPq90RxbQyQQYQZASZzXSy7F3LMic3B9va9G6k5+Hz3TJ2vGvZ2KllwV3Lindo3SvIpHd4W2zXq7j9\/TvDOYEqyAgy1yxsoKgBgoz2\/lqK17zeVS66F2QEGYUNBBlAkHmE7X04ylKYQXFXrWdtmNIlyAgyt1zY9uHgQFEDBBntPQgyggwgyACCDCDIKGqAIANo80GbL8j4MYCiBggygDZfkAEEGUCQAQQZQQYQZABtPiDIKGqgqAGCDKDNF2QAQQYQZABBRpABBBlAmw8IMooaKGoA2nzQ5gsygCADCDKAICPIAIIMIMgAggwAAIAgAwAACDKCDAAAIMgAAAAIMgAAgCAjyAAAAIIMAACAIAMAAAgyggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwh4MMAADAnSDIAAAAggwAAIAgAwAAIMgAAACCDAAAgCADAAAgyAAAAA\/L\/wdCDxQclZwmpwAAAABJRU5ErkJggg==","width":424}
%---
%[control:button:3461]
%   data: {"label":"Run Calculus Flashcards App","run":"Section"}
%---
%[text:image:2596]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
