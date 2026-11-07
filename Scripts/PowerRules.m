%[text] %[text:anchor:T_3C84D55C] # Derivative Rules for Powers
%[text] [⇦ Main Menu](file:../MainMenu.m)
%[text] The basic limit definition of the derivative can be slow and awkward to apply. For most standard functions, it is easier to prove a few rules for simple functions and then compute complicated derivatives by breaking the functions down into simple pieces that fit the known rules.
%[text:tableOfContents]{"heading":"Table of Contents"}
%[text] %[text:anchor:H_51183E7B] **Before you get started:**
%[text] %[text:anchor:H_BF646A47] This live script is intended to be used with the code hidden. On the **View** tab of the MATLAB toolstrip, in the **View** section, select **Hide Code**.  Alternately, select **Hide Code** using the icon ![live script code hidden icon](text:image:1405) at the top right of the Live Editor pane.
%[text] ![Bright idea symbol](text:image:6138) Although the code is hidden, some interactivity requires familiarity with MATLAB syntax. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2 hour online tutorial that teaches the essentials of MATLAB.
%[text] ![Bright idea symbol](text:image:0c98) This script builds on the limit definition of the derivative, as discussed in [Definition.m](file:./Definition.m).
%[text] %[text:anchor:H_5C3B2A3B] ## Power Rule
%[text] One simple function type is the power functions: $y = x^n${"altText":"y = x^n"}. The following section calculates the derivative of positive integer powers using the difference quotient. 
%[text] Recall that a linear function is presented in the standard form $y = mx+b${"altText":"y = mx+b"} where $m${"altText":"m"} is the slope and $b${"altText":"b"} is the $y${"altText":"y"}-intercept. Since slopes are derivatives, this means that the derivative of $y=mx+b${"altText":"y=mx+b"} must be $m${"altText":"m"}. Observe:
%[text]{"align":"center"} $\\frac{dy}{dx} = \\lim\_{h\\to 0} \\frac{(m(x+h)+b)-(mx+b)}{h} = \\lim\_{h\\to 0}\\frac{(mx+mh+b)-(mx+b)}{h} = \\lim\_{h\\to 0} \\frac{mh}{h} = \\lim\_{h\\to 0} m = m${"altText":"(dy)\/(dx) = limit as h -\> 0 of ((m(x+h)+b)-(mx+b))\/(h) = limit as h -\> 0 of ((mx+mh+b)-(mx+b))\/(h) = limit as h -\> 0 of (mh)\/(h) = limit as h -\> 0 of m = m"}.
%[text] This result remains true in the special case of a constant function with $m=0${"altText":"m=0"} which is described by $y=b${"altText":"y=b"}. The power of calculus is in its ability to describe the slope of curves as well as straight lines. 
%[text] %[text:anchor:H_54A553FA] ### Example: Derivative of a quadratic
%[text] Let $y(x) = x^2${"altText":"y(x) = x^2"}. Applying the [limit definition of the derivative](file:./Definition.m:H_8E01DCBA), we calculate that
%[text]{"align":"center"} $\\frac{dy}{dx} = \\lim\_{h \\to 0} \\frac{y(x+h)-y(x)}{h}${"altText":"(dy)\/(dx) = limit as h -\> 0 of (y(x+h)-y(x))\/(h)"} 
%[text]{"align":"center"} $\\frac{dy}{dx} = \\lim\_{h\\to 0} \\frac{(x+h)^2-x^2}{h}${"altText":"(dy)\/(dx) = limit as h -\> 0 of ((x+h)^2-x^2)\/(h)"} 
%[text]{"align":"center"} $\\frac{dy}{dx} = \\lim\_{h\\to 0} \\frac{(x^2+2xh+h^2)-x^2}{h}${"altText":"(dy)\/(dx) = limit as h -\> 0 of ((x^2+2xh+h^2)-x^2)\/(h)"}
%[text]{"align":"center"} $\\frac{dy}{dx} = \\lim\_{h\\to 0} \\frac{2xh+h^2}{h}${"altText":"(dy)\/(dx) = limit as h -\> 0 of (2xh+h^2)\/(h)"} 
%[text]{"align":"center"} $\\frac{dy}{dx} = \\lim\_{h\\to 0} 2x+h${"altText":"(dy)\/(dx) = limit as h -\> 0 of 2x+h"} 
%[text]{"align":"center"} $\\frac{dy}{dx} = 2x${"altText":"(dy)\/(dx) = 2x"} 
%[text] One way to check the derivative is to use it to graph the tangent line to the function at various points. Recall that the tangent line is the straight line through a given point on the graph, say $(a,f(a)) = (a, a^2)${"altText":"(a,f(a)) = (a, a^2)"} with the same slope, that is derivative, as the function itself at that point which is $f'(a) = 2a${"altText":"f'(a) = 2a"}. Given the derivative calculated above, there is a tangent line through $x=a${"altText":"x=a"} described by:
%[text]{"align":"center"} $y = f(a) + f'(a)(x-a)${"altText":"y = f(a) + f'(a)(x-a)"} 
%[text]{"align":"center"} $y = a^2+2a(x-a)${"altText":"y = a^2+2a(x-a)"}   or, simplified    $y=2ax-a^2${"altText":"y=2ax-a^2"}
%[text] Graphing the function and the tangent line to the function allows a quick visual check on the accuracy of the calculation of the derivative.               
syms x         % Create a symbolic variable
a =3;       % Request user input to select a point %[control:slider:089e]{"position":[4,5]}
if ~exist("drpHandle","var") || ~isvalid(drpHandle)
    % this code only runs the first time this section is run
    f(x) = x^2;    % Define f(x) as a symbolic function
    figure         % Initialize a figure
    fplot(f)     % Symbolically plot y=x^2
    ylim([-1 25])  % Extend the window of the plot to better see the apex of the graph
    title("$y=x^2$ and the tangent line $y=2ax-a^2$ at $x=a$","Interpreter","latex")
    xlabel("x")    % Label the x axis
    ylabel("y(x)") % Label the y axis
    hold on
    ya = double(f(a));                    % Compute f(a) as a number
    drpS1 = scatter(a,ya,"filled",SeriesIndex=2);   % Add a point at (a,f(a))
    [~,linApprox] = GetLinApprox(f,x,a);  % The function GetLinApprox is defined in Local Helper Functions
    drpHandle = plot([a-2,a+2],linApprox([a-2,a+2]),"LineWidth",2,SeriesIndex=3); % New Color
    hold off
end
drpS1.XData = a;                      % Reset the x coordinate of the point %[output:0e030be6]
drpS1.YData = f(a);                   % Reset the y coordinate of the point %[output:0e030be6]
drpHandle.XData = [a-2,a+2];          % Reset the x data for the linear approximation %[output:0e030be6]
[m,tanApprox] = GetLinApprox(f,x,a);  % The function GetLinApprox is defined in Local Helper Functions
drpHandle.YData = tanApprox([a-2,a+2]); % Reset the y data for the linear approximation %[output:0e030be6]
legend(["$f(x)$" "$(a,f(a))$ = (" + a + "," + double(f(a)) + ")" ... %[output:group:79340ffd] %[output:0e030be6]
    "tangent line with slope "+m],"Location","north","Interpreter","latex") %[output:group:79340ffd] %[output:0e030be6]
  %[control:button:7b32]{"position":[1,2]}
