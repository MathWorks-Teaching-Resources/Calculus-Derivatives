%[text] %[text:anchor:T_07C9A64B] # Taylor Polynomials: An Application of Derivatives to Approximating Functions
%[text] [⇦ Main Menu](file:../MainMenu.m)
%[text] You may have noticed that operations with polynomials have many properties that make them popular to work with. This means that there are quite a few situations in the real world where approximating a more complicated function by a polynomial can result in a quick, good-enough solution. Let's investigate some of these approximations.
%[text:tableOfContents]{"heading":"Table of Contents"}
%[text] %[text:anchor:H_2DDAB39B] ## Define a function and a point
%[text] Consider a function $f(x)${"altText":"f(x)"} and a point $x\_0${"altText":"x\_0"} in the domain of $f${"altText":"f"}. Define your function as `f(x)` and your central point for the approximation as `x0`.
syms F(x) f(x)
F(x) =  x^2*sin(x)-x*cos(x); %[control:editfield:3223]{"position":[8,28]}
x0 =  pi/2; %[control:editfield:4225]{"position":[6,11]}
  %[control:button:0e21]{"position":[1,2]}
%[text] You defined:
fexp = F(x); %[text:anchor:M_14D746BF]
displayFormula("f(x) = fexp")
%[text] and
displayFormula("x_0 = x0")
%[text] %[text:anchor:H_1FEA7B8E] ## Tangent Lines
%[text] You have probably encountered the first couple of steps in this process already. If we use a constant function, $P\_0 = a${"altText":"P\_0 = a"}, the best approximation around the point $x\_0${"altText":"x\_0"} is simply to evaluate the function: $P\_0 = f(x\_0)${"altText":"P\_0 = f(x\_0)"}. Visually, this looks like:
xval = x0-5:.1:x0+5;
clf
plot(xval,F(xval))
hold on
plot([xval(1) xval(end)],[F(x0) F(x0)])
xline(x0,":")
hold off
title("A Constant Approximation")
legend(["$y=f(x)$" "$P_0=f(x_0)$" "$x=x_0$"],"Interpreter","latex","Location","best")
axis tight
%[text] Constant functions are usually pretty terrible approximations. We can get a significantly better approximation by considering the best linear approximation to $f(x)${"altText":"f(x)"} around $x=x\_0${"altText":"x=x\_0"}. Theoretically, this means:
%[text]{"align":"center"} $P\_1(x) = ax+b${"altText":"P\_1(x) = ax+b"} 
%[text] with 
%[text]{"align":"center"} $P\_1(x\_0) = f(x\_0)${"altText":"P\_1(x\_0) = f(x\_0)"}       and         $\\left.\\frac{\\text{d}P\_1}{\\text{d}x}\\right|\_{x\_0} = \\left.\\frac{\\text{d}f}{\\text{d}x}\\right|\_{x\_0}${"altText":"(dP\_1)\/(dx) evaluated at x\_0 = (df)\/(dx) evaluated at x\_0"},
%[text] or in other words
%[text]{"align":"center"} $P\_1 = f(x\_0)+f'(x\_0)(x-x\_0)${"altText":"P\_1 = f(x\_0)+f'(x\_0)(x-x\_0)"}.
%[text] The best linear approximation to a differentiable function at a point is the tangent line at that point. In our example, this becomes:
syms dF(x) d f dx
dF(x) = diff(F(x),x);
dfexp = dF(x);
displayFormula("f(x) = fexp")
%[text] and
displayFormula("df/dx = dfexp")
%[text] so evaluating at $x\_0${"altText":"x\_0"} we have:
fx0 = F(x0);
dFx0 = dF(x0);
displayFormula("f(x0) = fx0")
%[text] and
displayFormula("df/dx = dFx0")
%[text] Therefore, $P\_1 = f(x\_0)+f'(x\_0)(x-x\_0)${"altText":"P\_1 = f(x\_0)+f'(x\_0)(x-x\_0)"} simplifies to
syms P(x)
P(x) = F(x0)+dF(x0)*(x-x0);
displayFormula("P_1 = fx0 + (dFx0)*(x-x0)")
%[text] or, in slope-intercept form, 
cval = fx0-dFx0*x0;
displayFormula("P_1 = dFx0*x+cval")
approxLabel = "$P_1 = f(x_0)+f'(x_0)(x-x_0)$";
PlotWithApprox(xval,x0,@(x)F(x),@(x)P(x),approxLabel)
%%
%[text] %[text:anchor:H_34BCE6EF] ### Errors
%[text] With the constant approximation, at the point $x=x\_1${"altText":"x=x\_1"} the constant approximation has an error of 
%[text]{"align":"center"} $\\text{Error} = f(x\_1)-P\_0(x\_1) = f(x\_1)-f(x\_0)${"altText":"Error = f(x\_1)-P\_0(x\_1) = f(x\_1)-f(x\_0)"}.
%[text] With
x1 = vpa( x0+0.5);   %[control:editfield:91d4]{"position":[10,17]} %[control:button:7067]{"position":[20,21]}
x1show = double(round(x1,4));
%[text] this error becomes 
fError = double(vpa(F(x1)-F(x0)));
disp("f("+x1show+") - P_0("+x1show+") = " + fError)
%[text] When the tangent line exists, however, it has an error of
%[text]{"align":"center"} $\\text{Error} = f(x\_1)-P\_1(x\_1)${"altText":"Error = f(x\_1)-P\_1(x\_1)"} 
%[text]{"align":"center"} $= f(x\_1)-\\left(f'(x\_0)(x\_1-x\_0) - f(x\_0)\\right)${"altText":"= f(x\_1)-(f'(x\_0)(x\_1-x\_0) - f(x\_0))"}
%[text]{"align":"center"} $= f(x\_1)-f(x\_0) - f'(x\_0)(x\_1-x\_0)${"altText":"= f(x\_1)-f(x\_0) - f'(x\_0)(x\_1-x\_0)"} 
%[text] which is guaranteed to be small for values of $x\_1${"altText":"x\_1"} close to $x\_0${"altText":"x\_0"}. In this case, the error is
linError = double(vpa(F(x1)-P(x1)));
disp("f("+x1show+") - P_1("+x1show+") = " + linError)
%%
%[text] %[text:anchor:H_A404DEC0] #### ![](text:image:7c6c) **Exercise 1:** Tangent Lines
  %[control:button:74a1]{"position":[1,2]}
%[text] Given a function, $f(x)${"altText":"f(x)"} and a point $x\_0${"altText":"x\_0"}, compute the tangent line to $y=f(x)${"altText":"y=f(x)"} at the point $x=x\_0${"altText":"x=x\_0"}. Your solution should be $P(x)${"altText":"P(x)"}.
clear MyFun VarChoice
syms F(x) dF(x) d P(x) Psoln(x) x
num = randi([-10,10]);
idx = randi(7);
opts = [1 1 1 1 2 3 4];
x0 = num/opts(idx);
[MyFun,VarChoice,~] = GenFun(x,1);  % GenFun is defined in FunctionLibrary   
F(x) = MyFun;
dF(x) = diff(F(x),x);
while imag(double(F(x0))) ~= 0 || imag(double(dF(x0))) ~= 0
    [MyFun,VarChoice,~] = GenFun(x,1);  % GenFun is defined in FunctionLibrary   
    F(x) = MyFun;
    dF(x) = diff(F(x),x);
end
displayFormula("f(VarChoice) = MyFun")
if mod(double(F(pi)),1) == 0
    x0 = x0*pi;
end
xVal = x0-5:0.1:x0+5;
displayFormula("x_0 = x0")
Psoln(x) = F(x0)+dF(x0)*(x-x0);
%%
P(x) =  0; %[control:editfield:6f7a]{"position":[8,10]}
  %[control:button:01f4]{"position":[1,2]}