%%
%[text] ![](text:image:969c) **Try.** Move the slider to different values and observe how the slope of the tangent line varies at different points. Does it match the algebraically computed value?
%[text] ![](text:image:4b3a) **Exercise 1**. Using the limit definition of the derivative, calculate the derivative $\\frac{dy}{dx${"altText":"(dy)\/(dx)"} for $y(x) = x^3${"altText":"y(x) = x^3"}.
%[text] ![](text:image:29e8) **Pro-tip**. MATLAB syntax is 7`*x^2` for $7x^2${"altText":"7x^2"} or `exp(-2*x)` for $e^{-2x}${"altText":"e^(-2x)"}. For more detail, check out the Help Center documentation for [mathematical functions](https://www.mathworks.com/help/matlab/referencelist.html?type=function&listtype=cat&category=mathematics) or the [Basic Functions Reference](https://www.mathworks.com/campaigns/offers/matlab-basic-functions-reference-cheat-sheet.html).
syms x
MyAnswer = 1* x^3; %[control:editfield:9e53]{"position":[12,18]}
  %[control:button:67b1]{"position":[1,2]}
disp("My answer is:")
displayFormula("dy/dx = MyAnswer")
CheckEx1(MyAnswer)
%%
%[text] %[text:anchor:H_DEAD50AB] ### Identifying the Power Rule
%[text] The computations involved in calculating the derivative of a power from the limit definition of the derivative get more involved quickly as the power gets larger. This section implements the same computations you worked through above to allow testing several powers easily to search for patterns in the results.
%[text] ![](text:image:4ac2) **Try.** Choose a power of $n${"altText":"n"} to run the calculations below to calculate the derivative $\\frac{d}{dx}\\left\[x^n\\right\]${"altText":"(d)\/(dx)\[x^n\]"}:
syms x h                       % Define symbolic variables
                % Run this section %[control:button:432b]{"position":[1,2]}
n = 6  % Select the desired positive integer power %[control:slider:2e2b]{"position":[5,6]}
f(x) = x^n;                    % Define a symbolic function f(x) = x^n
oldPrefs = sympref();          % Save the current user preferences to reset at the end of the section
sympref('PolynomialDisplayStyle','descend');  % Present polynomials in descending power format
sympref('FloatingPointOutput',false);         % Do not use floating point representations
fxhD = f(x+h);                 % Name the symbolic function f(x+h)
%[text] Evaluate:
displayFormula("f(x+h) = fxhD") % Display the formula
% Use the built-in Taylor polynomial approximation to expand the polynomial
fxph(x,h) = taylor(f(x+h),x, "ExpansionPoint",0, "Order", 11);
fxphD = fxph(x,h);                    % Name the symbolic function
displayFormula("f(x+h) = fxphD")      % Display the formula
%[text] %[text:anchor:H_84807332] Calculate the difference quotient:
DQ = (fxph - f(x))/h;                  % Name the symbolic difference quotient
displayFormula("(f(x+h)-f(x))/h = DQ") % Display the formula
%[text] Simplify the difference quotient:
DQsimplified = simplify(DQ(x,h));      % Name the simplified symbolic difference quotient
displayFormula("(f(x+h)-f(x))/h = DQsimplified") % Display the formula
%[text] Compute the limit of the difference quotient as $h${"altText":"h"} approaches 0:
displayFormula("df/dx = limit((f(x+h)-f(x))/h,h,0)")
displayFormula("df/dx = limit(DQsimplified,h,0)")
limDQ = limit(simplify((f(x+h)-f(x))/h),h,0);  % Name the limit of the simplified difference quotient
displayFormula("df/dx = limDQ")                % Display the resulting formula
sympref(oldPrefs);   % Restore the system preferences you had before running this script.
%%
%[text] ![](text:image:1ae5) **Reflect** Can you find a pattern in the results $\\frac{df}{dx}${"altText":"(df)\/(dx)"} for different values of $n${"altText":"n"}?
%[text] ![](text:image:83b3) **Exercise 2**. For a positive integer $n${"altText":"n"}, can you write down a rule for the derivative?
%[text]{"align":"center"} If $f(x) = x^n${"altText":"f(x) = x^n"}, then $\\frac{df}{dx}${"altText":"(df)\/(dx)"} = ? 
syms x n                      % Define symbolic variables
dfdx =  x^n;  % Assign a user-defined function to dfdx %[control:editfield:87d0]{"position":[8,12]}
CheckPwrRule(dfdx,x,n);           % checkPwrRule is defined in Local Helper Functions
% checkPwrRule compares dfdx to the correct power rule and displays
% feedback
                   % Run this section %[control:button:2033]{"position":[1,2]}
%%
%[text] %[text:anchor:H_900A8650] ### Extending the Power Rule
%[text] What happens if $n${"altText":"n"} is not a positive integer? If $n=0${"altText":"n=0"} this is quite doable by hand, but what happens with other values? Does your rule still work?
syms x h                                      % Define symbolic variables %[text:anchor:H_84807332]
oldPrefs = sympref();                         % Save current preferences for restoration at the end of the section
sympref('PolynomialDisplayStyle','descend');  % Present polynomials in descending power format
sympref('FloatingPointOutput',false);         % Do not use floating point representations
n = 0.5                      % Select and display a power n %[control:editfield:3c88]{"position":[5,8]}
order = 5             % Select an order to use in the Taylor approximation %[control:slider:7d99]{"position":[9,10]}
                                % Run this section %[control:button:36ad]{"position":[1,2]}
f(x) = x^n                                    % Define a symbolic function f(x) = x^n
fxph(x,h) = f(x+h);                           % Create a multivariable function to use in the Taylor expansion
% The definition of DQ uses simplify on the difference quotient to
% eliminate the common factors in the rational expression and expand to
% split into recognizable terms
DQ = expand(simplify((taylor(fxph,h,"Order",order)-f(x))/h));
displayFormula("f(x+h) = DQ")
displayFormula("df/dx = limit((f(x+h)-f(x))/h,h,0)") % limit is a symbolic MATLAB function
DQ0 = DQ(x,0);                                % Name the difference quotient evaluated
displayFormula("df/dx = limit(DQ,h,0)")
displayFormula("df/dx = DQ0")
sympref(oldPrefs);   % Restore the system preferences you had before running this script.
%[text] %[text:anchor:H_02D8FB52] ![](text:image:9981) **Pro-tip**. The method used to approximate the difference quotient here is called a [Taylor Series](https://www.mathworks.com/help/symbolic/sym.taylor.html#busozb7-8). This is an extremely useful method you are likely to see again. The higher the order the closer the approximation is to your original function. What impact does changing the order have on your calculation?
%%
%[text] %[text:anchor:H_160C97A6] ![](text:image:7792) **Exercise 3.**
%[text] Compute the derivative of the following expressions by hand using the Power Rule:
%[text] 1. $x^2${"altText":"x^2"}
%[text] 2. $x^{-2}${"altText":"x^(-2)"}
%[text] 3. $x^{1/2${"altText":"x^(1\/2)"}
%[text] 4. $3${"altText":"3"} \
pwrRuleSelected = false;     % This sets a boolean to control showing/hiding the solutions %[control:checkbox:7186]{"position":[19,24]}
if pwrRuleSelected
    syms x; %#ok<*UNRCH>
    disp("3.1. ")
    ans1 = 2*x
    disp("3.2. ")
    ans2 = -2*x
    disp("3.3. ")
    ans3 = 1/2*x^(-1/2)
    disp("3.4. ")
    ans4 = 0
    disp("Note: This can be thought of as a power rule in terms of x^0, but it is sometimes called the Constant Rule.")
    disp("      The derivative of any constant is zero!")
end
%%
%[text] %[text:anchor:H_BB5029F8] ## Linearity Rules
%[text] The trouble with the power rule is that it is very limited in scope. It only applies to the derivatives of $x^n${"altText":"x^n"}. Functions of the form $x^n${"altText":"x^n"} are called monic (coefficient is 1) monomials (there is only one term in the expression). Most applications of powers result in polynomial functions such as $T(x) = \\frac{9}{5}x+32${"altText":"T(x) = (9)\/(5)x+32"} or non-monic monomial such as $G(x) = 2.365x^{-2}${"altText":"G(x) = 2.365x^(-2)"}. Neither of these functions can be differentiated by applying to power rule directly. To extend your ability to differentiate to the entire set of polynomials, you must check how derivatives interact with multiplication by constants and with addition. Happily, the conclusion is that you can multiply by a constant before or after computing a derivative and you will reach the same result. Similarly, the derivative of a sum is the sum of the derivatives. What does this look like in derivative notation?
%[text] Remember that the [derivative is an operator](file:./Definition.m:H_1ECFF159). In fact, it is a linear operator, which means that it satisfies the following conditions for any differentiable functions $f(x)${"altText":"f(x)"} and $g(x)${"altText":"g(x)"} and any constant $c${"altText":"c"}:
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[f(x)+g(x)\\right\] = \\frac{d}{dx}\\left\[f(x)\\right\] + \\frac{d}{dx}\\left\[g(x)\\right\] = \\frac{df}{dx} + \\frac{dg}{dx}${"altText":"(d)\/(dx)\[f(x)+g(x)\] = (d)\/(dx)\[f(x)\] + (d)\/(dx)\[g(x)\] = (df)\/(dx) + (dg)\/(dx)"}
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[cf(x)\\right\] = c\\left(\\frac{d}{dx}\\left\[f(x)\\right\]\\right) = c\\frac{df}{dx}${"altText":"(d)\/(dx)\[cf(x)\] = c((d)\/(dx)\[f(x)\]) = c(df)\/(dx)"}
%[text] %[text:anchor:H_96251CFE] Let's start from the limit definition of the derivative and see why the derivative satisfies these conditions.
%[text] %[text:anchor:H_E222D4B5] ### Sums and Differences
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[f(x)+g(x)\\right\] = \\lim\_{h\\to 0} \\frac{(f(x+h)+g(x+h)) - (f(x)+g(x))}{h}${"altText":"(d)\/(dx)\[f(x)+g(x)\] = limit as h -\> 0 of ((f(x+h)+g(x+h)) - (f(x)+g(x)))\/(h)"}
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[f(x)+g(x)\\right\] = \\lim\_{h\\to 0} \\frac{f(x+h)-f(x)+g(x+h)-g(x)}{h}${"altText":"(d)\/(dx)\[f(x)+g(x)\] = limit as h -\> 0 of (f(x+h)-f(x)+g(x+h)-g(x))\/(h)"} 
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[f(x)+g(x)\\right\] = \\lim\_{h\\to 0}\\frac{f(x+h)-f(x)}{h} + \\lim\_{h\\to 0}\\frac{g(x+h)-g(x)}{h}${"altText":"(d)\/(dx)\[f(x)+g(x)\] = limit as h -\> 0 of (f(x+h)-f(x))\/(h) + limit as h -\> 0 of (g(x+h)-g(x))\/(h)"}
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[f(x)+g(x)\] = \\frac{d}{dx}\[f(x)\] + \\frac{d}{dx}\[g(x)\] = \\frac{df}{dx}+\\frac{dg}{dx}${"altText":"(d)\/(dx)\[f(x)+g(x)\] = (d)\/(dx)\[f(x)\] + (d)\/(dx)\[g(x)\] = (df)\/(dx)+(dg)\/(dx)"} 
%[text] %[text:anchor:H_E94B0CBF] ### Multiplying by Constants
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[cf(x)\\right\] = \\lim\_{h\\to 0} \\frac{cf(x+h)-cf(x)}{h}${"altText":"(d)\/(dx)\[cf(x)\] = limit as h -\> 0 of (cf(x+h)-cf(x))\/(h)"} 
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[cf(x)\\right\] = \\lim\_{h\\to 0} c\\left(\\frac{f(x+h)-f(x)}{h}\\right)${"altText":"(d)\/(dx)\[cf(x)\] = limit as h -\> 0 of c((f(x+h)-f(x))\/(h))"} 
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[cf(x)\\right\] = c\\lim\_{h\\to 0}\\frac{f(x+h)-f(x)}{h} = c\\frac{df}{dx}${"altText":"(d)\/(dx)\[cf(x)\] = c times limit as h -\> 0 of (f(x+h)-f(x))\/(h) = c(df)\/(dx)"}
%[text] ![](text:image:6939) **Exercise 4**. Calculate the derivative with respect to $x${"altText":"x"} for each of the following:
%[text] 1. $x^2+x^3${"altText":"x^2+x^3"}
%[text] 2. $x^{-2}-x^4${"altText":"x^(-2)-x^4"}
%[text] 3. $x^{1/2}+x^{-1/2}${"altText":"x^(1\/2)+x^(-1\/2)"}
%[text] 4. $\\frac{2}{3}x^3 + 6${"altText":"(2)\/(3)x^3 + 6"}
%[text] 5. $7x^3-12x^2+3x-8${"altText":"7x^3-12x^2+3x-8"} \
linearitySelected = false;    % This sets a boolean to control showing/hiding the solutions %[control:checkbox:4dce]{"position":[21,26]}
if linearitySelected
    syms x;
    disp("4.1.")
    disp(2*x + 3*x^2)
    disp("4.2.")
    disp(-2*x^(-1) - 4*x^3)
    disp("4.3.")
    disp((1/2)*x^(-1/2) - (1/2)*x^(-3/2))
    disp("4.4.")
    disp(2*x^2 + 0)
    disp("4.5.")
    disp(21*x^2-24*x+3)
end
%[text] ![](text:image:0290) **Reflect**
%[text] 1. Is there a pattern to the graphs of the powers and their derivatives?
%[text] 2. If you know something about how a function is changing, what can you say about the original function?
%[text] 3. Where does a polynomial function reach a maximum or minimum value? Does this have any relationship to its derivative? \
%%
%[text] %[text:anchor:H_BC579CCC] ### Application: Parabolic Motion
%[text] A standard problem in the history of calculus (and physics) is the description of parabolic motion. Using a bit of imagination, consider an object that is impervious to heat, cold, and pressure such that it could be tested on any of the bodies in our solar system. 
%[text] ![](text:image:54b3) **Try** Choose some values and begin. 
planet = "Earth";     % Choose a planet, moon, or star %[control:dropdown:0a9f]{"position":[10,17]}
g = GetGravity(planet);            % getGravity is defined in Local Helper Functions
% getGravity sets the acceleration constant g based on the solar system
% body chosen, then print the acceleration selected
disp("On " + planet + " the acceleration due to gravity is " + g + "m/s^2.")
v0 = 10;         % User selection for the initial velocity %[control:editfield:1607]{"position":[6,8]}
h0 = 1.88;         % User selection for the initial height %[control:editfield:1a4e]{"position":[6,10]}
figure                             % Initialize a figure
                       % Run this section %[control:button:66a1]{"position":[1,2]}
[fh,tmax] = SolveParabolicMotion(planet,v0,h0);  % solveParabolicMotion is defined in Local Helper Functions
% solveParabolicMotion sets up and graphs a parabola
%%
%[text] Once you have chosen your preferred location and set up your trajectory, let's use calculus to study the motion. The height of your object is given by $h(t) = -\\frac{g}{2}t^2+v\_0t+h\_0${"altText":"h(t) = -(g)\/(2)t^2+v\_0t+h\_0"}. The velocity of your object is given by $v(t) = \\frac{d}{dt}\[h(t)\]${"altText":"v(t) = (d)\/(dt)\[h(t)\]"}. You may use either numbers or the variables `g`, `v0`, and `h0` as well as the independent variable `t` to express your result.
if exist("planet","var")          % Check for planet to see if the previous section has been run
    v = @(t) -g*t^2/2+v0*t+h0;    % User-defined anonymous function of t %[control:editfield:6852]{"position":[14,30]}
    CheckVelocity(v,fh)               % checkVelocity is defined in Local Helper Functions

else                      % If "planet" doesn't exist, warn the user to run the previous section
    warning("You must choose a solar system body and graph the resulting parabola to continue.")
end
                % Run the section %[control:button:1c91]{"position":[1,2]}
%%
%[text] Thinking about what you know about derivatives, what is the velocity at the apex of the parabola?
apexVelocity = "unknown";  % user-selected string value from options %[control:dropdown:4470]{"position":[16,25]}
CheckApexVelocity(apexVelocity);  % checkApexVelocity is defined in Local Helper Functions
% checkApexVelocity determines if the argument identifies the sign of the
% derivative at the apex of a parabola and gives feedback
%%
%[text] Can you solve for the point at which the apex of the parabola is achieved? 
if exist("planet","var")              % Check for planet to see if the setup section has been run
    tApex =  0;     % User-defined time value for the apex of the parabola %[control:editfield:4090]{"position":[13,15]}
    hApex =  h0;     % User-defined height value for the apex of the parabola %[control:editfield:2a76]{"position":[13,16]}
    CheckApex(tApex,hApex,g,v0,h0);   % checkApex is defined in Local Helper Functions
    % checkApex determines if (tGuess,hGuess) is the correct apex point for a
    % parabola h(t) = -g/2*t^2+v0*t+h0
else         % If "planet" doesn't exist, warn the user to run the setup section
    warning("You must choose a solar system body and graph the resulting parabola to continue.")
end
   % Run this section %[control:button:7599]{"position":[1,2]}

%%
%[text] %[text:anchor:H_5ECDFDAA] ## Practice Computing Derivatives Using the Power and Linearity Rules
%[text] %[text:anchor:H_E28888E7] ![](text:image:5f79) **Practice.**
%[text] Generate randomized practice problems. First, click **Initialize Values** once to get started. Then each time you want a new problem, click the **Generate Problem** button each time to create a new problem. After solving the problem, input your solution as MATLAB code and click the **Check Answer** button.  
%[text] ![](text:image:1721) **Pro-tip**. MATLAB syntax is 7`*t^(2/3)` for $7t^{2/3}${"altText":"7t^(2\/3)"}. The variable you use in the solution matters, as does appropriate use of parentheses and multiplication operators.
% Clear variables
clear MyFun VarChoice MyAnswer TotPowerRuleProbs
syms t r x z                         % Declare symbolic variables
VarOpts = [t r x z];                 % Define the list of variables to use in the problems
ErrorCount = 0;                      % Initialize a count of errors
TotPowerRuleProbs = 0;               % Initialize a count of total problems attempted
TotAttempts = 0;                     % Initialize a count of total solutions offered
AdjustCount = 0;                     % Preserve the counts if the user resubmits a solution
LastFive = zeros(1,5);               % Initialize a matrix to record the last five solution results
  %[control:button:616e]{"position":[1,2]}
disp("Values initialized for Power and Linearity Rule Practice.")
%%
% Check if the previous section has run
% If not, provide warning. If so, generate a problem.
if ~exist("TotPowerRuleProbs","var")
    warning("You must initialize values before you can generate a problem.")
else
    [MyFun,VarChoice] = GenProdType(VarOpts,1);  % GenProdType is defined in Local Helper Functions
    % GenProdType sets up a variable and generates a randomized function
    TotPowerRuleProbs = TotPowerRuleProbs+1;     % Increase the count of total problems attempted
end
                                   % Run this section %[control:button:3008]{"position":[1,2]}
%%
MyAnswer = r;     % User-defined solution, default value r %[control:editfield:8768]{"position":[12,13]}
TotAttempts = TotAttempts + 1;       % Updates count of total attempts at solution
[LastFive,ErrorCount,TotAttempts,AdjustCount] = ResubmissionCheck(TotAttempts,TotPowerRuleProbs, ...
    AdjustCount,MyFun,VarChoice,MyAnswer,1,ErrorCount,LastFive);
% ResubmissionCheck is defined in Local Helper Functions
% ResubmissionCheck records the attempt and provides appropriate feedback
                          % Run this section %[control:button:7e06]{"position":[1,2]}
%%
%[text] Once you have completed sufficient practice, track the overall results of your practice here:
                        % Run this section %[control:button:4cfd]{"position":[1,2]}
AnalyzeResults(TotPowerRuleProbs,ErrorCount,TotAttempts,AdjustCount,LastFive)
% AnalyzeResults is defined in Local Helper Functions
% Compute the percentage of initially correct solutions out of the total
% problems attempted, subsequent attempts are not scored
%%
%[text] %[text:anchor:H_2ABFE476] ### Practice App
%[text] If you would prefer to practice in the Calculus Flashcards app, you can start it by clicking on the image below. You should set it for "Power and Linearity Rules" in the Derivatives section. The app will open in a new window.
%[text]{"align":"center"} [![Calculus Flashcards settings screen](text:image:7f77)](<matlab: CalculusFlashcards>)
run("CalculusFlashcards")
  %[control:button:37b8]{"position":[1,2]}
%%
%[text] [⇦ Main Menu](file:../MainMenu.m)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] %[text:anchor:H_82C05E78] ## Local Helper Functions
%[text] If you wish to see the details of the code, select the **View** tab on the MATLAB toolstrip and switch to **Output Inline**. Alternately, select **Output inline** using the icon ![live script output inline icon](text:image:34d8) at the top right of the Live Editor pane.
function [m,linApprox] = GetLinApprox(y,x,a)
% GetLinApprox creates a tangent line function to y(x) at the point x=a
%
% GetLinApprox requires four arguments
%   y a symbolic function
%   x the independent variable
%   a the point of tangency
% GetLinApprox returns two values
%   m is the slope as a double
%   linApprox is the tangent line to y(x) at x=a as a symfun
dy = diff(y,x);         % Symbolically compute the derivative y'(x)
m = subs(dy,x,a);       % Symbolically compute the slope m = y'(a)
ya = subs(y,x,a);       % Symbolically compute y(a)
linApprox = @(x) ya + m*(x-a);  % Symbolically compute the tangent line y = y(a) + y'(a)*(x-a)
m = double(m);          % Express the slope as a number
end

function CheckEx1(myAnswer)
% CheckEx1 checks the expression for the derivative of y=x^3
syms x
correctAnswer = 3*x^2;
if myAnswer == correctAnswer
    disp("That is correct.")
else
    disp("That is incorrect. Please try again.")
end
end

function g = GetGravity(planet)
% getGravity sets the acceleration constant g based on the solar system
% body chosen
%
% planet is a string
switch planet
    case "Mercury"
        g = 3.59;
    case "Venus"
        g = 8.87;
    case "Earth"
        g = 9.81;
    case "Mars"
        g = 3.71;
    case "Jupiter"
        g = 25.95;
    case "Moon"
        g = 1.62;
    case "Saturn"
        g = 11.08;
    case "Neptune"
        g = 14.07;
    case "Uranus"
        g = 10.67;
    case "Pluto"
        g = .62;
    case "Sun"
        g = 274.13;
end
end

function [fh, tmax] = SolveParabolicMotion(planet,v0,h0)
% SolveParabolicMotion sets up and graphs a parabola
%
% Inputs: planet is a string, v0 = initial velocity, h0 = initial height
% Outputs: fh is a handle to the parabolic equation, [0 tmax] is the xlims of
% the plot
syms t                             % Create a symbolic variable t
g = GetGravity(planet);            % GetGravity is defined in Local Helper Functions
% GetGravity sets the acceleration constant g based on the solar system
% body chosen
fh = @(t)-g*t.^2/2 + v0*t + h0;    % Define a function handle for the parabola
if (v0 < 0) && (h0 < 0)            % Check for reasonable initial values
    disp("You have to throw upwards, and be above the ground, or the ball won't travel anywhere!")
    disp("Please set positive v0 and h0 values and run this again.")
elseif v0 < 0                      % Check for reasonable initial values
    disp("You should look at parabolic motion with an apex.")
    disp("Please set a positive value of v0 and run this again.")
end
% Compute the physically interesting value of tmax
if h0 > 0
    % For positive initial height, select the most positive root of the
    % parabola -g/2*t^2 + v0*t + h0
    tmax = max(roots([-g/2,v0,h0])); %#ok<*NASGU>
else
    % For non-positive initial height, set a tmax that centers the apex if v0>0
    % This returns to the starting height at tmax
    % If v0<0, there are no physically realistic choices so the user is
    % encouraged to choose different initial values
    tmax = abs(2*v0/g);
end
fplot(fh,[0 tmax])                           % Symbolically plot the parabola
formatSpec = "$h(t) = %.2ft^2 + %.2ft + %.2f$";  % Set up a format string for displaying
% information on the graph to 2 decimal places
hStr = compose(formatSpec,[-g/2 v0 h0]);     % Create the string with current values
% Label the plot appropriately
legend(hStr,"Interpreter","latex","Location","best")
title("Parabolic Motion on " + planet)
xlabel("Time (s)")
ylabel("Elevation (m)")
end

function CheckVelocity(vh,fh)
% CheckVelocity determines whether the first argument is the derivative of
% the second argument
%
% CheckVelocity takes two function handles as arguments
syms t                   % Define a symbolic variable
v(t) = vh(t);            % Create a symbolic function from the function handle
f(t) = fh(t);            % Create a symbolic function from the function handle
df(t) = diff(f,t);       % Compute the symbolic derivative as a function
if isequal(v,df)         % Check whether v is the derivative of f
    disp("Correct.")
else                     % If the answer is incorrect, try to give useful feedback
    % Identify the coefficients of the solution
    correctG = double(diff(f,t,2));
    correctV0 = double(df(0));
    % Check whether the answer v(t) was a linear function, i.e. with
    % constant derivative. If not, warn the user it should be linear
    try answerG = double(diff(v,t));
    catch
        warning("The derivative should be a linear function.")
        answerG = 0;
    end
    % Check whether each each term was correct and give feedback
    answerV0 = vh(0);
    if isequal(correctG,answerG)
        disp("You made a mistake with the constant term.")
        disp("Please check your work and resubmit.")
    elseif isequal(correctV0,answerV0)
        disp("You made a mistake with the linear term.")
        disp("Please check your work and resubmit.")
    else
        disp("Please review the rules for computing derivatives of polynomials.")
        disp("Then fix the answer and resubmit.")
    end
end
end

function CheckApexVelocity(str)
% CheckApexVelocity determines if the argument identifies the sign of the
% derivative at the apex of a parabola and gives feedback
if str == "zero"
    disp("Correct!")
else
    disp("That is not correct. Please review what you know about graphical derivatives and try again.")
end
end

function CheckApex(tGuess,hGuess,g,v0,h0)
% CheckApex determines if (tGuess,hGuess) is the correct apex point for a
% parabola h(t) = -g/2*t^2+v0*t+h0
syms t                                      % Define a symbolic variable
fh = @(t) -g/2*t.^2+v0*t+h0;                % Define the parabola as a function handle
if (tGuess == v0/g) && (hGuess == fh(v0/g)) % Check for correctness, and give feedback
    disp("Correct.")
    disp("Note: As a theme in calculus, you can replace some of the specific formulas you memorized")
    disp("      in the past with general rules from calculus that allow you to quickly compute solutions.")
    % For incorrect solutions, try to determine how the answer is wrong and provide appropriate feedback
elseif (tGuess == v0/g) && (hGuess ~= fh(v0/g))  % Correct time, incorrect height
    disp("You have the correct time, but the incorrect height.")
    disp("How can you evaluate the height at a given time?")
    disp("Please check your work and resubmit your solutions.")
elseif (tGuess ~= v0/g) && (hGuess == fh(v0/g))  % Correct height, incorrect time
    disp("You have the correct maximal height, but the incorrect time.")
    disp("Remember that the velocity is zero at the apex. How can you use that to find the time?")
    disp("Please check your work and resubmit your solutions.")
else                                         % No correct components, offer hints and suggestions
    disp("Your answers are incorrect. Please note that they need to be exact values so it may be easiest to work in terms of g, v0, and h0.")
    disp("Remember that the velocity is zero at the apex. How can you use that to find the time?")
    disp("Once you know the time, how can you find the height at that time?")
    disp("Please check your work and resubmit your solutions.")
end
tmax = double(abs(v0/g*2));  % Set a window to see the full parabola when v0>0
fplot(fh,[0, tmax])          % Symbolically plot the parabola in that window
ax = gca;                    % Define an axes handle
yLimits = ax.YLim;           % Extract the y limits of the window
% Increase the upper y limit so that the apex is clearly visible in the plot
yLimits(2) = .1*(yLimits(2)-yLimits(1))+yLimits(2);
ax.YLim = yLimits;           % Set the y limits on the axes
hold on
xline(tGuess, "r--")         % Add a vertical line at the user-defined tGuess
yline(hGuess, "g:")          % Add a horizontal line at the user-defined hGuess
% Label the plot appropriately
title("Locating the Apex of a Parabola")
xlabel("t (s)")
ylabel("h (m)")
legend("Parabola","My Calculated Apex Time","My Calculated Apex Height","Location","best")
hold off
end

function CheckPwrRule(dfdx,x,n)
% CheckPwrRule compares dfdx to the correct power rule and displays
% feedback
syms x n
pwrRule = n*x^(n-1);               % Define the power rule in terms of x and n
correct = isequal(dfdx,pwrRule);   % Check whether dfdx is equal to pwrRule
if correct                         % correct = 1, display "correct" feedback
    disp("Good work! The power rule is f'(x) = n*x^(n-1).")
else                               % correct = 0, display "incorrect" feedback
    disp("No, that isn't correct. Please try again.")
end
end

function AnalyzeResults(totProbs,errorCount,totAttempts,adjustCount,lastFive)
% AnalyzeResults provides feedback in the single problem type case
%    totProbs, errorCount, totAttempts and adjustCount are integers
%    lastFive is a vector
overallRight = (1 - sum(errorCount)/sum(totProbs))*100;
if sum(totAttempts) > sum(totProbs)
    % If the user has resubmitted after seeing the solution, respond
    disp("Why are you resubmitting after you know the solution?")
    disp("Resubmissions are not included in your statistics.")
    if sum(adjustCount) > 1
        % If the user is repeatedly resubmitting, encourage them to use
        % this problem generator as intended by starting over
        disp("You have resubmitted " + sum(adjustCount) + " times.")
        disp("Please consider restarting the count using the `Initialize Values' button.")
    end
end
if totProbs >= 5
    lastCorrect = sum(lastFive);
    % If more than 5 problems have been attempted, provide grammatically
    % appropriate feedback on success rates
    if lastCorrect > 1
        str = compose("The overall success rate is %.1f%% on %i total problems \n\n" + ...
            "Of the last five, %i were correct.",overallRight,totProbs,lastCorrect);
    elseif lastCorrect == 1
        str = compose("The overall success rate is %.1f%% on %i total problems \n\n" + ...
            "Of the last five, one was correct.",overallRight,totProbs);
    elseif lastCorrect == 0
        str = compose("The overall success rate is %.1f%% on %i total problems \n\n" + ...
            "Of the last five, none were correct.",overallRight,totProbs);
    end
else
    % If fewer than 5 problems have been attempted, encourage persistence
    str = compose("The overall success rate is %.1f%% on %i total problems \n\n" + ...
        "Please do at least five problems.",overallRight,totProbs);
end
disp(str)
end

function [lastFive,errorCount] = Check1(myFunc,myVar,myAnswer,errorCount,lastFive)
% Check1 generates correct answers by differentiating and updates
%        errorCount and lastFive
%
% Inputs: myFunc is the symbolic function to differentiate or integrate
%         myVar is the independent variable
%         myAnswer is the symbolic test function or number
%         errorCount is an integer tracking total incorrect attempts
%         lastFive is a vector tracking the last five attempts
% Output: correctAnswer is a symbolic function that is the
%         solution to probType applied to myFunc(myVar) with bds
syms C
correctAnswer = diff(myFunc,myVar);
lastFive(1:4) = lastFive(2:5);
disp("When simplified, this function is: ")
disp(myAnswer)
if correctAnswer == myAnswer
    disp("That answer is correct.")
    lastFive(5) = 1;
else
    disp("That is incorrect. The correct answer is:");
    correctAnswer %#ok<NOPRT>
    errorCount = errorCount + 1;
    disp("Please try again with a new problem.")
    lastFive(5) = 0;
end
end

function [myFun,varChoice] = GenProdType(varOpts,probType)
% GenProdType sets up a variable and generates a randomized function
%
% Inputs: varOpts is an array of possible variables
%         probType is a string that identifies the function type
% Outputs: myFun is a symbolic function
%          varChoice is the independent variable
%          probType is an integer tracking the type of question asked
%          [a, b] are the bounds for the definite integral, if required

% Randomly select a variable from the set varOpts
varChoice = varOpts(randi([1 length(varOpts)],1));

% Use GenFunDiff to generate simple functions
% GenFunDiff is defined in Local Helper Functions
% The inputs to GenFunDiff are the variable varChoice, a range of values
% from which to select coefficients and a value indicating which warnings
% have already been printed during problem generation
switch probType
    case 1 % Simple derivative
        myFun = GenFunDiff(varChoice,[1,10]);  % Generate myFun
        % Display the derivative problem
        disp("Take the derivative with respect to: ")
        disp(varChoice)
        disp(" of the function ")
        displayFormula("f(varChoice) = myFun")
end
end

function [myFun,type] = GenFunDiff(var,bds)
% GenFunDiff generates a random function with a simple derivative
%
% Inputs: var is the independent variable
%         bds is a 1x2 vector of increasing integer values that set
%             the range for the coefficients
%         prevType is an integer that identifies the type of function
%             created last
% Outputs: myFun is the generated symbolic function
syms f(t)                   % Create a symbolic function f(t)
params = randi(bds,[1 5]);  % Randomly choose parameter values
sgns = randi([0 1],[1 3]);  % Randomly choose +/- signs
type = randi([1 6],1);     % Randomly choose the function type

% For readability, create parameters a,b,c, and d
a = (-1)^sgns(1)*params(1);
b = (-1)^sgns(2)*params(2);
c = max(params(3),params(5));  % c > 0, it is only used as a denominator
d = (-1)^sgns(3)*params(4);

switch type
    case 1
        f(t) = a*t^(b);
    case 2
        f(t) = a*t^(b/c);
    case 3
        f(t) = a*t^b+c*t^d;
    case 4
        f(t) = a*t^b+t^(d/c);
    case 5
        f(t) = t^a+c*t^b+t^d;
    case 6
        f(t) = t^a+c*t^b+d;
end

myFun = f(var);
end

function [lastFive,errorCount,totAttempts,adjustCount] = ResubmissionCheck(totAttempts,totProbs, ...
    adjustCount,myFun,varChoice,myAnswer,probType,errorCount,lastFive)
if sum(totAttempts > (totProbs + adjustCount))
    % Check if this is a resubmission after the solution has been provided
    % If so, provide feedback but do not record in errorCount or lastFive
    % If not, update the values of lastFive and errorCount using Check1
    adjustCount = totAttempts-totProbs;
    [lastFive,errorCount] = Check1(myFun,varChoice,myAnswer,errorCount,lastFive);
elseif sum(totAttempts < (totProbs + adjustCount))
    % Check if this is a submission after the generation of multiple problems that were skipped
    % If so, add the skipped problems to errorCount and adjust the totAttempts
    % to compensate. Explain to the user that skipped problems count as incorrect.
    numSkipped = totProbs + adjustCount - totAttempts;
    errorCount = errorCount + numSkipped;
    totAttempts = totProbs + adjustCount;
    for k = 1:length(totProbs)
        if numSkipped(k) < 5
            lastFive(k,:) = [lastFive(k,1+numSkipped:5),zeros(1,numSkipped)];
        else
            lastFive(k,:) = zeros(1,5);
        end
        if sum(numSkipped) > 1
            disp("The "+sum(numSkipped)+" problems generated without attempts at solution " + ...
                "have been included in the count of errors.")
        else
            disp("The problem generated without an attempt at solution has been " + ...
                "included in the count of errors.")
        end
        [lastFive,errorCount] = Check1(myFun,varChoice,myAnswer,errorCount,lastFive);
    end
else
    [lastFive,errorCount] = Check1(myFun,varChoice,myAnswer,errorCount,lastFive);
    % Check1 is defined in Local Helper Functions
    % Check1 generates correct answers by differentiating myFun with respect to varChoice and compares
    % the result to myAnswer before updating the integer errorCount and matrix lastFive
end
end


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"hidecode","rightPanelPercent":15.1}
%---
%[text:image:1405]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j4gbEASHJNlwZYtW\/93dHTixDCDQTRMDKRn8FhATBDNmTOH\/CAiBI4cOQI2HETTLBW9fv2a\/FRUtPXVf\/WeuyRhkB6iLQBp2HLvP0kYpGfUglELhpMFNM9oNKlw6FHp06TZAgAoeVix9Bg9oQAAAABJRU5ErkJggg==","width":24}
%---
%[text:image:6138]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:0c98]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[control:slider:089e]
%   data: {"defaultValue":3,"defaultVariable":"b","label":"Choose a point","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.5}
%---
%[control:button:7b32]
%   data: {"label":"Generate Graph","run":"Section"}
%---
%[text:image:969c]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:4b3a]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:29e8]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[control:editfield:9e53]
%   data: {"defaultValue":"1* x^3","label":"The derivative is y'(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:67b1]
%   data: {"label":"Check Exercise 1","run":"Section"}
%---
%[text:image:4ac2]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:button:432b]
%   data: {"label":"Show Computations","run":"Section"}
%---
%[control:slider:2e2b]
%   data: {"defaultValue":6,"label":"Choose a power n: ","max":10,"min":4,"run":"Section","runOn":"ValueChanging","step":1}
%---
%[text:image:1ae5]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:83b3]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:editfield:87d0]
%   data: {"defaultValue":" x^n","label":"f'(x) is ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:2033]
%   data: {"label":"Check Answer","run":"Section"}
%---
%[control:editfield:3c88]
%   data: {"defaultValue":0,"label":"Choose a numerical value for n: ","run":"Section","valueType":"Double"}
%---
%[control:slider:7d99]
%   data: {"defaultValue":5,"label":"Choose the order for approximating f(x+h):","max":12,"min":2,"run":"Section","runOn":"ValueChanging","step":1}
%---
%[control:button:36ad]
%   data: {"label":"Show Calculations","run":"Section"}
%---
%[text:image:9981]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[text:image:7792]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:checkbox:7186]
%   data: {"defaultValue":false,"label":"Select this check box to reveal the solutions.","run":"Section"}
%---
%[text:image:6939]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:checkbox:4dce]
%   data: {"defaultValue":false,"label":"Select this check box to reveal the solutions.","run":"Section"}
%---
%[text:image:0290]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:54b3]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:dropdown:0a9f]
%   data: {"defaultValue":"\"Earth\"","itemLabels":["Sun","Mercury","Venus","Earth","Moon","Mars","Jupiter","Saturn","Uranus","Neptune","Pluto"],"items":["\"Sun\"","\"Mercury\"","\"Venus\"","\"Earth\"","\"Moon\"","\"Mars\"","\"Jupiter\"","\"Saturn\"","\"Uranus\"","\"Neptune\"","\"Pluto\""],"label":"What solar system body are you on? ","run":"Section"}
%---
%[control:editfield:1607]
%   data: {"defaultValue":0,"label":"Enter a positive initial velocity in meters per second: ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:1a4e]
%   data: {"defaultValue":0,"label":"Enter the initial height in meters: ","run":"Section","valueType":"Double"}
%---
%[control:button:66a1]
%   data: {"label":"Graph Parabola","run":"Section"}
%---
%[control:editfield:6852]
%   data: {"defaultValue":"-g*t^2\/2+v0*t+h0","label":"Calculate the derivative of h(t) with respect to t: ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:1c91]
%   data: {"label":"Check ","run":"Section"}
%---
%[control:dropdown:4470]
%   data: {"defaultValue":"\"unknown\"","itemLabels":["unknown","positive","negative","zero","g"],"items":["\"unknown\"","\"positive\"","\"negative\"","\"zero\"","\"g\""],"label":"At the apex, the velocity is ","run":"Section"}
%---
%[control:editfield:4090]
%   data: {"defaultValue":" 0","label":"Apex time is: ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:2a76]
%   data: {"defaultValue":" h0","label":"Apex height is: ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:7599]
%   data: {"label":"Check ","run":"Section"}
%---
%[text:image:5f79]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:1721]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[control:button:616e]
%   data: {"label":"Initialize Values","run":"Section"}
%---
%[control:button:3008]
%   data: {"label":"Generate Problem","run":"Section"}
%---
%[control:editfield:8768]
%   data: {"defaultValue":"r","label":"My answer is: ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:7e06]
%   data: {"label":"Check Answer","run":"Section"}
%---
%[control:button:4cfd]
%   data: {"label":"Analyze Results","run":"Section"}
%---
%[text:image:7f77]
%   data: {"align":"baseline","height":326,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAzIAAAJ1CAYAAAACH8VNAABKAklEQVR42u3d\/688310X8P0\/jMEfiBaNSkxEjRo+aRGtdPVaRQkIUcFPP1gI8k3qdQsWNDRqit8Q3+5NxC9UqsEC2oh7A4WatkAbpILX3rYIfuy70lbkXSzYFMp4Z3dn95wz55yZ3bt7vz4+ySOf93u\/zM7M7rzOec45M+\/Jb\/icL2wAAADuk4mdAAAACDIAAACCDAAAgCADAAAIMgAAAIIMAADA9YPMZ\/yx55vf9ae+Yi+\/+RVfakcDAAA3H2Q+65Vf3rz5pz\/S\/Juf\/F\/Nd737afNP3\/li8+Rt\/735hz\/0geYNi\/c1r\/8P722+5d9dNK\/9tz\/VfMO\/eU\/zNf\/qJ5qv+Bfvbr70H\/9Q8ztf8eftaAAA4OaDzCuf\/yvNP5y\/seofzL+r+fv\/5Luav\/eP\/0Xzd7\/jnzdv+Ef\/rHnDt39n89IveJUdDQAA3HyQ+bq\/8Yam9t+nPvWp5pOf\/NXm\/33iE80v\/\/IvN7\/0S\/+3+cVnz5r\/\/Qu\/0PzpL\/86OxoAAHYw9r+7tt4\/efG+5qu+9duLz7fPta+5E0GmDTE\/9ANva9799X+wefbzPx+FmI989H+PCDKvab7jxWCBL35f8\/Lq67+9OW8+1HzHq\/bd6Ou+P1xO\/N\/PfPdrrrH8Q63X8T7rq99+tZFv\/3bFBQDgBoLMIV5z09qg8slP\/L9smKk9d+NBpg0xL\/7Cx5vXvOKLmw\/\/p89s\/tuTfxCFmP\/18x+uB5lXfV\/zM1fLOX99\/Nh3vP6+BJncch5okGm\/qxff1Zy\/eFPrCAAgyNy3IFMKLIcOMaODzNd8y9\/JhpiL\/\/kLzR\/+m9\/fzH\/HS5qPvuMzm3d9ycuiEPP06Yeaz3\/ha6sjMeevv+kOvyCzz2e9\/Ls\/tBxx6v6vwAAACDJjwswxQszoIPPVr\/tbvRDz5re+p\/ndX\/r3mukf+PzmBz7r05uP\/vPf3vyXP\/6S5gNvf8cmxLz4Pz\/Y\/Mnnv7oyGvOu5quHpjJ1\/22mNKWd8Hhq2ioYpa8J\/176c\/r33HJ3DzL5bais8+tXo1TbqWq17azvo\/O3f+jqwfU+flW43O\/bYTu716xfvxyZCaf\/1dZ7aJsAAHiIQSYMM8cIMaODzFd90+uXO+rXPvXrzbte\/KXmW99y2bz0G7+3+ezP+8rmqz7t05t3fvZvaT761z6j+dkvfknzjm987SbE\/OzP\/Y\/mT3zZV1WmKg1dDzMURFad8H7n+ABB5vXvGrgepH+NTD5EjV32enndPmlfswl6pe2s7aM0UGxDSjuq0ozezvS7CkJNbr2XgSlej\/xzAAAunBdkjhxkvvK137rcUWc\/\/L7mlf\/0vzWf\/0\/+c\/MFf\/sHmi\/4PZ\/XvOE3fVrz05\/3kuajf+Ulzc9\/xUua85f+\/ubnfu7nliHmZ\/77zzZ\/\/C985d4jMqvOfPdfJnwUl3GAILMewSiHh5FTy3LbkF320LoU9tXQPvqcyijKqO38wt50smUQKo6QrUaJSqFu+xwAAKaWHTnIvPqv\/c3ldLKPfeyXmn+5eFfzJfMfb75o+hebv\/4bf2PzHz7zNzcvfvFLmo+c\/rbmPd\/6Z5ofefnva9793d+9DDHve\/8Hmumfe\/V+18hEnfdwFOCGgkzYad93allxG3LL3iPIjNlHQ0Fm1Hbm\/us+Nz\/VL79N+14XBQAgyLjYf48g8+V\/9Vs2\/07Mxz\/+8ebyve9tfuRfv6n58T\/0W5oPfvlvaz7yNZ\/RvOu7\/vYyuPzoj\/xI8x+\/6ZuWf37v5fuaV3zJXxocccnetax9rjhdaWhqWdJhXn5O+f3515VHJEYHmeI25JY9fL1Obx1G7aOBqWVD2xl+xueUwkqwblG4qj0HAMBDCzJ37vbLr\/qGv977xy4\/8tGPNv\/jTX+6+dgbf2vzn\/\/l6XIqWTed7D3v+alliPmvF+9t\/uiffWH4+osm9+\/IBBehR7f9zXfSexerh1Ou3v6u8ihM6XXRlK0xoz4DNwwItyG77KHRodx2jt1H8WdGF\/sPbGc7FSw37Ww7vSy8sUB6w4DacwAAPKTrelp37h\/E\/Itf\/41RiOlusXzx49\/X\/Ni\/\/zvNBz7wM5sQ043EtCHmp376vzZ\/5Iue92N80Gq3cr7JW0oDAPCYjAoyX\/Z139gLMeEtlksh5iff81PNH\/lCQUaQsZ8AALiFIPN7\/9SXLQPJPj7zFV9kRwsy9hMAADcfZAAAAAQZAAAAQQYAABBkAAAABBkAAABBBgAAEGQAAAAEGQAAgOMGmcnX\/CAAAMD9IcgAAACCDAAAgCADAAAgyAAAAIIMAACAIAMAACDIAAAAggwAAIAgAwAAcLQg8+53vxsAAOCojhJkfviHf7h59uwZGd\/5nd\/Z\/OiP\/iiPiO\/cPgIADkuQEWTQSbePAABBRpARZNBJt48AAEFGkEEn3T4CABBkBBl00u0jAECQEWQEGXTS7SMA4PEFmUUzm0yaycasWYx538W8mW5e2y5j2swv2j9fNvOTSTM7v+9BZt68EO2Xtefnh\/sBfP\/rmucmLzTz9M8HWW5\/3Z\/75rfsuKy3NK972aR54Wxg3R9gJ33+\/NU+e9nrmrdc+7Mr+3CX34cgAwAIMv0QMz273Dx2eTYdF2aKQeahjMisgkzcAb1Gp\/QmO6rL5T7XvO770+1JHxNkivvvZS80L7xs1\/114CBjRAYAEGRqYSQNIKtwsxlRWb4mHa0JR3H+cvOak+7P7bKCEZl12JmdbkcFwpGaVWhavW92evXn08XqufPZ7iNENxJkVmfqlyMb67Dw3MvadVx36M9eiEZAoveGoyTLM\/3hiM\/V+9Ng0Hv9+vHwM0ojBtkgE3So22VcddKfC5eRXe76Pd+8XZfNqE66vju8fznaMQn2W2\/fHT4g7dJJf8s3P7dcz\/b\/0QjceptfeD7\/HS9fv9mGbv9v9\/vmt5N8zmYEKB31i\/bxajn7j64JMgDAgxqRWYWONGCUQs2iDSQn8+Zy7NSydQjqRnz67+\/esw5GyyATj+60YSccMbrdIBM8tg4am+eT8LDs1G469PFoSByGclPLaq+PO8jZqW65IBM+tgwNwfPRtoTL7TrP4Tqu39db99x6rf+chKVVJ3z13OrP8faGHfyb76S369WtS7te\/XAZhY9o27avXT4X7INtgAxDXvB95B4P9nEcqpL1EmQAgEd7sX80AhKEmuXjwYhIGF5GB5lgxKdd3jrILEdjuhGY6O\/Hn6Z2nWtk4hGJytSjsHMadVRHXCNTeH0cjoaW21\/3TehKOt295WyeD8NGOYSV1yt5fzKKsx2h2Gfa25E66ctpZdttadexFFaL+z8KHuHUsiCAhJ8z4vfRGx0ytQwAEGQq082SgLOdPrZLkAmCUBBklqMz2SCTTGfrRnDuyNSy2jUi0fSgYIpVr6M\/EGRKr4+nLlWmYe0SsnKft1mX\/vUdxSCTXa\/k\/cUgU5lKd8Od9Oy2ZKd65UZScu+L90EXjNJRp\/Bza8EvO21RkAEAHl2QaYNFECbC6WbLIBIEj73uWlYJMuURmfhzSo\/fuSBTG+U45IjMmLPyOwaZ8SMywd9HjRbsEGT22c6Dd9JL0wkz0+mS\/ZaGwfyIzPo9z78umL5W2WfFGyocZwRLkAEA7t1dy6LrY5ajMPG1K93z0R3NrhlkitfIJO+5W9fIjA0yybUhSbDYXD9RCjLV1yePFwPSDkFm6BqZ3HYMrW8wtWwwyCSP39o1MmkYrYS3epBZT0vMBZnuuWzoKV8jE4c+18gAAKaWZf4dmeT6lOiuZeFz3fva0NHdNCB\/17JskInuWjZr5sHIy\/bx+zS1LJxadNURPRtzV6\/uOpzMXctKdycbc3evXYPMDncdK4WS\/HqNH5GJpnTd0tSy7QX6uelmhe+o912utz+5Tig7PS\/72ylNLYuv2TK1DAAQZO6EVfg59MjL9YIMD8nd+c6Pf2MDQQYAEGSOKb2RwIGvgxFkuHOd9OT2zfYRACDI3PsRmZulwybIYB8BAIKMIINOun0EAAgygowgg066fQQACDIIMjrpvnP7CAAQZAQZdNLtIwBAkDlKkPme7\/keoaXgzW9+c\/PWt76VR8R3bh8BAId1tCADAABwTIIMAAAgyNipAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwf4LM2GUCAAAPnyADAAAIMoIMAAAgyAgyAACAIAMAAAgyggwAACDICDIAAIAgAwAACDKCDAAAIMgIMgAAwOMOMrssE4C7Te0HUPsfVZB59uwZAPec2g+g9gsyAAgyAAgyggwAggwAgowgA4AgA6D2CzJ+BACCDACCjCDDPXR5Nm0mk0kzOV30nlucTpbPTc8u91j2opm1y53MmsWY11\/Mm2n7+pN5c1l4Tbc+s\/NrbHP3OaHMto\/dd9t9s+P2giBzP2rjJFMHR9Sru23PenU+i+rlQWryTX6P6+8rrt13az0PuV6HXebx2rjud5Q91hBkNGaM69inxemGO+Y3EWTaRjgNMRu7becxGh0QZO6IQq3YHO+PMch0+2TPEz+347KZn8TbeVdr92NtU9IQI8wIMhoz9iz0SUBIGq307GTYgG8K8OlsHYqmzfwi01D2OgfBc0HHYH6aL2a5IBMXwVqj3K1PWiAzjw+sS35f5DoG232bW79twzXfrMNq31U6VPe244Qgc\/86V5ta0x2H3fEXBpngGO11vtIR4E0I6GrD9njvj473O+G1EaNewCh+di7IlOv1cpsKtXu4Jif1bESdD2tydhlD+2FTI9PlTJrPff5zx7023FebdZ41s5NKJ7taqwf275j2ILvv1s+H33Ww7v1wNLBvd92GgTZu8\/s4C3+LmXY\/ep\/ZDYKMxox9zz5uilYSbgbOTo7q2OemdIVFt\/R80EimjWb2TE6po187m5gW04F1GRdk0gLfbzh6y0m3YWifgSBz5OlIhc5UsUZkOp6F47v7jH49S+pQ7ngfO2JUrI\/HCTKls+uboDO430p1s\/A9VPfD2CDTf119X2aC1WCtHh9kitte\/E6nvce7\/R0HmYF9u\/M2DLdxpd9DtQ3r9UcQZDRmjJ5mkJ7dGWg80tGawbM3lalkm88sn6GMG8318jMjQ7mpZ\/Vh++TM54h1KZ\/pWi8jU4xLy+jvgxEdGRBkbmDK7cBZ+kynLe3Ub2tEcoIoOr4XvbPwtXqWdoKHr29MR953DDKFk0HRNufajdJIVia4rNarPgq1+\/S3\/nb1andvXw63B8XfS7FW7xBkSicUe+vRn02Qfu\/5IDPQJo\/dhhFt3CbIdMscCCm9MI8gozFj16kUbcErdvoLUxXyry8FmeTsV9rAZYf0V6\/JN5rj5tbuFWRyUzGSs6mlIJO\/nmdoGWlD0z\/jZd4wgsxNn+Cp1KviiZRC\/Ys6r0E9WC+vm57bPr+qIaXOc3\/dtrVmh88+YJDJ19hCba2cgKpNYx4dPHcIMuWRkOTEXnU9hmr1+CATthnRuvbWozw9MR9khvbtbtswpo3rv6Z\/ArI3CmokRpDRmHG96WXdPOCgAU0bsMKITLVwl0ZgKh2DfYNMdSrGLlPLciNMI4NM\/mzqrkFmIPyBIHPDF\/+XO7fxMV84lpPOaxdWZqfT+NrCq0AzG3OsZzvwYz57OMiURi6KIzLZUaLdg8yoa22ejWubrhdkkrZmVN0t1erx6xHuv0MHmXH7dtw2jGnjdgky9eCOIKMxY+8C3C9Gw9OsykWv1ygecGrZ2O0rXljau17nZqaWDQeZZ8ULhEHtP9YNUMLjLHlsRId8eHpXeo1HfKZ7txHY\/Nny3aeW9ad8HWVq2cgpwUOj6UNt035Ty3a\/o+bwb2h4\/46eWnaAILPbTIV0G3afWjYmyCDIaMw46P32y3eh2W9q2d4Xtu96sX+tkz\/29ssj1iXenva9+1\/sXwwypfXVCCDI3Fgt3G9q2ZgL7vMnUrafXa5lxfUbunlKcYSgVK8yQSZYt70v9h+ckjeurg9fTF4OMv3aPf67Ht22ZELJ6JvmlC7G3zvIDOzbwW3Y\/2L\/4SDjJJ0gI8hw0Atca1Ob2kITd7jHXSMTF722sEVDyQe5\/fKIf2NmzD+IufMtQnNBZpfbL1dGZGq3rAZB5ubCTGXaa3FkoXoL5MLIx9DNVsas3863X05ff\/V48SL4cpDZ5fbL5f1Wu\/6nNpOg3zblrxdKa3fuM\/P\/NMDlqOmHhVo9sH93uf3y\/iMyA\/u2ug3XuP2yICPICDJwC4HOyAeCDACCjCADggwIMgAIMoIMCDKg9gOo\/YIMAIIMAIKMIAOAIAOAIHPoIAPAw6D2A6j9RmQAMCIDgBEZQQYAQQYAQUaQAUCQAVD7BRkABBkABBlBBgBBBgBBRpABQJABQJDRmAEIMgAIMoIMAIIMAIKMIAOAIAOAIKMxA9CYqf0AgowgA4AgA4AgI8gAIMgAIMhozAA0Zmo\/gNovyAAgyAAgyAgyAAgyAAgyggyAxkztB1D7BRkABBkABBlBBgBBBgBBRpABQJABUPsFGQAEGQAEGUEGAEEGAEFGkAFAkAFAkNGY7e1DH\/pQ87a3va1505ve1Mzn86X2z+1j7XP2EX6LCDI4hvH9I8gIMnfKT\/zETywLTVtk3ve+9zUf\/OAHl9o\/t4+1z7Wvsa\/wW0SQwTGM7x9BRpC5M0XnjW9847LIfOxjH2s++clPNr\/+67++1P65fax9rn3N0YrP+ayZnMybS9+H3+Jt\/xYrFqeTZnp26bsSZDjSMTw\/mTST00Xy+GXhcR5eDV80s0n\/u748m\/r+1X5Bhvzwb3t25AMf+MCyyJT+a59rX9O+1rAwj\/W3KMgIMhz7GF51ZGfnSSfWia5H9f1PJtNmfiHIqP2CDAPaYd5WWHS+7du+rXn5y1++1P45LD7d62udu6jgtCMty6K0smmcliMw02baPt42UNGIzPrsW\/qei\/nV62fNIjuKE79HZ\/Nh\/BZrDeHwb3H1mwg7RL0zvNnf2NXvcvlc8Fvrftd+X4IMR21Ptu1Gd\/y1HdugU7s8RrtjNzhGo8fjTjD3p4Z33\/fsNA6vvSAT9i2EXEFGkHm82ovvXnzxxajRee655yJh49O+tn1PeVpY0Hlcdwq7BiU6q7YsQkFjEyyj7YxmX1cJMnGRawth3Anl\/v0Wh\/7L\/haXv7\/17+Xq91EKHPXfWCn8GJERZDh6exK0I+2xFh9z8WjN9jhOTlq0x7Sz9\/e0hnfBNf5OozY+qtOmHar9gsyj1g7tfuITn9gUlvasWdrwtI91\/7Wvbd8TLScMLGnYKAWe6Ixb+Fx6Fn3boI0PMjyE3+LQf9nfYvd7XI72lcLs0G+sfDZXkBFkOHJ70hthSWp+bxSm\/Xtt9JX7VcODEbjg++7N9AhHYdLfBYKMIPO4Cs+v\/dqvjW542tf2C8+2EUkDxfKMWTC1LAoyaSFa\/r0\/P3rTeaxOLYs\/S4N2\/3+LQ\/\/lf4tjAscOvzFBRpDhhtuTyvGWTFWOp5F111ZMdGrvdQ2PpxJ2v4Gwb9G7ZmqgbiPICDIPfCj4Ix\/5yOipAO1rc1MBuiLTFp1oeL8UPIpBZvyITPkC0GRONffytzj0X+m3uJpWMt9OMdt5REaQEWS4zfakGmTGXA\/hLpj3uIbnrolaXzNjREbtF2TIXZz3jne8IyoupYsz2\/\/a12YvzhycBrCexzoYZMZevxAvrz+PWlF7CL\/F2n\/532Lw3S+nmOU7M6OvwxJkBBluvj0pHm\/xaOrqBhzt8Zp0fl0jc89reOaOZeEtmV0jo\/YLMqS3SxxzFqV9TfmWt7liEt4Z6qownQedxEqQKd5RKrpz1NXyzsL3hNMKTC17rL\/FdJ58+dqpkXfGy408umuZIMOR25PKiYPS3cmiaWdOZN3f7z83oyLTv3DXMrVfkKHT\/QNWteLTPndb\/wghfot+ixoztd8xjO8ftV+QoVh82rMj73znO5dF5lOf+tRS++f2sfY5RQe\/RQQZHMP4\/hFkBJk7OSzczldtL75rC02r\/XP72E3\/C+r4LfotovY7hvH9o\/YLMgAIMgAIMoIMAIIMAIKMIAOAIAOg9gsyfgQAggwAgowgA4AgA4AgI8gAIMgAIMhozAAEGQAEmfsdZAB4GNR+ALX\/0QQZAADg4RNkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAAAAEFGkAEAAAQZQQYAAHiYQQYAAGAfggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAAAgyAAAAIKMIAMAAAgyAAAAggwAAMD9CjLPnj0DAADuKUEGAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQEGQAAEGQEGQAAQJARZAAAAEFGkAEAAEFGkAEAAAQZQQYAABBkBBkAABBkBBkAAECQEWQAAABBRpABAABBRpABAAAEGUEGAAAQZAQZAABAkPHlAwCAICPIAAAAgowgAwAACDKCDAAACDKCDAAAIMgIMgAAgCAjyAAAgCAjyAAAAIKMIHP\/LJrZZNJMUqeL1fMX82Y6mTWLe7RNi9NJMz27vMb+mDbzi\/5zl2fTo+6X5fJP5s3lPu8\/yPqsfguz8yN9N+ezwvZdNvOTY31u+fu8l0Z9z5X9eaeP59V673\/s7r6d0TFd\/H0e6Lffrc91PuexfH8H+twb+37HHIsjPn9M29W+pl3edtsG2vBD151D\/gaXy+qv+z6\/ofK+O2b7ErYz7T65ic8SZAQZRnReg4NRkLkfQeZovwVB5v4RZPYKMscUBpkb2C5B5g4GmQO1XWGQWb12oA2\/sRMo+y43rc\/71ey7E2QeW3sjyAgydzLIBEUhKWDt4\/mzJslZoaBzEL4n6jREZ2PKRXLX98cFbVXEuvfH2xmu8\/ZsyurvSTFadkSCdVjvl3nbUGZeX95PuQ7O6v2z0zDIlNc7uz\/C72nZYE9X+6ZbXrj+UWMefM7prBBk1g3B2XZ\/b7Zp3RBNT4LvoPS9rjsS89P0uaSh2eX9F5l1ym1b+\/38q6Qj0753+ffK9lV\/p\/F3NNiBO898\/mZ5heMn3b\/J8Xi5+f2Fv8Gh7yvZp7nfRbTNIxvmcFnh72i53Ve\/rcKxtfk9r1+T3Y+V9ckea73jYbttm85tekwnr6std3Zaqin5dZ6dFkZkCtu1qmHz7W+icAIl+\/33Op1dJyv\/exx1PBXrR+37q9XeZ8Ntx3V\/N4Xvt19\/ajV7fSydzkaNdCx6v4vyiEz43XWfF7Vd6+8i3W+XZ7PVfrha3uq5MW14UqNLx2r6m1yub9JOpr+v3uuHfzP1IJPus3FtWfGYSduXHd5\/mWvfs8fs1Wecrpa1OL1fJ34FGUHmgQaZ4LGgaEUjBlGRTc6IhcUpKt7h2Yr4c5cNQK7Y7fH+sDFYPh42jGln7zw9c7fLiEzyOevPL++nfEcn3IfhNmTXu7Q\/0o5br\/DG290tO9rv6wJfCjJxUAk\/N3zP6nvJ7Zdu+f3vJvwuKr+LaP2SdSqe8Q6\/z\/i73Z7RrGxfZX3is\/mFzmJldGj7\/srxk+7f3vecnGQIllf+vnLbGf4uMg3\/0KhF0iGJjoHc97Ze3qqjEAfgUiDNrU\/u\/b2R5FKQqZyxry+38PvO1NXodb31KW\/X6vWZ3+AO3\/\/g9zf2eMrVqRHfX7n2VkZT0rbjWr+bzPdbW16lbYt\/y7uM2BeCTPSb3NaF0gnE67fhaQ0pHKtJjcquT+8ETOn1+TZnMMj0fgP9EJH7DovHTG+GSaUtTE\/Ghc\/tWxsRZASZ27lGpn9msz98Xx7KDYpbaTg\/7XiWCvce79+uV1rgx0yZ2yXIBK9LOiej9lO6bZu\/V9a7tD8qHZzelLVSR6o4BF\/ZpnQ\/ZM\/WhY1S7jtLtq\/0u8h03IojDYXvs5uWEYfiyvZV1mf3aUnh59SmOwTrPLR\/s7\/Poe8rc2Ki+ru45jTC3O8x6CAMHyvl9cm9Pxwx3TfI1JebO+4HpuJk16e+XeFva7Oeo77\/MKSHv\/l6DS0eT7k61au16TIqNWxs2L\/27yYXZHLLq9Xs9LlS+1CvnWntLq3vdlRgl+lJY9rwyvKKAWvENTKF15dry7hrZOLRk\/6ofOm3mD1mgu+gtl7x++snnVwDI8gIMvdgatmzQmezeEFhMlQ9SYtAWlx7r5\/Uz3Tt8P60Mc0W+FFn8He4RibpnIy58LJcVOsNU3Z\/DHXcestrXzu2s9F\/vHjmsLdfK6G2GGQKv4vM1J9dg8zmDNpmWtnA9g38ThdjphjlfkO1KV61aULR3zO\/tUJjWwwy2d9FbtrluDnq0bIKnaNxHchaZy3e\/vD12f27c5AZudw9T7T0z8YPTY8tfX7p+w+nTVZGCkceT706Nerk1kDnujIlsXS87\/O7qV0jky4vX7PTY6nUPizq03LP67+v+BhaTVkef63R2DZ8+FgtXqdZCDKl19dry9DUsvJvtPxbrBwzaZAprFf8\/lKQ2a82IsgIMncoyJTPII8p9rvdwWXfO8DEjWmhSB5kRKYcZEadsamOyIw5I1cYYap03OoBZeyITPD3akd7YERm8\/eRv4tDBJl1xy7uKFS2b\/TvdOR31q1nNCWhcvxU9m\/aqJc7evnva\/SI0ph9UDtzWvk9jj2zXlqffUZkwjOv+43IjAgyo0Zk6tvVu84w+fzy9x+MOJ5Vpr6MPZ72HpEZU8Mqv\/0D\/G52CTL5mj02yBxyRGaX\/bdHkNnhWL3WiMyY2rJjkNllRCY3Hay2XuODzI61EUFGkLkrQSY3lzY\/jWB11mNVBLKNa+bag2jOc7Egjnt\/8RqZaH5t5v0DIWJckKntp9q+r1wjE6x3cX\/UGpeksShezzN0jUw0h7x2YXH9GpnoepOBa2Si38VBgkw6l3pg+0b+zsZdIxOfRU+vK8odP+ODzPosYXiGeej7Kv4uCqNYo4NM5rqCUoc7cy1G\/1gpr8\/oa2SS7\/N618iMCDJJmMxfI1Peruj1Y65ZTLYrPCterO1jj6fKdQm1769ce8vtT\/Tbv\/bvZmyQqdXssUEmt73t6\/JBJvd57WvC72D81NXrBJla7SsE+KEakpmCWbyWbNcgM3iNTOaYKV4jU762thxk9qiNCDKCzN0JMrU7iMXTnRZB8a\/c2WnUnZF2f3\/trmXDd6PqXp9Zn24KxIgzs8U7rVWmVSzvMlW4a9ng9gydJYumbxTuvLW+o0\/xrGJw557sxedDd\/lK7xpUmtpV+l3sFWQy32dv\/1S2r\/o7jafPVPdJb9pF\/Hzx+KmOeCVTHNJRweCuZcV1K\/0uCo8Pje5t9tH5+BHCRXAXqeKUmuLvd8RdyzKf0ZsSu+NdyxZjzshGdwCbb4Nu7\/qhwtSyq99j\/a5zpe9\/5C1zdzmexty1rDDSOXRXv+Jv\/5C\/m8z3W15e5Y5X1ZGS3F3ayqPNud9Xru0ad13RLlPLKsdq8bvufmuZu5aVfhuVY3bvILPDXceK+7F2zI0ZkRmzXff03+ATZAQZeHz\/Lsk91J\/Wcfjte7i34Lxq4J2BvOP\/FtYN\/xs5AIKMIAOCzM1sR\/8M+qG37wF39jf\/dgV3OcjE02wABBlBBgAAEGQEGQAAQJARZAAAQJARZAAAAEFGkAEAAAQZQQYAAAQZQQYAABBkBBkAAECQEWQAAECQEWQAAABBRpABAAAEGUEGAAAEGUEGAAAQZAQZAABAkBFkAABAkBFkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAQZAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQAAAAEGQAAQJARZAAAAEEGAABAkAEAAAQZQQYAABBkAAAABBkAAABBBgAAEGQEGQAAQJABAAAQZAAAAEFGkAEAAAQZAAAAQQYAABBkBBkAAECQAQAAEGQAAABBRpABAAAEGQAAAEEGAAAQZG44yIxdLgAA8HAJMgAAgCAjyAAAAIKMIAMAAAgyAA\/f2Yeb8n+\/8n+arz3YZz1tLtaLvfixyuu+9\/80v7h81a82P\/i9t7FP3t\/84K80A\/\/d1roBIMgAMBxkDhpmBBkABBlBBuDQQebDT+PnfuzjB+6035cgE\/va9\/\/qEUanABBkBBmA4wSZXvAI\/v7hj2\/GJrahpD+SEQeWcHnbP7f\/\/eL73z8cZDaP59a3W177nnDZ3TJyj+0XZAaDX+Z10ahXJhBtPqMU9NJtNyIEIMgACDJjR2Ti8DH8XBpSyq+JXpcLMj\/28YFpb5Vl\/8qvJiGg\/e\/jzdm+IzKb9YuX0e3HbjvGXntUel1\/f5jeBiDIADD+GplNwAnCQjKqsF1G0LmvBaFsR3793l6Q2Y705EZ\/0tGizfqG4af32PgQ0J9alluf7vO327\/drlwgWz+WC0XpY8lIT\/j50UgWAIIMgCCT6yiXrnEpPZ52uAuvS4NL8e+1dcwtu\/bYdYJM8FgakIJRrfxIV7xP0ill2RGXdPtdqwMgyABQu0Zm7MX65XAQT7cqvS55fMcgs1rv3LLHPrbHxf7RqEluhKY\/1Sz3eD3IbJdXel31pgkACDIAgsxdGJGphY8bDjJheHl\/\/ZqZUSMyu4yyhFPmjM4ACDIAgsy+QeZA18j0LqbvXyOTu14nvkbmpoJMf5SkNPIy7hqZYJ9uXrPal9nPT17jdwwgyAAIMnsEmdr0r5u9a9nNBZmhWzpXb6KQu5Zmn\/02+J0BIMgACDID\/6Dlkf8dmTTMRMHiNoJMZjSpsF+jsJLZz2mY6d+NrB9m3LEMQJABgD3Ub4M8PiACIMgIMgAcXTo6kr9ORZABEGQEGQDu5EhMbYqaIAMgyAgyAACAIAMAAAgyggwAACDIHGoFAAAABBkAAECQEWQAAABBBgAAQJABAAAEGUEGAAAQZAAAAAQZAABAkBFkAAAAQQYAAECQAQAAEGQAAABB5qaCzLNnz4AHQPEFtPmgzRdkAEUNEGQAQUaQAQQZQJABBBlFDRBkAG0+aPMFGUBRAwQZQJARZB6xRTObTJpJxuz8+stfnB5uWdv1nTWL9d8vz6bL5U\/PLn2XihogyHBNXbu6W7t92cxPps384nbX\/fB9DgQZRe3eBpm7FxC6dd0GGRQ1QJDhNoNMG2LatlmQQZBR1O5KODifrcNMWJiS0HO62L7+Yt5M28dOZs3sZBuCoqKyXmYUjrrP6Za1+dxOt179wNUuMxqRGbP82jbkPv9k3lz6nQgygCDzSIPMph0\/W7fzUdvchZj+CdBuOf2+RLzc1XPrtnnT5m77JrPTsL3O9wWKQUabLsgIMo80yPQKQn7kZhMaLsICty1a2WUEhSR6vreM4eIVTy0bWP7O21AIOwgygCDzyIJMvm3MB5k4xKTh51n\/+ZPp+mRoGmTCNr\/\/Welyx\/cpfM+CjCDz4INMfbSjKyjr920KRnzWJT07svp795qBqWKbUZ7+GZrSNTLV5Y\/dBkVOkAEEGUEmDjLpzIlN25xOLUva1l77uw0p3Wdsgk0myJSnifWntGWDjDZdkBFkBJn82ZWggPRCR32YtzgVLHcmZocgU1v+4DZUhsgRZABB5lFPLTtP2uhikKlce9uGimx\/oTy1bFG5FiadthavqzZdkBFkTC1LpnAV7242NsgExWp+mozgpMvYY0SmtvzBbRgMUggygCAjyOwdZNr37B1kSiM\/pSCjTRdkBJnHG2Q2U8VK07KGpoGVi0p0JiV4fWl0ZbcgU17+4Dbc4TuxKGqAIMP9CDKZqWWFWRfDU8uCZRRPbg4FGW26ICPIuP1y6XXF0ZNKUQkuwAtDRXHEpHDxXzjlLQonheUPbkPvjmnO3ggygCAjyIwLMtvpY6X2vBdcBi\/2zwSZ4vTwZ9k7pWrTBRlBxj+IWXht7UxJ7exI6axIXAzb9ywq08OKQaZ61qWyDdXbPyPIAIKMIJO7Q2jUdq4vrk\/DSjobYjt7om1nx10jEy2z\/ZxkpsXg7Ze16YKMIAMIMoAgw362Jy17\/\/yB0RJtviADCDKAIMNdVfq3adxVTJsvyACCDCDIcC9GZfxDldp8QQZQ1ABBBhBkBBlAkAEEGUCQAQAAMCIDODsDGJEBjMgIMoAgAwgygCCjqAGCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ0QZABtviADCDKAIAMIMoIMIMgA2nxAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNVDUALT5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw\/afEFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQMEGUCbL8gAggwgyACCjCADCDKANh8QZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDRQ1AG0+aPMFGUCQAQQZQJARZABBBhBkAEFGUQMEGUCbD9p8QQZQ1ABBBhBkBJlb8eTJk704OFDUAEFG2w+CjCBzq8Xs6dOnO1HMUNQAQUbbD4KMIHPrxWzX\/2rFbHE6aSYn8+YyfPxi3kwns2bR\/vl81n8+4\/JsOup1z0qfs4d23adnl6u\/j1xPFDVAkHnsbf+yzZxMm\/lF+PhlMz+ZNLPzSvs8st2O2udj0\/5r8wWZR1rM2oJ0MmtmJ0kxu6kgc003WigRZABB5kEEmTawTJvZ6TRpQ0cEmbvYPgsy2nxB5nEWszZ8tIVmGUJOF7sHmeUZncnyrE5bELevWxXD1XProrhZ7tVnLp+7Wv7mc4LimSmCy\/WbTDaf1Yau8LHl67r1TNc3KsaF9epGprrPCPcFggwgyDy4k5hX7WQvrOw4IrNsb9uToQPtc9RfSGeBLJrZpu29WlY3SpT2F9JlhG142O5Hr9k\/iCHICDJ3vpitzsisRmLaQhIc8GOCzPI1XSFZB4T165ahoAsD4fB19J74c+IwtdgWs+X7t+sWLjs\/tSx4b7Lc4npF2xjuFwQZQJB5mCcxu3Zxe1JvjyCT9gNy7fM6lKza1f7ruj+vAlCtv5C07WF4KbT\/Zm1o8wWZh1rMujMyQUDIBYxikEkfjwpJrTAGIaFXEIdHgdJg0g8yq89bPR6O9FTWy7C0IAMIMo\/uJOa6\/ducRNwnyGxfU2qfe1PPC8EjOomZ9hdqfZDi8tDmCzIPtpjF07WSKVUjgky9ME16y14WtLQwRn\/fFqB4bm08HSxcz9LF\/pti2lt+Yb2eFYbCEWQAQeahncTstYXx9OvdppZt+wHVIJP7zF5YSYNM\/PnRFPBwilq4HuH2OUGpzRdkHmoxS0cnKgVkrxGZwhmRapDpCt8iOluUBqbhEZlgudGZprFnavrX6yDIAILMQwgy0RTr3jWpRwwy2WtPh0Zkgs9PRn\/yIzLlGRxo8wWZh1TM0oIQdOB7IyfFaVdhGKpcIxPOcx0IMpuL9NLCuPn7elRlKMgEozi9C\/oz6xUXO9fICDKAIPNYTmKG7exxgkw6TSz8Zx\/q18iUgkzc59isR\/Ie18ho8wWZB1rMcmdktkUkvJvY2LuWXRW+s\/Cam3g6WFzMKkFmXWTjwhNOCVuPsoRTyNK7lqXbkglr\/SlkpccRZABB5iGfxAxP7B0uyETtc\/VuYts2fnrVjyhPLQvb6avXnOfXI5rGZmqZNl+QeQT\/KBYIMoAgo+2\/baWghTZfkFHMHBwoaoAgo+2\/O9Kb+ZjWjSDzKILMPhwcKGqAIKPtB0FGkAEEGUCQAQQZRQ0QZABtPmjzBRk\/BlDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ1Amw\/afEEGEGQAQQYQZAQZQJABBBlAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNUAnDdDmgzZfkAEUNUCQAQQZQQYQZABBBhBkFDVAkAG0+aDNF2QARQ0QZABBRpABBBlAkAEEGUUNEGQAbT4gyChqoKgBggygzRdkAEEGEGQAQUaQAQQZQJsPCDKKGihqgCADaPMFGUCQAQQZQJARZABBBtDmA4KMogaKGoA2H7T5ggwgyACCDCDICDKAIAMIMoAgo6iBogagzQdtviADKGqAIAMIMoIMIMgAggwgyChqgCADaPNBmy\/IAIoaIMgAgowgAwgygCADCDKKGiDIANp80OYLMooaKGqAIANo8wUZ4MEVNfsWHM+AICPIADo+gOMZEGQUNUDHBxzPjmdQIwQZQFFTI8DxDAgyggyg4wM4ngFBRlEDdHzupot5M51MmknOyby5POZnn8+WnzM9uzz+9h17W3A8A4KMogaKmhpxR4JM63Rxv4MMjmdAkBFkAB2fBxxkeiMWi2a2DDOzZrF+7PJsWhyx6Z6bns3X72tNm\/lFbpnr5WaDzGUzPwnD1Pbzt89dLfdstnnN6v3h+4L3RNuXLrv\/+ngb0\/XH8QwIMooaoONzv4LM+Sw7YtOFkF7I6YWdUogIg0zpNV2gKD8\/PSmMJO0QZPLbEAYpHM+AIKOoATo+92JqWXHaVxds1oFhEwK64LJZbhqEtsFgcZp8RveazEjP6nO2QaR7T7eMzXvSZQwGtXREJwgupr45ngFBRlEDdHzuW5ApTKtKX58Emf7oSjzaEYWCJCh0oWR2ngkc0YjKdt16y02DSzbIBFPcNtcAhdPebvA6Icez4xnUCEEGUNTUiANMLQuCSi50bDr1hRGZ6wSZ7jXHDTLB9LJSuLnpu7c5nh3PoEYIMoCipkYc4BqZzTSwbWBIR0viKV\/DQaY\/taw\/TWz81LL9g8xmKlrv2pfM1DIcz4Ago6gBOj7362L\/9NqTbQDIT7saDDIHvdh\/3yBTGnVZLa90w4J4hAjHMyDIKGqAjs89uGtZFxIWyW2Vh6aO5UY4kmWcXeP2y0cIMrm7r7nQ3\/EMCDKKGqDjA45nxzOoEYKMHwMoamoEOJ4BNUKQAXR8AMczIMgIMoCODzieHc+AIKOogaKmRoDjGVAjBBngoRc14GFQK0GbL8gAzuACjmdAkBFkAB0fwPEMCDKKGihqagQ4nh3PoEYIMvfPkydP9uLgQFHT8QHHs\/YeBBlB5lYL29OnT3eisKGoCTLgeNbegyAjyNx6YRvz3\/n5eXN5ebn8c7+wLZrZZNJMErPzfdbpspmf7PveKxfzZjqZNYv0z7fhfLbeF9NmfjG8vyYn8+by0Otwl\/aHjg\/geL7z7X34Xy7ILE4nzfTscvDzxr7uYO3todpQbbcaIcg8rMLWhpjnnnuueeUrX7kMM6UgE4WP5YF3jUByiIP\/ll2eTQtFPLO\/HsH+0PEBHM+CzF0PMtpuNUKQeUCFrQsxrfl8Xh2RSQ\/uthhEhWVzliM8g7EagZmeTNejONsRmbQILpd3uugva\/PZ4dmSqwKwKQT9UZ5o2dn1Sj+jUlAy71+ua\/dYt86jimG6ru1r12eF1tszOy2Meq3D43Y9SvvjWXW7l\/vmdJYsa\/tcebt0fADH86MKMssAcdUunUyiUYywDRxsa8O26qrtidu8q1BxErTB2bY\/CTKPsu1ef\/7pLLv+D6HtFmQUtZ0LWy7E7BJk+kOj3TDt6oBbHUzhn5NiEJ1hCR6PlpUEpsJwbBSCegUmt17Ba2pnaKKRp3hb4s88VDHcNgrLwrTZP\/H6bhqa0vB0Zb1XBS\/zut73kQ676\/gAjudHF2QqbcnmdcW2dt3mhO1m0uZt2sNa279pnx5r273+cxTm1st9IG23IKOoVQtbG1Re+9rXDoaYfYNMdnRm+ff1iMym0BQCS22YNTxISwf\/8qAO\/hyefcmuV1xcRg9nB58zVAzjebbdtg0Vw2Cd0jNQuWH12v4orHfYqJSDpaImyIDjWZCZRaMeYbsXvm58W1tp82rt76Nvu9O+VPD5D6TtFmQUtWJha697aa9\/aUNLG2ZqIWanIJMWhmwBSA\/+8O\/bP6eFJRomDYdXixfIbQ\/qXnEtFabecG9+Lm30XHEU6HDD04tMIe6tx0AxrK13PKUvXp\/sdAFFTZABx\/Mjnlq2bUuqQSbX1vbCSqXNq7X9vROaj63trnz+A2m7BRlFrVrYwjBTCzH7XiNTLgy1ILN9X1u8ormwhaJQu9PHqqguomHV8npltiX3umuc1RlVDGujUkcckSkFmYPdXU7HB3A8P64gU2wPRwaZWttfaAMfT9tdDzIPoe0WZBS1wcLWjsS89KUvXYaYV7\/61TsUthF3LUvOumzniNaDzPbMSqmYJfNCa7cs7C6Q653NyKxX8t6bnmdbni9cC3DJdrTL2PMamVyQibfHNTKCDDieBZlxQabcBxi6RmZk29+tx6Ntu8tB5qG03YKMojaqsLVhphZirvXvyGTvJDIQZHo3Awge6+6Qcp5OISvc6WP9XK+oFe5wEg2F1+aXFu7Esl8xjIfFp2fzUcPT5fWo7I\/aXcuyIzLhfje1TJABx7MgUw4yXRuavWtZpm0ebPNqbX86XevRtd21EZmH0XYLMoraUQsb6PjYt+B41t5fSzp9DAQZRU2QAR0fcDwLMnevvY9HCyaTxzXtCUFGkDlAYduHgwNFTZABx7P2HgQZQQbQ8QEcz4Ago6gBOj7geHY8gxohyPgxgKKmRoDjGVAjBBlAxwdwPAOCjCAD6PiA49nxDAgyihooane1Rrj7EAgygCCjqIGidi+DzNOnT3ciyOB41uaDGiHIAIrarQeZw\/3Ddut\/kO50ET\/e\/gvbJ\/Pmcv387HxovRbNbDLmdc8Kn7PPvmg\/s\/sH9Mau520r7aeR638xb6Y39S+f3+RnCTKAICPIAILMTkGmDRKns6vOddJhvakgc+1QcN\/+JfBr7idBRpABBBlFDRQ1QeZZszhddarb\/0\/PLncMMuvRnMlkHYaC1y07wevnws7wcrnT1XPt8rvPSUdmok70qvM\/6SxHj4LPXoaZ7Xqm23J5Nt2OOJXWK1pesi\/SgBesy2Z7l+t\/tQ+idRqxn3IjMuttn52mnxPuh\/W6F7dnvd3rdZmdbvfBcv+cTIPtjLd98z1E38HI\/eN4BgQZQQbQ8Tl+kFlsR2LaTmsYJEYEmbZDvOn0rjv4YYe7e0\/\/dUEnf\/M58ejKNnysPn\/TcV52rrvXFaaWRaEoXP\/yekVhJ9wvvRGKZB2z2x9P1yvvp1qQ2W5z9P5MwMvu595+KqxP9\/do2+NAtRi7fxzPgCAjyAA6PjcSZJbTyhZBRzoXMEpBJn08CRJhRzfsfKfPJZ8TjhDkR4HC8FIIMmEnvvbZxY76Htf3JMtOg1h2P1WDTO672H97wr\/HwWV4ZGjv\/eN4BgQZQQbQ8TlGkFkEU5d6U4YGg0x6rUcaZNJlrzvm6RSy4O+bznJ6bUZveQNBJvhz1AGvrVeyP0rXsPT2WRhkgu3afm5lP40IEMNBJr89aVhJg0w0NSyanhZsf7IeY\/aP4xkQZAQZQMfnuEEmPeuf6yRfZ0SmdCeySpDZfH40UpQGgREjMkHHvbsGaLc7pBVuIlAcTaoFmX1HZEYGmcL2DI3IbINMMnWvth538CYL2nxAkFHUQFF7ZEEmur4jN8oy4hqZ8jUicfhYXXRe6HxnrmeZ9IJLuqzhILMdZQg74uX1ijv3hWtAoiCzXtfBIFPbT9cMMrX9PHCNTDHIhOsXfNao\/eN4BgQZQQbQ8Tl2kInPwmcu4N\/1rmVXr52flu5aVrjeoxQAinffatd50ZtClt61LFq39LqO0nold0Yb3N72vefl0ZF4RKSyn3YNMpv1zN21LB4l2e63WTOvTS0Lp6itR7GWz1fuHGdqGSDICDKAjs8t3rWMx+GyGFwdz9p80OYLMoCOjyDD3ZHeCOAO3nHM8QwIMoIM8AiDzD58\/zietfmgRggygKKmRoDjGRBkBBlAxwdwPAOCjKIG6PiA49nxDGqEIOPHAIqaGgGOZ0CNEGQAHR\/A8QwIMoIMoOMDjmfHMyDIKGqgqKkR4HgG1AhBBtDxARzPgCAjyAA6PuB4djwDgoyiBoqaGgGOZ8czqBGCDKDjAzieAUFGkAF0fADHMyDIKGqgqKkR4Hh2PIMaIcgAOj6A4xkQZASZG\/DkyZO9ODhQ1HR8wPGsvQdBRpC51cL29OnTnShsKGqCDDietfcgyAgyt17Ydv2vX9gWzWwyaSap08W93z+XZ9NmcjJvLtPnLubNdDJt5hf99yxOJ8307PL467dch1mzSP+8y7ZlvrfZ+Yj3n8\/y+0XHB3A8P+D2ftXG7d\/eXzbzk\/V7vvI1I9qt1etX7VLb18i3uzVj2+Qba7vveRuqRggyDzbIxB3gsPg8riBzK\/YNMum2tcV1zHIEGUEGHM+PN8hEwWUdTkaFmba\/sFtbFb9XkEGQUdRuJMgkRWHZ0e7O3nRFLC5Kccc6DELBGZzwc9ZhYnoyKXS+k5GirsiuO\/2z08IoxLIz3z4+vXrNNUZkRn\/OJPmMeHs3z6Xbuwkv4XbOmr+bFON2v+aKcz6kBd9JGo7CwpsU4fAMXfhZ0Zm7OzJCp0aAToogc8ggk2kTi23+ZNO+zt8atDHLNuWqvTwJnr8I+wJhuxg\/NzSbIOqLFD4nnKEQvTbbRgfbcTpL2sykTxIuI1zHtD3t7SsEGUXtloNM+Njqz11xWBbB9QHc\/rl73+K0LQBhwVv9OSqaywM+LBql4rUqcHGQit+XW594mesiea0gU\/ucpBivtzFuJIL9mG5vaWpZFDLaZefXc3BEZmSQiZYTruPI9dDxARzP9zzI9KaAhW172I4WTpatO\/NR27v8jPLUsmLfYCjIZD8nd\/J1uI1eBaBCnyTpJ0Rt5aZ97J\/QvbFRITVCkFHY6tfIxAUh6BAHB\/fywO6K1em8WVz9fdMJXj6ehqSgqO00vWvRO2uyeV9lpKE4\/Ds6yOQ\/pxciisPMle0tXiMTDN23jxeGr\/PXyBSWX9xPSWAMt\/+ODp2rEaCTIsgcMcikU5R77VMpyGzfE\/UNskGm0jcYDDK5z4lfV26j0+ltlb5FbTpZcXkIMoranZlaVr7uIjnw24O5\/X9bTK5e2xaS7VmJSkgaui4kGdKdjJgyNTpg7DC1rPg5ve0KQ0nmAvxsIMyPnnQjXbWzO+m29hqnHYJM6cLP7HC9jg\/geH5gQSboB\/Ta3vAkWSXIBO3R2CBTPIFanVqW+5xMkMm10b22vzIdO3djhNxJ07DNd92MIKOo3cEgUxmRWRWpq+fWAWb53Ok8mIZUOVtRDTLpOu137cdRg0z2mpF0hCMdkRkXZFYjWvPqdK7+1LJ4CmC6zPyw+NibOtydmz+oEaCTIsgc8RqZ6mj8IYPMuJGMvYNMto0eGpFJ2uGxfY3M+iDIKGp3JchUrpHZXhsTzFld\/r0wUhDOQd0hyPTnsRaKS\/S+Q1wjU\/ic5P3bfZIEmXA+7y5BpjtbVTm7M+4amcK+KI5ibb\/ruCC7RgZwPD+Ou5bl2t8RU8t2CjKVvsEBgky5jR66RqYUZAptaOaEoWtkBBlF7c4FmdIdTPJnLfq3QIynLxWvvalcAzI9W5RHNnKjMN2UrrPCNSaZ6V9dMRsVZGp3KgkfvyqWxeX15h1PBvbjmLuWxQ3Sdh9ebdvZuLuWxeFlYmoZ4Hh+aEFm6N+RidrIESMYo4JM16bk71pWamPGBpmuvcvetSx3onD52nllallyp7Xz\/PZG09hMLRNkFLXbKWzcNS4g1PEBx7PjWXt\/VGP\/7TUEGUFGYWOk5LbP6PiA49nxrL0\/hPQGN04YCjKCzK0Xtn04OFDUgIdKe6+9R5svyACCDCDIAIKMIAMIMoAgAwgyihooagDafNDmCzKAIAMIMoAgI8gAggwgyACCjKIGippOGqDNB22+IAMoaoAgAwgyggwgyACCDCDIKGqAIANo80GbL8gAihogyACCjCADCDKAIAMIMooaIMgA2nxAkFHUQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNQBtPmjzBRlAkAEEGUCQEWQAQQYQZABBRlEDRQ1Amw\/afEEGUNQAQQYQZAQZQJABBBlAkFHUAEEG0OaDNl+QARQ1QJABBBlBBhBkAEEGEGQUNUCQAbT5oM0XZPwYQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyBzGkydP9uLgQFEDBBntPQgygsytFranT5\/uRGFDUQMEGe09CDKCzK0Xtl3\/Kxa281kzmUw2pmeX8XMn8+Zyl\/W7mDfTyaxZ7PyeSbQeS6eL43weihogyDyy9n5xGrexs\/Njtunr95T+vM\/70eYLMgpbP8RMm\/lF99hlMz8Jwsw+QWYfy0IVrkdr0czGFFpFTlEDEGSq7f0yxITt+foE4lHa2NJ79gkyaPMFGYUtX9iS0JIrIOsgM9+cxQkLyypo9EZPeu+fNbOT7nVpWKkFmVXhXa3fal23Bbf97PXr04IXjjDdRAhDkAEEmXvY3i\/DzbLtHm5j52fTTDu+el88oyPsG1y1zZs2uvR4OgNkxOt6bfx6\/U9nu83oQJARZO5xYSuEh9y0s1VxWxesoOhtimK4rDTIZN+\/64jMyCATLafyeShqgCDziEZkLrsgkm0Th9rY7fuWy1kHiOWfN8tr3zMwnaw2ZSycAVJ9T7lPsnl\/b7YJ2nxB5oEGmYGh22Ux2L4mLlpp6CgFmRHvL1wjsz17NC7IhAX2RqfGIcgAgsxdvya2NJNisI0NQ8H2uXqbfoQgk7bpmz5GOuIUrL\/2U5svyDzyEZmgaERFK7lJwKQUZErvr61LEoB2CjK9QGSeraIGCDKCTHm62Q7Tt5OQEN5AYPP+IwWZ3snKzXOV9dd+avMFmUd2jUw4PFwMIumF+JURmX2CTO\/CxKRIFaaylUeMUNQAQeaxtvdBu55ON8tdI9NrY4P2uXgStDblezjIRCFlzxEZQUabL8i4a1l8XcnIILMaCTlskMldIxPN0R28RiZzlxYUNUCQeax3LYva31UbG47IlNvY7UnPMHBsb8iz7zUySRt\/zWtkBBltviDj35GJC10liITTuKZni20ROViQ6T4jLmCrz5uPu2uZaWWKGiDIaO+z\/45MNCNjoI3d3rWsfPfSOEjk7joWPB71I64+6yzsL5TeP3DXMkFGmy\/IPPY5syDIAIKM9h4EGUFGYQNBBhBktPcgyChq28K2DwcHihogyGjvQZARZABBBhBkAEFGUQMEGUCbD9p8QcaPARQ1QJABtPmCDCDIAIIMIMgIMoAgA2jzAUFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQPQ5oM2X5ABBBlAkAEEGUEGEGQAQQYQZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDdBJA7T5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw8IMooaKGqAIANo8wUZQJABBBlAkBFkAEEG0OYDgoyiBooaIMgA2nxBBhBkAEEGEGQEGUCQAbT5gCCjqIGiBqDNB22+IAMIMoAgAwgyggwgyACCDCDIKGqgqAFo80GbL8gAihogyACCjCADCDKAIAMIMopazZMnT\/bi4EBRAwQZ7T0IMoLMrRa2p0+f7kRhQ1EDBBntPQgygsytF7Zd\/+sXtkUzm0yaSep0ce31uzybNpOTeXO51\/vb9Zo284vMcxfzZrrvOi\/fO2sWCoSiBggyj6q9f9YsTifN9Oxy8PPGvu4gwnb5oG30ZTM\/mTSz8\/2X0e6HXl9jr\/Wr9GkQZASZ6weZ+EC\/\/sF\/\/CCTPpfbDkFGUQMEGe39vQkyB3WgIJOcJF32bXY+2SvICDKK2g0GmaCIrUPD9CQ4CxGNiCTF53y2fnzazE67IJMWk\/SADkeF2uWtXt8tp3fgZ4NMWHgrn5cWzM36Tq4RuhBkAEHmngWZtv07mTWzpL1ddtTX7WL02mxbGbTfp7OkrU36DuEyNv2OpP0f1Uav2\/jT2cCMjPXrzrZ9lm570qDWbnMuuOWCzGq\/deuSzGrpXhtt\/19uXpP2aaJ94eSqICPIHDjIBI+tQ0scCuJisDmgo9euw8hgkImf257puM6IzMggEy1nvb4HmFKHIAMIMvciyKRt9roNjF5XaSvDjv4qAIVtbdAOJ+12NGOjNLUs16dYflbYv+i2I9df6E6KZtr8KIy0r8v3N3JBZvvYavnZ\/ZTtO3WfEfdvSiEKQUaQucY1MvkClhnRKBaG8O87jJBc4xqZbSEY93m9qW\/p+iPIAILMgw4y2\/Y3nDIVvq7cVuZmV8QjMsWpVGF7WwoyuT5FMGtj2+aX+gvp68Ltat8TfGah7c9eI1PsJ9S2vxxkEGQEmSNMLSvOXU0KX3hAlotdJVj0lrfHNTK9ZewQZA5yER+CDCDI3MepZds2uxpkcm1lrbOeOUnZCwUDQabXp9g8NzRdvXyNTLhd7Z\/b52ojItmpZdnp9MnUsd72J+sYnpB1AlWQEWRuMMgcYkSmN\/x6zSCTTnEb+Xn7XbCHIAMIMo8syGTbyqERmcpJ0AOMyIwNMulsjWj7T+fFaWXDQSbtP9WCXLlPoy8iyAgyNxlkatfIZK5TCYNMdh5t8vnbMzDXv0amPG83d41Mui0IMoAgI8jU2sr6NTKlIJNc47LnNTJjg0z8OZkbDVXa\/V2CTHX7KyHHNTKCjCBzo0Fm7F3L1ncKSW4EsLqWZV4eYk0L3Q53LVsVkf6d1aLPq90RxbQyQQYQZASZzXSy7F3LMic3B9va9G6k5+Hz3TJ2vGvZ2KllwV3Lindo3SvIpHd4W2zXq7j9\/TvDOYEqyAgy1yxsoKgBgoz2\/lqK17zeVS66F2QEGYUNBBlAkHmE7X04ylKYQXFXrWdtmNIlyAgyt1zY9uHgQFEDBBntPQgyggwgyACCDCDIKGqAIANo80GbL8j4MYCiBggygDZfkAEEGUCQAQQZQQYQZABtPiDIKGqgqAGCDKDNF2QAQQYQZABBRpABBBlAmw8IMooaKGoA2nzQ5gsygCADCDKAICPIAIIMIMgAggwAAIAgAwAACDKCDAAAIMgAAAAIMgAAgCAjyAAAAIIMAACAIAMAAAgyggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwh4MMAADAnSDIAAAAggwAAIAgAwAAIMgAAACCDAAAgCADAAAgyAAAAA\/L\/wdCDxQclZwmpwAAAABJRU5ErkJggg==","width":424}
%---
%[control:button:37b8]
%   data: {"label":"Run Calculus Flashcards App","run":"Section"}
%---
%[text:image:34d8]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
%[output:0e030be6]
%   data: {"dataType":"image","outputData":{"dataUri":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAArwAAAGmCAYAAACeH1cjAAAQAElEQVR4AeydC7xVY\/7\/vxuNUFR0JVMxaEhukXKfqEHCaHRixnWaEgbFmR9jJjLINONWGPN3Nx3GNdcxcokicktMIonQjUqiDPI\/79VZp3322fe99l63T6\/W2Ws961nP833ez95rfdZ3fZ9nrfeD\/omACIiACIiACIiACIhAhAmsZ\/onAiIgAiJgZoIgAiIgAiIQVQISvFHtWbVLBERABERABERABIohEMFjJHgj2KlqkgiIgAiIgAiIgAiIwDoCErzrWGhNBEQgfwLKKQIiIAIiIAKhISDBG5qukqEiIAIiIAIiIALBIyCLwkBAgjcMvSQbRUAEREAEREAEREAEiiYgwVs0Oh0oAvkTUE4REAEREAEREAH\/CEjw+sdeNYtAAwLffvut\/eMf\/7CDDz7YunbtaoMGDbJPP\/20QR5tiIAIhIOAfs8Z+0k7RMAXAhK8vmBXpSLQmMALL7xg3333nT322GP25JNP2pIlS2zs2LH2ww8\/NM6sFBEQgUAT0O850N0j42JIQII3hp0e+CbH1MA1a9bYgAEDrEmTJrbVVlvZrrvuagsXLrSvvvoqpkTUbBEILwH9nsPbd7I8mgQkeKPZr2pVCAkceOCB1qFDB8dyvLpcMHfffXfbZJNNnDT9iS4B+nvZsmXGY\/DotjJeLfPq9xwvamqtCJSPgARv+diqZBEomsDHH39s8+fPtyOPPNISiUTR5RRy4MqVK+3uu++2o446yn79618b2\/kcv2LFCuc4vNPnnntuPocoTx0BGF9xxRW255572gEHHGDvvPOOs4fY7X79+tkJJ5yQdz84B4bwzwcffODEq\/\/kJz+xbbbZxvn+vfXWWyFsSWaT\/fg9Z7ZGe0QgngQkeEPf72pA1Ajg7ZswYYIjOrt06VKx5jVr1swRXgsWLHBiibNVjFBDkJNn0003tY4dO9p7771Xlnhj7MH7aSH9l81+mHOTsO+++zZo3UYbbWRbbrmlIwA33HDDBvuitPHJJ5\/Y2WefbXvssYf97W9\/s8MPP9zefPNNGzp0qCGEo9BWL3\/PMFm1alUUsKgNIlBxAhK8FUeuCkUgMwEujg888IC1atXKDj300Ip5d12LCJ\/IJbCw8Y477rBHH33UPcyaN2\/uxB7XJ3i08uWXX9qf\/vQnw0PmUZEVLSYf+xOJhK23XsNTccuWLe2mm26yP\/7xj2XhagH5d++999rAgQNt5MiR1r9\/f7vqqqvsV7\/6lTM7CYO+CjYzYAfwW\/Hq98xvgN8C36mANVPmiEAoCDQ8y4bCZBkpAtEl8O9\/\/9tmzpxpxx9\/vK2\/\/vr26quv2pQpUwLTYC7gjzzyiF199dVltwlP1qWXXmovvfRS2esqRwVht78cTJLL\/N\/\/\/mft2rVzbuzc9EQiYfvss4+zuXr1auczzH+8+j3zhOP\/\/u\/\/7MMPPwwzDtkuAr4SiJvg9RW2KveXAI\/hr732WucC+9Of\/tRcD9KsWbOcR\/nnn3++IejKZeX3339vDz74oJ1yyinOo2rCFvDWnHnmmbbddtvZJZdcYiNGjLDHH3\/c+vbtazzmxqOz7bbbpjVp2rRpNnjwYLvxxhttyJAhjkgm9pM2IJovuOACp4zbb7\/diAclPOKwww5r8KgYJhdffLETN3nGGWc4tnFxTVthbSJhC\/fff78hVp544gmDWXK8JSJlzJgxtsMOOxgxmb\/\/\/e8N4Vd7qMMW5ieddJINHz7cevXqZdiYqT7KR+xS5vjx441yiRfG5tGjRzuPwm+44QY76KCD7M4773TKZz9xyMQT0x6OwRaW66+\/vj5UA0YPP\/ywYQscyUsc7X777Wcw4jtBWQju3\/72t0Ys9c9\/\/nN75plnnHp4tEzZPXv2tJtvvtmJQSX+FLGGzbQ3k\/3sy7YwcG3SpElOSMvPfvYzW7x4scMQjzqx1fT5ddddZzvvvHPJjLFj+vTpTggBAyR\/85vf2DfffEOy0zc9evSw5P51dnj050c\/+pEde+yxhjc7uUjaz0wl22+\/fXKyuf3Bdwb2+++\/v+211142e\/ZsJ96dvuI7xZORpUuXOn1FqAR1cGyDwjza4Df90EMPOb8\/fofEv3fr1s34zfE79uL3zG8NT\/i7775r\/FYuv\/xyZ75ut5+Sm4I92c4xfIeS85djHdb0Rbp+Kkd9KlME8iUgwZsvKeULPQHiJRE2iMgNNtjAEG40ivhThMq8efPSTgGG+EAs5rPwaJYy0y14bBFO1N+u1rPFXLs8wv3FL35hU6dONWI5\/\/vf\/xoC7LnnnrPnn3\/e8KaSN7W8uXPn2jnnnON4yBApo0aNcrw\/CAEueltvvbV9\/vnnzqNhYiL\/9a9\/OV7ZOXPmGGIJwYcQpQzm+2U\/NwN\/+MMfUqtqsI0wP+6445w0RDkXtp122snZ5g82d+\/e3WbMmOGIxHvuucdpD\/ueeuopR9Qj7BGwl112mXEhr66udgQdeZIXWO22227WtGlTRyCTj3jha665xij3xBNPdITa0UcfbQz8eu2115y88EKYv\/zyy46oRoDusssuhjhGyFIHebkgI4wRreedd54RysF0cAhmvhN8Vwgt+fvf\/241NTXWtm1bGzZsmONxb926tSN8EaPPPvus\/fWvf3Xawg0M3m9EeSb7qT\/XAucvvviiXqDzfeXGB9HDzczmm29uCFXqgAXfH8osjDFHmCFq6XvEIsyogz0IfISnG6tNmrvQPoR3Pr8Jvg\/Y7B6b7ZPvJf1Fn9Bnbl5uMH75y1\/axhtvbKNqv+vcqLCPmwxinekvbr74LpCXPuS7iOjkRoeQG\/J7ufD74ffCjeuf\/\/xnR\/RiD+EpTCkIPy9+z5RXVVXl3CRzc8BNJL95vq+p7cl1junTp0\/qIc4TJfoon76kz+n7RoXUJcA+Wz\/VZdOHCPhCQILXF+yq1E8CO+64oyHS8Fx99tlnhhDGs4dHlRjWVNtIR4TmsxBzmXp86jbCiTepIWpZp24EVLoLWOqx7jb5ubDgzUok1s3igHjFI7rZZps57aJtjPRHKOINQwwyUIi5fRE32IDoQ9hQdufOnRt53EjPd+EtcXiTaQuCGAGDBw5v1F133WXYhthFnNx3331O2Mbbb7\/tvGQj3zrgRZsQOu4xXITxfuE1RKTSHvqNBRYHHHCAIUYXLVrkHIJY5BjsJKF9+\/bGRR82X3\/9tb3xxhuGKOYTW\/Eo813B24Ygg2uLFi041PHEYgsebb5bbhnOziL+YDttSP4ukobYwV48iHihWXcZcyNTCmPK53sAk9dff92xmnrw+vLpJCT9wbZx48Y5NzO5fhfcMOJhTzo84yrfBcQ7A9lgTEb6jcf5bdq0cZ5AYCvfI17SQp9hC\/lYEMpM58fNLE9S+J3AMpFY9xshH6y4Wcm18HviBpJjkhe+17feeqvRNgQo9WAPdvEb4vuQnD\/XOsdn+z3nOj51P+eVfM8x9A3tyNWP7KfPk3kn11tIPyUfp3URqBSBrIK3UkaoHhGoJAEupHgOP\/roI+fxPhcqvKA8Pk4kGl4YsQthwcU2nwVhyTHZFsrjIsMnnqBEonGd2Y5nHx6rs846y3jsy6NURBgXYfbluzz77LOOV5OLY77HFJsPbyVeV7jjFWbBU4sHDIGDRzrfsvHGEwbyyiuvOI+OeXyd77FuPoQ\/6wgsPvGg4kneYostjBkSuBnCs0boBbay4G3Hs57Ni09Zfi2lMsarDBduhPhNIKLxWJKW2qZEIuEMrMznN4GYQ6SmlpG6jWDiO8FTh2Tv7j\/\/+U\/nBgQvJ997juMJAk8wCOtIJNb9fvge0Yf8LrJ9r\/H+Io5zLcccc4zzpIQ6kxe+Hzwx4AaPmxz2MRsHdiE08zkPcIy70K5Sf89uWXxybsn3HEPf0Ef59GW6mwfqYymkn8ivRQQqTUCCt9LEVV8gCHChw3PDI24GhiUSCcMzk864fL1BeIuIX0tXRnIaj0J5bIw3qNhBKMQ5Er6A5wsh0Lt3b8dbmlxPrnUEBuVgR668Xu1fvnx5fYxosWUiNo444gjnJQ3EtHKhLrQsbm6IAeXRN\/3Po1jmwD311FOdGScoDy6ISNbNLDQfxTJGICLWELp8l\/GS4hnnZiC18dxccaNBvlwLXlK+Z6llJG\/jWeamghhYQgHcfdRBjCzhHNwcks7vh6cDCFtEHWnuwu8JIcwn3283PfWTR\/vcvORaJk+ebOm+X7ChTZSDYKR84ruJoSdEJB0z8mRaKKvU33Ny2TDK9xxD3fRRrn5kP\/1B3yfXxTrphfQTx2gRgUoTkOCtNHHVFwgCricIbxaDPPDkuBeuVAPz9QYhohkAlnp88jYXCwZY4WUmDpPHhKQRYpCcL9c6o7\/x7OLtxDuUK3+6\/YgIRB0e1nT7vUwj9pLHvIQS4NV1y6btDPpCWLhp2T4RMcRAE3ZAiEa2vNn2wezkk082hC+vb2bKJ+J0XbEFG7ycEydOdIS1WxbhCtSPoHDTgvJZKmPXK4inEkFJKIjrvUxtI9\/X008\/3fjO51oQhdxMpJbhbiO4\/vKXvxihKi5\/9nEz+uKLLxphKJ06dTIELuk8fied3zBhJYSZkE7fMF3e3nvvbTy9oU\/ZR\/ns92qh7e+\/\/74T+sP3hHKp67bbbnPCiPCKk4f0fBcvfs9uXfymCjnH0Df0Ua5+ZD99nq5t\/Iby7SfXTn2GmUA4bZfgDWe\/yeoSCSA2uTA99thjzmAk4i8zFcnFIJcnyN0\/duzYtMXgAWGGAsQlggLPLHUi\/hj0wsWykAsznmQubHg78Y7hXeKCgxBkkBHxrGkNSUpkdgMeZfIocnKtJwuPNzGrHEtZlENa0iHOKo\/+uTngIke7qNvZkeUPAp+4U2z93e9+58xEgUAZNWqUwY4BU+kOR5giyqmHtnJxRmxiI55IyiA0g2PxQFEW67kWysKjOGjQICPmmFhf6nKPIzaUx+J48hC4eIBhRCgFXkjCHty82T4pM9l+vG7Z8peyr1jGyXUSs0sfMZiQ+XHp5+T97jp18b2Fd66Fx\/zp4oApi+88fPHK8n1mFgEWyr7ooosM0c1ALG504EgfIMYR5x06dDBCIBiYhjhG7OLxZ1AlbeC3Rkw9g1Gpy6sF7y2x4jz5QfzxHWTQIuVzU4cgZ\/Ag7SEtnyXX75n2cEPD7xtW3DhSb3LZ\/EaKOcfQN\/RRrn5kP\/1C3yfXyzrfk2z9xKBIvO7k1SICfhGQ4PWLvOr1lQADL7g44cFisAgXsXIaxAWQgVZ4ZRnpj9A88MADDdGGyORCzUUjXxuIHcS7y9RXCHKOxTtGTCqzChCTzOAjLpRMv8UjS4QEIpVYWoQDgh97sAVvJyzwNOFJI9Y2ky2IQQQqAuO0004zYjx5nEld1Mm8wXi88JxTBoIYQYK4RNwgWImNZYYBLuIM+sF+8qYu5MGLx9Rg3JwQ28kcxQgeeDJFEy8qQFgifhDEtNe1BWGANw5OlI3HFmHMY39sZFQ\/Nx7uCHWYYi9MYIO3kFkQ6ymRyAAAEABJREFUDjnkEGPADrZiAxd\/8rll8iibAYDw52YBjrQz1f7UsBkEH\/bi6cdmOCIMEE30E2VhM\/1HmWyTTv9RJy81wAZswaZiGHO8uxDWQJwmA77wqrrp5fjEg87b1QgroW\/xHjIzBguzHxCu0LNnT2fqMmLUuTGBrzugjZsWQi5uvfVW4zdMDDKhPUw5SJ\/ecsstRugL617a7373OGcw5RkzhPCbph5uEmHIbzGRWBdbnKv+bL\/nf\/zjH8b5itlcEP3UyUBQBH9yuV6fY5LLzrXO9xq7MvUTLxWBT65ytF8EyklAgrecdFV2YAngfeHCxcUz9cJRDqPxliFUmJ8TMUUdTC2Ex4\/Huem8JuTJtBBXSFmUiVhCuF155ZXO632Z6oz4VC6AiD1mGaBOpnLiQokIxNuKRwbxitggH2IRAfL0008bNhHPSZ5UGxCXiAmOYeYF8jHFF9vUiWhkei8EIiIMQUMeykLYUz\/pfDLVWLa2Yx8XUWxj6jCEMVMjcSxtx3NEW\/BQwYFZK2ivawvxlAh7hCF1kh923OzAiIFoeHFJZ6GfGIyEt4w28GiYelgQvpQHDwQy7XLL5DtE3diBrbQTL3A6+zneXWgPYoCbBGyG449\/\/GNDKNNGyuJ7Qv9RJtuk02bqZMYLbMAWbCqGsWsLn3j08XbzfUok8hdsHFvogmCk\/2k3bUhd8P6Th7lsaTeMuMGCKZ5MbgDoQ\/qWac9cm+HCPr433JgValc++WHE940bS6ahQ2zzvcEObsjo13zKcfPwncz0e+Y3yW8OEU351EkdiUTD\/uG7y\/eUcvi+UDbfnWLPMRyf75Krn9z463zLi1g+NScgBCR4kzqCkwknUy4cLKyTlpQl45yFXITx0CTn1XpwCXBB5CLDhSu4VsqychDAW4qHGdGIN3CXXXZxXjbBNnP7MqdrOeoNepmEDRDegrcy201I0Nsh+0RABEQgHQEJ3joqPEJkHkpO9q6ngXXS2FeXzRlAwTqPGd18fGaKbSKvlmAQwPtGbCKeGbxkeMwK9cSUpSUqtKIECGdgTl3iponNxduPZ5NYT7x1hC\/wWL+iRvlUGTfpnLsID+CFJIcffrjz9jafzFG1IiACIlA2AhK8dWjx+BEvxqOiuiTnVa2ksc9NI+aSWEdiltw0fYaDAP3II2MGuZx11lnOiOpwWC4rvSTAyHqmgGKgEOKWkAc8\/YRpELtKmpf1BbksvN0IXQYSwoAY2CDbK9uiT0AtFIFyEZDgrSPL6Ho8Heke5TE4BE8IWRG8xIily8d+LcElQLwgMayM\/i50YvjgtkqWFUogkUgYAwaJXSbmkSc0xITyvSC2t9DywpyfG3diY4m9Jt41kWgYFxrmtsl2ERABEUgmIMGbTCNlnSlgmPrFFbiM7uZROAMoiPF1l6C+eSmlORHZVDNEQAREQAREQAREoDACErxZeDHdDPF+TH9ENqYEYpvpcvAKsbjxoBq0BiEtIiACIiACFSOgikRABPImIMGbARVTzDBdEQPXmJibbHwy8InwB7ZZGOl\/4YUXGsKXhTQtIiACIiACIiACIiACwSEgwZumLxC7eHeZ93Po0KFpcjRMYqJx5kkkvrfhnnVbY574wLYYeo+5YRAV+lR9XbqIgRjoO6DvgL4D+g7E8jvQf\/zrNrxm1joxEuM1Cd6UzicetxCxm3J4xs3qvp1tzcZb2O3\/ec15lSrhEFrmisVcMdDvIPd3gBOLOOXmlJ2RjhefeH0H0Bsvzpxj6A\/OIXFfJHiTvgGIXcIYeKVoOs8u8\/HimeUz6bD6uXlzTenzo4+mWs30BcmHal0EREAEREAEREAEPCfAk+X1vv7ctm7V1POyw1igBG9drxHG4IrdPn361KU2\/GBOXpbRo0cbMzawlzexjRgxwg4++GAjxpe0TMtawbvQPlq6OlMWpYuACIiACIiACIhASQTQGVPfX25N35lYUjlROliCt7Y3Ea81NTW1a2ZDhgxpFOez\/\/77OwKXuXeZq7dHjx6G8MXby5vYGNiWPJDNKSjNnw0+m229t2lh3HWl2a0kERABEQgKAdkhAiIQYgLoDDy76I4QN8NT0yV4a3Ey08LkyZMzxpOyjzy1WZ3\/iNvkWKh04Q9OxjR\/Bu\/Z3mqmL0yzR0kiIAIiIAIiIAIiUBoBvLvoDMXuNuRYvOBtWI628iRQ1aOdk5Mvo7OiPyIgAiKQgwA32DmyaLcIiIAIOAQIZcC76+oNJ1F\/TILXhy8BX8IJL2vwmg\/oVaUIlIWAChUBERCBoBBAXxA+GRR7gmKHBK8PPTG+qqtxBzZlznIfaleVIiACIiACIiACUSSArpi\/bLVV9WjvV\/MCW68Er09dw92XpijzCb6qFQEREAEREIEIEmCwWseWTW2fbVtEsHWlNUmCtzR+RR\/tDl4juLzoQnSgCISRgGwWAREQARHwnAB6gqfHGqyWHq0Eb3ouZU+t6tHOmQyau7GyV6YKREAEREAEREAEAkfAS4N4asxgNXl301OV4E3PpSKp3IVptoaKoFYlIiACIiACIhBZAnh3xzwxT68RztLDErxZ4JR7F15e6pDohYKW9ATKl8qLU7R0afSiGTERk1K\/A+X71apkEUhPgFAGvLuurkifK96pErw+9z9fTqYQ8dkMVR9TAszvqmVuxpfOiI3YFPodiOmppDLNVi0ZCaAjGAyfMYN2aB5ev78DVT3aa4oyvztB9YuACIiACIhASAkwFRkeXvRESJtQEbPl4a0I5syVEFzOXRnB5plzaU+eBJRNBERABERABGJFgMHv6Aj0RKwaXmBjJXgLBFaO7JqirBxUVaYIiIAIxJmA2h4HAgxWw7vLIPg4tLeUNkrwlkLPo2Or6qYo40vrUZEqRgREQAREQAREIOIEeDrMYDV5d3N3tARvbkYVycHd2fCaWRWpy61EnyIgAmsJrFy50p5\/\/nn773\/\/az\/88MPaRP0VAREQgQATwLvLLE84zQJsZmBMk+ANSFe4X1i+vAExSWaIQCwIzJgxwwYOHGh8VlVV2UsvvVTf7m+\/\/dZuu+02e\/TRR+vT0q289dZbNm7cOEM4p9uvtMATkIEiEDoCCF6MxmHGp5bsBCR4s\/Op6N6qHu1sypxlFa1TlYlAnAl89913dvPNN9tPf\/pTO+WUU2zSpEm2++67O0gQu5dccok1b97cDj30UCct05+ddtrJevfubeeff759+eWXmbIpXQREQAQ8I+AOVvOswIgXJMGbbwdXIF9Vj\/aGh\/ejpasrUJuqEAEReP\/99+3FF1+0Aw44wDbaaCNr3bq1NWnSxAHzr3\/9yz7++GP7+c9\/bolEwknL9meXXXaxVq1a2Z133qmwiGygtE8ERKBkAugExv2gG0ouLCYFSPAGqKMJOu+9TQvjri1AZskUEYgcAby3U6ZMsQkTJjge2fnz59urr75q33\/\/vdPWJUuW2B133GH9+\/d3hLCTWPvngw8+sIsvvtj69OljkydPtmnTptlRRx1l1157rSOKSb\/33nsdoVybPbL\/1TAREAF\/CaAT0AvoBn8tCU\/tErwB6yt3irKAmSVzYkKg1TnPWBSWXN2FF7dnz572+eef21ZbbeXE8BLKsP766zuHzp492xYsWGBbbrmls+3+6dy5s\/3mN79xhPGYMWMMLzBi96STTnKybL311rZ69WpHPDsJ+iMCIiACHhPAu8vTYMXuFga2TIK3MCOUex2Bqh7tjClG+DKvS9WaCFSGwNK\/HWhRWPKhtWLFCps7d64Tv9uyZcsGhyB4SWjatCkfDRbCFrbZZhvDC3zyySc7grlZs2ZOHvJvsMEGzgA4J0F\/REAERMBjAoQyoBPk3S0MrARvYbwqkhvRy+OKilSmSkQgpgQWLlxoixYtsq5duxoiNRkDIQ\/J28nrG264oXXp0sX4TBXKbr4GA9fcRH2KgAiIQIkE8O5OeHmBoRNKLCp2h0vwBrDLeUzBl3rKnOUBtE4miUA0CHz44Yf21VdfGYPNUlv04x\/\/ODWpfpspyJ588klbunSpEftbvyNppV27dklbWhUBERABbwigDeYvW10reNt7U2CFS\/GzOgleP+lnqZu7N3l5swDSLhEokcDbb7\/tzMqQGqdLsa4H97PPPmPTWfDaInJvuukmGz58uBHG8Morr9hf\/\/rXeuH7xRdfODG86US0U4j+iIAIiEAJBNAFDFYjpKGEYmJ5qARvQLu9qkd7I05HXt6AdpDMKhOByhT7zTff2DvvvGM77rijtWnTplGlDD5DtDJzAzvxBJ955pnG9GVMU3bYYYcZ+2+88Ubr1q2bdezYkWyG13jzzTe37t27O9v6IwIiIAJeEkAXoA+8LDMuZUnwBrSnCUbnLq5m+oKAWiizRCC8BPDUMsXYvvvu68TipraEOXlPO+00561rn3zyiW2yySZ2yy232JtvvmmHHHKIM1UZYtfd5vhVq1bZgw8+aGeccYbjOSZNiwiIgAgUTSDlwP7jX3cGtaMPUnZpMw8CErx5QPIriztFGTE7ftmgekUgSgSYe\/e2224zwhkQtQceeGDG5uHBZRYGhG22QWwU8MMPPzgvnNhtt92sX79+JGkRAREQAc8IoAPw7jLGx7NCY1aQBG+AO7yqbooyYnYCbKZM84+Aai6QwLvvvmvE4N566612\/vnnW4cOHbKWQPgCC\/PtZsvIIDamKmM+3kQi91vZspWlfSIgAiKQSgAdQNwuuiB1n7bzIyDBmx8n33JxN6c5eX3Dr4ojRgCP7XPPPed4Y3v16pVX63r27GnHHXdc1ryEORx00EHO29ayZtROERCBMhGIbrF4d9EBhDlGt5Xlb5kEb\/kZl1SDezfHl72kgnSwCIiACIiACIhA6AgQyoB3FwdY6IwPkMESvAHqjEymIHp5nJFpv9LzI6BcIiACIiACIhAmAnh3edEE3l1Eb5hsD5qtErxB65E09oyv6mp86TVFWRo4ShIBERABESiUgPKHhADXfjy8VT30oolSu0yCt1SCFTq+qkc70xRlFYKtakRABERABEQgAAR4uot3V1ORld4ZErylM6xICVW1d3fE8VbMy1uRVqmSOBH4bsk8+\/LZW23Zvy5yPqPa9mXLltmkSZOMeX6j2ka1SwREoPwEpsxZ7ryASrG73rCW4PWGY9lL4e6Ouzx5ecuOWhWUgQAi96PTOtuS8SfZsntGOZ9zByaM9DJUl7PIJUuW2KWXXuq5KH388ceNqcl45fCgQYMalJ9vnW+99ZaNGzfOVq5cWd+OdGn1Oz1aYa5h5ih+9NFH60ucP3++\/f73v3emcKtPzLCC0B8zZowNGTKk3nbKZB7jl156KcNR4UiWlSLgBwG8u8Ttcv33o\/6o1SnBG6Ie1YsoQtRZMrWeAKIWkVufkLRCOvuTksq+ypvTzjvvPDv22GOtc+fOntX35ZdfGvP79unTx84++2x75JFHjFcUU0Ehde60007Wu3dvR2RSJsenSyPdqwVheskll1jz5kdmO6MAABAASURBVM3t0EMPdYp9\/fXXbfbs2fbss8\/a\/\/73Pyct0x+82byG+YUXXqgXu+Rt0qSJcwPw2GOPGTcDpGkRARHITcCN3ZV3NzerfHNI8OZLKmu+yuys6tHOea2gvLyV4a1aSidAGAOiNltJ7Cdftjxe7Vu1apVddNFFxhvWeFGEV+VSzmuvvWZz5syxvffe2zbccENr3bq1rb\/++lZMnbvssou1atXKmS+Yt7hRfro00r1YeLHGxx9\/bLxkI5FY++KMXXfd1XbeeWenLbnq6Fx748B8xZtsskmjrIjewYMH2\/\/7f\/\/PqKNRBiWIgAg0IuB6d7nuN9qphKIISPAWhc2\/g7jbG\/PEPP8MUM0iUACBbxfn911d9fazBZRafNaXX37Z8VoecMABjQrhkfztt99uY8eOtX\/84x921VVX2YoVKxrlS00g9ODpp5+2f\/7zn86LJ9555x2bNWtWfbZi6kwkEoan+N57760XiYlE47T6SkpYIdTijjvusP79+xuvWy6hqLWHpvnbqVMna9mypdGeNLuVJAIikEQA7y5jdghjTErWaokEJHhLBFjpw927PX4Mla5b9YlAoQRWvz05r0O+W\/xhXvlKzfTss886ntPNNtusQVEI1oEDB9q2225reCMRvghXPLUNMqbZaNasme2+++6GcOzWrZsdeeSR1rVr1\/qcxdZJOMTq1auNUAG3sHRp7r4bbrjBunTpknUZOXKkm73+k7CFBQsW2JZbblmf5vUKHHfYYQebPHmyffHFF14Xr\/JEIFIEmIaM2F0cXJFqmM+N8UPw+tzk8Fdf1aOd8bgj\/C1RC6JOYIM2P86rifnmy6uwDJm++uore\/\/99x0vJqEGbjZiVYnpPfXUU61Xr1723XffGWEEiFiEmpsv2+fixYvtk08+se7du1vyY\/1S6mzatKltsMEGNmPGjPqq06W5O4cOHWpz587NuuC9dvO7nwhe1imbz3It3BjACFblqkPlikDYCeDd1YsmytOLErzl4VrWUvUiirLiVeEeEmh+wIk5S9ugdSfLJ1\/OgnJkQMQiZpOzEY7wl7\/8xYjn7du3r7MLgUkow2677eZs5\/OH2NTly5cbg8uS8+euM3ed7sC15HLTpSXvL2SdAWuF5C8l7zfffGN4rUspQ8eKQJQJIHjx8Fb10IsmvO5nCV6viVaovKpaL68Gr1UItqopiUDLgaOyHl8JsYsBeF7btWvHav3C7AJvv\/22M9CMGFPieG+++WZr27Zt\/QwL9ZmzrFDGFlts4YQTJGfzos5Umyk\/XVqxIQ0\/\/nF+XnjqLXXBy5saTlJqmTpeBKJEgKe3vbdpYbGciqzMHSnBW2bA5Sq+qvbujzheJqYuVx0qVwS8INDyl3+ydKIXzy7p7PeinlxlJBIJ22WXXWzRokXOzAnk\/+yzz5xptHicz2wKDFRjzltE4G233ebMunD99dfbQw89ZJk8oXiNifdt3769MzMD5bpLIlF4ncx9y\/HEuuINxWa2WdKlkc5SbEgDcb+EbsCCcvJZeLHGtddea0uXLs0nu5MH7nBl9gknQX9EQAQaEOB6jndXsbsNsHi2IcHrGcrKFsTdH3eB8vJWlrtqK44Aonbr6z6w1sNvccQvn2yTXkCJJWdl6qw1a9bYvHnznLL22GMP22+\/\/ezqq6+2E0880fbcc0\/bfvvtnVhf4nmJ9WX2hXPPPdcyvTyB8AdiZ4n5ZR5bp+CkP4XW2bFjR+foDz\/80DbffHMnLthJqP2TLq02uaT\/DIRDVCcPjqNAwg+efPJJ5wYBTzjL999\/b6Q\/+OCDduWVVxqil7zcDDAbxXvvvefEMvNJGvtYCB0hVrhfv36Gl5c0LSIgAg0J4N1lsNo+27ZouENbnhCQ4PUEoz+F6EUU\/nBXrcURwKNL+AIil8\/iSintqJ\/85CdWVVVlDzzwgDM4DYF6yy23ONOI3X333XbYYYc5L4x45plnnAFszC\/L+jHHHGNt2rRJWzkDsT7\/\/HPbd9990+4vtE4KwduMqDzjjDPqvcbp0shb6sJUZKeddpoj6GmLWx5e3+OOO87wXt93333OSzq4ASCdN8ExAI5ZLcjPXLsHHXSQTZ8+3ZmJgTl8SWMfCwMDN954YzvqqKPY1CICIpBC4KOlqwt8jXBKAdrMSUCCNyei4Gao6qEXUQS3d2RZEAkkEgnnzV+IMbyXuWwkXGHChAl2yCGH2HbbbVefncFoCNKHH37YEHNMuYXIq8+QtJJIFFYnZd95553GoLl+tR5RikqXRrpXCx7ek08+2W688caMoRvJdSFsCVH45S9\/mZycdh0Rzc3ERRdd5LzJLW0mJYpAzAm43l2u6zFHUbbmS\/CWDW1lCibWZ8wTax\/PVqZG1RIWArIzPQHE7h\/+8AdjeixmZEifa20q04KdcMIJtv\/++69NqPvLo\/033njDCYV47rnnjPKyPaovpE6EOLNGnHTSSc6LLKgyXRrpXi68ZY2Ft67lKrdHjx42bNgwo13Z8hLucf\/999vo0aPLOs9vNhu0TwSCTgDvLmNyJHbL21MSvOXlW\/bS3R8IP5ayV6YKRCAiBBBqCFnmzS2mSQjhUaNGGYO3eGUuYQu5ysm3TrzJhAckEon6ItOl1e\/0cIV4Y8IYvCpy0003NcIymAHDqzJVjggUQSDQhzBQjdhdHFiBNjTkxknwhrwDMR\/Ry+MQ1rWIgAiIgAiIgAiEgwDeXfdFE+GwOLxWSvCGt+\/qLdeLKOpRFL+iI0VABERABESgwgQQvHh4q3q0r3DN8atOgjcifV7Vo51pirKIdKaaIQIiIAI+ElDVlSPA01mmGNVUZOVnLsFbfsYVqaGq9u5QcbwVQa1KREAEREAERMATAnh3FbvrCcqchUjw5kQUjgzcHXKXOLxmVgUMVhUiIAJ+EeCFDl999ZVf1RdV75dffmnvvvtuUccmH0S7aX9ymtZFIKwEuF5z3eb6HdY2hMluCd4w9VYOWwfv2d7w8hITlCOrdouACISMAG86Gz58uHXr1s3uuOMOx\/pp06bZzjvvbPfcc4+z7cefbDbwsgzeYrfXXns5c\/wWa9+\/\/\/1vO\/zww5234vEijGLLKfQ43hB38cUXG\/MsM1XcoYcearx6ukE52hCBIghwneZ6Le9uEfCKPESCNwnczJkzndd4dunSxViYsoi0pCzOKlMRsd9dbrjhBifd7z9VPda+iIKYIL9tUf0iEEQCvMDhtttuc96sFjb7eOvb0KFDjTedubYjwn7zm98Yr0h20yr9mWpDMmPe4sab7Vq3bl2SWbyAA8HLi0BKKqiAg2nHNddcY7xNDpE7ceJEw8P8+9\/\/3pYtW1ZAScoqAo0JcJ1mKjJ5dxuzKVeKBG8dWUTsgAEDnMnUeS8+CxOrk8a+umzOvJsjRowwTn7k4fP666+3LKLXPbQin9wtctfI3WNFKlQlkSKw5uuPLQpLuk5BwDzyyCN23XXXWSWFUzpb0qUVYx9CknluEcPpyqxEWrINxbShEjYWU8dnn31m33zzjR111FHGvMs77bST9e\/f3+bPn28ff\/xxMUXqGBFwCHB95jo9blBXZ1t\/KkNAgreOM4\/MmHT9+OOPr0sxY5009pHIm5l4Y9DBBx\/sPFYkjceLCOOamhrnzU2k+bnIy+sn\/fDXvXzSvhaFBdGe2huff\/65TZ482YgnnTp1qvNKYOJB\/\/rXvxovkbjiiisccUPowMKFC+2qq64yfv949PAw8lu\/+eabDVFH2Z9++qn99re\/NW54jz32WGf9\/PPPt2eeecbxAP7f\/\/2fnX766XbggQcaZa9evdrZd9JJJznCifCE3Xff3Y488kjj9bvp7KOebAueRl7bS52ED\/CqY8rDq3riiSc64Q54gGkz5ZA\/1S4YsM9dKGfkyJH205\/+1OGFwEPo8XY1XqPMzQKvWx40aJDDkjJdG7K1AaZDhgyxXXfd1fbZZx\/L9Ja7Bx980H73u9\/Z7bff7vTHlClTXNMafBJucOmllxohB2PHjnXyEl5Bex5\/\/HHjxSL0y69+9SuHA+dzV6hicy4OCPmLLrrI8FK7FfM2vVatWtkWW2zhJulTBAomwEA1eXcLxlbyARK8dQg5YXIS54RWl1T\/wYWNk+uiRYts+fLlxsWvfmftSu\/evZ30N998s3bL\/\/\/VfTs7sbz+WyILRCA4BBApPJ7mjWf8ZhFeiClCHBB0p512mhMugNBq166d4dHjJnerrbYyPMO\/+MUv7KabbnI8fIi+MWPG2CabbGKEGSDQXnzxRdt7770dMffHP\/7RELPjxo2zCy64wHgb23333WeIRryGX3\/9tSEqOecgdrlhTmdfNnpLliyxf\/7zn0Zds2fPdoQZsbKIOUT5lVdeaddee63x6uOnnnrKEILkTbUr9VXCCDyEIl5NXg3csWNHGzhwoGPKxhtv7Hg7aT\/xrIj4ZBuytQEh\/ec\/\/9n+85\/\/GOdZuGOnU3Ddn6VLlzqxvpxjf\/3rX9vJJ59s\/\/vf\/+r2rvug\/ssvv9w++ugjQ7jy1I230eHthgXhaDyBSyQSRljCAw88YPPmzXPEMeI\/Hw7ralu7Rp2ENhBawfdjbar+ikBhBD5autoYrMZ1urAjlbtUAoETvKU2yMvjuShxMerQoYNzgkbwUn7btm35aLTMmTOnUZofCVU92jnVEiPkrOiPCIhAWgI9e\/Z0PIl4M\/FkIrgQRMmZGbCE+EPkcOP7xRdfGEIPwenm69Spk2222WaOp\/a9996zV1991fEgIzjxJm+99daO4HLzcw7Bg9iyZUtDROL9dPfl+8nx+++\/vzVt2rTRIYh0ysYbyX7Kz8cutyDa\/JOf\/MQJ3UKgr7\/++gYbPKfwefnllx3PdTYb3LLcz86dOxv5EdTYhU3ExLr7+WQftl922WX2wgsvGCIWbzD7khecEHi1d9llF+MGJpFIODcaiGOeyNFf6623nlEWHIgz5sncG2+8YfRHrv5Jrstd5xhuGoYMGWKJRMJN1qcIFERg6vvLDe+ue50u6GBlLomABG8WfDyGxKPLo7Es2YyLV4sWLbJlqfg+fkxjnphX8XpVYbgJNO9VY1FY1tt4q7w6AjGIR\/S8884zHscjxCyPfxyHePvvf\/9rxHri\/UNkIcC4MUYk8sgfj+Of\/vQnJ\/YfT28eRSdn8XS9ELuaN29ujF8g7IAnV3iJGRj3\/PPP27PPPuuc8xCTnhpYWxiCd9SoUda+fXsjFOHss882bjBqdzX4Txo3H8mJ7nkYIZ2c7q6zn35ZsGCBE5tbSP\/g+MC7j2cYNm6Z+hSBQgjg3cURJe9uIdS8yyvBm4Elg9Duv\/9+ZxAbsXsZshWc7M7s4H4WXECeB4yvWhsMT2B8nocomwhYky16RmLJtyt51I\/AOueccwyxilcwn2MRt8TzI8wITfj73\/9uhDgQUtCsWTPj8T3xrm5ZPLp\/+umnnXQ3rdKf2exK9bRiG+EZiUTCCPdC3BLywVMsYpb322+\/sng54YapzrSYAAAQAElEQVSYJdSDeGm8qpdcckmjQYaETnBzQogBNxvYy+eaNWucWRXYTl3Yv+WWWxohGtSTrn\/SccCTT2gKNy4cT7nko09Z1yIC+RLAu0teHFJ8er24uiL50+s6\/Cuv9JoleNMwROzi3cXrQ3xemiwNkvCc4AlukJhhg7iy5CVDNk+S+VERK+RJYSpEBCJAgMffPJYmJIHfIY\/o8frRNDyGeGsRTbnEDPvvuusu69Onj912221GbOqee+7piEDCAbp27erE7SKqKP+WW24xvMF4MKkr05JqH7Zmyltoeja7CKtILY8QBETvrFmzjHjd3XbbzRGTtIH11PzudiltIFyCMBBEL+EaeHkRl99\/\/71bvPPZrl07J6SCEAVCUUgkZIN+Oeigg9h0FrcvXYHLjAvclGTqn1QO2MOgOMIhaBcx3YRacH1ItcmpUH9EIAMBvLsTXl5gvbcp39NgzmmpSwZzYpkswZvS7XhrOJmlE7s8EiM7ApfP1IUBMalpfm67j03k5fWzF1R3pQjkUw8CjkfSzJ7AILMjjzzSOYzPv\/zlL7b99ts74Qfc9OI9ZCeCDwHGnNwIZYQVQpQ4Uh5xu94UBsGxzTF4JTfffHM75phjnDlyEdKnnHKK8Tid8wcLxzPAipAKZg\/Ak5hqH55kymNBOCOgXRsoi+PdbUIyGJjFzTflIc4Q2Qh5bE4kEpbJrkSicUwqdWM\/cbQMAoMbnt2jjz7aWHdtSraBON\/kNhAv++GHHxo2MfsFg8ywkRABGNAGykleyIf3nMGDeHjPOussY\/Dc22+\/7cROUx+xuueee64dccQRxoC1G2+80Xn5Bv223Xbb1RdHnC9l4Z3t1auXnXjiiY7t+XBA7DKTxqOPPmqnnnqqM2MHMd\/MsoGohk99RVoRgRwEELzzl60297qcI7t2l4GABG8SVMQuYQycPNN5dhG8LVq0MB7rJR3mDIIgnTceJaf7ve4GxnNX6bctql8EgkCAwWkvvfSSsRx33HG27777GlNZEavK9GR4F4lZZapBhBbeEuJwGZA2fvx4Q2wh+BCfiDBmXiCN8hBGhES88sorhgeRmQHef\/99QyhzA41nlIFghFGwIMyon\/rwFhMTnGpfIrFOiPLCCWYuoD5sJZwCQepuI7DxMtMWymvTpo0x2wI2kJ+Qhkx2Zeob7COkwRV3zEYBNzc\/NiXbQJhBchvw0CI0sQlWDN5j9ovJkycbDODhlsUnNuN1Z4YJ2opnnPywoW9oK\/VRLzzhyjmbgWSEHZCXctzlZz\/7mTOLBU4Mbjjw0rIvHw6IekQ334HkBRvwPlOOFhHIlwCxu3h3uS7ne0wJ+XRoGgISvHVQ8Axw4kTs8piyLrnBBydj5rfk5Om+jIKLGTFtpLO\/wQEB2Kjq0d6IG5oyZ3kArJEJIhANAkzlhYgjlhQRhSBDgBEnipc4Gq1UK0RABLwgwPUX7y7XYy\/KUxnFEZDgreXGoz\/mwaxdNTwF7iNK95O7efKwH88votjNx0hmvEGksz9oC68t5K6Su8ug2SZ7fCSgqksiwKN0PJk\/\/\/nPnemwiA3lvHDmmWca0xiWVLgOLokAsbWEo7hhFIRIENtbUqE6WARKIMD1l+sw1+MSitGhJRKQ4K0FiGeWR2zJj62S19lHntqszn88wMn7gyp2HWNr\/xAzJC9vLQj9FwGPCODR5RE7T3h4eQXhC9XV1ZZ8nvCoKhVTIAHmDCbGFg88YRQMvksk1oWGFFicsseAQDmbSOwu1195d8tJOb+yJXjz4xTqXNxVcndZM31BqNsh40VABERABEQgTASYKYnrL9fhMNkdRVsleKPYq2naNHjP9s7rhoklSrNbSVkJaKcIiIAIiIAIFEbA9e7ylLWwI5W7HAQkeMtBNYBlVvVo57zOUF7eAHaOjya5cer67GJiIAZefAd8\/DlXpmrVkjcBxe7mjaoiGSV4K4I5GJVwl8mcvNx1BsMiWeEngeQ4dK3PNTEQA6++A37+rlV3MAhwneV6y3U3GBbJCgneGH0HXC8vd51lbLaKFgEREAEREIFYE+A6y5y7it0NztdAgjc4fVERS7jb5K6Tu8+KVKhKREAERCC2BNTwOBLg+sp1dtygrnFsfmDbLMEb2K4pj2F4eSlZsbxQ0CICIiACIiAC3hJgGjJ5d71l6kVpErxeUCyhDD8Ore7bycY8Mc+PqlWnCIiACIiACESWAN5dpiKr7ts5sm0Ma8MkeMPacyXY7f4QeeRSQjE6VAREQAS8JKCyRCD0BFzvrvs0NfQNilADJHgj1JmFNIUfI3ehhRyjvCIgAiIgAiIgAukJ4N1lsJrrVEqfS6l+EQiX4PWLUgTrdX+Q8vJGsHPVJBEQAREQgYoTwLtLpTiU+NQSLAISvMHqj4pZQ0A9P0ruRitWqSoSARHwjIAKEgERCBaBCS8vsN7btAiWUbKmnoAEbz2K+K2Mr+pqPIKZMmd5\/BqvFouACIiACIiARwS4js5fttrcp6ceFati8iOQVy4J3rwwRTcTd6Py8ka3f9UyERABERCB8hPgOsr1lKen5a9NNRRDQIK3GGoROoa7UeKOuDuNULPUFBFoSEBbIiACIlAmAlw\/8e5W9WhfphpUrBcEJHi9oBjiMnjtIXel3J2GuBkyXQREQAREQAR8IcD1k+so11NfDCiw0rhml+CNa88ntVte3iQYWhUBERABERCBPAkwDoanpPLu5gnMx2wSvD7CD0rV3JVyd8pdalBskh1+ElDdIiACIiAC+RBgPnuun1xH88mvPP4RkOD1j32gapaXN1DdIWNEQAREQASCQCCLDcTu4t3l+pklm3YFhIAEb0A6wm8zuDvlLlVeXr97QvWLgAiIgAiEgQDXS66bXD\/DYG\/cbZTgjfs3IKn93KVyt8pda1KyVrMT0F4REAEREIGYEeA6yfWS62bMmh7a5krwhrbrvDecu1TuVrlr9b50lSgCIiACIhBtAvFpHddJrpdcN+PT6nC3VII33P3nufXcrXLXyt2r54WrQBEQAREQAREIOQF3ZgaulyFvSqzMl+CNVXfnbix3q9y1cveaO3fhOXSECIiACIiACISZADMz8EY1rpdhbkfcbJfgjVuP59Fe7lrl5c0DlLKIgAiIQPEEdGQICbje3XGDuobQ+nibLMEb7\/5P23ruWuXlTYtGiSIgAiIgAjEmIO9ueDtfgjfIfeejbfLy+ghfVYuACIiACASOgLy7geuSggyS4C0IV3wyu17emukL4tNotVQERCCwBGSYCPhNQN5dv3ugtPoleEvjF+mjB+\/Z3mqmLzTN2BDpblbjREAEREAEchCQdzcHoBDsjpDgDQHtkJlY1aOdEcsrL2\/IOk7mioAIiIAIeEpA3l1PcfpSmASvL9jDU6m8vOHpK1kqAvUEtCICIuAZAXl3PUPpa0ESvL7iD37l8vIGv49koQiIgAiIQPkIyLtbPraVKNmtQ4LXJaHPjATk5c2IRjtEQAREQAQiTEDe3eh0rgRvdPqybC2Rl7dsaFVwIAjICBEQARFIT0De3fRcwpgqwRvGXvPBZnl5fYCuKkVABERABHwjEEvvrm+0y1+xBG\/5GUeiBnl5I9GNaoQIiIAIiECeBOTdzRNUSLJJ8Iako4Jg5sPDd9W8vEHoCH9tUO0iIAIiEAsCU99fbuMGdY1FW+PQSAneOPSyh23UvLwewlRRIiACIiACgSTQf\/zrtnWrpsZbRzMbqD1hIiDBG6beCoCtiuUNQCfIBBEQAREQgbIRUOxu2dD6WrAEr6\/4w1e5G8s75okPwme8DxarShEQAREQgXARIHaXp5ny7oar33JZK8Gbi5D2NyJQ3bezEds0Zc7yRvuUIAIiIAIiIAJpCIQiiesa1zeuc6EwWEbmTUCCN29UyugS4K6Xu195eV0i+hQBERABEYgCAa5rXN+4zkWhPWrDOgISvOtYaK0AAtz9chfM3XABh2XPqr0iIAIiIAIi4BMBrmdc17i++WSCqi0jAQneMsKNctHc\/XIXzN1wlNuptomACIiAHwRUZ+UJcD3jusb1rfK1q8ZyE5DgLTfhCJfPXTB3w9wVR7iZapoIiIAIiEDECXAd43rGdS3iTY1t8yR4Q9v1\/hvOXTB3w6ffNct\/Y2SBCIiACIiACBRBgGnI8O4yCxHXtSKK0CEhICDBG4JOCrKJ46u6GieLmukLg2ymbBMBEYgyAbVNBEoggGd3\/rLVVtWjfQml6NCgE5DgDXoPBdw+3kRT1aOdcXcccFNlngiIgAiIgAg0IIDDZsLLC4ynlfLuNkATuY24CN7IdVyQGkTMEycNeXmD1CuyRQREQAREIBcBeXdzEYrOfgne6PSlby1xvby8ncY3I1SxCIhAngSUTQREAAI4ang6Ke8uNKK\/SPBGv48r0kJiealIXl4oaBEBERABEQg6Aby72MhTSj61RJtAWsEb7SardeUiUN23k8nLWy66KlcEREAERMArAsneXZ5SelWuygkuAQneDH1zww032ODBg23lypUNcsycOdO6d+9uXbp0abCky9vgwBhsVPft7LSSR0TOiv6IQPgJqAUiIAIRJOB6d92nkxFsopqUQkCCNwUIm5MmTbIrrriC1UbLokWLnLSJEyfa3Llz65cJEyZYs2bNnH1x\/lNd6+Ud88S8OCNQ20VABERABAJMAO8uTyOJ3Q2wmQE0LdwmSfCm9N\/IkSNtyJAhKanrNufMmWM77rijde681pu5bo\/WIFBd6+Xl8ZC8vNDQIgIiIAIiEDQCeHe5Tsm7G7SeKa89ErxJfBG7Tz75pOG9Pfroo5P2rFtF8Hbo0EHe3HVIGq0hevHychfdaKcSIk1AjRMBERCBIBPguoR3l+tUkO2Ubd4TkOBNYjp27FibMWOGdevWLSl13erixYtt+vTp9s477zSI30Uor8ulNV5Ewd2zvLz6LoiACIiACASJANclrk9cp8psl4oPGAEJ3gI6hPjd5cuX2w477FAfuztt2jRHBGvQWkOQ3D0zRRl30w33aEsEREAEREAEKk+A6xHXJa5Pla9dNfpNQIK3gB7A84sHGE+we1ibNm3swgsvNIQvi5se90\/unrmL5m467iwytl87REAEREAEKkaA6xHXJa5PFatUFQWGgASvB13Rtm1ba968uRHfm6u41OnMcuUP8\/43\/rC3cTfNXXWY2yHbRUAEREAEykug3KVzHeJ6FGXvbqq+YLvcXMNUvgRvhXsreSoz1itcfcWrY9oX7qorXrEqFAEREAEREIE6AgxUi7p3F02RutQ1Xx+1BCR4ayHk+5\/5eblj4jP5GGJ72e7duzcfWpIIcDfNXfWUOcuTUotZ1TEiIAIiIAIiUDgBrj9MRTZuUNfCD9YRkSEgwVtAV\/bs2dNYRo8ebczYwKG8eW3EiBF28MEHZ5zdgXxxXfbZtoXJyxvX3le7RUAEykJAhRZEgKeMXIe4HhV0oDJHioAEbwHdyZvUeKNajx49HOGLt3fA2LIZiQAAEABJREFUgAE2bNgwSx7IVkCRsciKl5e7a+6yY9FgNVIEREAERCAQBHjCOH\/ZauM6FAiDZIRvBCR4M6BHwCJuEbmpWdiXHCczdOjQ1Cx+bweqfu6qGRV7+l2zAmWXjBEBERABEYguAQaqTXh5gfOUketQdFuqluVDQII3H0rKUzIBXuHIyYe77ZILUwEiIAIikDcBZYwrAZ4syrsb195v3G4J3sZMlFImAtV9OxkjZctUvIoVAREQAREQAYcADhauN8TuMjuDk6g\/sSYgwWtmsf4GVLDx1X07GyceTkIVrFZViYAIiIAIxIxAzfQFzvWGp4sxa7qam4GABG8GMEouDwFEL2EN3H2XpwaVKgIiUAIBHSoCoSfA9WXME\/M0UC30PeltAyR4veWp0nIQYPAaj5iYJiZHVu0WAREQAREQgYIJcH3haSLXm4IP1gGRJVC44I0sCjWsUgRcL6+mKasUcdUjAiIgAvEggHeXp4h6yUQ8+ruQVkrwFkJLeT0hwPQw8vJ6glKF+ExA1YuACASLAGNEuL5wnQmWZbLGbwISvH73QEzrx8vLlDHy8sb0C6Bmi4AIiIDHBLiecF3h+uJx0SouN4HA55DgDXwXRdNA7r65C9fLKKLZv2qVCIiACFSSAKEMxO4St8v1pZJ1q65wEJDgDUc\/RdJKpovhJEW8VSQbqEY1JKAtERABESgTATy7eslEmeBGpFgJ3oh0ZBibwSjaar2MIoxdJ5tFQAREIDAEcJzg3eWpIdeVwBiWxRDtqjwBCd7KM1eNSQSq+3Z2tjhZOSv6IwIiIAIiIAIFEOAlE2TnqSGfWkQgHQEJ3nRUlFZRApykmCScu\/SKVhzoymScCIiACIhALgJcN7h+uM6TXPm1P74EJHjj2\/eBaTmDDHgMJS9vYLpEhoiACIhAcAhksYTrBtcPriNZsmmXCJgEr74EgSDA3TmD15hWJhAGyQgREAEREIFAE8C7y3VDL5kIdDcFxjgJ3sB0RbwN4e6cAQfcrRdBQoeIgAiIgAjEjIBeMhGzDi+xuRK8JQLU4d4RwMvL1DLy8nrHVCWJgAjEjUA82st1gusF1414tFitLJWABG+pBHW8ZwSYLFxeXs9wqiAREAERiCQBQhl4GsiTQa4bkWykGuU5gVAL3h9++MEWLlxokyZNshtvvNHOP\/9855Nt0tnvObEIFBjkJjBjA3ftxGUF2U7ZJgIiIAIi4A8BrhF6yYQ\/7MNcaygF74oVKxxhu\/fee1uvXr1syJAhdvnll9tdd93lfLJN+r777mu33HKLrVy5Msx9FCvbGW1brZdRxKrP1VgR8JGAqg4ZAby7xO7i3eV6ETLzZa6PBEIleL\/\/\/nt76KGH7KCDDrJrr73W9txzTxs3bpw9\/\/zz9sorr9h7773nfLI9duxY6969u40ZM8YOOOAAu\/322+3bb7\/1EbWqzpdAdd\/OxomMk1q+xyifCIiACIhA9AkQysD1getE9FurFnpJIDSCFy8tnturr77aLr30UnvttdfsmmuusUMPPdS23HJLa9Wqla2\/\/vrOJ9tHH320jR8\/3mbOnGl\/+tOf7KabbrKhQ4cWzk5H+EKAaWYIa5gyZ7kv9atSERABERCBYBHAu8t1getDsCyTNWEgEBrBu2bNGjvllFPsP\/\/5jx1yyCHWpEmTvPiSr3\/\/\/vb00087x+d1kDL5ToCBCBrA5ns3yAARaEBAGyLgJwGe+nFd4Prgpx2qO5wEQiN4N910UydeFy9uMag5jrjeYo7VMf4QcAewycvrD3\/VKgIiIAJBIYBnd\/6y1aZQhqD0SPjs8FjwVgYA4Q2zZs2ybLMwrFq1yu6++25bsmRJZYxSLZ4TWBun1cmOuO51z8tWgSIgAiIgAuEgQCgDsbvy7oajv4JqZSgF79dff22nn366XXzxxWlnYJgxY4Ydfvjhdt1112UVxUHtFNm1jgB38whfHmWtS9WaCISAgEwUARHwhEDN9AVOOTz1c1b0RwSKIBBKwdu8eXPbf\/\/97c4777QBAwYYApe249VlQNsxxxxjX3zxhY0YMcI233xzdmkJMQFEL4+zFNoQ4k6U6SIgAiJQBIG13t15CmUogl2QDgmCLaEUvBtttJFdeOGFdttttzkMEbiIW7y6zLs7ePBgZ5DaEUcc4czc4GTSn9ASYL5FHmXxSCu0jZDhIiACIiACBRPg6R5P+bgOFHywDhCBJAKhFLzYn0gknEFsvGxip512sgceeMA+\/fRTZyqyiy66yBjkRj4t0SCAl5e368jLG43+bNwKpYiACIhAQwKc7xmopmnIGnLRVnEEQit4GbD2wgsv2KBBg+zNN9+03r17W4cOHWz48OHGvLu8ja04JDoqiASYhoY7\/NPvmhVE82STCIiACIiAhwTWhjJ8YDzd4\/zvYdHBL0oWloVAKAUvszScddZZ9qtf\/cp5e9odd9zhvEntkUcesZNOOskmTJjgvI3t4Ycf1qC1snxt\/CmUAQvuSdAfC1SrCIiACIhAJQjwRA\/vLk\/3KlGf6og+gVAKXmZpeOutt+z44483RC7z6yYSCSO29\/zzz7d7773XNttsM+P1wpqWLFpfYkTvmCfmGcI3Wi0rqDXKLAIiIAKRJcD5ndhdxC7xu5FtqBpWUQKhFLwbb7yxjRs3zkaNGpU2Vrd79+6OED7ttNMskUhUFKgqKy8Bwhp4xKUBbOXlrNJFQAREwC8CnN8Rupzvc9ugHCKQH4HQCN7vv\/\/emHaMZjVr1sy6du2aVczi7T322GOtdevWHOIs3377rfOpP+EmwF2\/pikLdx\/KehEQARFIR4CBapzfNVAtHR2llUIgNIJ36dKlNnDgQLv++uvTvmwiGwRifjnuqKOOypZN+0JCgAEMeHnzHcAWkmbJTBEQARGINQFCGfDuVvVoZ5znYw1DjfecQGgEL57av\/3tb\/af\/\/zHmY7sggsuMF4vnMlr+80339irr75qI0eOtD322MM5juM9J6gCfSHw8PBdnThePAG+GKBKRUAERCB8BAJtsQaqBbp7Qm9caAQvpLfbbjtnQNpll11m06ZNs8MOO8x22GEH69mzp+233371y5577umEPOARZnDbNddc4xzH8ZSjJRoEqvt2MgY24BWIRovUChEQARGIJwHO45zP8e4SvxtPCmp1OQmESvACYv3113eE7qRJk+ypp56yYcOGOXG6a9assWXLljnTkHXs2NHOOOMMZ\/\/jjz9uhxxyiN64Brx8lhDlqe7b2Tgx8ggsRGbLVBEQAREQgRQCnMc5n3NeT9mlTRHwhEDoBK\/b6kQiYZ07d3ZCFphvd8qUKTZz5kx7\/vnn7b777rOzzz7b2Z9IaJYGl1kUPxnYQFjDlDnLo9g8tUkERMBHAqq6MgTw7nIe53xemRpVSxwJhFLw8hY1PLd4dOPYaWrzOgL7bNvCeRMP3oF1qVoTAREQAREIAwHELqEMDETmfB4Gm2VjOAmEUvCuXr3aLr\/8cmcw2oABA+z+++8veOYGb7pLpQSBAAPYpr6\/3PAQBMEe2SACIiACIpAfAc7dvFGNlwrld4RyiUBxBEIpeNu0aWMPPvigXXrppU6rzz33XNt1113t17\/+tTMbAzM0ODv0JzYEqvtqAFtsOlsNDSYBWSUCBRJwvbsaqFYgOGUvikAoBS8tbdmypfFiiYkTJ9orr7xivHVt4cKFziA23rTGoLXp06dbpmnLKENLdAhU9+2s0IbodKdaIgIiEAMChKJpoFoMOjogTayk4C1bkxG\/xx13nOPdRfwOHz7cmMUBQbz77rs7nuBPPvmkbPWr4GAQQPQS1qABbMHoD1khAiIgApkIcJ4mnEED1TIRUrrXBCIheHnt8Ouvv268jGL\/\/fe3K6+80jbbbDP77W9\/awjhhx56yPr162cMdPMaoMoLDgEGPPBoTG9gC06fyJJMBJQuAvElQCgD5+ne27TQG9Xi+zWoeMtDK3gJVUDkEr+7yy672C9+8QtjerL+\/fvbo48+alOnTrXq6mpnefLJJ23HHXe0a6+9tuKAVWFlCbgDH3hUVtmaVZsIiIAIiEA+BGqmL3CyuedrZ0N\/4kugQi0PpeBdsmSJHXroofUi94ADDrC7777bXn31Vfvzn\/\/svGWNF1S4DJs3b25bbbWVu6nPiBPgEdmYJ+YZj8wi3lQ1TwREQARCRQDvLudnztOhMlzGhp5AKAUv1PfYYw+74YYbbMaMGY7ntkePHtakSRN2pV3++Mc\/2l133ZV2nxKjRWAfzc0brQ41U3tEQAQiQACxy5y7hJ5xno5Ak9SEEBEIpeBt3bq1XXbZZXbIIYfYhhtumBfuTTfd1FjyyqxMoSfAozIGRDCILfSNUQNEQAREIAIEOCcz5251384RaI1fTVC9xRIIpeAttrE6Lj4EmOoG0Ys3Aa9CfFquloqACIhA8AhwHuZ8jHeX83PwLJRFUScgwRv1Ho5x+zixMgqYk2ycMKitIiACIhA0ApyHEbry7gatZ+JjjwRvfPo6li3l5MpjNA1gi2X3q9EiIAIBIEBoGaEMPgxUC0DrZUJQCEjwBqUnZEdZCDAworpvJzviutfLUr4KFQEREAERyEyAUAamieRpG+fjzDm1RwTKS0CCNwNfZoAYPHiwrVy5slEO3uLWpUsXcxfyNsqkhMAQqO7b2XiUxiO1RkYpQQREQAREoGwEELsUzpgKPrWIgF8EJHjTkEfQXnHFFWn2mPPK4hEjRtjEiRNt7ty5zuf111\/vTJGW9gAlBoIAj9J4rKbQhkB0h4wQAREIIAGvTeJ8y3mX86\/XZas8ESiUgARvCrGRI0fakCFDUlLXbi5evNhGjx5tBx98sHXr1s1J5HPYsGFWU1Nj7HcS9SdwBHiUxiM1XmcZOONkkAiIgAhEjIAbysDgYc6\/EWuemhNCAhK8SZ2G2OU1xHhvjz766KQ9a1cXLVpky5cvt379+q1NqPvbu3dvJ\/3NN9+sS4nqR7jb9fDwXc09CYe7JbJeBERABIJNgMHCDFQjpCzYlsq6uBCQ4E3q6bFjxzpvbsNrm5Rcv4rgZaNt27Z8NFrmzJnTKE0JwSJAHBmvtQyWVbJGBEQgdARkcFYCjJlA7DJ+ImtG7RSBChGQ4PUANAK4RYsWHpSkIspNgMdrhDb0H69ZG8rNWuWLgAjEkwDnV86znG\/jSUCtDiIBCd7y9Urakt2ZHdzPtJmUWFYCeHl53OaOHi5rZSpcBERABGJEgEFqhDJwno1RswPRVFdXJH8GwrCAGCHB60FHEOpAbG8+RTGzQ\/KSzzHK4y0BHrFxMia0gVHE3pau0kRABBoTUEocCDBGQqEM\/vV0srZw1\/2zJng1S\/AW0CeELpAdgctn6rLtttumJmk7oAR41MYjN3l5A9pBMksERCBUBFyxy3mV82uojJexsSAQGMEbBtoIXmJ1UwenTZ061Ujfeeedw9AM2VhHAC+vQhvqYOhDBERABEogwLlUoQwlANShZScgwVsA4lMnSeoAABAASURBVDZt2lhVVZXxUgpeTsGhM2fONF48QTr7SdMSDgKENjx02q6m0IZw9FeMrFRTRSBUBFzvrmZlCFW3xc5YCd4Cu3zo0KF24403Oi+nIDB8wIABxosnSC+wKGUPAAEmROcRnEIbAtAZMkEERCB0BFyxy3lUoQyh674QGOydiRK8GVgyJ++ECROsWbNmjXL06dPH3IBwPiV2GyEKVQIvpOBxnERvqLpNxoqACASAQM30BaZQhgB0hEzISUCCNyciZYgDAYU2hLeXZbkIiIA\/BPDuEhKmUAZ\/+KvWwghI8BbGS7kjSsANbTj9rlkRbaGaJQIiIALeEUDsMgUZYQws3pWskkogoEOzEJDgzQJHu+JFgNAGWqzQBihoEQEREIHMBNxQBry7mXNpjwgEh4AEb3D6QpYEgMC4QV2jPWtDABjLBBEQgXATwLurUIZw92EcrZfgjWOvq80ZCRDawOM5hTZkRKQdIiACMSaA2I1KKEOMuzGWTZfgjWW3q9HZCPBCCvZzUudTiwiIgAiIwFoCCmVYy0F\/w0dAgjd8fSaLK0CA0Iaa6QttypzlFahNVYiACIhA8Ang3SWUgfMjL+4JvsWyUATWEZDgXcdCayJQT4DQhuq+nUyhDfVItCICIhBjAh8tXW089SLki\/NjjFGo6SElIMEb0o6T2eUnUN23s3Vs2dQ5yZe\/NtUgAiIgAsEl4IYyuCFfwbVUlolAegISvOm5KLVwApE8AtFbM12hDZHsXDVKBEQgLwKEdhHKwPkwrwOUSQQCSECCN4CdIpOCQ4BHd9UKbQhOh8gSEQgFgegYSdwuoV2EMrBEp2VqSdwISPDGrcfV3oIJVNeFNvQf\/3rBx+oAERABEQgrAcQucbvYr1AGKGgJMwEJXp96T9WGiwBvYZv6\/nLN2hCubpO1IiACJRBw43aZlaGEYnSoCASCgARvILpBRoSBQHXfTnbEda9L9Iahs2RjmAjI1gASwLtL3C5hDIR2BdBEmSQCBRGQ4C0IlzLHmUB1387We5sWmqoszl8CtV0EYkAAscvNPWKX814MmqwmxoBAOARvDDpCTQwHAeLYuBi4cW3hsFpWioAIiED+BMY88YGTWWLXwaA\/ESEgwRuRjlQzKkOAtws9dNqupqnKKsNbtTQmoBQRKCcBzm2MVyBul\/NdOetS2SJQSQISvJWkrboiQYB4tuq6eF68vZFolBohAiIQewKcz3h6RSgD57nYAxGAoBMoyD4J3oJwKbMIrCVQXRfPy8VhbYr+ioAIiEB4CbhiF68u57fwtkSWi0B6AhK86bkoVQRyEiCel0d\/brxbzgOUofIEVKMIiEBeBNwpyAjZyusAZRKBkBGQ4A1Zh8nc4BDAE8LFgal7ePVmcCyTJSIgAiKQPwHOX5zH8OxyXsv\/SOUME4G42yrBG\/dvgNpfEgHi3DRVWUkIdbAIiICPBAhl0KuDfewAVV0xAhK8FUOtiqJKgLewdWzZ1ML\/6uGo9pDaJQIikI4AYtcdh0CIVro8ShOBqBCQ4I1KT6odvhLgUaDieX3tAlUuAiJQIAE3bpcpyAo8NPrZ1cLIEZDgjVyXqkF+ECC0obpvJyMOjng4P2xQnSIgAiKQLwG8u5yvNAVZvsSUL+wEJHjD3oOy3y8CjeqtrpuqjHi4RjuVIAIiIAIBIYDYPeK61w2xy3krIGbJDBEoKwEJ3rLiVeFxI0A8L21WPC8UtIiACASRgDuVondiN4itlE0i0JCABG9DHtoSgZIJvPGHvY14XoU2lIxSBYiACJSBAOcn4nY1BVkZ4KrIwBKQ4A1s10TLsLi1prpvJ+ORoURv3Hpe7RWB4BIglKHVOc84oQyMOwiupbJMBLwnIMHrPVOVKAJWrXhefQtEQATSE\/AlFbHLTbjidn3Br0oDQECCNwCdIBOiSYB4Xs3PG82+VatEIEwEELuabzdMPSZby0FAgrccVEstU8dHhgCTuRMv5w4SiUzD1BAREIHQEHDn233otF1DY7MMFQGvCUjwek1U5YlAEgEGhXCRYb5LxfMmgdGqCORJQNlKI1AzfaGxaJBaaRx1dPgJSPCGvw\/VgoATYHBItQaxBbyXZJ4IRI+AG8pA3C7noei1UC0SgfwJREDw5t9Y5RQBvwhUaxCbX+hVrwjEkgBiV4PUYtn1anQGAhK8GcAoWQS8JqBBbF4TVXmNCChBBGoJIHY1SK0WhP6LQBIBCd4kGFoVgXIT0CC2chNW+SIgAhqkpu+ACJilMpDgTSWibREoIwENYisjXBUtAiLgDFBjkCxhVJxvhEQERGAtAQnetRz0VwQqRoDBI9UaxFYx3pkr0h4RiBYBN5SB8wsD1aLVOrVGBEojIMFbGj8dLQJFEajWILaiuOkgERCB9AQQuwxS671NC+dNj+lzKVUEMhCIQbIEbww6WU0MJgEGsWFZ\/\/Gv86FFBERABIom4L7cxj2vFF2QDhSBiBKQ4I1ox6pZ4SDAZPAheRNbOIDKShGIIQHELucRzicxbL6aLAJ5EZDgzQuTMolAeQgQz8vMDQwy0ZvYysNYpYpAlAlw3uD8QZgU55MotzU4bZMlYSQgwRvGXpPNkSLA4JJqDWKLVJ+qMSJQCQJu3C7nD84jlahTdYhAWAlI8Ia152R3oAkUalx13SA2Bp3gsSn0eOUXARGIFwFX7CJ0OX\/Eq\/VqrQgUTkCCt3BmOkIEykKAwSaMsD79rlllKV+FioAIRIOAK3ZpDSFRfAZ4kWkiEAgCEryB6AYZIQJrCXDx6tiyqWnmhrU89FcERKAhAcSu+9rgh07bteFObYmACGQkIMGbEY12VIyAKqonwJuREL2MuJborceiFREQgToCNdMX2Pxlqw2xy\/miLlkfIiACOQhI8OYApN0iUGkCXMS4mCF6mW6o0vWrPhEQAf8IZKuZ80HN9IXG9GOcJ7Ll1T4REIGGBCR4G\/LQlggEggDTCyF6mW6IC1wgjJIRIiACvhHgPMD5gEFqnB98M0QVi0BICUjwhq7jZHBcCHBRq+7byYjX08wNcel1tVMEGhPg9895gPNBdd\/OjTMoRQREICcBCd6ciJRBBPwjwMWNmRs0XZl\/faCaA0wgBqYxSI3fP55dzgcxaLKaKAJlISDBWyDWmTNnWvfu3a1Lly4NlsGDB9vKlSsLLE3ZRSA3AU1XlpuRcohAFAm4YpebXgazRrGNapMIVIpA1AWv5xwXLVrklDlx4kSbO3du\/TJhwgRr1qyZs09\/RMBrAohepivb5ZIXvS5a5YmACASQAGKXMAZM4\/fPpxYREIHiCUjwFshuzpw5tuOOO1rnzoqjKhCdspdIAA8PF0FNV1YiyNgeroaHhQC\/c8SuO\/1YWOyWnSIQZAISvAX2DoK3Q4cO8uYWyE3ZSyfANETM3MB0ZRK9pfNUCSIQVALuXLuafiyoPSS7wkiggeANYwMqafPixYtt+vTp9s477zSI3x05cmQlzVBdMSbAzA2u6GVOzhijUNNFIJIE+F0zBRkD1Pi9R7KRapQI+EBAgrcA6MTvLl++3HbYYYf62N1p06Y5IliD1goAqawlEeAiiOhlTk6mKyqpMB2ciYDSRaDiBBC7\/K6ZkYGl4gaoQhGIMAEJ3gI6t1u3bjZjxgwbO3Zs\/VFt2rSxCy+80BC+LPU7tCICZSSA6CWml+mKJHrLCFpFi0CFCLhit7pvJ6sO2Fy7a77+2L56\/Vxb+lBnY71CSFRNYAhEw5D1otEMf1vRtm1ba968uRHfm8uS1OnMcuXXfhHIRAAPkERvJjpKF4HwECCEAc9udcDELuJ2xdQqWz5pX\/tm\/r0OUPfT2dCfQBFI1RdsB8pAn42R4K1wByRPZcZ6hatXdREjgOjlIum3pzdiWNUcEagYAcQuMzLwO64OiGcXUesK3e8+n9aAxTfz72uwrY3gEEBTpC7Bsc5\/SyR4C+iDSZMmOYPV+Ew+jNhetnv37s2HFhGoKAEukghfid6KYldlIlAygaCJ3W9qvbgIXcIXUoXuehtvZRtt\/zvbtFdNye2OeAFqXkAJSPAW0DE9e\/Y0ltGjRxszNnAob14bMWKEHXzwwUaML2laRKDSBAhtkOitNHXVJwLFE3Dn2uV3y01r8SWVdiRhC\/kI3RZ9nq8VvGcZwre0GnW0CPhDQIK3AO7NmjUz3qjWo0cPR\/gSHzNgwAAbNmxYg4FsBRSprHEkUKY2I3p7b9PC5OktE2AVKwIeEUDs8tZExC6\/W4+KLaiYeqH7QpVl8+i6QregwpVZBAJIQIK3iE5hlobkOJmhQ4cWUYoOEQHvCfAKUkTv6XfNsilzlntfgUoUAREoiYDfYhehu2r2VbaiTuiyndwgPLiELlRK6CbXrXURKCcBCd5y0lXZIuADAURvx5ZNTaLXB\/iqUgSyEHDFLm9NrLRnF2HrCt1Vs69uNL2YhG6WjtOuSBCQ4I1EN0a5EWpbMQSSRW8xx+sYERABbwkgdgk3Quy+8Ye9vS08S2mu0GVqsUxCd5Nd\/2Ly6GaBqF2RICDBG4luVCNEoDEBV\/QSK9h4r1JEQAQqRcAVu9RXktilgDyXVKGbehgeXVfobtjxmNTd2haByBGQ4I1cl6pBIrCOgETvOhZaEwE\/CFRa7OYjdJv3qnE8uhK6fnwjVKdfBCR4\/SJfnnpVqgg0IiDR2wiJEkSgIgSSxe5Dp+1a1joLEbpNtuhZVltUuAgEkYAEbxB7RTaJgMcEGCDDQDbCGzR7g8dwVVxACfhrVrLYJYyB2N1yWJRL6OLFdT26Errl6AGVGRYCErxh6SnZKQIlEOBi63p6NXtDCSB1qAjkQSBV7OZxSMFZELrMn+sORksugPhcV+gSpyuhm0xH63ElEGvBG9dOV7vjS0CiN759r5ZXhoArdnmigmfX61qThS5vSEsu3xW6m\/aqMQndZDJaFwEzCV59C0QgZgRc0csUSQpviFnnZ26u9nhAALFL2BAvf+F35kGR9UUgdFdMrTI8urmELsK3\/kCtiIAIOAQkeB0M+iMC8SLAxZjXmkr0xqvf1dryEaiZvtAQu9V9Oxkx817VhLh1he53n09rUCzClreiuR5dthtk0IYIiEA9gfwFb\/0hWhEBEYgCAS7KXJwleqPQm2qDnwQQu8NrZhm\/p+q+nT0xxRW6xOlmE7obbX+WSeh6glyFRJyABG\/EO1jNE4FsBLg4I3wRvVy0s+XVvnUEtCYCLoExT3xgXoldwhbyEbruW9EkdN1e0KcI5CYgwZubkXKIQKQJENqA6OWizcU70o1V40TAQwL8XrhRrO7bqda7W7xnt17ovlBl2Ty6rtD1sAkqSgRKJRCa4yV4Q9NVMlQEykcA0cvE+GOemOd4q8pXk0oWgWgQcMUuv53qIsMYELqrZl9lK+qELtvJdPDgEqMroZtMResiUBwBCd7iuOkoEYgcgX22bWGIXjxWeHs9a6AKEoEIEWAmhlLFLsLWFbqrZl9tbCcjktBNpqF1EfCGgASvNxyQi1VVAAAQAElEQVRVighEgkCy6I1Eg9QIEfCYQM30BcZN4bhBXQsOY0DYrqr16DK12CoJXY97JhzFyUr\/CEjw+sdeNYtAIAkgepkwv9U5zzjTLAXSSBklAhUmgGeXaccQuzwJ4XeSrwmpQjf1ODy6vChCoQupZLQtAt4RkOD1jqVKEgEPCASjiK1bNTVEL2+L4iKvF1QEo19khT8EELvMZELt\/C74fbCeaylE6G7Y8ZhcxWm\/CIhACQQkeEuAp0NFIMoEuKgzewOil4s9nq0ot1dtE4F0BIjX5aaPfYhdPnMt+Qjd5r1qDI+uhG4WmtolAh4SkOD1EKaKEoGoEUD08la26r6dnNkbNJgtaj2s9mQigFcXscvMJXz\/8xG7uYQu4tYVuk226JmpaqWLgAiUgYAEbxmgqsiKEVBFFSJQ3bdz\/QwO\/ce\/XqFaVY0I+EMAsesOTquuvdmrrv3+Z7MEocv8ue5gtOS8xOe6Qpc4XQndZDpaF4HKEZDgrRxr1SQCoSbAIB28XFPfX+4MZlNcb6i7U8ZnIIDYdUN4cs3EkCx0eUNacpGu0N20V41VRugm1651ERCBVAISvKlEtC0CIpCRACEOiF43rleiNyMq7QghAcSuG6+bbSYGhO6KqVWGRzeX0EX4hhCFTBaByBGQ4I1cl2ZukPaIgBcEEL3E9fKGKTxhxDl6Ua7KEAE\/CfA9Ruzyveamju95qj3ffjbNXKH73efTGuxG2PJWNNejy3aDDNoQARHwlYAEr6\/4VbkIhJcAMzhU9+1kDOpRXG94+zGmltc3G68uYpfvMd9nvtf1O+tW8OIidL98ocqyCd2Ntj\/LJHTroOlDBAJGQII3YB0ic0QgTASq+64dzObG9SIewmS\/bI03Ab6vzDzClHvVtTdv1bXfZ5cIYQuu0GVAWiahy9RiErouNX2KQHAJSPBm6huli4AI5EXAHczmxvXmdZAyiYDPBBC7hOTMX7bamYHEFbv1QrfWm5uP0PW5GapeBEQgTwISvHmCUjYREIHMBIh3JK4X0csriXlEnDm39oSNQJTsRejy\/SRel3YxOI3vL0J31eyrbEWd0GWb\/e5CqAIxuq5H103XpwiIQDgISPCGo59kpQiEggCit7r20TDxkIrrDUWXxcpIxG5yCAOD07Zq+pm5QnfV7KtNQjdWXwk1NkYEPBK8MSKmpoqACGQlUN23syEkeFSMF01Tl2XFpZ0VIuB6dfle4tU9d98mjtBlajEJ3Qp1gqoRAR8JSPD6CF9Vi0BUCfCIGNHLFE\/ESeJVi2pbG7VLCYEigFcXsctTh+rapw+vndPRWi+5wZlDF6GbaiyhC7woQqELqWS0LQLhJiDBG+7+k\/UiEGgC1bXeXrxpjIKXtzfQXRVJ4xC73HDx\/btmQHM7s9PEvIQurwKOJBA1SgQqTCBI1UnwBqk3ZIsIRJBA6iwOeNsi2Ew1KUAEELp8z7jJ2rLpZ3b3zybboV8MtEwe3ea9agyProRugDpRpoiAxwQkeD0GquJEQAQaEyDEIXlAG0IEUWLWOK9SRKAUAnyvCKG5c\/Irjkf3ju3OtNZL\/t6oSMStK3SbbNGz0X4liIAIRIuABG+0+lOtEYFAEyDEgdhepi9D9AbaWBkXOgJ4dQ8b+7Ad0eSvNrnneY7gTW4E8bmu0CVOV0I3mY7WfScgA8pKQIK3rHhVuAiIQCqBZG8vc\/YyfRleudR82haBfAnw\/bnsgSnW6sMLHaH7i3ZTGxzqCt1Ne9WYhG4DNNoQgdgQkOCNTVeroREgEKkmuN5eGoW3F+8c61pEIF8CCF1CF95+5Ej77fq\/slxCF+Gbb9nKJwIiEC0CErzR6k+1RgRCRSDZ28u0UQhfzdsbqi70zdi57z1rX75Q5QxG26vF7AZ2IGx5K5rr0WW7QQZtRICAmiAChRGQ4C2Ml3KLgAiUgYDr7XXn7VWYQxkgR6TIb+bfayumVlmLWSdZ+zVvNGgVwtYVuhttf5ax3SCDNkRABGJLQII3tl0f\/YarheEigLfXFb5YjrdXYQ6Q0LLm64\/NFbpfvX6ufff5tAZQELYIXaYWk9BtgEYbIiACdQQkeOtA6EMERCAYBBC+qVOY8eKAYFgnKypJoF7ovlBl+QjdStoWsrpkrgjEnoAEb+y\/AgIgAsEk4Hp7CXNgXlWFOQSzn4qx6rsl8+zLZ2+1Zf+6yPlMLQOhu2r2VbaiTuiynZwn1aObvE\/rIiACIpCOgARvOipxTFObRSCABPD2usIX8whz4FNLeAkgcj86rbMtGX+SLbtnlPM5d2DCSEfYukJ31eyrje3klkroJtPQugiIQCEEJHgLoaW8IiACvhBA+BLmML6qqzF3L8JX8b2+dEVJlSJqEbmphazXbANbVevRXT5p39pP\/4Vuqn3aFgERCD8BCd7w96FaIAKxIUB4A29q45NpzBC\/Er7h6H7CGFLFLkK36c4tbNOjtrKm3Vs0aggeXV4U4Q5Ga5RBCSIgAiKQJwEJ3jxBNcymLREQAb8I4O11wxyq+3YyCV+\/eqKwer9dPK\/+gEKE7oYdj6k\/TisiIAIiUCwBCd5iyek4ERABXwm4wnfp3w60VOHLG7h8NS5OlefZ1tVvT7ZcQnfNyu8s8b9+hkdXQjdPsMomAiKQFwEJ3rwwKZMIiECQCVT37WzJwteN8ZXwDUavMfhsgw7LM4Yu\/O\/9lbbyPwttxQMf2wZb7BUMo2WFCIhApAhUQvBGCpgaIwIiEFwCycKXuXslfP3tK4Qu8+cyGO3bpQ82MAZvrit0v37hM\/tu0WrboHUna37AiQ3yaUMEREAEvCAgwesFRZUhAiIQKAIIXwa3VfftZFPmLDeEL4v\/A9wChalsxiQLXd6QllxRvdB9cqG5QtfdL7HrktCnCIiA1wQkeL0mqvJEQAQCQ6C6b2djOjPEb\/LMDohfPMCBMTQihiB0V0ytMjy6qUKXGReIy23S4reO0EX4us3Gs9ty4Chr+cs\/uUn6FAERiDqBCrdPgrfCwFWdCIhA5QkkD3BD\/PbepoXx9jaEL15fxfqW1ifffjbNXKH73efTGhSG0N1o+9\/Zpr1qjCnGNjv0D7b1dR9Y6+G3GCKXT7Yldhtg04YIiIDHBCR4PQaq4kRABDwjUJaCEL+8wALhi9cXTy\/ClwXxW5ZKI1ooXlyE7pcvVFk2obvR9mcZwtfFgEeX8AVELp9uuj5FQAREoFwEJHiLIDtp0iTr0qVL\/XLDDTcUUYoOEQER8JMAwpeQB4QvC+LXndO3\/\/jXDfErz2\/DHoLHczPfslvvG2eP397PGJCWSegytViq0G1YmrZEQATyJ6CcpRKQ4C2QIGJ3xIgRNnHiRJs7d67zef3115tEb4EglV0EAkTAFb\/u1GaYhvjF68uC+GUhPU4LAhcPOOEf3c6\/xy7+f2OtxayT7Igmf7W9WsxugAIPLqELrtBtsFMbIiACIuAzAQneAjpg8eLFNnr0aDv44IOtW7duzpF8Dhs2zGpqaoz9TqL+iIAPBFSlNwTw+jLQDfHren6nzFle6\/GdZ63OecaZ8QHxS5o3NQanFAQu7aJ9eLkR+5c+8Ly1XvJ3++cuV9gVO9xkWzX9rIHBEroNcGhDBEQgoAQkeAvomEWLFtny5cutX79+DY7q3bu3k\/7mm282SNeGCIhAuAm4nl8EMOL3odN2NUIf8Hoecd3rjvhFGCIQSUMshqXFiFsW7GahHQhc2sU2wvbun0225w+6xs7sNFFCNywdKzshoEUEGhGQ4G2EJHMCgpe9bdu25aPRMmfOnEZpShABEYgGAcTvPtu2MDzAiF8WxC9phD\/w2B+x6HqBEZBBEMKIWhZELDayYBviloVt7KR9DOZ77ZyO9uLAl+zPrYfY7t\/fZkw1ltyD8ugm09C6CIhAWAhI8HrQUwjgFi1aeFCSiqgYAVUkAiUSQCAiflnc8AdEMKIRIUzxrshMJ4QRmSzkYcE77C4IVI5Pt7DPXdz8HO8ulImIRdSyIGpZSJv6\/nKnSGzHTjzWru3XDmhuR256l2362sG2avbVTr7kPwhdphVTjG4yFa2LgAiEhYAEb4V7Knl2B9YrXL2qEwERKBMBRCQLYhcR7IZBuIISgck+qkeougIVIcqCKHYXBCqeYndJ3mbdXdz8HM+C2KVchC22sFBvsrBlmwVb8E7jwV01+yrnZRGrcgjdDTseg\/laIkZAzYkGATRF6hKNlnnTCgleDzgS6kBsbz5FMbND8pLPMcojAiIQbgIITwSmK4RdMYxHGEGcaykkH3lZELUs1IuwTSWYj9Bt3qvG8OhK6KbS07YIBI9AsrZw14NnpX8WSfAWwJ7QBbIjcPlMXbbddtvUpIhsqxkiIAJRIZBL6CJuXaHbZIueUWm22iECIhBzAhK8BXwBELzE6qYOTps6daqRvvPOOxdQmrKKgAiIQOUIIHR5UcTySfumjdF1hS5xuhK6WfpFu0RABEJJQIK3gG5r06aNVVVV2RVXXGG8gIJDZ86cabx4gnT2k6ZFBERABIJCIFnofjP\/3gZmMRANoUvYgoRuAzTaEAERiBgBCd4CO3To0KF244032pAhQ5xXCw8YMMB48QTpdUXpQwREQAR8J4DQXTG1yhmMlknobtqrxhC6CF\/fDZYBIiACIlBGAhK8RcDt06eP81phNyhcYrcIiDpEBESgLAS+\/WyauUL3u8+nNagDYcvrfysndBtUrw0REAER8I2ABK9v6FWxCIiACHhHAC8uQvfLF6osm9DdaPuzDOHrXc0qSQREQASCT8B3wRt8RLJQBERABIJJgLAFV+gyIC2T0CVGV0I3mH0oq0RABCpDQIK3MpxViwiIgAjkIpBxP5PJJ++sF7q13tx8hG7ysVoXAREQgTgSkOCNY6+rzSIgAqEkgNBdNfsqW1EndNlObgihCsTouh7d5H1aFwEREIHwEPDeUgle75mqRBEQARHwlED7Vmau0F01+2qT0PUUrwoTARGIAQEJ3hh0spooAlEkEKc2PfzHH2oFr4RunPpcbRUBEfCWgASvtzxzlkYsnpYuzhzG4iAO+g7k9x1IPbF8utRs1ISE7TbkE9vx59fo99QlP45dlE\/flWh+BzL2a+q5I87bErwV7H133l59zm0wj7F4iIe+A9m\/A62O+MA5UxGjy4sidjrxA7vmruzHiKn46Dug7wDfAefkoT8mwasvgQjEgYDaGHoCzXvVGIPRNux4TOjbogaIgAiIQKUJSPBWmrjqEwEREIEiCDTZomcRR+kQERCBVALajicBCd549rtaLQIiIAIiIAIiIAKxISDBG5uuVkPzJ6CcIiACIiACIiACUSIgwRul3lRbREAEREAERMBLAipLBCJCQII3Ih2pZoiACIiACIiACIiACKQnIMGbnotS8yegnCIgAiIgAiIgAiIQaAISvIHuHhknAiIgAiIQHgKyVAREIKgEJHgr2DMjR45M+zaUSZMmVdAKVSUCIhAWAitXrrTBgwfXnzf2uC0wZQAABqVJREFU339\/W7x4cVjMl50iIAI+EZDeaAxegrcxk7KkcOH69NNP7eijj270lrE+ffqUpU4VKgIiEF4CnDOGDBliHTp0qD9n9OjRwwYOHCjRG95uleUiUHYCnDukNxpjluBtzKQsKV9\/\/bV98skn1q9fv7KUr0JFQASiReDOO++0t99+20444YT6hp133nnO+v333+98hvyPzBcBESgDAemN9FAleNNz8Tx10aJF9sMPP1jbtm09L1sFioAIRI\/AnDlzbMcdd7TOnTvXN65NmzaGl\/e5554zvDj1O7QiAiIgAnUEpDfqQKR8BFvwphgb5s2pU6faF198YcOHD6+Px+vevbvNnDkzzM2S7SIgAmUggJjlkSThDM2aNWtUA0+L8OI02qEEERCB2BOQ3kj\/FZDgTc\/F81S8NRQ6fvz4+ni8YcOG2YABA0yD1iCjRQREIBsBd9+2227rrupTBERABBoRkN5ohMRJkOB1MJT\/z9ixY23GjBnWrVu3+sqOP\/5469mzp9188816PFlPRSsiIAIiIAIiIALFEoiB3igKjQRvUdjSH8R0QUwb1KVLl\/qwBaYGSZ\/bjEeVPLLU48lMhJQuAiKQSsD13qSma1sEREAEMhGQ3jCT4M307SginQElkydPrg9ZmDt3rnGnVURROkQERKAUAiE\/1r04EcdLPG9qc7bcckvbeOONU5O1LQIiIAIikIGABG8GMF4mc8Fi8ngW1t2yWeeCxqhrxLKbrk8REAERIFY39ekPT5GmT59u++23n\/OESJREQAREIJkAugKtwcI6+1hYj7vekODlm1DmBW\/NySefbNOmTTPm1nSrGzVqVKN5Nt19+hQBEYg3AV5SA4GzzjqrPsb\/iiuuIMncfc6G\/oiACIhAHQHpjToQaT4keNNAKUcSb1ObOHGiXX\/99fXxvXhqnnzyyQYD2cpRt8oUgewEtDeIBHjq8+ijjzqm7bzzzs55g3PGPffcY+xzduiPCIiACKQQkN5IAVK3KcFbB6ISH8zQwEwNxPayEO+rC1clyKsOEQgnAbw1EyZMqB8XoHNGOPtRVoeIQERMld5o3JESvI2ZKEUEREAEREAEREAERCBCBCR4I9SZakpFCKgSERABERABERCBkBGQ4A1Zh8lcERABERABEQgGAVkhAuEhIMEbnr6SpSIgAiIgAiIgAiIgAkUQkOAtApoOyZ+AcoqACIiACIiACIiA3wQkeP3uAdUvAiIgAiIQBwJqowiIgI8EJHh9hK+qRUAEREAEREAEREAEyk9Agrf8jPOvQTlFQAREQAREQAREQAQ8JyDB6zlSFSgCIiACIlAqAR0vAiIgAl4SkOD1kqbKEgEREAEREAEREAERCByBEAvewLGUQSIgAiIgAiIgAiIgAgEkIMEbwE6RSSIgAiJQEAFlFgEREAERyEpAgjcrHu0UAREQgcoTWLVqlQ0ZMsS6d+9uM2fOrDfg3Xfftb322stOOOEEW7lyZX26VkRABERABNYSyPRXgjcTGaWLgAiIgE8ENtpoIzvzzDPtRz\/6kV177bWGAGYZO3asY9EFF1xgzZo1c9b1RwREQAREIDcBCd7cjJRDBEQgUgTC0ZiddtrJ8fI+++yz9vjjj9v9999vrFdXV9t2220XjkbIShEQAREICAEJ3oB0hMwQAREQgVQCVVVVtvfee9vo0aPt8ssvtwEDBlj\/\/v1Ts2lbBERABIojEKOjJHhj1NlqqgiIQLgIELYwcuRIW7NmjbVq1crOOOMMa9KkSbgaIWtFQAREIAAEJHgD0AkyQQQCTECm+Uzgvffecwaoffzxx\/bKK6\/4bI2qFwEREIFwEpDgDWe\/yWoREIEYEPjggw\/sb3\/7m\/3sZz9zFtZJi0HT1UQRCCABmRRmAhK8Ye492S4CIhBZAt9++60jdvkkrIGFdUQvn5FtuBomAiIgAmUgIMFbBqgqMr4E1HIR8IrAww8\/bE888YSdeuqpzqwMzMxw0kkn2WOPPWbs86oelSMCIiACcSAgwRuHXlYbRUAEQkWAeN3x48fbbrvtZoMGDaq3\/dhjj7Wdd97Z2Eee+h1aEYHgEZBFIhAoAhK8geoOGSMCIiACZltttZU99dRTdtddd1nz5s3rkbRs2dIeeOABZx956ndoRQREQAREICsBCd6seLSzrARUuAiIgAiIgAiIgAhUgIAEbwUgqwoREAEREAERyEZA+0RABMpLQIK3vHxVugiIgAiIgAiIgAiIgM8EJHh97oD8q1dOERABERABERABERCBYgj8fwAAAP\/\/5woZpwAAAAZJREFUAwD6XL3vW8FlZQAAAABJRU5ErkJggg==","height":337,"width":560}}
%---