PlotWithApprox(xVal,x0,@(x)F(x),@(x)P(x),"My tangent line, $P(x)$")
CheckPofx(@(x)P(x),@(x)Psoln(x),x0)
%%
%[text] %[text:anchor:H_2DEBFFDF] ## Quadratic Approximations
%[text] Why stop with linear approximations? Let's compute the best quadratic approximation to our function $f(x)${"altText":"f(x)"} around the point $x= x\_0${"altText":"x= x\_0"}. Consider a general quadratic function, $P\_2 = a(x-x\_0)^2+b(x-x\_0)+c${"altText":"P\_2 = a(x-x\_0)^2+b(x-x\_0)+c"}. Then $P\_2(x\_0) = f(x\_0)${"altText":"P\_2(x\_0) = f(x\_0)"} implies that $c = f(x\_0)${"altText":"c = f(x\_0)"}. We also have the same condition that $\\left.\\frac{\\text{d}P\_2}{\\text{d}x}\\right|\_{x\_0} = b = f'(x\_0)${"altText":"(dP\_2)\/(dx) evaluated at x\_0 = b = f'(x\_0)"}. The final condition is that $\\left. \\frac{\\text{d}P\_2}{\\text{d}x^2}\\right|\_{x\_0} = 2a = f''(x\_0)${"altText":" (dP\_2)\/(dx^2) evaluated at x\_0 = 2a = f''(x\_0)"}. Therefore, $a = \\frac{f''(x\_0)}{2}${"altText":"a = (f''(x\_0))\/(2)"}, and the quadratic approximation to $f(x)${"altText":"f(x)"} at $x\_0${"altText":"x\_0"} is
%[text]{"align":"center"} $P\_2 = \\frac{f''(x\_0)}{2}(x-x\_0)^2 + f'(x\_0)(x-x\_0) +f(x\_0)${"altText":"P\_2 = (f''(x\_0))\/(2)(x-x\_0)^2 + f'(x\_0)(x-x\_0) +f(x\_0)"} 
%[text] which is also 
%[text]{"align":"center"} $P\_2 = \\frac{f''(x\_0)}{2}(x-x\_0)^2 + P\_1.${"altText":"P\_2 = (f''(x\_0))\/(2)(x-x\_0)^2 + P\_1."} 
%[text] ![](text:image:8cd1) **Exercise 2: Quadratic Approximation** 
%[text] Find the quadratic approximation to $y = e^x${"altText":"y = e^x"} around the point $x = 0${"altText":"x = 0"}. Your approximation should be $P(x)${"altText":"P(x)"}. 
syms P(x)
P(x) =  0; %[control:editfield:946c]{"position":[8,10]}
  %[control:button:87c7]{"position":[1,2]}
PlotWithApprox(-1:0.02:1,0,@(x)exp(x),@(x)P(x),"My solution, $P(x)$")
CheckPPofx(@(x)P(x))
%%
%[text] %[text:anchor:H_559274A7] ## Higher Order Approximation
%[text] We can continue to extend these calculations to higher order approximations. A fifth-degree approximation, for instance, would be:
%[text]{"align":"center"} $P\_5(x) = a\_0 + a\_1(x-x\_0)+a\_2(x-x\_0)^2+a\_3(x-x\_0)^3 + a\_4(x-x\_0)^4 + a\_5(x-x\_0)^5${"altText":"P\_5(x) = a\_0 + a\_1(x-x\_0)+a\_2(x-x\_0)^2+a\_3(x-x\_0)^3 + a\_4(x-x\_0)^4 + a\_5(x-x\_0)^5"}
%[text] and $P\_5(x)${"altText":"P\_5(x)"} must agree with the function $f(x)${"altText":"f(x)"} we are trying to approximate and as many derivatives as possible.
%[text]{"align":"center"} $P\_5(x\_0) = f(x\_0) \\Rightarrow a\_0 = f(x\_0)${"altText":"P\_5(x\_0) = f(x\_0) implies a\_0 = f(x\_0)"}
%[text]{"align":"center"} $P\_5'(x\_0) = f'(x\_0) \\Rightarrow a\_1 = f'(x\_0)${"altText":"P\_5'(x\_0) = f'(x\_0) implies a\_1 = f'(x\_0)"}
%[text]{"align":"center"} $P''\_5(x\_0) = f''(x\_0) \\Rightarrow 2a\_2 = f''(x\_0)${"altText":"P''\_5(x\_0) = f''(x\_0) implies 2a\_2 = f''(x\_0)"}
%[text]{"align":"center"} $\\left.\\frac{\\text{d}^3P\_5}{\\text{d}x^3}\\right|\_{x\_0} = \\left.\\frac{\\text{d}^3f}{\\text{d}x^3}\\right|\_{x\_0} \\Rightarrow 6a\_3 = \\left.\\frac{\\text{d}^3f}{\\text{d}x^3}\\right|\_{x\_0}${"altText":"(d^3P\_5)\/(dx^3) evaluated at x\_0 = (d^3f)\/(dx^3) evaluated at x\_0 implies 6a\_3 = (d^3f)\/(dx^3) evaluated at x\_0"}
%[text]{"align":"center"} $\\left.\\frac{\\text{d}^4P\_5}{\\text{d}x^4}\\right|\_{x\_0} = \\left.\\frac{\\text{d}^4f}{\\text{d}x^4}\\right|\_{x\_0} \\Rightarrow 24a\_4 = \\left.\\frac{\\text{d}^4f}{\\text{d}x^4}\\right|\_{x\_0}${"altText":"(d^4P\_5)\/(dx^4) evaluated at x\_0 = (d^4f)\/(dx^4) evaluated at x\_0 implies 24a\_4 = (d^4f)\/(dx^4) evaluated at x\_0"}
%[text]{"align":"center"} $\\left.\\frac{\\text{d}^5P\_5}{\\text{d}x^5}\\right|\_{x\_0} = \\left.\\frac{\\text{d}^5f}{\\text{d}x^5}\\right|\_{x\_0} \\Rightarrow 120a\_5 = \\left.\\frac{\\text{d}^5f}{\\text{d}x^5}\\right|\_{x\_0}${"altText":"(d^5P\_5)\/(dx^5) evaluated at x\_0 = (d^5f)\/(dx^5) evaluated at x\_0 implies 120a\_5 = (d^5f)\/(dx^5) evaluated at x\_0"}
%[text] ![](text:image:4134) **Exercise 3: Higher Order Approximation** 
%[text] a) Calculate the fifth-degree approximation $P\_5(x)${"altText":"P\_5(x)"} for $f(x) = \\sin(x)${"altText":"f(x) = sin(x)"} around $x\_0 = 0${"altText":"x\_0 = 0"}. 
syms P5f(x) 
P5f(x) =  0; %[control:editfield:8241]{"position":[10,12]}
%[text] b) Calculate the fourth-degree approximation $P\_4(x)${"altText":"P\_4(x)"} for $g(x) = 3x^2-2x+7${"altText":"g(x) = 3x^2-2x+7"} around $x\_0 = -1${"altText":"x\_0 = -1"}.
syms P4g(x) 
P4g(x) =  0; %[control:editfield:1196]{"position":[10,12]}
%[text] c) Calculate the third-degree approximation $P\_3(x)${"altText":"P\_3(x)"} for $h(x) = \\ln(x)${"altText":"h(x) = ln(x)"} around $x\_0 = 1${"altText":"x\_0 = 1"}. 
syms P3h(x)
P3h(x) =  0; %[control:editfield:1778]{"position":[10,12]}
CheckHigherOrderApprox(@(x)P5f(x),@(x)P4g(x),@(x)P3h(x))
  %[control:button:467b]{"position":[1,2]}
%%
%[text] ![](text:image:99cb) **Additional Practice: Create and Solve Your Own Problems**
%[text] Set up the problem:
syms x f(x) Pn(x)
f(x) =  log(x); %[control:editfield:9365]{"position":[8,15]}
x0 =  0; %[control:editfield:5a20]{"position":[6,8]}
n = 2; %[control:slider:2a08]{"position":[5,6]}
%[text] Solve the problem of finding $P\_n(x)${"altText":"P\_n(x)"} for $f(x)${"altText":"f(x)"} around a center $x\_0${"altText":"x\_0"}.
Pn(x) =  0; %[control:editfield:1ac6]{"position":[9,11]}
  %[control:button:2dbf]{"position":[1,2]}
CheckMyApprox(@(x)f(x),x0,n,@(x)Pn(x));
%%
%[text] %[text:anchor:H_2471D2EB] ## Taylor Polynomials
%[text] Consider the $n^{\\text{th}}${"altText":"n^(th)"} Taylor polynomial, $P\_n(x)${"altText":"P\_n(x)"}, defined as:
%[text]{"align":"center"} $P\_n(x) = f(x\_0) + \\left. \\frac{\\text{d} f}{\\text{d} x} \\right|\_{x\_0} (x - x\_0) + \\left. \\frac{\\text{d}^2 f}{\\text{d} x^2} \\right|\_{x\_0} (x - x\_0)^2 + \\ldots + \\left. \\frac{\\text{d}^n f}{\\text{d} x^n} \\right|\_{x\_0} (x - x\_0)^n.${"altText":"P\_n(x) = f(x\_0) +  (d f)\/(d x) evaluated at x\_0 (x - x\_0) +  (d^2 f)\/(d x^2) evaluated at x\_0 (x - x\_0)^2 + ... +  (d^n f)\/(d x^n) evaluated at x\_0 (x - x\_0)^n."}
%[text] We can visualize the resulting approximation:
syms F(x) 
F(x) = sin(x+1)*cos(x); %[control:editfield:4322]{"position":[8,23]}
x0 = -1; %[control:editfield:2ad3]{"position":[6,8]}
deg = 4; %[control:editfield:62dd]{"position":[7,8]}
bds = [-pi,pi]; %[control:editfield:94e7]{"position":[8,11]} %[control:editfield:7274]{"position":[12,14]}
  %[control:button:4977]{"position":[1,2]}
if deg<0 || mod(deg,1) ~= 0
    disp("Please select a non-negative integer degree, n.")
else
    try
        currentProject;
        T = ShowTaylor(@(x)F(x),deg,bds,x0);
    catch
        addpath("FunctionLibrary")
        T = ShowTaylor(@(x)F(x),deg,bds,x0);
        rmpath("FunctionLibrary")
    end
end
oldPrefs = sympref();          % Save the current user preferences to reset at the end of the section
sympref('PolynomialDisplayStyle','ascend');  % Present polynomials in descending power format
sympref('FloatingPointOutput',false);         % Do not use floating point representations
displayFormula("P_n(x) = T")
sympref(oldPrefs);   % Restore the system preferences you had before running this script.
%[text] ![](text:image:2509) **Reflect**.
%[text] 1. Investigate the Taylor polynomial approximations for $\\sin(x)${"altText":"sin(x)"} and $\\cos(x)${"altText":"cos(x)"}. Do you have a theory as to why $\\sin(x)${"altText":"sin(x)"} is an odd function and $\\cos(x)${"altText":"cos(x)"} is an even function? \
%%
%[text] %[text:anchor:H_80C6B665] ### Animate Approximation by Taylor Polynomials
%[text] Visualize the improvement in the approximation as the order of the polynomial used grows.
if ~exist("bds","var")
    syms F(x)
    F(x) =  sin(x)/x-x*cos(x);
    x0 =  0;
    bds = [-3*pi,3*pi];
    disp("Using default values with f(x) = x*sin(x)-cos(x)/x and x0=0.")
end
  %[control:button:0c5c]{"position":[1,2]}
finalValue = 13; %[control:slider:3a3c]{"position":[14,16]}
try
    currentProject;
    Tlast = ShowTaylor(@(x)F(x),1:finalValue,bds,x0);
catch
    addpath("FunctionLibrary")
    Tlast = ShowTaylor(@(x)F(x),1:finalValue,bds,x0);
    rmpath("FunctionLibrary")
end

%%
showT = false; %[control:checkbox:9ab1]{"position":[9,14]}
if showT
    displayFormula("P_n(x) = Tlast",["n","Tlast"],[finalValue,Tlast])
end
%%
%[text] %[text:anchor:H_A33B1A08] ## Further Exploration: [Taylor Series](https://www.mathworks.com/help/symbolic/taylor-series.html)
%[text] If we take this to the limit and allow an infinite number of terms in our sum, we have the expression:
%[text]{"align":"center"} $f(x\_0) + \\sum\_{i=1}^{\\infty} \\left.\\frac{\\text{d}^if}{\\text{d}x^i}\\right|\_{x\_0} (x-x\_0)^i${"altText":"f(x\_0) + sum from i=1 to infinity of (d^if)\/(dx^i) evaluated at x\_0 (x-x\_0)^i"}
%[text] In fact, for sufficiently nice functions, called *analytic functions*, this expression converges to the value of the function itself: 
%[text]{"align":"center"} $f(x) = f(x\_0) + \\sum\_{i = 1}^\\infty \\left. \\frac{\\text{d}^if}{\\text{d}x^i} \\right|\_{x\_0} (x - x\_0)^i${"altText":"f(x) = f(x\_0) + sum from i = 1 to infinity of  (d^if)\/(dx^i) evaluated at x\_0 (x - x\_0)^i"}
%%
%[text] [⇦ Main Menu](file:../MainMenu.m)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] %[text:anchor:H_6A0979CA] ## Local Helper Functions
%[text] 
%[text] `PlotWithApprox(xval,x0,Fh,dFh,approxLabel)` 
%[text] Create a plot of the original function $y = \\text{Fh}(x)${"altText":"y = Fh(x)"} over the domain given by `xval`. Layer on top of that a plot of $y=\\text{dFh}(x)${"altText":"y=dFh(x)"} over the same domain. The final argument, `approxLabel`, provides the label used in the legend for the function $y=\\text{dFh}(x)${"altText":"y=dFh(x)"}. 
function PlotWithApprox(xval,x0,Fh,dFh,approxLabel)
clf
plot(xval,double(Fh(xval)),"LineWidth",2)
hold on
plot(xval,double(dFh(xval)))
xline(x0,":")
hold off
legend(["$y=f(x)$" approxLabel "$x=x_0$"],"Interpreter","latex","Location","best")
axis tight
end

%[text] `CheckPofx(Ph,Psolnh,x0)`
%[text] This function checks whether the expressions `Ph` and `Psolnh` match the way they are supposed to. It displays 'partial credit' comments if some of the computation matches, as well as noting the correctness or incorrectness of the entire solution.
function CheckPofx(Ph,Psolnh,x0)
syms x
flag = [0 0];
    if abs(double(Ph(x0) - Psolnh(x0))) < 4*eps
        disp("You have the correct value for f("+x0+")")
        flag(1) = 1;
    else
        disp("You have an incorrect value for f("+x0+")")
    end
    if abs(double(diff(Ph(x),x)-diff(Psolnh(x),x)))<4*eps
        disp("You have the correct value for f'("+x0+")")
        flag(2) = 1;
    else
        disp("You have an incorrect value for f'("+x0+")")
    end

flag = logical(flag);

if all(flag)
    disp("Your solution for the tangent line is correct.")
else
    disp("Your solution for the tangent line is incorrect. Please try again.")
end
end
%[text] `CheckPPofx(Ph)`
%[text] A modified version of CheckP`ofx` that checks the solutions offered to Exercise 2.
function CheckPPofx(Ph)
syms x
x0 = 0;
flag = [0 0 0];
    if abs(double(Ph(x0) -1)) < 4*eps
        disp("You have the correct value for f("+x0+")")
        flag(1) = 1;
    else
        disp("You have an incorrect value for f("+x0+")")
    end
    if abs(double(subs(diff(Ph(x),x)-1,x,0)))<4*eps
        disp("You have the correct value for f'("+x0+")")
        flag(2) = 1;
    else
        disp("You have an incorrect value for f'("+x0+")")
    end
    if abs(double(diff(Ph(x),2)-1))<4*eps
        disp("You have the correct value for the quadratic term, a.")
        flag(3) = 1;

    elseif abs(double(diff(Ph(x),x,2)/2-1))<4*eps
        disp("You have an incorrect value for the quadratic term, a.")
        disp("Perhaps you forgot to divide by 2?")
    else
        disp("You have an incorrect value for the quadratic term, a.")
    end
flag = logical(flag);

if all(flag)
    disp("Your solution for the quadratic approximation is correct.")
else
    disp("Your solution for the quadratic is incorrect. Please try again.")
end
end
%[text] `CheckHigherOrderApprox(P1,P2,P3)`
%[text] This function checks that the solutions to Exercise 3 are correct by calling a helper function that checks each derivative.
function CheckHigherOrderApprox(P1,P2,P3)
CheckDers(P1,[0 1 0 -1 0 1],0, "a)");
CheckDers(P2,[12 -8 6 0 0],-1,"b)");
CheckDers(P3,[0 1 -1 2],1,"c)");
end
%[text] `CheckMyApprox(f,x0,n,Pn)`
%[text] This function computes the appropriate arguments to pass into CheckD`ers` to evaluate whether the solution to the self-defined Additional Practice is correct.
function CheckMyApprox(f,x0,n,Pn)
syms x
pSoln = nan([1 n+1]);
pSoln(1) = double(f(x0));
for k = 1:n
    dkf = diff(f(x),x,k);
    try
        pSoln(k+1) = subs(dkf,x0);
    catch ME
        disp(ME.message)
    end
end
CheckDers(Pn,pSoln,x0,"extra");
end
%[text] `CheckDers(P,pSoln,x0,partLabel)`
%[text] This function checks the derivatives of the proposed solution `P` against expected values defined by `pSoln` at the point `x0`. The input value `partLabel` is used to identify which Exercise component is currently being checked so feedback can be provided correctly.
function flag = CheckDers(P,pSoln,x0,partLabel)
syms x
flag = 1;
p0 = pSoln(1);
pRest = pSoln(2:end);
if P(x0) ~= p0
    flag = 0;
else
    for k = 1:length(pRest)
        dkP = diff(P(x),x,k);
        if abs(double(subs(dkP,x0))-pRest(k)) > 4*eps && flag == 1
            flag = 0;
        end
    end
end

if partLabel ~= "extra"
    if flag == 1
        disp("Your solution for part " + partLabel + " is correct.")
    else
        disp("Your solution for part " + partLabel + " is incorrect.")
        disp("Please try " + partLabel + " again.")
    end
else
    if flag == 1
        disp("You have correctly solved the problem.")
    else
        disp("No, that is not the correct solution. Please try again.")
        disp("You probably want to check your derivatives and your signs.")
    end
end
end

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"hidecode","rightPanelPercent":33.1}
%---
%[control:editfield:3223]
%   data: {"defaultValue":" x^2*sin(x)-x*cos(x)","label":"f(x) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:editfield:4225]
%   data: {"defaultValue":" pi\/2","label":"x0 = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:button:0e21]
%   data: {"label":"Set these values and evaluate","run":"Section"}
%---
%[control:editfield:91d4]
%   data: {"defaultValue":" x0+0.5","label":"x1 = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:button:7067]
%   data: {"label":"Calculate","run":"Section"}
%---
%[text:image:7c6c]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:74a1]
%   data: {"label":"Generate a Problem","run":"Section"}
%---
%[control:editfield:6f7a]
%   data: {"defaultValue":" 0","label":"P(x) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:button:01f4]
%   data: {"label":"Check my solution","run":"Section"}
%---
%[text:image:8cd1]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:editfield:946c]
%   data: {"defaultValue":" 0","label":"P(x) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:button:87c7]
%   data: {"label":"Check","run":"Section"}
%---
%[text:image:4134]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:editfield:8241]
%   data: {"defaultValue":" 0","label":"P_5(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:1196]
%   data: {"defaultValue":" 0","label":"P_4(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:1778]
%   data: {"defaultValue":" 0","label":"P_3(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:467b]
%   data: {"label":"Check Solutions","run":"Section"}
%---
%[text:image:99cb]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:editfield:9365]
%   data: {"defaultValue":" log(x)","label":"f(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:5a20]
%   data: {"defaultValue":" 0","label":"x0 = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:slider:2a08]
%   data: {"defaultValue":2,"label":"n","max":6,"min":1,"run":"Nothing","runOn":"ValueChanged","step":1}
%---
%[control:editfield:1ac6]
%   data: {"defaultValue":" 0","label":"P(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:2dbf]
%   data: {"label":"Check solution","run":"Section"}
%---
%[control:editfield:4322]
%   data: {"defaultValue":"sin(x+1)*cos(x)","label":"f(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:2ad3]
%   data: {"defaultValue":"-1","label":"x0 = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:62dd]
%   data: {"defaultValue":0,"label":"n = ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:94e7]
%   data: {"defaultValue":"-pi","label":"Left endpoint = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:7274]
%   data: {"defaultValue":"pi","label":"Right endpoint = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:4977]
%   data: {"label":"Set these values and evaluate","run":"Section"}
%---
%[text:image:2509]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:0c5c]
%   data: {"label":"Create Animation","run":"Section"}
%---
%[control:slider:3a3c]
%   data: {"defaultValue":13,"label":"Highest degree approximation?","max":30,"min":5,"run":"Section","runOn":"ValueChanged","step":1}
%---
%[control:checkbox:9ab1]
%   data: {"defaultValue":false,"label":"Show Taylor polynomial? ","run":"Section"}
%---
