%[text] %[text:anchor:T_E6A09C28] # Definition of Derivatives
%[text] [⇦ Main Menu](file:../MainMenu.m)
%[text] How much time do you have to drink your coffee before it becomes too cold? How far will a ball travel before it hits the ground? Will my couch fit through the hallway into my apartment? Many every-day interactions can be described by functions, and these functions can be analyzed by studying their rates of change.
%[text]{"align":"center"} ![A mug containing hot liquid that is cooling down](text:image:29d4) ![A couch to be moved](text:image:7330) ![A basketball to be thrown](text:image:925e)
%[text] Derivatives allow us to answer these questions by computing rates of change for a given function. 
%[text] 
%[text:tableOfContents]{"heading":"**Table of Contents**"}
%[text] %[text:anchor:H_51183E7B] **Before you get started:**
%[text] %[text:anchor:H_BF646A47] This live script is intended to be used with the code hidden. On the **View** tab of the MATLAB toolstrip, in the **View** section, select **Hide Code**.  Alternately, select **Hide Code** using the icon ![live script code hidden icon](text:image:4769) at the top right of the Live Editor pane.
%[text] ![Bright idea symbol](text:image:857c) Although the code is hidden, some interactivity requires familiarity with MATLAB. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2 hour online tutorial that teaches the essentials of MATLAB.
%[text] %[text:anchor:H_8F8A032D] ![Warning symbol](text:image:896a) For an optimal experience, follow the instructions and steps in the given sequence. Proceed to a new section only after completing the preceding one. Some sections depend on variables created in prior sections and will generate errors if run out of order.
%[text] The ![Try this icon](text:image:7792)  and  ![Exercise icon](text:image:362e) icons refer to two different types of interactive activities that you will find in this script. The ![Try this icon](text:image:05d0)  usually indicates an interaction where you will explore the visualization of some concept introduced in this script. The ![Exercise icon](text:image:569e) interactions are designed to challenge your understanding of those concepts and may be used for grading and completion checks by your professor.
%[text] %[text:anchor:H_4060251F] ## Definition of the Derivative
%[text] The derivative of a function tracks the rate of change of that function at each point in its domain. 
%[text] %[text:anchor:H_52AF4A61] #### Motivating Example: Cooling Coffee
%[text] %[text:anchor:H_90274D82] Consider the function $T(t)${"altText":"T(t)"} that tracks the temperature, in degrees Celsius, of a cup of coffee as a function of time, in minutes. If the coffee is poured out of a temperature-controlled carafe held at $95^{\\circ}${"altText":"95 degrees"}C at $t=5${"altText":"t=5"} minutes, a representative cooling curve is presented below. The rate of change of $T(t)${"altText":"T(t)"} with respect to time $t${"altText":"t"} in this scenario is the rate at which the coffee is cooling, with units of degrees Celsius per minute. Calculus provides tools that can determine the rate of change at each point of this function.
t1 = 6;   % Select a point to evaluate T(t) at, default t1 = 6  %[control:slider:1507]{"position":[6,7]}
dx = 3;     % radius of tangent line to draw %[control:slider:8bf1]{"position":[6,7]}
                   % Run this section %[control:button:4d83]{"position":[1,2]}
if ~exist("sCoffee","var")||~isvalid(sCoffee)
    syms t;       % Create a symbolic variable
    % Run the function CoffeeExample, defined in Local Helper Functions
    [sCoffee,tHandle,Temp] = CoffeeExample(t1,dx); 
    ax = sCoffee.Parent;           % Track the axis plotting the coffee curve
else
sCoffee.XData = t1;    % Reset the x coordinate of the point
T1 = double(Temp(t1)); % Evaluate the point T1 = T(t1)
sCoffee.YData = T1;    % Reset the y coordinate of the point  
tHandle.XData = [t1-dx,t1+dx];     % Reset the x data for the linear approximation
[m,TempVals] = GetLinApprox(Temp,t,t1,T1,dx);   % The function GetLinApprox is defined in Local Helper Functions
tHandle.YData = TempVals;  % Reset the y data for the linear approximation
xticks(ax,[-1 t1 31]);     % Add an x tick at the point t=x1
yticks(ax,[15 T1 100]);    % Add a y tick at the point T=T1
legend(ax,["$T(t)$" "$(t,T(t))$ = ("+t1+","+T1+")" "Rate of Change " + ...
    "= "+m+" $^{\circ}$C/min"],"Location","best","Interpreter","latex")
drawnow
end
%%
%[text] %[text:anchor:H_6886B216] #### Motivating Example: Basketball
%[text] The height of a basketball $H${"altText":"H"}, in meters, as a function of the time $t${"altText":"t"}, in seconds has a derivative that tracks the rate of change of height with respect to time in meters per second. The derivative of a position function with respect to time is a velocity function. The derivative of a velocity function with respect to time is an acceleration function.
t2 = 0.5;  % Select the point in time to consider %[control:slider:1076]{"position":[6,9]}
               % Run this section %[control:button:348d]{"position":[1,2]}
if ~exist("lH","var") || ~isvalid(lH) 
                                  % Check if this section has been run before, if not set up the graph
    figure 
    [lH,lV,lA] = BasketballExample(t2);   % Run the function BasketballExample found in Local Helper Functions
else
    lH.Value = t2;               % Update the location of the dotted line
    lV.Value = t2;
    lA.Value = t2;
end
%%
%[text] %[text:anchor:H_CFA5E626] #### Motivating Example: Moving a couch
%[text] Consider moving a couch into a new apartment. It may be necessary to maneuver the couch around a corner, but couches are not flexible. Calculus offers tools to determine whether a one-dimensional couch will fit around a corner. Calculus provides a method that will locate the minimal value of the longest path over all possible paths around a curve. Similar methods could be employed for a more realistic three dimensional couch.
%[text] The black lines model the walls, the white area is the available floor and the red line models the couch.
           % This button runs this section of code %[control:button:44ae]{"position":[1,2]}
clf
CouchExample([1.5 9]);  % Run the function CouchExample found in Local Helper Functions
%%
%[text] %[text:anchor:H_8E01DCBA] ### Limit Definition of the Derivative
%[text] More formally, the derivative of a function $y=f(x)${"altText":"y=f(x)"} is defined as the limit of the slopes of secant lines between the points $(x,f(x))${"altText":"(x,f(x))"} and $(x+h,f(x+h))${"altText":"(x+h,f(x+h))"}:
%[text]{"align":"center"} $f'(x) = \\lim\_{h \\rightarrow0} \\enspace\\frac{f(x+h) - f(x)}{h}${"altText":"f'(x) = limit as h -\> 0 of (f(x+h) - f(x))\/(h)"} 
%[text] %[text:anchor:H_CF230EAB] #### Illustrative Example
%[text] Let $f(x) = x^2${"altText":"f(x) = x^2"}, and choose a particular value $x\_1=-1${"altText":"x\_1=-1"}, and start with $h=2.5${"altText":"h=2.5"}. Observe the slope of the secant line as you make $|h|${"altText":"|h|"} smaller.
syms x            % Set up a symbolic variable x
f(x) = x^2;       % Define a function f(x) = x^2
x1 = -1;          % Set the initial value x=x1 to be -1
h = 2.5;     % Select the step size h %[control:slider:7f76]{"position":[5,8]}
figure
  %[control:button:0691]{"position":[1,2]}
fplot(f(x))       % Plot the function y=f(x) using the symbolic function plotting command
hold on
title("Plotting the secant line between $x = $" + x1 + " and $x+h = $" + x1+h,"Interpreter","latex")
xlabel("x")
ylabel("f(x)")
GraphSecant(@(x)f(x),x1,x1+h,"f");         % GraphSecant is a function in Local Helper Functions
legend(["" "$f(x)$" "Secant line from $x_1$ to $x_1+h$"],"Location","north")
m = double((f(x1+h)-f(x1))/(h));           % Compute the slope of the secant line
annotation("textbox",[.4 .5 .2 .2],"EdgeColor","none","String","slope = "+m) % Display the slope on the plot
%[text]{"align":"center"} $\\text{Slope}  = \\frac{f(-1+h)-f(-1)}{h} = \\frac{(-1+h)^2-(-1)^2}{h} = \\frac{1-2h+h^2-1}{h} = -2+h${"altText":"Slope = (f(-1+h)-f(-1))\/(h) = ((-1+h)^2-(-1)^2)\/(h) = (1-2h+h^2-1)\/(h) = -2+h"}
%[text] The derivative of the function $f(x)${"altText":"f(x)"} at the point $x=x\_1${"altText":"x=x\_1"} is
%[text]{"align":"center"} $f'(x\_1) = \\lim\_{h\\to 0} \\frac{f(x\_1+h)-f(x\_1)}{h} = \\lim\_{h\\to 0} -2 + h = -2${"altText":"f'(x\_1) = limit as h -\> 0 of (f(x\_1+h)-f(x\_1))\/(h) = limit as h -\> 0 of -2 + h = -2"}
fplot(f(x))           % Plot y=f(x) using the symbolic graphing function
dx = 0;               % Set a step size of 0 to reuse the secant code to graph a tangent line
hold on
title("Plotting the tangent line to $f(x) = x^2$ at $x_1 =$" + x1,"Interpreter","latex")
xlabel("x")
ylabel("f(x)")
GraphSecant(@(x)f(x),x1,x1+dx,"f");  % GraphSecant is defined in Local Helper Functions
hold on
scatter([x1 x1+dx],double([f(x1) f(x1+dx)]),"o","filled","SeriesIndex",2)    % Plot (x1,f(x1))
legend(["" "$f(x)$" "Tangent line at $x_1$"],"Location","north","Interpreter","latex")
m = 2*x1;            % Compute the slope of the tangent line to x^2 at x=x1
annotation("textbox",[.4 .5 .2 .2],"EdgeColor","none","String","slope = "+m) % Display the slope on the plot
hold off
%[text] The line through a point on a curve with a slope equal to the derivative at that point is called the tangent line. It is the best linear approximation to the function at that point.    
%[text] Putting this all together:
%[text]{"align":"center"} $f'(x) = \\lim\_{h \\rightarrow0} \\enspace\\frac{f(x+h) - f(x)}{h}= \\lim\_{\\Delta x \\to 0} \\frac{\\Delta f}{\\Delta x} = \\lim\_{(x\_2-x\_1) \\to 0} \~\\frac{y\_2 - y\_1}{x\_2-x\_1}${"altText":"f'(x) = limit as h -\> 0 of (f(x+h) - f(x))\/(h)= limit as Delta x -\> 0 of (Delta f)\/(Delta x) = limit as (x\_2-x\_1) -\> 0 of (y\_2 - y\_1)\/(x\_2-x\_1)"}
%[text] The ratio $\\frac{f(x+h)-f(x)}{h}${"altText":"(f(x+h)-f(x))\/(h)"} is called the difference quotient.
%%
%[text] %[text:anchor:H_E986D3A0] ### Derivatives as Limits of Secant Lines
%[text] ![](text:image:1234) **Try.** 
%[text] First, use the default function to set up a graphical representation of the limit definition. Then try a few more functions of your choice.
syms x f(x) h df dx              % set up symbolic variables and functions
f(x) =  x^3      % define the function and display the result %[control:editfield:60ae]{"position":[8,12]}
%[text] ![](text:image:1371) **Pro-tip**. MATLAB syntax is `3*x^2` for $3x^2${"altText":"3x^2"} or `exp(2*x)` for $e^{2x}${"altText":"e^(2x)"}. For more detail, check out the Help Center documentation for [mathematical functions](https://www.mathworks.com/help/matlab/referencelist.html?type=function&listtype=cat&category=mathematics) or the [Basic Functions Reference](https://www.mathworks.com/campaigns/offers/matlab-basic-functions-reference-cheat-sheet.html).
                 % Run the current section %[control:button:9021]{"position":[1,2]}
figure                            % Initialize a figure
x1 = 1;  % Define a value for x1 %[control:slider:92f5]{"position":[6,7]}
fx1 = f(x1);                      % Compute the value f(x1)
x2 = -4; % Define a value for x2 %[control:slider:457d]{"position":[6,8]}
                                  % out is true if x1-x2 = 0
out = GraphSecant(@(x) f(x),x1,x2,"f");  % GraphSecant is defined in Helper Functions
if out                            % Run if x1-x2 = 0 to highlight the secant/tangent difference
    warning("There is no secant line through a single point. Graphing the tangent line.")
end
%[text] **Calculations:**
%[text] Use $h${"altText":"h"}`=x2-x1` for the step size $\\Delta x${"altText":"Delta x"}:
deltax = x2-x1;    % Compute h = x2-x1, the denominator of the difference quotient
% Print the steps of the computation
displayFormula("h = deltax")
if deltax ~= 0                       % Separate secant and tangent computations
    fx2 = f(x2);                     % Compute the value f(x2)
    df21 = fx2-fx1;                  % Compute f(x2)-f(x1), the numerator of the difference quotient
    sDQ = simplify(df21/deltax);     % Symbolically simplify the difference quotient
    vpaDQ = vpa(sDQ);                % Express the difference quotient in variable precision arithmetic
    displayFormula("f(x_1+h)-f(x_1) = f(x2)-f(x1)")
    displayFormula("f(x_1+h)-f(x_1) = fx2-fx1")
    displayFormula("(f(x_1+h)-f(x_1))/h = sDQ")
    if ~isequal(round(sDQ),sDQ)
        displayFormula("(f(x_1+h)-f(x_1))/h = vpaDQ")
    end
else
    fxph = f(x+h);                   % Name the symbolic expression f(x+h)
    fx = f(x);                       % Name the symbolic expression f(x)
    displayFormula("df/dx = limit((fxph-fx)/h,h,0)")
    dfEval(x) = diff(f(x),x);        % Compute the symbolic derivative f'(x)
    dfxS = simplify(dfEval(x1));     % Evaluate and symbolically simplify f'(x1)
    dfxV = vpa(dfxS);                % Express f'(x1) in variable precision arithmetic
    displayFormula("df/dx = dfxV")
end
%[text] ![](text:image:64cb) **Try** 
%[text] Investigate what happens for different values of `x1` and `x2` and for different functions `f(x)`.  
%[text] ![](text:image:6c5d) **Reflect**
%[text] 1. What do you notice about the slope of the secant line as you change `x2`?
%[text] 2. What happens when you set `x2` equal to `x1`?
%[text] 3. Can you find values for `x1` and `x2` where the secant line has a positive slope? Or negative slope? Or zero slope? 
%[text] 4. Do your answers to Question 3 change if you start with a different function `f(x)`? \
%%
%[text] %[text:anchor:H_11B23D0C] ## Derivatives are Slopes
%[text] Using the fact that the derivative is the slope of the tangent line, try evaluating the definition of the derivative at different points. Notice that when the derivative is positive, the function is increasing (and vice versa). The function you are exploring here is $y = 6 + \\cos(x) - \\frac{32}{5}e^{-x/5}${"altText":"y = 6 + cos(x) - (32)\/(5)e^(-x\/5)"} over a range from $x=0${"altText":"x=0"} to $x=25${"altText":"x=25"}. 
xPosn = 3;  % Set the value of x to consider %[control:slider:519f]{"position":[9,10]}
figure
ExampleFunction(xPosn,2); % ExampleFunction is defined in Local Helper Functions
                          % Run this section %[control:button:8410]{"position":[1,2]}
%[text] ![](text:image:71bf) **Reflect**
%[text] 1. What do you notice about the derivative near the top of a peak? What about near the bottom of a valley? 
%[text] 2. Can you calculate the derivative of this function from its limit definition? Why or why not? \
%%
%[text] %[text:anchor:H_DC183546] ## **Graphical Derivatives**
%[text] %[text:anchor:H_E8956C76] Surprisingly often, it is sufficient to know the sign (positive, negative, or zero) of a derivative. A positive derivative at a point means the function is increasing in value from left to right at that point. A negative value means the function is decreasing in value from left to right at that point. And a zero derivative means the function is constant, neither increasing nor decreasing, in value at that point.
syms x                            % Create the symbolic variable x
g(x) =  exp(x)*cos(x)+x^2       % Define a function g(x) %[control:editfield:53c5]{"position":[8,26]}
xa = -3;  % Select a point x=xa %[control:slider:857c]{"position":[6,8]}
                        % Run this section of code %[control:button:7259]{"position":[1,2]}
figure 
fplot(g,"SeriesIndex","none");    % Symbolically plot the function y=g(x)
hold on
scatter(xa,g(xa),75,"filled","SeriesIndex",2)    % Plot the point (xa, g(xa))
hold off
title("Plot of $y = g(x)$ and the point $(x_1, g(x_1))$ = (" + xa + "," + double(g(xa)) + ")","Interpreter","latex")
xlabel("$x$","Interpreter","latex")
ylabel("$g(x)$","Interpreter","latex")
%%
%[text] ![](text:image:9ee5) **Exercise 1**. Determine the sign of the derivative at the point you have selected:
slope = "undefined";       % Set the value of slope from a set of options %[control:dropdown:5288]{"position":[9,20]}
                         % Run this section %[control:button:4c67]{"position":[1,2]}
if ~exist("xa","var")               % Check whether the variable xa exists
    xa = 3;                         % If not, set xa to its default value
end
if ~exist("g","var")                % Check whether the function g(x) exists
    syms x
    g(x) = exp(x)*cos(x)+x^2;       % If not, set g(x) to its default value
end
CheckSlope(slope,@(x) g(x),xa,"g"); % The function checkSlope is defined in Helper Functions
%%
%[text] ![](text:image:5d6e) **Exercise 2**. Find a point on the graph that has the specified derivative:
                     % Run this section %[control:button:5b36]{"position":[1,2]}
syms x                          % Create the symbolic variable x
figure                          % Initialize a figure
q(x) = piecewise( ...           % Define a piecewise function q(x)
    x < -1, 5-(x+3)^2, ...      % if x < -1, q(x) = 5-(x+3)^2
    x < 2, -x, ...              % if -1 <= x < 2, q(x) = -x
    x < 4, -2, ...              % if -2 <= x < 4, q(x) = -2
    (x-4)^3-2);                 % if x >= 4, q(x) = (x-4)^3-2
p = fplot(q(x),"LineWidth",1);  % Symbolically plot the function y=q(x)
ylim([-3 6])                    % Set the y limits to strictly contain the maximum and minimum values of y=q(x)
xticks(-5:5)                    % Show x ticks at each integer value
xlabel("x")
ylabel("y")
title("Graph for Exercise 2")
grid on                         % Turn on the grid to allow easy analysis of the graph
%%
%[text] Identify each point by its `x` value.
%[text] 1\. Identify a point with `x<0` where the derivative is positive.
q1 = -6;     % Solicit user input as x = q1 %[control:editfield:540f]{"position":[6,8]}
if (q1 < -5) || (q1 > 5)       % Check if q1 is not in the defined domain, [-5,5]
    disp("Please select a value between -5 and 5.")
elseif (q1 > -5) && (q1 < -3)  % Check if q1 is in (-5,-3)
    disp("Correct.")
elseif q1 == -5                % Check if q1 is on the boundary
    disp("You cannot be sure what the derivative is at the boundary of a plot without additional information.")
elseif q1 > 4                  % Check if q1 is positive and in a region with positive derivative
    disp("This is not a point with x<0.")
else                           % General incorrect answer
    disp("Incorrect. Please try again.")
end
%[text] 2\. Identify a point with `x>0` where the derivative is positive.
q2 = 6;     % Solicit user input as x = q2 %[control:editfield:955c]{"position":[6,7]}
if (q2 < -5) || (q2 > 5)       % Check if q2 is not in the defined domain, [-5,5]
    disp("Please select a value between -5 and 5.")
elseif (q2 > -5) && (q2 < -3)  % Check if q2 is negative and in a region with positive derivative
    disp("This is not a point with x>0.")
elseif q2 == 5                 % Check if q2 is on the boundary
    disp("You cannot be sure what the derivative is at the boundary of a plot without additional information.")
elseif q2 > 4                  % Check if q2 is in (4,5)
    disp("Correct.")
else                           % General incorrect answer
    disp("Incorrect. Please try again.")
end
%[text] 3\. Identify a point with `x<0` where the derivative is negative.  
q3 = -6;     % Solicit user input as x = q3 %[control:editfield:71cf]{"position":[6,8]}
if (q3 < -5) || (q3 > 5)       % Check if q3 is not in the defined domain, [-5,5]
    disp("Please select a value between -5 and 5.")
elseif (q3 > -3) && (q3 < 0) && (q3 ~= -1)  
                               % Check if q3 is negative and in a region with negative derivative
    disp("Correct.")
elseif q3 == -1                % Check if q3 is a critical point
    disp("The derivative does not exist at this point. Please try again.")
elseif (q3 >= 0) && (q3 < 2)   % Check if q3 is positive and in a region with negative derivative
    disp("This is not a point with x<0.")
else                           % General incorrect answer
    disp("Incorrect. Please try again.")
end
%[text] 4\. Identify a point with `x>0` where the derivative is negative.  
q4 = 6;         % Solicit user input as x = q4 %[control:editfield:765a]{"position":[6,7]}
if (q4 < -5) || (q4 > 5)           % Check if q4 is not in the defined domain, [-5,5]
    disp("Please select a value between -5 and 5.")
elseif (q4 > 0) && (q4 < 2)        % Check if q4 is positive and in a region with negative derivative
    disp("Correct.")
elseif (q4 > -3) && (q4 <= 0) && (q4 ~= -1)  
                                   % Check if q4 is negative and in a region with negative derivative
    disp("This is not a point with x>0.")
else                               % General incorrect answer
    disp("Incorrect. Please try again.")
end
%[text] 5\. Identify a point with `x<0` where the derivative is zero.
q5 = -6;    % Solicit user input as x = q5 %[control:editfield:7dfe]{"position":[6,8]}
if (q5 < -5) || (q5 > 5)      % Check if q5 is not in the defined domain, [-5,5]
    disp("Please select a value between -5 and 5.")
elseif q5 == -3               % Check if q5 is an extremum
    disp("Correct.")
elseif (q5 > 2) && (q5 <= 4)  % Check if q5 is positive and in a region where the derivative is zero
    disp("This is not a point with x<0.")
else                          % General incorrect answer
    disp("Incorrect. Please try again.")
end
%[text] 6\. Identify a point with `x>0` where the derivative is zero.
q6 = 6;    % Solicit user input as x = q6 %[control:editfield:6e6f]{"position":[6,7]}
if (q6 < -5) || (q6 > 5)      % Check if q6 is not in the defined domain, [-5,5]
    disp("Please select a value between -5 and 5.")
elseif (q6 > 2) && (q6 <= 4)  % Check if q6 is positive and in a region with derivative 0
    disp("Correct.")
elseif q6 == -3               % Check if q6 is negative and has derivative 0
    disp("This is not a point with x>0.")
else                          % General incorrect answer
    disp("Incorrect. Please try again.")
end
%[text] 7\. Identify two different points, `x1` and `x2`  in the interval (-5,5), where the derivative does not exist.
q71 = -6;                                  % Solicit user input as x = q71 %[control:editfield:0227]{"position":[7,9]}
q72 = 6;                                  % and x = q72 %[control:editfield:7383]{"position":[7,8]}
if (q71 < -5) || (q71 > 5) || (q72 < -5) || (q72 > 5)        % Check if the values are in the defined domain
    disp("Please select values between -5 and 5.")
elseif (q71 == -1 && q72 == 2) || (q71 == 2 && q72 == -1)    % Check if the values are correct
    disp("Correct.")
elseif (q71 == -1) || (q72 == -1)                            % Check if only one correct value has been found
    disp("Yes, the derivative does not exist at the point x = -1, but what about the second point?")
elseif (q71 == 2) || (q72 == 2)                              % Check if only one correct value has been found
    disp("Yes, the derivative does not exist at the point x = 2, but what about the second point?")
else                                                         % General incorrect answer
    disp("Incorrect. Please try again.")
end
  % Run this section to generate feedback on all the solutions at once, all default answers are outside [-5,5] %[control:button:512d]{"position":[1,2]}
%%
%[text] ![](text:image:545f) **Reflect**
%[text] 1. How easy is it to find points where the derivative is zero? Do they exist on your graph? Why or why not?
%[text] 2. What does knowing the sign of the derivative tell you about your function?
%[text] 3. Using + for regions with a positive derivative, - for regions with a negative derivative, and 0 for regions where the derivative is zero, can you sketch two or more functions with derivatives that fit different patterns? How about + everywhere? Or -0+? Or +0-0+? Perhaps -0-? 
%[text] 4. Can you sketch a function with a derivative that is -+ and never 0? Why or why not?  \
%[text] %[text:anchor:H_1ECFF159] #### Derivative as an Operator
%[text] The derivative can be thought of as an operator $\\frac{d}{dx}${"altText":"(d)\/(dx)"} which acts on one function $f(x)\n${"altText":"f(x)"} using it to produce a new function $\\frac{df}{dx}${"altText":"(df)\/(dx)"} that tracks the rate of change of the original function at each point. Alternatively, you can think of the derivative as a black box which accepts a function as input and returns a new, but related, function as output, similar to some visualizations of functions themselves:
%[text] For a function, the input $x${"altText":"x"} is transformed to an output $f(x)${"altText":"f(x)"}:
%[text]{"align":"center"} ![A value of x is input to a box labeled Function which outputs a value f of x](text:image:6488)
%[text] For a derivative, the input $f(x)${"altText":"f(x)"} is transformed to an output $\\frac{df}{dx}${"altText":"(df)\/(dx)"} which can also be written as $f'(x)${"altText":"f'(x)"}:
%[text]{"align":"center"}  ![A value of f of x is input to a box labeled Derivative which outputs a value f prime of x](text:image:13b3)
%[text] %[text:anchor:H_C797B625] ## Notes on Notation
%[text] You may see the derivative of a function represented using different notation. 
%[text]{"align":"center"} <u>Notation:</u> <u>Read As:</u>
%[text]{"align":"center"}  $f'(x)${"altText":"f'(x)"}                     "eff prime of ex", 
%[text]{"align":"center"}  $\\frac{df}{dx}${"altText":"(df)\/(dx)"}                         "dee eff dee ex",
%[text]{"align":"center"}  $\\frac{d}{dx}\[f(x)\]${"altText":"(d)\/(dx)\[f(x)\]"}            "dee dee ex of eff of ex",
%[text] While they may appear different, all of these notations mean the same thing: the derivative of a function $f(x)${"altText":"f(x)"} with respect to the variable $x${"altText":"x"}. 
%[text] While the function f and x were chosen for this example, you can extend this notation to any function and variable! For example, the derivative of the function g with respect to the variable z (in its notations corresponding to above) would look like:
%[text]{"align":"center"} $g'(z), \\enspace \\frac{dg}{dz},\\enspace\\frac{d}{dz}\[g(z)\]${"altText":"g'(z), (dg)\/(dz), (d)\/(dz)\[g(z)\]"}
%[text] There is a subtle difference in notation between $f'(x), \\enspace \\frac{df}{dx} \\enspace${"altText":"f'(x), (df)\/(dx)"} and  $\\frac{d}{dx}\[f(x)\]${"altText":"(d)\/(dx)\[f(x)\]"}. The former describe functions which are the result of applying the derivative operator to a function. The notation $f'(x)${"altText":"f'(x)"} is called "prime notation" and is primarily used as a shorthand when there is only one independent variable and especially when the derivative is going to be evaluated at specific points, such as $f'(a)${"altText":"f'(a)"} to describe the slope of the function $f(x)${"altText":"f(x)"} at the point $x=a${"altText":"x=a"}. The latter references the act of taking a derivative of a function. In this sense, the latter notation refers to the derivative as an "operator" where it "operates/acts" on the original function. 
%%
%[text] [⇦ Return to the main menu](file:../MainMenu.m)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] %[text:anchor:H_A7C4A6F7] ## Local Helper Functions
%[text] If you wish to see the details of the code, select the **View** tab and switch to **Output Inline**. Alternately, select **Output inline** using the icon ![live script output inline icon](text:image:4a24) at the top right of the Live Editor pane.
function [sP,cTan,T] = CoffeeExample(x1,dx)
% This example creates the graph of the cooling coffee example
% T(t) was defined using Newton's law of cooling applied to a liquid stored in a 95 degree
% temperature-controlled environment up to t = 5 then moved to a 22 degree temperature-controlled
% environment and allowed to equilibrate. The time constant was estimated
% to approach the author's experience
syms t      % Set up the symbolic variable t
T(t) = piecewise(t<5,95,73*exp(-.15*(t-5))+22);  % Define the symbolic piecewise temperature function T(t)
y1 = double(T(x1));  % Compute T(x1) as a number
[m,linApprox] = GetLinApprox(T,t,x1,y1,dx);  
fplot(T,[0 30]);   % Symbolically plot the temperature over 30 minutes
hold on
sP = scatter(x1,y1,"filled","SeriesIndex",2); % Add a point at (x1,T(x1))
cTan = plot([x1-dx,x1+dx],linApprox,"LineWidth",2,"SeriesIndex",3); % Tangent line
hold off
ylim([15 100])             % Choose y limits for a reasonable viewing window
xlim([-1 31])              % Choose x limits for a reasonable viewing window
xlabel("Time (min)","Interpreter","latex")
ylabel("Temperature ($^{\circ}$C)","Interpreter","latex")
xticks([-1 x1 31]);       % Add an x tick at the point t=x1
yticks([15 y1 100]);      % Add a y tick at the point T=y1
xticklabels(["-1" "t" "31"])
yticklabels(["15" "T(t)" "100"])
legend(["$T(t)$" "$(t,T(t))$ = (" + x1 + "," + y1 + ")" "Rate of Change = " ...
    + m + " $^{\circ}$C/min"],"Location","best","Interpreter","latex")
end

function [m,LinApproxVals] = GetLinApprox(y,x,a,ya,dx)
% GetLinApprox calculates the tangent line to y at x=a
%
% GetLinApprox requires four arguments
%   y a symbolic function
%   x the symbolic independent variable
%   a the point of tangency as a double
%   ya the value y(a) as a double
%   dx the radius of the interval desired as a double
%
% GetLinApprox returns two values
%   m is the slope as a double
%   LinApproxVals is a vector of values of the linear approximation at a-dx and a+dx

dy = diff(y,x);           % Symbolically compute the derivative y'(x)
m = double(subs(dy,x,a)); % Evaluate the slope m = y'(a)
LinApproxVals = ya+m*([-dx dx]);  % Compute two points on the tangent line
end

function [lH lV lA] = BasketballExample(xpt)
% Create a basketball example that presents the relationship between
% slopes/derivatives/rates of change and position, velocity, and
% acceleration curves
%
% BasketballExample takes one input, t=xpt
v0 = 4;             % Select realistic values for the initial velocity (m/s)
h0 = 2;             % Select realistic values for the initial height (m)
tVals = 0:.01:1.2;  % Set up a vector of time values
hVals = h0-9.81/2*tVals.*tVals+v0*tVals; % Compute h = -9.81/2*t^2+v0*t+h0 (m)
vVals = -9.81*tVals+v0;                  % Compute v = -9.81*t+v0 (m/s)
aVals = -9.81*ones(size(tVals));         % Compute a = -9.81 (m/s^2)

% Create a tiled layout for the plots
tiledlayout(3,1, 'TileSpacing', 'compact', 'Padding', 'compact');

% Plot height
nexttile
plot(tVals, hVals, 'SeriesIndex', 1);
ylabel("Height (m)")
axis tight
grid on
ax1 = gca;
ax1.XAxis.Visible = "off";
lH = xline(xpt, LineStyle=':', LineWidth=2, SeriesIndex=2); % Add dotted line

% Plot velocity
nexttile
plot(tVals, vVals, 'SeriesIndex', 1);
ylabel("Velocity (m/s)")
axis tight
grid on
ax2 = gca;
ax2.XAxis.Visible = "off";
lV = xline(xpt, LineStyle=':', LineWidth=2, SeriesIndex=2); % Add dotted line

% Plot acceleration
nexttile
plot(tVals, aVals, 'SeriesIndex', 1);
ylabel("Acceleration (m/s^2)")
xlabel("Time (s)")
grid on

% Add a vertical line at the specified xpt location
lA = xline(xpt, LineStyle=':', LineWidth=2, SeriesIndex=2); % Add dotted line

sgtitle("Plotting the Height of a Basketball"); % Set the overall title for the tiled layout
end

function shortest = CouchExample(corner)
% CouchExample animates the minimization problem of a length passing around
% a corner. The current parameters do not generate a particularly tight
% set of constraints.
%
% CouchExample takes one argument
%    corner=[a,b] with 0 < a,b < 10 locating a corner
% CouchExample returns one value
%    shortest is the minimal maximal length of a straight line from one hallway
%    wall to the other
p = plot([0 0 10],[0 10 10],"-","LineWidth",5,"SeriesIndex","none"); % Plot the exterior wall line
hold on
% Shade the inaccessible space in the lower righthand corner of the plot
rectangle("Position",[corner(1) 0 10-corner(1) corner(2)],"FaceColor",[.5 .5 .5])
% Plot the interior wall line
plot([corner(1) corner(1) 10],[0 corner(2) corner(2)],"-","LineWidth",5,"SeriesIndex","none")
xlabel("Location (m)")
ylabel("Location (m)")
title("A Hallway and (theoretical) Couch")
% Create the line modeling the couch from a point on the left-hand exterior
% wall (0,cy) through the corner and extending up to the top exterior wall
% It is a plot object to facilitate animation by resetting only its values
% rather than redrawing the entire plot each iteration
couch = plot([0 (10*corner(1))/corner(2)],[0 10],"-","LineWidth",2,"SeriesIndex",3);
% Use the distance formula to determine the length of the couch line
maxCouchLength = sqrt((10/corner(2))^2 + (10-0)^2);
% Annotate the plot with the current length of the couch line
% Create an annotation object to facilitate animation by resetting only its
% string value at each loop iteration below
noteMaxLength = annotation("textbox",[.35,.4,.4,.2], ...
    "String","Maximum couch length = " + maxCouchLength,"EdgeColor",[.8 .8 .8], ...
    "BackgroundColor",p.Parent.Color,"FitBoxToText","on");
drawnow  % Force drawing of the plot at this point
% Loop over values of cy from 0 to 8.9 by step sizes of .1 m
for cy=0:.1:8.9
    m = (corner(2)-cy)/corner(1);       % Calculate the slope of the couch line
    % End the couch line at the top exterior wall or edge of the plot
    xLargest = min([(10-cy)/m 10]); % Determine the largest x value
    if xLargest == 10  % This computes the y value when the right plot edge is the end point
        yLargest = m*10 + cy;
    else               % This computes the y value when the top exterior wall is the end point
        yLargest = 10;
    end
    couch.XData = [0 xLargest];  % Set the x endpoint values of the couch line
    couch.YData = [cy yLargest]; % Set the y endpoint values of the couch line
    length = sqrt(((10-cy)/m)^2+(10-cy)^2); % Calculate the length of the couch line
    noteMaxLength.String = "Maximum couch length = " + length; % Set the annotation string
    drawnow % Force drawing of the new couch line and annotation
    hold off
end
% Create the final iteration when the couch is parallel to the top exterior
% wall, and annotate the plot accordingly
hold on
couch.XData = [0 10];
couch.YData = [corner(2) corner(2)];
noteMaxLength.String = "Maximum couch length = Infinite";
drawnow
hold off
% Symbolically compute the maximal length of the couch
syms y        % Create a symbolic variable y
% Create a symbolic function that returns the length of the couch as a
% function of position y of the corner (0,y)
L(y) = sqrt(((corner(1)*(10-y))/(corner(2)-y))^2+(10-y)^2);
dL = diff(L,y);               % Symbolically differentiate to find L'(y)
minY = vpasolve(dL,sym("y")); % Solve L'(y) = 0 and call this solution minY
shortest = double(L(minY));   % Express L(minY) as a number
% subtitle("The longest possible couch is " + shortest + " meters")
hold on
annotation("textbox",[.35,.2,.4,.2], ...
    "String","The longest possible couch is = " + shortest + " meters","EdgeColor",[.8 .8 .8], ...
    "BackgroundColor",p.Parent.Color,"FitBoxToText","on");
hold off
figure
fplot(L,[3 8])   % Symbolically plot the function L(y) over the interval [3,8]
hold on
fplot(dL,[3 8])  % Symbolically plot the derivative L'(y) over the interval [3,8]
cdata = colororder;
xline(double(minY),":","Color",cdata(3,:))  % Add a vertical line at value y = minY
yline(shortest,":","Color",cdata(3,:))      % Add a horizontal line at value L = L(minY)
yline(0,"--","SeriesIndex","none")  % Add a line indicating L'(y) = 0
title("Determining the longest possible couch")
xlabel("Vertical Value (m)")
ylabel("Tracking the Couch")
legend(["Maximal Couch Length" "Rate of Change"],"Location","west")
hold off
% Commentary to direct attention to interesting features of the plot
disp("Observe the fact that the minimal value of the maximal couch length")
disp("occurs when the rate of change of the maximal couch length is 0.")
end

function out = GraphSecant(fh,x1,x2,fstr)
% GraphSecant plots a curve y=fh(x) and a secant line between
% two distinct points (x1, fh(x1)) and (x2, fh(x2)) or the tangent
% line to fh(x) at x=x1. It returns a logical value.
%
% GraphSecant requires four arguments
%        fh a function handle
%        x1   a number
%        x2   a number
%        fstr a function string, e.g., "f"
% GraphSecant returns one value
%        out is a logical that is 1 if x1=x2 and 0 if x1 ~= x2
out = (x1 == x2);  % This is 1 for tangent lines and 0 for secant lines
syms x;        % Create a symbolic variable x
f(x) = fh(x);  % Define a function f(x) from the function handle fh
if x2 ~= x1    % If x2 is not equal to x1, create a secant line function
    secant(x) = f(x1) + (f(x2)-f(x1))/(x2-x1)*(x-x1);
else           % If x2 = x1, create a tangent line function
    df = diff(f);  % Compute the symbolic derivative df=f'(x)
    secant(x) = f(x1) + df(x1)*(x-x1);
end
ax = gca;
fplot(f(x),Color=ax.GridColor) % Symbolically plot y=f(x)
hold on
fplot(secant(x),"--","SeriesIndex",1) % Symbolically plot the secant/tangent line y=secant(x)
scatter(x1,f(x1),"Filled","SeriesIndex",2) % Add the point (x1,f(x1))
scatter(x2,f(x2),"Filled","SeriesIndex",2) % Add the point (x2,f(x2))

% This code works to improve readability of the plot by redesigning how the
% tick marks are labeled as they come close together
ax = gca;      % Identify a handle for the current axes object
NoTickOverlaps(x1,x2,"x1","x1+h",ax,"x","horiz") % This function is in Helper Functions
y2 = double(simplify(f(x2)));  % Express f(x2) as a number
y1 = double(simplify(f(x1)));  % Express f(x1) as a number
% Note that fstr is a passed-in string that names the function
NoTickOverlaps(y1,y2,fstr+"(x1)",fstr+"(x1+h)",ax,"y","vert") % This function is in Helper Functions

% Label the plot with appropriate legends and titles
if x1 == x2
    legend([fstr+"(x)","Tangent line at $x_1$"],"Location","best","Interpreter","latex")
else
    legend([fstr+"(x)","Secant line from $x_1$ to $x_1+h$"],"Location"," best","Interpreter","latex")
end
hold off
formatStr = "$y = %s(x)$";           % Create a LaTeX format string for y=?(x)
fStringL = compose(formatStr,fstr);  % Create the LaTeX string by replacing ? with fstr
if out
    title("Plot of " + fStringL + " and the tangent line through (" + x1 + "," + double(f(x1)) + ")","Interpreter","latex")
else
    title("Plot of " + fStringL + " and the secant line between (" + x1 + "," + double(f(x1)) + ") and (" + x2 + "," + double(f(x2)) + ")","Interpreter","latex")
end
end

function NoTickOverlaps(y1,y2,str1,str2,ax,var,opt)
% y1, y2 are numbers, str1 and str2 are strings that label points y1 and
% y2, ax is a handle to a figure axis, and var is the variable of interest
% and opt is either "vert" or "horiz" to choose how to display overlapping
% labels
switch var     % Use the appropriate axis
    case "x"
        valMinMax = ax.XLim;
        varLim = .05;   % Because x+h is longer than it is high
    case "y"
        valMinMax = ax.YLim;
        varLim = .03;   % A solid value for single character labels
    case "z"
        valMinMax = ax.ZLim;
end

varScale = valMinMax(2)-valMinMax(1); % Calculate the total distance available

if y1 == y2
    % If the values are identical, only one tick is needed
    tickLocations = y1;
    formatStr = "%s = %s";
    labelStr = compose(formatStr,str1,str2);
    tickNames = labelStr;   % This is a label for a single point
elseif 0< y2-y1 && (y2-y1)/varScale < varLim
    % If y2>y1, it should be above (vert) or to the right (horiz),
    % but not overlapping
    tickLocations = [y1 y2];
    if opt == "vert"
        % createStackedLabel is defined in Helper Functions
        tickNames = CreateStackedLabel(str2,str1);
    elseif opt == "horiz"
        tickNames = [str1+str2 " "];
    end
elseif 0 < y1-y2 && (y1-y2)/varScale < varLim
    % If y2<y1, it should be below (vert) or to the left (horiz),
    % but not overlapping
    tickLocations = [y2 y1];
    if opt == "vert"
        % createStackedLabel is defined in Helper Functions
        tickNames = CreateStackedLabel(str1,str2);
    elseif opt == "horiz"
        tickNames = [str2+str1 " "];
    end
elseif y1 < y2
    % If y1 << y2, it should be below (vert) or to the left (horiz)
    tickLocations = [y1 y2];
    tickNames = [str1 str2];
else
    % If y1 >> y2, it should be above (vert) or to the right (horiz)
    tickLocations = [y2 y1];
    tickNames = [str2 str1];
end
switch var  % Label the correct axes
    case "x"
        ax.XTick = tickLocations;
        ax.XTickLabel = tickNames;
    case "y"
        ax.YTick = tickLocations;
        ax.YTickLabel = tickNames;
    case "z"
        ax.ZTick = tickLocations;
        ax.ZTickLabel = tickNames;
end
end

function strOut = CreateStackedLabel(top,bot)
% CreateStackedLabel takes two strings and refactors them to
% Create a blank label and a vertically stacked label to be
% used in NoTickOverlaps
row1 = [" " top];
row2 = [" " bot];
ylabelArray = [row1; row2];
ylabelArray = strjust(pad(ylabelArray,"left"));
strOut = sprintf("%s\\newline%s\n",ylabelArray{:});
end

function ExampleFunction(xPosn,dx)
% ExampleFunction takes a value x = xPosn and a radius and plots its location
% on y = 6 + cos(x) - 32/5 * exp(-x/5) and computes and prints its derivative
% y' from xPosn-dx to xPosn+dx as well
syms x;                   % Create symbolic variables
y = 6 + cos(x) - 32/5 * exp(-x/5); % Define y as a symbolic function of x
dy = diff(y);             % Compute the symbolic derivative y'(x)
dyVal = double(subs(dy,x,xPosn)); % Evaluate y'(xPosn) symbolically
yVal = double(subs(y,x,xPosn));   % Evaluate y(xPosn) symbolically
xV = 0:.1:25;
yV = double(subs(y,xV));
plot(xV,yV);
hold on
plot([xPosn-dx xPosn+dx],[yVal-dyVal*dx yVal+dyVal*dx],"SeriesIndex",3)
% fplot(y,[0 25])           % Plot y symbolically for x in [0 25]
scatter(xPosn,yVal,"filled","SeriesIndex",2) % Add the point (xPosn,y(xPosn))
% Create the string and annotate the plot
str = sprintf("$\\lim_{h \\rightarrow 0} \\enspace\\frac{f(%d+h) - f(%d)}{h}$ = %.2f",xPosn,xPosn,dyVal);
annotation("textbox",[.4 .35 .1 .1],"String",str,"FitBoxToText","on","Interpreter","latex","EdgeColor","w");
hold off
title("Compute the definition of the derivative")
end

function CheckSlope(slopeGuess,gh,xa,gstr)
% CheckSlope determines whether the string slopeGuess matches the actual
% slope of the function defined by the handle gh at the point xa. Then it
% plots the function and the tangent line at x=xa.
%
%     slopeGuess is a string that is "positive", "negative" or "zero"
%     gh is a function handle
%     xa is a number
%     gstr is a string naming the function
syms x;          % Create a symbolic variable
g(x) = gh(x);    % Define a symbolic function from the function handle
dg = diff(g,x);  % Symbolically compute the derivative g'(x)
% Determine the correct solution
slope = double(dg(xa));
if slope > 0
    CorrectSlope = "positive";
elseif slope < 0
    CorrectSlope = "negative";
else
    CorrectSlope = "zero";
end
% Check if the user-defined solution matches the correct solution
% Then display an appropriate message
if slopeGuess=="undefined"
    disp("This is the default value. The slope is not undefined here. What is it?")
elseif (CorrectSlope == slopeGuess)
    disp("Correct. The slope at x = " + xa + " is " + slopeGuess + ".")
elseif abs(slope)<.1 && abs(slope)>0
    disp("This might be frustrating, but the slope is not identically zero here. In fact, it is " + slope + " which is " + correctSlope + ".")
else
    disp("Incorrect. The slope at x = " + xa + " is " + slope + " which is " + CorrectSlope + ".")
end
% Graph the function and the tangent line at xa
GraphSecant(gh,xa,xa,gstr);
end
%[text] %[text:anchor:H_66219561] 

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"hidecode","rightPanelPercent":40}
%---
%[text:image:29d4]
%   data: {"align":"baseline","height":134,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAA5AAAANKCAYAAAD86aFtAACAAElEQVR42uzdC3wV9Z3\/\/yq3hGu4hVswCQoRCSbhDsUQAcGiYkSQ1W0kbaW14iVYXWSxGpGIqJDIRWgrmsVdlXohXRf\/1VrNf7G\/Ras1Wnf1\/\/91NdtH3XXX7U8WW8Xr\/PKJGZwzmTln5pyZOd+ZefXxeD72Ug3DyTkz3\/f5fr6fz9c0TfsaAAAAAACp8CIAAAAAAAiQAAAAAAACJAAAAACAAAkAAAAAIEACAAAAAAiQAAAAAAACJAAAAAAABEgAAAAAAAESAAAAAECABAAAAAAQIAEAAAAABEgAAAAAAAESAAAAAECABAAAAACAAAkAAAAAIEACAAAAAAiQAAAAAAACJAAAAACAAAkAAAAAIEACgKI3ua99rSpgebzuAACAAAkA3cNZXpIgVdehPolWB9o6aDGQ6nWwew2rLV73ct6bAACAAAnAz9BnDibNFiHmSEzCXBS1m36XLabfd53p\/VDEZwUAABAggWiXZyYLgIQoeLVD2mx4n9USOgEAIEACUGN3sM6i3LONMOPOsIJCbeLseYHhNe+249lkeB8TNgEAIEACcBgOy7sWz7Vdi+mmKJSHnnRamWWQOmPFKm3ZtTfbWrv3gLbh0edS+tt3tEhrPPx20r\/\/dxvvt30NrV73vgMGhXV3s9lcTst9AwAAAiQQ9Z3DaotwqHzoW3zZNQnB5Jv1jd2CTMPTr0Q+zEVVqlAqYV\/xENpmEzJpGAQAAAESUH4H0VhW2qZKEDTu+JkD4I\/feJ8ghbTIe8f4XjIGz6mLz1cldB4xNQeqo1QWAAACJBBESCwynD\/UdxHbg1wM6wtyWZzrC3XZMSIMImw7nlKmbLXLmcUzmU3G8Sfc8wAAIEACbnYTq00dSwNp5mIMhvo5QDkHR\/AItozTzVnDbEt1XjSs7x\/j+U\/zrqbsrge8e9lsaPRDaSwAAARIxHxHUQ+KbX6Xk+rnCQmH3pRMCinJddJARkI6HVCtd7STnXkVqjYvMr4fzCHT77LZ3jm57w4YMqzNNLIkj3srAIAACURnV7HWUHrqaWdTWawazxrqZaWUlFqTpjt2u3vyOpbMPEM7uWKmNnr8RIJeyIJosvO22Xyv6V806AHTr9cip1\/\/z4omT3l\/7vJL\/\/CN71774re3\/Kj57hf\/7faOa6nqQsgEABAgAcXDoqcLZb3MVA+JBMLEQKgv1Jd87wedIVB2XwtOnUzQgqvzvEGWL+vnMfWzmH7sVutfMskOr\/w91z341Lsdf35rh6YO9V3hkvJYAAABEgigDNXzsGjcSYlzqanVLmEUdwdzOxb3Q8cUJlUys1JJqa67V+8+of7d6MFLmIOm3+Nj5Oebw6XXpbESVvUQLX9W172mrUNLV7Cs7kDHWAAAARJIMzBWGcZkHPHibGIcg2Kys2MBNihJy8BhIxIC0tiJp3cLVRVnnafNWVbTzdKrb0SXhbVXWr5G5tdSXt+R40q00adM7HxvjCg+RekdTXNzIT\/KyPXPj\/7Fih+7lsbdyq6gfKRrx1IPlZTCAgAIkIDF7mJ11+5im5flY1EffG8+9+VnaV46ZFfMbnfPHP6+8b3rCHwhCqLyOyybv6Tj97hUGz9tTmf4lN9xbnZnQXZrZOVXqaxx11K+lPHyCxn9Cy\/9bGnHn9feoblDLbuUAAACJOJcjtqcyXxFPSyaSsIiRR9xoO+ABNV50kkgNO4IGsOgBA0CF8yhs7RyUbdyXNllzkaZrF6NoO9eeh0s\/dix1EOl\/OyNB1\/8dwIlAIAACQKji1KvKIVFY4mp\/P2ysYNoPBtoFQoJQ\/DbvItXd77X5H1nDppBnO80h0svz17qpbCyo6hXCXhZ\/nrl7of\/69Ynf32flLzyzAEAECARxsCYZyhJbc+k4YShhCv0paZ+N+lIdZZQ3zGUnSCCIcK8o6mHzHHlMwLZyZTdPz+6Mpt3KzO9J8i\/X77gnE8W1Fz+5sr1m2\/n\/CQAgAAJ1Udq1Kd7hlEWaGHfXdTLTSX0BrWTeMq0M7SCCaXayHETju\/aEA4RV3KOVt77M85ZcbwxkJ\/nMuXzbSyj92LHUu4j+pdNXoTKUSeXfHh61eLDJTPPuEmqQXheAQAIkMjmLqOUpbak0yVVD4yyUPKje2JQu4l+DysXhaXTtZJZ87XKS67QFq1ep126uVlbvf0x7Yf\/8M8dXtdWbthKeABclMkady\/9CJfGHUsvuj57GSoHDBn2wfCxRS\/0Hzx0vXzxx\/MMAECAhJK7jGEMjH52WTQalD+6MySWLTi\/MyRedOP2zpD4ZUBMjWAAeBsu9Z1LL89eGpt+edEhWi9\/lftqJvemjr\/jRx3X9lLXvb2KZx0AgACJTENjdTrNb6S0S+8YqHpg1EtP\/QyKffoNSAiJibuI6bvxiddZ\/AMBlMXK2WF919LLYOnl2CG9hF7uY5mUz\/fO7XuYQAkAIEDC99JUvemNymcYzWcU\/Sw3dbuTmI4NLW0s8oGIBUuvQqVe+prpLmWPnr2eJ1ACAAiQsAuNrnYZ9bJU1YKi3jbfj11FfTdxxtKa47uJV+192tegaOe6Bw+xmAcUDJZ6KaxXHWK9mnmr3xcz+QJtwJBhz3X8zzrOUAIAARKERkeLGNV2Gc1h0avOp8agqDevuX7\/4awERTurmx5i0Q6E5IyljB\/Rdyu96ADrxagj2eHUy17Tac7Tq0\/OMWnKU3Bq6XV0eQUAAiQIjZ0LCtXOMnp1zsdceirnE1UNinbowAqEe66lPnLEixJYvfQ1k2ZlmQbKQfkjP5KxIQtqLt98\/tUbCnn2AgABEjEIjXoDHBVKU2Wn04tOg+aOp\/oZRS8a2WQPDXSAqIZKL3Yqh4wqOP4FYLpVI5kGyvFTZ3903pU3\/Lbu3sf3dPw8zlACAAESIeieesTNeUYvBmF7tbuY6QDtEcUlxxvahGlX0an1j7\/MghuIUflrpmcq8\/JHaadXLe68x6Z7r9cDZTpnKPWKllWbdvx+5yv\/\/mDHz6vtwDlKACBAIstzGpucjtxQITR60dBB31k0lqBGKSjaueonT7K4BmJKb9QzctyEtEtf+\/Ttn3GglHt4uhUi+pn6TT9\/+YOOn9XSoY5ACQAESARToird8NrCEBq9CIzS3CbKO4tOXVK\/nYU0AM92KSVQls1fknbJq5y7lH9Xdhndnk83dfU+QqAEAAIk\/ClRbXFTNpSNM41eBEa9E6qcWczWuAwVXXDtRhbOAGzHiehnKdMNlINHjsnoDGW65a7yzJJjDIbmbXqglJJXOr0CAAESLkJjkZsSVXkABx0aZZGRyRlG8+4iQdHahp+9yiIZQFplr+k255Ey1XRn\/0oQlH8vnd1Ji\/FRbR2a2J0EAAIk7IOjdFFtdfqAD3LkRiaLAmNglLOL4e6IGqxr7nuaBTGArAZKPdilcyRC3510e3ZS\/nnTn9neoblDNesFACBAstv45W7jEadnR9Jt057JLmMmgZFy1PTVbNrDAhiAL4EynZJX4\/gnt19g6mcn3VauWJzpP9IVJtmZBAACJLuN2S5RlQe0PKjd7jKyw+gPFrsAVD5DmcnupDzX3D5vLMJkO2WuAECAjPpuY73T3UZ5KAdRoqqXpro9yyjzFznD6J+\/PvAbFrgAArWw9srjXV7djg0xdVh1\/eWlNGJzU+qaJExS5goABMjQB8cqp51UJchJR9OgQmOui9Aou4wyg3FpXUNsR2oE6fv3HGBBCyDrY0NKKxe5Pj9p0WHV9fGJDMPkEc5MAgABMoxzG2uddFINarcxndCo7zJSlhq85es2s4AFoFy5q+xO5rqsWNGb4rg9w5\/OWXx5pspupuHPIkwCAAEyGk1xgtht\/Co0DnT88JWzjLLLSPOb7LnxiddZsAIIxe6k27OT+pgQt+cmjU14MgiuepisYs0CAARIFcpUm51+M+rnbqM8lN2ERr009aIbt1OaqohrH2hlgQogVLuT6ZydtCg99S1MWpTU6mcmi1jHAAABMsjgWO2km6p0qvOzk6p8uyrBdOiYk1yHRgKbei6+aTuLUgChHhUinV1z0xjX4fZZKYHQ7ZlJfRSJ4ee0dajtkMfaBgAIkH6O4WhP1URAHlJ+zm2Ub1NLZpxBaGR8BwBEptRVf366DZNuG\/Akab7DriQAECA9a4yTcgyH32Wq8qCbu\/xSLbf\/QMdnGgmN4XHDoy+y6AQQ2TEhbru6SphMp8xVwqSbOZP6eUnDs7uVxjsACJC8CL4GR3n4yI6gn7uNBSWTHT0IC0unM24jpK78UQsLTQCxOTc5ZsIk389M6r0BnM47Nu1+ylnJWtZDAAiQcNpRtTlVcJTzjX51U+38BvXbV2s5DnYbB+WP7hy5QfdUylcBIIxhUs5NZjCuw3F3cqfNd0x\/BkESAAESKYNjym8o\/TrfKIHUyQNOP9d46eZmwlckvMZiEgBhsiNMjhw3wdc5k26b78iXxV1VRgRJAARIOA+OfjbG0duSOzmvMaK4hBJVylcBgDCZelyHoxJXKY11UuKqn8nc+qv\/\/QeCJAACJMEx6QPDr8Y48jPlZ6d6cOm7jau3P0bYiqgLrt3IohEAkoRJpw149C983R4xcVPi2rUr+XrHv1fOegoAAZLmOL4HR9nFlIebk7ONi1avY7cx8l5nkQgALrq5Oh0Nks55SX0kiJOqIPlnzr96w9PMkQRAgCQ4+hIc9W5wTjqpMn4jPtb99FcsDAEgjTApzXdyHXZY1c8yunm+yy6mk+d27oCBX5TMPONhWWew3gJAgIxOeKzNVnCUB5A8uFI9gKRMlU6q8bP67odZDAJABuYsq9HGTjxd69W7j+MSVzcjQfTGO6l2JXvn9v2k4+ffTpAEQIAMd3Cs7tCuanCU840ygoMy1fhauWErC0AA8Iib5jt6F1c3awA5K5nq2X5ijx4fSMUTi1AABMhwBcfyDq3JbvDZDI5yvpFuquD8IwD4e17SaYmr28Y7Do+lyBfYdGwFQIAMwTnH5mzMcZSf6TQ4EpwgfvB3rSz0AMBn8y5e7bjEVcpU3exKOmyMJ19o07EVAAFSwfCYtEGOhDu\/gmOqhwfBEVYuqd\/O4g4AFB0J4mZX0mGQbOJ8JAACpBrBsSrZOUc54+B2HpTTQ\/UyVJjgiHSsf+wlFnQAkOUurk52JWUdIR1cnQbJFPMk5YvuahaoAAiQ2StXbUnWIMfpDd8tOT\/ZN8m5CoIjUvn+PY+ziAMARRrvONmVdNN4T764luCZ5Oe1sBsJgAAZbHisS1au6leDHOm+lqyNN8ERdF8FgOjvSjrtpyBfZCf5wlnWMVUsVgEQIP0NjkXJuqv6ec4xWYMcxnHAjZsO0n0VAKKwK+kkSMoX2inORzaxYAVAgPSvSY5t1zTZHczGOccZS2sIjnDl6r0HWaABQIg6uKYKkk4qn6SsNUkVUxslrQAIkN7OdGxTrVy1ZNZ87aq9TxOI4NrydZtZmAFAyDq4lsysTFre6qT3QordyCOM+wBAgPTxrKOUlMog36DLVUcUl2iXbm4mCCEt6376v1iMAUCEg6ST4zTyJXWSs5G1LGABECDT67DaavcNnwz5Dbq7qpxzXLR6HSEIGam9\/T4WYQAQkSDZOyc37d1ICZlJOrVyLhIAAdJFeKxOtuvoR5Mc2clM1m67bMH5nHNExm584rcsvAAgYkEy2RlJKVdNdswmRUlrMwtZAATI1OGxKRu7jpSrIghX3UvzHACIojnLarSBw0ZYriXkC+pUvRpkjUOIBECAdF+y2mZ34\/XjrGOyXUd9LAehBzTPAQA4JWWtdmuZVBVUSWZGEiIBECAtuqxalqzKCI2gdx0LS6fTXRWeq2t+isUVAMRkN9KqyY6Ew1QhUr7cJkQCIEAmD4+1diWrfsx1THZgnSY5YPcRAODV2UirklYn5ayESAAESJfnHZ2UeaQjSWkIu47w1Q\/+rpUFFQAQIo+vc5wcs7FZs9CdFUA8A6R8i5ZOt7J0yM+buvh8dh2RNSs3bGUxBQCESFdHdJKESOZEAohPgEzWLMePLqty8x1WUGjbYZVdR\/g+uuPvX2URBQCEyG7rECdHdZKEyHIWuQAiHyDtwqNf5x2lZNWuUQ4dVhGU72zdxwIKAGJuYe2V3RrryBfcTqquZI1ksZaR5oN5LHQBRDZAJguPfozosBvKOyh\/NHMdEZib\/uF1Fk4AgE4zzlnRbV0iXeGdrGts5kS2stAFEMkAaRce5Zs3r8OjfJN36izrGUwls+Zr1+8\/TLBBYNbe\/\/+waAIAHDdy3ISEtUnugEGOez\/YfDlex2IXQBQDZEs6bazTCY9jJ55uGR5plIOg3fzkGyyWAADdzkOaS1md7kLKOsdmFBnnIQFEJ0BadVv1KzwWlEy27LK6evtjBBoE74nfsFgCAHRTMrOy23EeN80BLZrqtLHgBRCJACltpoM482j3jRxdVpFNNbfuYqEEALDchTSvWaTxn9N1j815SEpZAYQ7QEo5RVeHsKyFR847Ilvqf075KgDAnvnIjcyrdrP+mTh7Hl1ZAUQuQLalM+\/ILbnhEh6hmqt+\/DMWSAAAxx1Zc\/oNcD3n2mIXspmFL4BQBkgpo0i3TbUbiy+7hvAI9UZ3HPwX7YJrN7JAAgAkZW6ms+HR51ytg2RtZREii1j8AghVgOwa2ZFQuiplFl6HR6uhutIwh\/CIbPvB37WyMAIAuB7p4fbLdjnGY9FQh11IAKELkPXmc4+Nh9\/2NDzKzzPfMOm2ClUsX7eZhREAwHU31tLKs1yviWwa6rALCSAcAdJq99GP0lWLg+Pa0roGwguybv3jv2ZRBABwZM6ymoS1TPHkqWmti4YVFLILCSC0AbLWvPvo9bxHq2\/aZiytIbxACZfUb2dRBABwZGHtld3WNB6tjejICiA0AbLFeAOTJjdej+wwl67SNAfsPgIAwsqLAGlzFpK5kABCESATbl5ez3w8Y8Wqbjdazj1CFTWb9rAYAgAEHiBtOtO3swgGoHSA7PhPubl81evGOZSuQlUbftbGQggAkLUAabVOkrUZC2EAKgfIWj9Hd5h3HxnZAZXU3n4fCyEAQNYCpE2TwSYWwgBUDpD1fnVfldp+8w228pIrCC5g9xEAQIDs8t3G+yljBRCqAJnQQEc6gvnVeZXdR7D7CAAgQKb+wp0yVgAqB8hW4w1rw6PPeRYgTzqtjLOPYPcRAMAYD\/dlrHRjBRCvAGl1KPyqvU8TXsDuIwAg1OYsq9G87h9hMROylcUwgFgFSHM9v8x9JLhABX994DcsgAAAaSutXJSwxpm6+PyM100yQs38xTuLYQCxCpDmuUaUr0IVl9RvZwEEAEjbuPIZmh8NCGWUGucgAcQ2QJpr+S+6cTvhBVm3\/vFfs\/gBAGRk4LARCWuctXsP+LJ2klFrLIgBKB8gpfTUi5vgsILChJvg6u2PEWDA7iMAINS+8b3rupWaSt8HL9ZOspPJPEgAsZ0Dab65El7A7iMAIOwqzjovYX0jX5h71b1edjJppAMgDAGyzuuD4ARIqGj5us0sfgAAGRk78fSE9c0ZK1Z5FiDlGJFp\/XSEBTEAFQNklfFmJQe4\/QiQjPBANv3g71pZ+AAAMi5f7dW7jy\/nH+3WTyyIASgXILtCZMLNSlpJe30Q\/NLNzQQZZM3KDVtZ\/AAAPC1f9epLdzqxAghjgExopCPDbDO9AUpJB2M8oMTZx8deYuEDAMjY0DGFvpWvJunEWsWiGICKATLhHORJp5VlfAOUbq7GnzkofzRhBlnxna0PsPABAGRkzrIazY+KLQIkgLAGyCKvb4o\/fuP9bjfaRavXEWgQqBse\/bV2wbUbWfwAADxtnuPFl+0ESAChDZBW5yC9KMswl7H26TeAeZAIVM2mPSx8AAAZWVh7Zbcvxb2am02ABBCZAClkFzGTm6AM1jX\/zBHFJdr1+w8TbuC7uuZnWPgAADw\/++jl7EcCJIAwB8jnzWFv8WXXZHwjXHbtzYRIBO+J1yldBQD4cvbRr91HAiSAsAXIVqtdSNlFzPRmKOcErEIk5azwS+2WvSx8AAAZz33MNY3V8HP3kTmQACIRIKcuPj\/jm6GUwlqFSM5Ewg\/XPXiIhQ8AIGPjymd0W7tsePQ538KjxdGfdhbEAEIXIMXavQcIkQiN5es2s\/ABAHheuurFl+puRqB1aGFBDEDlANlkFyD7DhiUcUOdVCFyaV0D4QcZW7vvlyx8AAAZl6726t3Hl7VQMhJQTWukOhbEAFQOkPV2AdLLb93k5mse76EjRILdRwBAtsPjwGEjfKnGSrU+6ms6b9mhnAUxgNAEyOFDB3a7eX6zvtGzG6VdiJyxtIYghLSsvvthFj8AgIyMnXi65sds7DTKVzn\/CCBcAfL0iYVa\/345vh4elzEhViGybMH5jPmAKzc8+gILHwCA5+FRjt74XboqpLur6c+uZzEMQPUAWWu8cY3Mz9Oqz55heR6y4elX\/PzGjVmRoHQVAJD18BjEuUch5bEWa6EiFsMAVA+QVeYA+Z2L52uVMyda3lC9mA9pvHFa1P3ToRWOrNnzMxY\/AADPw6OXX5i73H38uEMei2EAoQyQYnzxKN9LOuQmbRciaa6DZC64diMLIABAWg1zsh0el117s10DwyoWwwBCGyBFYcEw30Ok3ZgPmuvAzuW7HmURBADwrNtqkOFRqrmsvjzvUs1iGIDqAbLIeOPq3atnQoCsubBSG5LX3\/cbbbIxH5yLRIInXmMRBABwbd7Fq7vNeQw6PAq7L81pogMgFAGyK0Qm3LyMATLIEJmspENKWi\/d3Ex4gnZJ\/XYWQgAAV0orF1muL4IOj3ZflhMgAUQqQKYKkdJR1euuZHalHZWXXEGIirF1P\/0nFkIAAFclq0PHFFquKYIa1ZGsA\/2wguJjpv9fK4thAJEIkHqIlDOSVjdhme3o9fkAuxKPwtLplLTG0uvayg1bWRABAByZcc4Ky5JVITuB2Q6PuQMGaZfd9ZBGgAQQxgB5xHjzkjmQdiHSrjurmDh7nqdjPpKdi5SS1otu3E6oipHVdz\/MgggAkNLC2ittdx3FN+sbAwuOesd5q+u4tvm5TgRIAGEMkK3Gm9eSBRVJA6SoKC22PUsgJahef2tnV9IqXVrZjYxD6er\/YlEEAEipZGal7a6jVDYFed4x2bGcVQ33a3v+RSNAAohPgBQLz5jc2bXV6iY9dfH5ns+LtCtpHZQ\/Wlu9\/TGCVmT9lpmPAICkKs46r7Mk1G7XUY7aBFmyale2KubXXNMZHsW2F97v9t+zGAYQ2QApVi6dY9lcx4\/dSLnxywPA7uFAg51ourRhD4sjAIClOctqLOc6ftWkplDb8OhzgQZHIWWyVtczu3rV8fCoI0ACCH2ArJw50XGA1E0qGWt78\/Z6NzJZl1aZGcluJKWrAIDoB8dk5xxlnSCjwYIOjslGdViFRwIkgLAGyHrjjUvON7oNkEJ2Lvv3y7G9kXt5aF0CqQRTuwcHZyPD76aD\/6wtX7eZhRIAIKFUNVlw1DusetnUz4sO8sayVSNKWAHEOkDqoz6S7UZ63alVQqndbqScjbx0czNhLKQu3\/UYiyUAQOcsx1RnHPU1RjbKVVNVR+kNc6zQRAdA7AOkk91IIWUlXpW1SiCVh4bdn1Uya7521d6nCWUh8tcHfsOiCQAYx6GNK59h21VVheCYrD+DBN7LdxywDY8ESACRCZCyg5hpgHSyG+n1wfZk4z5kbiRNdsJj5YatLJ4AgDJVZYOjkD9b1jJW11ZQUqZtePyVpOFRnLvmZvO\/28xiGEAYAmSV8eY1Mj\/PkwCpqz57hm2nVr3JjldlranORkpZ60U3biekKezqew+ygAKAmJl38WpHu436uiGbwTFVV3hpliNnG1OFR5sAWc9iGEDsA6Ru1pTxtnMj9W5pXpW1JvtWUBSWTqdbq4qeeJ2ZjwAQo7ONpZWLko7hMK4TstUcx3zW0W59ISWryc47WpHmOgRIAATIFHMjCwuGJS1r9Wp2pIRRCaXJHkhlC87nfKRCam+\/j0UVAMSgIc7IcRNShkZ9XSAN87wcB+ZHv4UJ0+dpDb9421V4FPLvmX5WNYthAKELkFJu6leAdNpkR27SDU+\/4tlNP1lZa+fsy0uuYOxHlq1\/\/CUWVwAQUTPOWaGNnXi6oxJVfRRHNstUnZaryq7jihsaXQfHJAGyisUwgDAEyDzzDdHvAKmTjq92Za1ez3KSB5HdfCZjox2CZHZcUr+dRRYAxDg0yjNaGuJle7fRWMXUN8nokLL556e160iABBD6ANkVIrMSIJ2UtXp9PjJZt1aCZHas2fMzFlsAEJFmOG5Co5Soyg5fts82mtcJyfooDBld2Dl+I5PgqJOfZfr55SyGARAgXZS1JuvWKqFPbupBfbMoQXLG0hrOSPrs+od\/xaILACLQQTU3yTPVqiGOCiWqboKj\/P2ka6oXwVFn\/jNYCAMgQKahcubEpGWtcnMPMkjSbMc\/Nz7xW235us0swAAgZOYsq0krNHrVKC\/I4CikW6rT0RwESABxCZBtxhuY7AZmM0TWXFiZ8nyklwOEnQZJGf\/BHEnvfGfrAyzEACCiZxr1mY2qnGtM57kvMx0zPedIgAQQ1QDZqlKANJ6PHF88KunNPRtBclD+aG3R6nWck8zAup\/+EwsyACA0Bj6OQ85cZjs4EiABECADCJIyn1K1IKmXt7Ir6R6lqwAQ\/jmNYQiNeid2KaFN9fconz5H++G+Z3wPjgRIAATIABvtBBkknZ6N0HclabpD11UACJuFtVdqpZWLtKFjCiMVGvVneLIRXrqKWXO1uvUbtfo7dml3tbxIgARAgHQQIJuNN7BZU8YrGSCddmz1I0jKz5KHpZOH6ojiks4SV8Jkdxt+1qZdcO1GFm0AoEDn1IHDRjgOjLn9B4YiNEqZqpMqopzcvlrVWUuOB0fdbXsPBBIeZRSI6ZraWAgDCFOArE\/4Jq60WOkAaezY2r9fTqBB0umDyRwmV29\/jADZ4ZL67SzeACALpan6eUannVP10RWqdk81k2t08kVv3uCh2tnnLdduuOWuhOCo27zvyWwFyFYWwgAIkIoFSa8fgE4fVuYy17iembz6vqdYyAFAwKWpbs8zyrENaTQThtCon2108qVu8fhTtb9Y9V3L0GgUVAkrARIAATIkQdLLOZLGpjvfrG90dM7CqGTWfG1pXUNsSl1pnAMA\/ndNdTOfUSfPLwmNDU+\/onxolGuUa3XSnyAnJ1crnzpLu7xufcrgqGt86g0CJAACpIMAWZcw77BgWCgDpNsgKaWoXp\/jkBLXdMKklLrK7uSlm5sjGR5X3\/0wizsAUGSXUW+CI88reW6pHhr1Z6uT0PhlmeqQpGWqyex66WggAXLD46+Yr7udhTCAMAXIKuNNTDqdhjlA6haeMTll11Ype5FvMv14gKYbJvXdyag04ln\/2K9Z6AGAh2cZ09ll7Gs4z6hyE5x0n6H6bqOTMlU7m\/bsD6wDK11YARAgFe\/amipICnmwetlwx1zmKqWzTs9qmM9O6vMmr99\/OHQBcuWGrSz8ACCDjqklMytdj9nQS1Ol2iYMpanGZ6WbL15PnXS6Vn1RTVq7jdk6\/0iABECADInqs2do44tHOXrgen1O0urgv+x8prM7KeWulZdcEYpy1+\/evZ8FIACkWZbaq3cf17uM+qiNMJSmGkOjm6Z0I8eclHaJajLbD\/2BAAmAAOkwQJYbb2ByfjCKAVK3cumcziDZu1fPlA9i+ebW74ew\/Hz94el2d7LzzGrpdCVHhax75EUWgwDgIDBWnHWe6xEb5l1GvypoVAmNBaecqi1Z\/pfd5jZ66Z5XjxEgARAgXYTIhJtYlAOkrubCys6Os6ka7vhd3mq1OymLgXR2J\/v0G3D8\/GS2AyWlqwBgfY4xk8AojWTkmSQBLAxnGTMJjYOHj9C+vmCJr6FRd+uOfYGGRwIkAAJkyEnnVifnJOXBLYf6g3poy58jDQ9kseC0+5wKgfK72yldBQDzDuPAYSNc38eNHVPDcpYx09A4u3KBq9EbXgi6gY4YMrrbc72cxTAAAmQIG+44OScZ9K6kV+WuxkDp1xnKDT9rY9EIgMCY5g5jWMtSMwqNw\/K1WXPPDDw0ZnsHcsL0eebXoorFMIDQBkg5JxjXEKmfk3Ra3hr0rqR5oLL82W4e1FZnKL1synPBtRtZRAKIVZdUvelNJoFRGquFZcSGF6Exp28\/rXz6nIzGbnhp874nCZAACJAuA2Sr8SYmO3FxDpDplLfqZUayAMjWQ1w\/Pzlx9ry0A6V0eZ2xtKZzbIjbOZSX73qMBSWASJ9fnLOs5vhYDbddUqMSGKMSGo22HmwLPEDOr7nG\/BrVsxgGQICM2K7kpJKxKbu36h1cZXGQ7fMqXgRKmUPppOz1xr9\/lQUmgMjtLko56rjyGWmfX4xKYNSPUUjVi5tnSm6\/AdrUuWcqGRqzOcJDnLvmZgIkAAIku5LWCwd54Kowk0sPlOmeoTSWveq7lFff90xngFy+bjMLTgCx312MUmA0hkY3ncHl+TJz0XnaX373GqVDYzZHeIhVDfebX7tWFsMAQhsgF54xmaDoYlfSyVlJvcRVpdbrxjOU6XR51eUXntK54JKFlyzAZCHGghSAyuRelenZRZ3syIW16Y3ds0ECsJvngvyzi791pXbZTXdqGxt\/EprgmM0dyGubnzO\/ju0shgGEKUA2GW9i0kCGgOiOhG6nHVz1Lq7ZPC+ZrMurLBzSmUOZULbUsSCThRmhEoAqYTGTURrmOYxhHKuRTDojo\/IGD9XOOGeZduO+f9DuOfRGKIOjbtdLRwMPkMyCBBD2AFlPgPRGzYWVnSWug\/P6f+a01EfFMGl1jrJvht\/SEyoBhCks6ruLejmqCkcR\/GiC4+benjd4SNZHbnjtlm0\/yUp4tJkFSSdWAARISlzHajl9en0QhTBp3qXMpDmPTs4Z6eWvM85Z0dm0gkUwACfzFvUzi16UoZp3F6NSjmp1bMFthcnIUWO0s89brtWt3xiZ0JjtER66svnduti2dyhnUQyAAAmt+uwZWmHBsHdPPPGEP0clTBp3KWVRItebaemrTkKl7CDITgK7lQC7ino31Ewb3BjDouy+6WcXw97sJllpqtvzjOLUSadr1RfVRDY0Gt3V8mLWAuSKGxrtfgd0ZAWgfICsTvi2MT+P0OejM78+6b+GDxn4Ysdr\/T9Ow6RqDXhSlUYZO74OHT3Wk1Bp3K2UxaQsKllcA9Ebm6F3QvViV1G\/h+qNbqLQGdVJlYib+YydMxpzcrXyqbM6Q+MNt9wV+dCY7QY6uoZfvJ3sfd5OSSsAlQNkFQEyO6pmn\/b2kLz+b7p50MvCQJXRIG5D5cU33qlNPbtaG35SsScLQ\/1spTlYsmMJqL+jqAdFL84qxm1n0VwFkk7zM\/08o+ozGqM4wsNo2wvvW5WyGrV0KGKhDIAACcvmO6PyB7\/Xo8eJx9zMG5OFUli7Af6g+QltSUfYK19wjjaieLxni0jjjqWUvemNezhjCQR7RlHK0PXSU692FI33P+OZxTiERfMuo9vmZvp5xig1wcnErTv2ZTU8mstZU3xGmgmSAAiQSDoW5OSikR\/37NHjE7cNIMJeonXj4\/+oXbpphzZ3+aXaKVNmaUM8KoE1kh0PfddSP2cpC14W\/kB6IdGP3UTjvU0vQZXgFKXxGU4rONI9yxjn0lTVG+jYlbROmJ6yQR1BEoASAbLIfIMixKk3Y7J\/vxzX7eejNKtMdhhk8SiLyJKZZ2iDR47xfKFqDJfGnUvOWyLO5xL1bqd+hkTjWUUJSlHthOqmY6o+Qsnt6yi7jFKaWvu9OkJiClsPtikVIHWX7zhgNeLDrLVDLQtogACZzRBJgAxJN1cZDeI2TEZldzJVsJTFlttv6NPpEKvvXhIwEYXziMZdRBmJ4VWnUyc7inErP001YiOdslTZZYxT19SoNNDxqKxVHOnalaxmMQ0QIAmQSDlnctaU8Z0lx+mcHdKbTER5QSaBWf6eEp69mFuZzg6m3tiHkIls7R7qDWv0s4giiM+CfOb0hjbyWYzzjqLdOUa5N6XzpRe7jN5QOTwam+ycu+Zmp2eI9TBZ2yGPxTVAgCRAImkTHr3UtXevnq7LxvTOrnE4W6R3hNV3LeXvHlS4NIdM2e3RdzJnnLOCoAlXu4byntHfP\/rOoV\/lpclCovF8IruJ\/gRG6ZjKWUZvbdqzPxQB0mhVw\/1OSluN2jo0dY1r49wkQID0PEC2G286UipJMAt3qWtFabE2JK9\/WueQ4hQorcKleefS77LYVJ1kzWFTb\/xDZ9lo7RQaS0nF2ImnH\/\/9+1lS6uRconwWCInBBUYhZal0TPXPlgefCV2A1F3b\/Jw2u3pVOp2Nj3SdnZRQWdfVRJFgCRAg0w6QrcabzJIFFQSxCO5Ouj07aTw\/GcdAabUoNO5eZjtgJtvdNJ\/VNAdPdjv92RW0CoLGHcJs7BI6OY+ol5rqZxLj\/lnP5AxjuvcDOY4wfcokylJj3kDHbXmr7EqmmCPpVHvXWlDmTtZ30UOmUZFH684ii59tpdZwPemw+juUEzxAgCRAIo2zk4UFw1yXu8Z9h9LtDqaxRHaoD+NI\/N71NJLdMGMgMjKW3yaT7VBnxVgGambcATTK1m5guuFQLzE1nkWUL0P4zGbWvEtv3NU3zfmWUiEiTdHkCz75ok\/uz2vXriHcBWTH4fdCHyCturfKzqTLMld8uQZu7To\/Ws\/uLAiQBEikIL9rKXdNpxmPscQt6k15vA6ZQkK4vrDXF\/p+jSdBdBiDoYy8MO4cUl7qXzmqvNbSgCzd35tVYDQjQNJAx8uZkrI7Ob\/mGiezJZH6LKm+M0uwBAHSECBbjB+WypkTCVcEyrRvtrLIksWW7Haw05FZWZxV2NR3NVUrn0V6Bg0foRVPnqqNnzr7eCmpORSy2x\/sFzz65yzd3UWngZEAmR23dTyboh4grWx4\/JXOUCldXaXslWCZEf08aWeoJMggrgGy3vjBkABBmIJXgVJCjl72yi5lMLubxrOaOv3Mpi6T3RR0\/9LE+NrqTWd0evMZdgnVK0WV+1ImzW6MZxjlXplJBQ8BMhh3PHIolgEyVWMeIbMnJWAKKYeVkGmUm8GXKkbyc8w\/24oEXf160qEHZSMfS3yPd70l2IAACXgcKI27lLKwZndFvUZBZsYwZGYMTnayEVbNoc5Osr+b1WvBrnr4w2Km70dpSCbnyOU8uZddywmQwWh69i1CI443IjKHZw93Z1u7zlNS8goCJGAeGZJJUx7zTDm90QeLdACZfAmil6F6UeYtX5jp5ajSiMyv++n6m+oJeAHY9dJRwhNcBUwJlxmeJ23v2p2kAyyiGyA7wsC7hCOk2+VVztDKYiudOZR2DXoIlQCsdhX1BjeZdEQ17y7K2CP5YizohnIESP\/dsu0nBCN4cp5UQmWaXW8Jk4hMgKwyvrmHDh7wPmEIXpe9erFLaQyVlL8C8QqKesm0V82j9FJU\/eyi02Y3BMjw2rzvSQIQfOt6m0agbKfMFQRIwOEupZSCyS5lpmcpjeWvsgtBox4g3E2g9I7DXncZVi0sEiCz466WFwk8CGyH0mXJawsNeBDqADkkr\/97BB0EfZZSL331KlTq3V8pgQXUConyeTSOpPG6gZKUzxvLUFUMiwTI7Nh+6A+hCyN7\/39Ne\/w\/NO3gf2tay7ua9mjHZ+mhf9O0v\/lXTbv3\/yOsheEcpexOSnMeF7uS9exKInQBsm9uH85AIpKh0mq3kpEKgPdNbPSdRL9Cor6rqI\/PkHuFlx1Rs+GmzU2EPJ+FLXz8+A1Ne+K9L8OjnZ\/955eh8u\/avwybhDb1w6SLnclmzkpC2QDZFSIT3rQEGMQpVJrPVlIGC9ifR7QKiF6Wm6YKikE3twkKAc9ft+09ELrAIaEwWXi0IoFTAuUDb7FDqfq5SSlzdXhmUkaCVBGYQIAEPD5Tqc+nlMWmVwtXWRQTLBGn8lJjOJSZiUHO8ZTSU\/2cYpSDIgEyO+545FDoQoaUqroNkGZS9srupNpkVIg04HFwn2zrUEtwAgES8IGceZLFp5yBkrNQXu5WGoMlpbAISyjUzx0ag6FXoy\/chkR9rqJ+RtHP2YoESOiann0rdMFCdhEzDZDmclcJk+xMqlvieu6am53sSrYTJEGABAIsgdV3K2WnI9NZlXalsLJAl4W6LNxp3gMvyMgaPQwKPQway0iD3C20I6N6JCDqO4mERAKkKu559VgoG+ikOgOZyc6kBFQ5Z0l4U4+clSwoKXMSJCltJUBmNUC2Gd+UcSsdArMqpWTOjzJYnSzs9a6wVozhwAo7nOFtKGNm\/t3LTrYeALO1M+j2PKI5IIa9gQ0BMtpu3bEvNE1zfvoHfwJjMvJn3v87Qpuq5a0Omu5wRpIAmbUA2UqABIIPln6U1jphF2ST0c+BRoGxpDMV4w6fFVXDXrrlpVL2Le95fWZimEZhhNX3v7PsfYKef7Y8+ExszjxmWuLKrmSog2QL4z8IkARIIATB0o9SWMDrUKh3MTUHQ0pLVQmQyz8g6Pmn8ak3QhES9HmP2SZlsw\/\/nrOSIQ6SMkcyj4BFgCRAAiE7Y+lH8x7El146qpMmNHoY1MtIdXwWw+eK1SsJej7acfi9UIQDCW0qBEhzeStBMnxB8oQTTvgfGu0QIIMIkM3GN54sSnioA953hTXuAun0uZbJSHMSglT4WP0ujeFPJ188GEMgO4MESMTr\/KN+BlKa26gWIoXMlmQUiJrNdlJ0bW2lrJUA6WeArCdAAuHfATWGEDv6LqlbUq6bKuiGiVWQs2Le4TMj7IEAyflHr8d3qFLOaia7pAQ39cj4j9zk5\/HrCVwESAIkAAARcfWabxH2fLL1YFtoQ4GUjsrcRtXCJCFS3TmSs6tXMfaDAEmABAAg6tauXUPY88n2Q3+ITECQURvSqVXKSf2aD+kUnVrVPh+ZYoZkE012CJBeBcha45tLStV4qAMAQIAkQKp7ZtIYKoPcqaSxjvpW3NCYrKxVdiPLCWEEyEwDZJW58QMPdQAACJBhtuulo7ELDnqw1MOlkLJTCZhG6e5iyrxIAlo4NPzi7VRjPzgbSYAkQAIAQICEjhDh\/tzl3\/zrl6FTQqaERXN4pBtr+Fy+40Cy3cg2OrUSIAmQAAAQIEGA9HRXk+AY\/iY7SXYjjzA3kgCZToAsN76RZOYcD3UAAPx3\/Q1\/RdgjQAIqnI1spsEOAdJtiEx4E\/FQBwDAf+tvqifsESCBQM9GJunU2kaDHQIkARIAAAIkARJAgnPX3JyspLWakEaAJEACAECAjJUdh98jKAAp5kYmKWltIqgRIF0FyJVL5\/BgBwCAAMkcyDS6XspaSsoEpXHJ\/JprOnd7ZLEuCC4IUYOdVs5FEiCTBchW4xtmyYIKHuwAABAgCZAuDRldmGz23nGyaC+bf35nuJTmJhIuNzz+CqEGWSFfdHAukgBJgAQAQHE3brqTsBehAJnkXJkrEkIlYM6uXtX5M1c13N8ZMGW3iLADv8j7zKakVc5FVhHcCJAESAAAsoygF50AKeEuyXkyT5nLY6VslvJYeEF2wZPsojMvkgBpHyAXnjGZBzsAAARIAmQGu4+zZ07SJpeO08YVj9by8wdr\/frlBBIwJVwKymPhw7lImusQII8HyHrjm6OitJgHOwAABEgCpMPZeuaF9qkTTtL+8i\/OslR93lxt4fxp2tSKks6AWTBmeGfA7NWrp+\/hUnZJrcpj5e9AeIKRvEds3kfNhDgCJAESAAACJAHSo4W2BMEVy860DZCpSLgUEi6FhEsRxO6lfv7SXB7L+ct4kh1sOrQSIAmQAAAQIAmQPu4+SuhLNzymIsFUwmXl3LLOP0d2OiVc9s3t82nQ5bH6eBLKY2PbXKeNEEmAPP6GmFQylgc7AAAESAJkwLuPmdLLY2dOP+3DoMtje\/XJOVZQUvbepLln\/5ny2Og11yFEEiDNAbLa+GYYmZ\/Hgx0AAB9979sXHCXohTtABr376IUli2clnL8Msjw2b8SYT43lsRIu6R4biQ6tR5gVGc8AWUWABAAgON+\/bMVHBD3\/3PPqscB3H6XLqsrh0en5S3N57OC8AYE392E0ibodWmWMDCGSAEmABAAgYFesXknQ8xG7j\/6Vx5rHk\/hdHmts7KOPJaEslhBJgCRAAgBAgIQnbtt7IHZnH+NaHmvctSRYEiIJkMEGyDzzG4CHOwAABMgw2vLgM74vns0NRaK+++h1eexJY\/P\/2K9f7u969DjxXb\/KYWXHUm\/kQ+jz53NgMyuSEBmHANkVIgmQAAAQIEPvrpYXfV04y24Xu4\/+7F7qZy+HD8\/7tGfPHp6OJpEdMwk8ehksIdCf3XhCJAESAAD44MrLv0nYC2kHVnYfs7dzKWNJvGzqo4dK2alkniUhkgBJgAQAQFlr164h7IWwA6sEDfOaSZrLEPSy19THy2Cpl7\/qZyoJh4RIAmTyANmecDM8ewYPeAAACJChcsu2n\/i6SDY3DpFOpIQ59cph9U6xXnSJJVBmHCIlY+QR\/KIZIFuNv+wlCyp4wAMAQICkA2sXCRDmxbGEFUJb+HYrMwmVBMrkyuafb\/W6tREiCZAAAIAAqZw7HjkU2O6KNHohnIU7VOpnK9MdN9KrT86xgpKyNy+5efd\/M0Ik5YgPQiQBEgAAECDVsvVgmy+LYgkH5gWxlEkSxKJX\/ipzLNPdpRwyuvCPC2uvfTfuDXmShMgWAmC0AmSL8Rc8a8p4HvAAABAg6cBqMbqjX78cAldMdinliwI56yq\/czdhsk9uv\/\/6+oXfee\/yHQcIkYmaCYHRCZD1xl9uRWkxD3gAAAiQdGDtMGR0IaM7kPYOpXR3lRLouIVJCZHmsTdd6gmCBEgAAECAjGQHVqvmOYzugD6j8tQJJ7kaISJfRsyvuSY2cyfl72kTImsJgwRIAABAgIxcB1Zz8xzZfSI8warcVd+ddBMmV9zQqEW9AY+EyJz+A7+weA2qCIThDpB1xl\/o+OJRPOABACBAxroDq5Tg0TwHbq1Ydmbn+8RNmJTxF1EucV3VcL\/V3\/tIh3JCYXgDZJXxFzoyP48HPAAAPll\/Uz2hLwQdWM2LXjn3RkCCn2FSdiWlaVMUdyVlt5XxHgRIAABAgIxsB1bzUHTpxkkoQqZh0umZSSmfljO4UQqR5pLwLq0EQwIkAAAgQIa6A6vV7EfpwkkQgldnJqWbr5PxIDIOQ3bDoxIiJ0yfZ\/X3bCIchjxA9u94M\/OABwCAABnXDqzmcjtmP8IvlXPLHJW4SnmrBEk5mxvRGZF0Zg1TgOwKkQm\/RB7wAAAQIOPagdW8wJVxDYQdqLArKWMx5JxkmINkkvEeNNUhQAIAALMbN91J8FO4Ayvlq8g2OSuZnz840kFSus5a\/L3aaapDgAQAACaEPrU7sFK+ClUsnD+ts3lTVIOkXDdNdSIUIGsurOQhDwAAATJ2HVjNTT4oX4UK5a1RDZLmbsdd6gmL4QiQbQmlGgsqeMgDAECAjFUHVll8U77qH3ktpWmMnPWTxjFSpumkE6lxN1j+HSE\/Q8gunQSsuARJ+UJDZpKmarYTgaY6VQRG9QNkKwESAAB\/rf7mYkKfwh1YZeFN+aq3gVFCXqrzfF6RP0cClpwhjHLwl5mS8romC5ISysIyR9Kmqc4RzkMSIAEAiL0rVq8k+CncgdU86Jzy1fRCo7xubnYW\/dIRsL6Qnc6pFSWRDJROSlulJFsaQ6keIs1f3nAekgAJAAAIkJ67q+VFTxex5l0QKbckFDrbEZOQpkJoTHpOMKf3R0WFoz6W36tcc5yCZBjOR5q\/wOE8pPoBssn4y6ooLeZBDwAAAVJpjU+94WkZnXnxSjjMvJTSalepa91ZJ+fc3Mz+k3+269+plWDRodm8CeLGyBFD\/jhr5qTPoxImZZc1WbmwfEGi8vlIzkOGL0DWEyABACBAhsmOw+\/5NlJASh8JiZ4Ex9ausFju81pWwmV1Vzh1HSrl9y1nJ6MQJqWxULLdYJXLWm3OQzIfkgAJAEA8Xb3mWwQ\/D\/k5vkNKMgmL3TkMjq1du4R5WV7fVnWtcVvdhskolC\/LezjZ70q+NFExRJpnsXZpIUASIAEAiJ21a9cQ\/BRsoGM1viMuoyG82tXq6popu39FSi68O8Js1w5lc9eOlpMmPJ0NgcL8XpAd1WTnI1Xt1mozH7KaAKnWh6o2oSY8P48HPQAABEhl3fHIIc8Wq5fvOMD4jiQBREJUiuBYH7YSw66S1yanYVLOFoZ5V1K+ABicN8D27ze\/5hqlmuzItTDaQ\/0AWUWABACAABnHBjqyeDaug2THhvDoaNexPgoLejdhUl6PMJ+VTFbWOmR0YecZRFVCpOyMMtqDAAkAAAGS8KdcAx3z+UcJCJx1HJfqjGNRJBfoX5W5pixvldcojEFSSnKTdWtV6Wyk+cudLnUESAIkAACxcP0Nf0X488At237i6SKV849fOefsWclKHY\/E5Rxa15nJulS7khIkZcc6jO8Z+aLEbjdy1MmnfazCbqTNaI8jUf0CI2wBssj4i+nd8WbiQQ8AgLfW31RPAFSsgY65TE4W1HE963jS2BHJdt1a4nr+rGujpSXVrmQYg6T83qXrrNXfJ6f\/wC+kI6oKoz0oZVUwQHZ9OBJ+MTzoAQAgQKrorpYXfRsZEMf5j3LWsU+fXsl2HWsZoXB8w6W56zWJVGlrsrOR0hE12w12zHNau9QSIAmQAAAQIJHS9kN\/8GxhOrt6VcL6Rxb\/cQqPKTqstsW1VNBBeWu9kyAZlbORKjTYsSllzSNAEiABAIisGzfdSQD0wD2vHvOtgY7sxsUhOC5ZPEvLG9Q\/WXh8Nu4jE7wIktK1NWzjP5I1UMpmSatNKWsLATK7H4KEN\/\/KpXN42AMA4CHCX+Y27dlPA50Mz7yl6LAqriAgehskZWdPQnuYvmCwG+GSzZJWm66s1QTI7L35W42\/jCULKnjYAwBAgFTKlgef8TVAxnyu44fSMKZjXSg7j3K+jPLV9IKk7WssJcNhOR+ZrMGOlJNmo6RVgquU05qupz0uu+UESAAACJBwaevBNs8Wow2\/eDsWAVKCQIqzjlrv3r3\/s6Gh4bKONaGUBB7RvvxPq0P1FiSAVnUpj2mzHcvXumfPHqEqa5UGO1Z\/j9wBg7TLdxwIPESaOyd3qSdAEiABAIiWvzybAOiBHYff820hKmWGUQuPElRS7DrqzXL0HZymrhDZ1BUE9RCoB8OWrtDYrqX3nzZD6Kzr+tlRHv\/Rave6jxw5JDQl08lKWqVDatAhUspoLa6lnACZ5QBZOXMiD3sAADxy2aXnf0oAzJyfOxlRCpASTOzKD32Y76iHzNquYNhk2J10Eyybo1g6K+Mm7M5HnnjiiVr56eNDs5Nt16VVuhkHeS5S\/izZAY3bbEgV39wJNdsVpcU88AEAIEAq47a93pbLmUtYZfRCFMKjNMnp+Lt84SA8Nge41iw37GTqAfNIkkDZ3vXPVUfofKRtWevAgf1CsxtpVw4t5yKDDJHmGa5xmA1JgAQAgAAJF+545JDni9AonYGUJjl9++Z87iA4Bh0ekynqCon1KUJlS9fuZF4EylrbrX4nJ5xwgjalYkIo3muzZ07q\/MIl2\/Mi4zYbkgAJAAABEi40PvWG5wtQcxlcGOdAys7V6FFD\/+wwOKoUHpPtVtZ1lbS225S71oW51DVZt9bBeQNC0alVzkVahUj5TEl5OA11YhggJ5WM5YEPAIBHvvftCz8nBKrTQEc3Yfq8hMWndJwMU3fVkglj210Ex7CW+BV17T5aBUq91LUqhCGyvKuBkcXZyBO0uXMmh+I9KIHX6u+wquH+QEKknL+0+POLCJDBbal\/1RkqP48HPgAAHrl6zbcIgRm4ZdtPAjlHJZ0mw1JC2KPHiR\/HIDxayesqe20yNeo5Yih1LQrR2cgmu9\/ZqJFDQz0vMogQadNQp4UASYAEACDU1q5dQxDMwJYHn\/Fl8Wk1C1LlMlYJjsnGcvTt2y\/q4TFZ2Wut4SxlW9fuZHMYxoV0rcOPWM\/o7KUtOXu28kFyXPFo2w6tWWqoU0WAJEACAECAjKmmZ9\/ybfFpLmNVcRdSQq3dCAWRk5OrnTrp9LiGx1S7lVUGeYrvRrbYNdg5vfRk5UOklIBnK0RKAx\/zfFMCZMABckhefx74AAAQICM3\/9FJIw7ZTQlDcBTlU2dp51ywkvAYnbmRdbYlraOGKt9gR3bJsxEibRrq1BIg\/f\/WI+FF54EPAAABMts273vS990L8y5k54K3YyGscnAsGjdeq1u\/sTNAEh4jFyLL7Upac3P7dHZADeOYD79DpMXnuD1KYz1UfbMSIAEAIEAqZevBNt8DpJyFtGjE0Tk0PeiFt11XS2NwrP1eXedrQ3iMdIiUzZ1Wm5LWz7P5BUcmYz7K5p\/f2fjGj8+xzKCM8lgPAiQAAARIOLDrpaPZnCnXGej8bKwjJYmpmuOYgyPhMVZBstnuXOT4UwpCGSILSsp8C5EWYz2ORGUXkgAJAAABEils2rM\/kPCou3jdnbajMeRcpJdBUn6W\/EyrBXay4Eh4jGWIrLX6fffocaI2fFie0ucigw6RVp2Vo7ILqeqbM2EY7ZIFFTz0AQAgQEa6fNXotr0t2l+s+m5nV1O7QCc7hVLaWjm3zNXCXQKjdKmUmXmpQqNdcEwSHmWXpZqwFekQaTnqQ8pZBw7oq\/S5SLsQ6deZyHPX3Gz1+SgiQPrzxmwlQAIAQICMW\/mq2H7oneN\/rjSnkQCXKuTppOGNHSdh0UlwvOGWu7SRo8bYhcdyQlZsmuu0md8DJ5544hc9e\/YgRHaRnU2LM83NBEgCJAAABMgIu23vgUB3H2\/dua\/bNVRfVKPlDR7iKgCmQ3Y8ZWdRgqvVa0F4hKm5jlWI\/Dzb3YNVCpEWu5Ba2HchCZAAABAgkUTjU28EFh63PPTLpNciQfLUSad7HhzlZ8rPloBo92dfXrde65OT8wXhEaYQ2WJ+T\/Ts0ePzHj16dJZKxz1ERnEXMhRdnmZNGc9DHwAAD6zbsIFQ6NI9rx4LJDxuO\/iq42uSoCeBT3YLbXYEbclOppSnVp21xLJE1Yqcx+zTJ+dzi5\/XRniEXYdWCZHSoClsIXJ+zTXsQoYwQNYbX+CK0mIe+gAAeGD9TfWEQhc273sy8HOP6ZIdQgmEduS\/T+fnnn3ecrsw2hal4ejITM\/efR60bPbUN0f5ENmzZ4\/PzNe9quF+diEJkAAAgACpXvnq7tc+1jY23qvc3112OZOM6WghPMLpTqSESGnkpOqYj84Q2aPHJ36GyCjtQhIgAQAgQCKL5at3tbyo3N9bdiuTlMY2E5bgOkT2y9UG5w1QNkRK0x+r697w+CvsQoYkQNYZX9zCgmE89AEAIEAGatOe\/b6Hx10vH1Xu7y1nK23OO4paQhLSCZE9evY8VjB6eOhCpIQ+r0KkzS5kHgHSuwGlx1\/Ykfl5PPQBACBABuqORw75HiDvfOR5pUpWk3R4pdMqMg6RPXv1+lj1EFl6WvEx83UPGV3YuYPo0y5kPQGSAAkAAAEyApqefSsrMx+ztesoMyBtwmMr5x3hVYjs3Sfns4KCEUqHyJPG5v\/RfN0FJWV+7UIeCdvniwAJAAABEhYCKF\/9owpnHWWkR5KxH\/UEIXgdIgcOzf\/85AmnKB0iO67tPT9mREZhF1LVN1q58UXt3y+Hhz4AAATIwNx27+P\/4fvcxyd\/eyxbf7+69RuTdVgV7fKFPgEIfoXIEYXjtQllU5QNkXJNffvmdAuRK25ozPizL3MmzZ83AqQ3b7SEF5aHPgAABMigbD3Y5vsO5G17W1QMjqKJklX4sLZvM7\/XSqZVakOGD\/9UQqSKu5DV583VTjzxxA\/N131t83MZffYbfvF2qBtUESABACBAwmTXS0f9nf34+ucfBvn3+YtV303WIEfXxq4jfFzb51mFyNKvL9IGDh76\/rji0UqGyG8snvmBVWdWCYGZ3AOkHDasu5AESAAACJAwuHXHvj\/6vfu441fv\/j6I0Ci7jUma4xibeDCeA0GFyCPm9+A3vn19R4gc8seiwlEfqxgip0099fdWTXUy6cwqo0EsPotVBEgPA2TNhZU8+AEAIEBGY3zHY7\/6yMtrrv1eXWcn1aqzlqRqimMOjvWUqyILvU66hchV9T\/Scvv1\/9OpE05Scidy9Ohhv\/e6qc6E6fPMn8kWAmRmb65W4wu6ZEEFD34AAAiQvttx+L1Qje9wERiNDXLqCI7I4jq\/2vy+7NO3v\/YXNzRqvXr3\/mz2zElKhsicnN7vdAu+DfenfR+4fMcBq89nEQGSAAkAAAEyJDbeff9HfofHe175s2e7jxsb79VOnjzNaXCUTpjVBBgostavs+rMunrLAxIiP6+cW6ZkZ9YTTjjhT+brlnLUdO8HQ0YXdmtiRYAkQAIAQICkfPWr8R0HX\/Xseu985PlUJaoSGmvZbURYxnuUzTtHW\/r9H3buRC5ZPEu5ELngzKl\/8vI8pIwFsfjc5hEgPQiQC8+YzIMfAAACZOjLV2\/f96R31\/ur\/\/jIahyAnDMjoCCsnVklQC5atbZzJ1LFGZElE8a2e3UeUoKndHUN00gPld9QTcYXsqK0mAc\/AAAESP+6r25v\/tTv8Lj79c+OeXnN8jPNC1mCCUIWIovMTXXkPKSUsspu5JDhw5UMkQP692336jykxUiPNgJkem+megIkAAAEyCiVr9797FvvenW9t+1tIUAiKiGyyuo85A\/3v9D5P0tKS0NxHjLd+ZDy74RppAcBEgAAAiQCKl\/d+sRvjnh1vXe1vEiARJRCZL35vTxjyUrt+vue0QYNG\/HFjDnTQ3EeUkZzeDTSo5kASYAEAIAAqWr31e3NH\/sdHoXsGnp1zdsPvWO5c0EYQYhDZKv5\/Xzpzbs7y1n75Pb9YuH8aaE4D3numptd3xuk\/NViFzKPAJnBfJiR+Xk8+AEAIED6YsuDz2hBBEgZu+HVNe9+7WPt2ubnzAvOVoIIonYeUnYhpbFO75ycL6rPm6tciMzN7fOuF6M9wtJMJzS10ARIAAAyt+GWBgKjhaZn3\/I9PO566X88K19t2LO\/82cSIBHBEFltDmMl0yo7z0NKSas01VEtQMq4EfN5SBnt4fYeMb\/mmlA00yFAAgAQI4TF7m7Z9pNAdh+3PflbzzqwbnnolwRIxGo+5EXX3dEZIvPHnvz5aZMnKrcLOaV8wkeZlrLKrqVFGWs5AZIACQAAAVIhm\/c9GUiA9HL+47aDrxIgEen5kCeccOLvrUpZr9rZ0nkesqpKvaY6QwYPfD\/TUlbZuTT9jCYCpLsa6IQXkAc\/AAAESK81PvWGFsD8x4+8vGZpoEOARNxGe+ilrLIb2TsnV7nzkHI9PXqceCyTrqwWzXSOECDdvXEIkAAAeOSK1SsJjBZ2vXQ0VPMfhf5zV9zQGJrW\/4BbHSFxt1VXVv085KiTCpU7Dzm1oqRbGap8Th2Xur\/wvlUZazUBkgAJAAABUgGbuprRhKl8tcFwzXLGyrReqid4IEqlrL1z+\/638T0+aPjIzlJWkX\/SKV+UTy1TrpR1+PC8T43XnNN\/4Bcycsfp\/WJ29SqlvxgiQAIAEBNXr\/kWoTEL4zt2v\/bJf3t6zV0NdAiQiGtX1srll3XuQsp8SPm\/pQuqal1ZzddcNv98x\/eMy3ccUHompOpvmIQ5MNVnz2ABAABAmtauXUNoNLmr5UXfA+TWJ35zxMtr1hvoECARF30H5D1nDlTSTEdC5KJVa7X+g\/I+X7HsTKVC5OTScd1CoJxZjsJMSNUDZKvxhVuyoIIFAAAABEgPm9H8wfcAubHxXs2PBjoESMRoF7KoZ+8+Hxvf64WnTekMkEL+99KyUqUCpATafv1yEj6fQ0YXZjITsoUASYAEACBQP7huLaHR5J5Xj\/kaHhufftPzazb+fAIk4uKkiRU77WZDfjnao98XixbNUSpELpw\/TUt3NqTNTMgiAiQBEgCAwKy\/qZ7QGHADnVt37vP0mhtM1ywjAlTu1gh4acCQ4Z+aG+rou5BflrIO\/lS1UtaCMcMTPqNSmiqdVp3cP2TH0vT5riNApg6QLQkHZmdOZAEAAAABMhQNdKTU1PNrNjTQsQmQVQQNRNX8i6+43bwrJ8HRWMo6efrMY6rNhjRfs3RZTbOMtY0AmTpA1htftIrSYhYAAAAQID3R+NQbvgZICXteX7OxgQ4BEnHUERLfM77n+\/Tt3znS43gpa8f\/feE3L1a+oY6UqIa1jJUACQAAATKWdr10NFTNc8wNdAiQiKPFtdcusRvrIeR\/zx877rOamvOUaqjTq1fPhGuWz25Yy1gJkAAAECBj59Yd+3wNj3c\/+5Yv123+cwiQiKNxp8\/8nd0upBhROF6bvejc\/1RpF3L2zElpjfVQsYw1VAFyfPEoFgAAAKTpps1NhMeAzj\/6Ub56294WJ7sTBEhE3gVX33q6dF01vvfL5p1zPEBeevPuzlB58TcvUKqUdXDegITPa0FJWSjLWFUPkFXGF2tkfh4LAAAA0kRwDO78o9fdV60a6AjzwpJwgbg4bdaCVvP7X85A6iFSAuXEGZUfqD7WY1XD\/emUsdYSIAmQAAAQICNy\/nHXy0d9uea7Wl4kQAJd5i77VmGyXUgpaZVdyHOXX6hUV9b8\/MEJn1kJh2mUsbYQIAmQAAAQICNy\/rHx6Td9uW5zAx0CJNiFTL4LKSM+8k865QuVGuqkswtpU8aaR4B0ECCH5PVnAQAAAAFS6fOPclbRl13Tl48SIIEUu5DGjqxi0PCR2sILL\/k07LuQKpWxKv\/GMN8YWQAAAECAVPX8o+wS+nXdVn8eARLsQibuQpo7suoNdWSUhioBsvq8ua53IWdXrzL\/O80ESAIkAAC+uWL1SsJjlx2H3wvd7qNVB1aLsrZ2AgXYhey+C1l42hRt2te\/rlRH1nHFo13tQl6+44D5836EAEmABACAABkAv8Ljzo5g6tc13\/nI893+PJkhZ1ontRIoEEcTZ575L8bPgpStGgNk5y5kbt8vwr4LaXEOsooASYAEAIAA6aPb9h4I1exH3d3PvkWABGzMOf\/SuebMsPT7P0wIkdKh9fQZM5XahSwYM9zVLmTZ\/PPNn\/kmAqR1gGwzvlBLFlSwEAAAgACZljseORSq0R3JGugQIIGvjDt95u+Mn4cRheMTAqR0Z5X\/\/wUXLFC6I6t8ru3uM7JDafrn2wiQ1gGylQAJAAABUuUGOn7uPt6603rsCAES+Mr0sy+qM4ex1Vse6LYLeWr5FE3ljqwTps+zvc80\/OJtqzLWIgIkARIAAAKkT7Yf+kPodh8lnBIggdSGji780PiZkMBotQsp5w9V3oWUBll295uCkrKsj\/MgQAIAQICkgY6iu4+du6ZPv2n555675mYlzkMBqig\/87x7zWHMONJD34UsKS1VaheyX7+chGuWkR1295v5NdeYP\/ctBMjuAbLZ+CJVlBazEAAAwKW1a9fEPjxu2rPf8\/C4+7VPPvP7uq3OP9oEyHpCBOLOPNLD3ExHxV3I2TMndduFlHJVh5UHRwiQ3QNkPQESAAACZKY273vS8wB5V8uLvl6z3flHAiRg7eSyWYeTNdNRdReyV6+eCZ9n+Xy7GOdRToAkQAIAQID0mIQ9r+c+bmy8NyvnHwmQgPORHuZmOrIL2Se3n6bSXMjJpeMcj\/SwGOdRT4AkQAIAQID0WJPFLMVMNOzZ73\/XWJvzjwRIwN7gEWOOGD8bM5as7LYLWTKtUps6S525kFJSaw6+MrbD6rO\/4obGrDbQCkOArDW+QIUFw1gIAABAgMxqB9ZtB18N5Jp3v\/ax7TVIow3TIrKO8ABoX5s056ztxs\/GoOEjuwXIS2\/erfXJ7atUGeu44tGORnpIl1Zz2CRAJgbIKuOLMzI\/j4UAAAAEyKx1YJVQ53fpqmhI0fRHFpemRWQV4QHozA955oB10XV3dAuRJ51a9rk0sFF5pIddM53cAYOy9vknQAIAEAM\/uG5trMPjrTv2eRYg73zk+UCuWXY5CZBAekaNm\/ivyWZCCunQ2q9f389VHulh10zHogKhngBJgAQAwDPrb6qPdYC8be8BzxrnBHXN8mcRIIH05I89+Trj56NP3\/7dAqToO2DQh7Lzp0qAnFpRkvC5Hjxy7OdWn385H5mtc5BhCJDlxhend6+eLAQAACBAuutm+uAzoWmck2p8BwESSK+MVc49mgPk3GXfOjZ6zIi3VG6mc\/mO7l+ASWlrts5BhuUNkPDisBAAAIAAGfQIj6Aa54jbHcysJEACyQ0ZNfY3qbqxykgP+e9UGulRMGZ4wmdbylVVOgdJgAQAgADJCA9FGue4CbwWi8ciQgPwlf55Q69I1Y1VFE+ecWRK+YSPVAmQ0tjHeN3yWVdpHiQBEgAAAiQjPFKQQBfk9aZqoCOy2cYfCGsZ6+otD3QLkNKhNSc3588qNdPp1atnypmQ2ZoHGcoAuXLpHBYDAAAQIB2759VjaYfHXS8fzULgfYcACXizC\/m68XOyaNVa62Y6\/Qf+acniWcrOhJTdRlXmQYYlQLYaX5glCypYDAAA4MKNm+5kBmSabtvbEvj1purASoAEHOeIOuPnpPC0KZYBctri5cfGjSv4RJUAWTm3rNtnfNsL76e8D0gDUgIkARIAgIzFOTxu2rM\/7fB497NvKRt4CZCA+4kOwipASmlrr169Pg1bGatFM606AiQBEgAAAmQWZkDufu3jL4JsnKNrcBh4CZCAMyeceOIHqcZ5iLzhI\/9Hdv7CVMZ67pqbzfeCZgKkRYBceMZkFgMAABAgHbnjkUNpBcg7H3k+K9frZITHtc3PmReNbQQFwDZLNBs\/L5XLL7MMkPMvvuL\/FBWO+ljVMlarbqwW94J2AuSXv\/R64wtTUVrMYgAAAAKkbzMgtz\/\/75+qfL0Wi8ZWggJgmyVqnZyDlJmQPXv2\/ETlMtbLdyRWVMi5SItzkHkESAIkAAAEyDQ1PvWG6wApZaTZut67HcysJEACrrJEkZNzkGLwiNEfqFzGOrt6Vbf7wZDRheb7QRUBkgAJAAABMqAZkI1Pv5nV65WxIQRIwPM8ccTJOciF37z6I5XKWGfPnJTwWZewaL4fyNlI0\/2gngBpCpCTSsayGAAAwKHLv31BrAPkrpeOOm+c8\/pnx27duS9r1ypNe5xcJwEScJ0nWpycg5QyVpW6sa5Ydma3ElWZ\/2i8H6y4odH8z7QQIL\/2tWrjizIyP48FAQAADl2xeiUzIJ02znnsVx9lt2Nsi6PrlHb+BEgg\/XmQJdMqbctY+w0a\/OHC+dOUKWPNzx+c8HmXwJjNRjph+YVXESABACBAut7Ra9p71Gl4vOfVY0fC0vDHonV\/PSEBcJ4nBg0faRsgpy1efqykpFiZMtapFSUJn3eZ\/ZhqrI+fjXQIkAAAECAjq+FHP33faYDc8vBzH2a94c\/TbxIgAf8yRcLn5vr7nrEMkBddd4eWN3TYh6oEyCWLZ3ULiNlspEOABACAABlZtz\/w8z86O\/v4+YdqNPx5hwAJ+Jcp2pw00hHy31efN1fZcR5StpqtRjph+WXnmVM3CwIAAAiQXpWE3v3\/\/tufs15u67CBDgES8LeRjhg\/5eufSgdUVQJkwZjhCZ95uQekuCc0xzpAWm05syAAAIAA6dUMyDsfeT77u6X7niRAAgFOdiibd45tgFy0aq02trDg07Ccg7RopNNGgCRAAgCQlrVr1zADMoWGPfuzfq3bDr7qOEBalKvVEhAAd8fiCk+bYhsgV295QOvVu89nYTkH2fCLt7v99wRIAiQAAARIH2ZA7vrNnz5V4Vp3Hn7PcYCU3YegGmYAEQqQReZMYRcgxYDBQz+R4KZKiOzZs8enyc5B5g4YZL4vlMc9QLYbX5Dqs2ewKAAAgACZ8QxIOScZtnmVBEjA306sYtKcsz6U0tGwnIO0uC9Uxz1AthpfkCULKlgUAABAgLR1666\/\/cBJGLt1576sX+tte1sIkIBinViXfv+H2tiTRit7DlJK2Y33hfk11wRyNpoACQAAATKSbtt7IGUQ2\/nCH99V4Vq3PPRLAiSgWCfWq3a2aL1691bmHOTC+dMSPvdSsmq8L6y4odF8X2ghQBIgAQAgQHo4wmPLw88pMf9x25O\/PeYmQBaUlBEgAQ86sc5YsjLpOcjefXI+U+kcpLkEV5rnBN2JNbTfFsyaMp5FAQAADlx\/w1\/FMkBuPdiWMojJ7EUlmv38+ki7mwBpXkTKzGzCAeAoU1Q77cQqTi6f9ZFK5yCHDRv0kfH6VzXcH3gn1tB+W1BRWsyiAAAAB9bfVM8IDwv3tH10VIXrlBDrJjxaBUiCAeA4U5QbPzt9+vZPGiBlHmRR0Zg\/qRIgT51wUsJnX849pvhyqYgASYAEAIAA6cA9rx5LGsKafvm7P6pwnXfsb\/1vAiSQvU6syQKkNNnp26\/\/h6oEyNkzJyVcu5yHDvp8NAESAAACZPQ6sO74m89Tnn986JdKXOvdz771LgESyN54wGSdWIX8MyuWnalEgJTzmMka6UhnVtP9oS7OAbLO+GKMLx7FogAAAAKkdVfTB58JxfiOzp3SV\/78EQESyF5zzlQBcvQpkz5YcObUP4WhkY7MhvR7lEeYftFVxhdjZH4eiwIAAAiQaXVgveeVD\/+syrW6DY8WjTKOEAoAV7mi2ekoDyGdWksmjG1XJUDm5w9OuAdcvuOrkUXSVMd0f2glQBIgAQAgQGbYgfXOx371kRqzKltcB0iLVv2thAIg\/aNxqQLk0u\/\/UBs5Zsw7qgTIccWjE+4BsusY5CgPAiQAABF346Y76cCq6PgOmUNJgAQCzxW1bkZ5rN7ygJbbf4AyJawyVsR4\/XLuUb8\/bHvhfd9L3EMbIPv3y2FRAACAA3RgNXVffeZ\/f6DKdW578rV2AiSQ3VyRKkCq1khn4fxpCfeAgpKyQOfEhrrlLosCAAAIkGab9uxPGsBu3\/ekSjul7xEgAbVnQeqNdCS4qRAgJciac5HxHiGB0s9RHgRIAAAIkJFyxyOHbMPX7t9++olK17rjn\/7rfQIkoPYsSFE275zO0tEwdGK1mAVZTYAkQAIAQIC00fTsW7bha\/uhd9Q6q\/n8v3\/qNkCuuKHRvDhsJhAA\/gZIabRzyoSTNVU7scoXS\/o9Yn7NNb6O8gj1L7rmwkoWBgAAECAT7HrpqG34kvEeSl3ry0ddd2ENYs4bEHU9e\/d5180sSPnvRxYUHAtDJ1a\/7xFhC5BtxhdjyYIKFgYAABAgHc9VVOn8YzozIAmQgDf6DshrcxMgr9rZ0vnPqRIgJ5eOS7gPyK5jULMgwxYgWwmQAAA4t\/qbi2MVHjdub343Wfhq2LOfAAnAdYDUO7FWnzdXiQBZOTexUY6cewzqnDQBEgCACLti9cpYBchbd\/1t0rEYKl1rQ4pusQRIwD99cvs9bfwcLf3+D1MGyJNOLf9MlU6syUZ5WATIdgIkARIAAAKkhS0PPdsWlgY6t+1tIUAC2csV9cbPkTTJcdKJdfrM8lCM8jD\/d3EOkE3GF6KitJjFAQAABMjjGp9643W74NX49JuRCJB+t+gHCJD2nVinzJiq7CiPbS+8T4BM9YsmQAIAQIA02vni\/zlsF7zufOR5pa5VOsJ6FCCrCASA\/wHyouvu0MYUFSsTIAfnDbAd5TFkdKFv9wkCJAAABMhYdGCVHT8CJIB0A6Q02hk2quCLMMyC9PM+QYAEAIAAGRVtyYLXxsZ7lbreu599iwAJZC9X1Bo\/RyXTKlMGyOvve0apUR7mWZArbmgkQKb6RY\/Mz2NxAAAAAbLTLdt+8pJd6Nr18lHlrlea+hAggazliirj56jwtCkpA6Q+ykMa2Kg4C1IabOn3CZkL6VezrVD\/ogmQAAAkt3btmtgEyE27H3w0LB1Yxe7XPk4rQPp5tgkgQCY3onC8tmjRHCUDpITGILo1EyABACBARsLtD\/z8QbvQJecNw3ReMxk\/uysCBMjk5J8754JzlQiQlXPLEu4FUp1AgCRAAgBAgHSo6dl\/3WMXurY89EulrrVhz34CJBDCADljyUpt2te\/rkSAXDh\/mm2AlPOQpntFS1wDZJHxhejdqyeLAwAACJD6jl6TXeiSwKbStUqgJUAC4QuQ0q11RtUCJQNkQUnZ8fuEdGQ13StaYxkgu37ZCS8GiwMAAAiQXQGy1S50qXatjU+\/SYAEQhggF61aq51aPkWJACnNfMz3AwIkARIAAAKk8xEelgFy5+H3lLteuSYCJBC+ACmzIEcXFn+uyigPAiQBEgAAAmR6mu0Cl+z2RaWBzobHXzEvCtsJAwAB0hwg\/bxXhPGXfcT4YqxcOocFAgAABMjmsHRgvW1vS9oB0s9dBYAAmTpAXrWzReudk6OpGiC3vfC+79UKYfxltxpfiCULKlggAABgY92GDbEIkA0\/+qltgJTAFpUGOgRIILsBUsg\/r0qAzM8fnHBPkHsEAZIACQBA2tbfVB+LALm5+R9utwtdGxvvjUwDHQIkQIAkQBIgAQAgQGZo28FXd1oFrt2vfRyZ848ESECNANk7J\/ez6vPmEiDDGiArZ05kgQAAQMwDZMdiqd4qcG0\/9E5kzj8SIAE1AuTok0\/9QGYwEiDD88uuN74QFaXFLBAAAIh3gGzvWCy1hKGBjlxPJgHy3DU3mxeFTYQBIK1MUZ1ugCyYMPnjMATIIaMLzfeLKgIkARIAAALklwHScgakNKxR6VplR9TjAFlPGAAyzxSVyy9zHCAlbKoSIAvGDE+4J6xquP\/4\/WLC9HkESAIkAAAESJsS1narwNWwZ39kzj8SIAF1AuQ3zlukRICcXDou4Z4g9wgCZIpf9qSSsSwQAACId4BstQtcUTr\/SIAE1AiQM5as1KbMmBq6AHnmX15VF9cAmXDgdWR+HgsEAABs3LjpzsgHyI2N9z5qFbZ2Hn5PtU6xBEggAgFS\/lkCJAESAIBIikP56m33HrAc4SHzFlW6zl0vH804QM6uXkWABLzJFM3Gz9KiVWsJkARIAAAQhwB514HDN6regfXWnfsyDo9+nmkCYhggE0YDXnrzbgJkXALkkLz+LBAAAIhxgLSbASlnDlW5xjsfeZ4ACUQoQE6eWvEuATI8v+w881BMFggAAMQ2QEoDnSarsLWx8d7IjO8gQAIESAJkZr9wAiQAAARIUW81A3L3ax8rdZ1yPQRIQN08cf19z0Q+QMZ2jAcBEgAAAqRBtVWAlB2\/qJ1\/JEAC\/uUJp+GRAEmABACAABluVao30PHq\/KPIHTDIvCAsIgwAmR+Jcxsgw9hEJ+4Bst34YixZUMEiAQAAkytWr4xtgNzy0C+Vuca7n33LswBpXvQSBoDMm3IWnjaFABmDANlKgAQAgAB5x0\/\/sU7lDqzSyMer8EiABAiQBEgCJAAABEgfAmQUy1cJkIBnWaLe+Dkqm3dOaANkwZjhCfeEa5ufI0ASIAEAIEAmmQHZLUDuPPyeMtcn10KABNQOkBIIwxog8\/MHEyAd\/tKbjS\/GrCnjWSgAABDPAFlvDlly5lCFa2vYs9\/T8EiABDzLEi3Gz9GiVWsJkDEIkAnfGlSUFrNQAAAgngGyRdUOrI1Pv+lpeJSFoWkx2EYYADKvZrz05t0ESAIkAACIQYBst5oBqUIDHS9nPyYJkK2EASCNLHHCCf9j\/Cyt3vKA6wA5ddZM5QPkkNGF5ntGOQGSAAkAQJwDpITHdnPQkvAWteY5BEjAv5nybsKjHiBnVC1QPkD6VfIe1l96XULr3YJhLBQAADBZu3ZNHAJkQsja\/drHSlzbrpePEiCBEIzwGDR8ZFoBcnrlPCUCZK9ePRPuC0GcmY7EL35kfh4LBQAAYhYgb9n2493mkLX90DuRbJ5DgAQ8yxHVmcyAFDOWrFTmDKQ5JBIgCZAAABAg7YLaj37abA5Z2w6+mvXrkmvwI0CuarifAAl4fBROwqDbACmh85wLziVAEiABACBAhj1Abnnol5Gb\/ag7d83N5gVhPYEAcCe3\/8BHM5kBqQfIRYvmECBDFiDLjS9G\/345LBQAADD5wXVrIx0gt\/79yw+r1oHVj+6rBEjAOwOH5r+ZyQgPPUAunD8t6+FRrsH4d5GxHUGM\/YlM9yQWCgAAJFp\/U32kA+S2n\/9ztx3IKHZfJUAC\/mWIq3a2uA6QBRMmfxLCANlKgCRAAgAQ6wDZ9MvfPW8MWFI6mu1ruvvZtwiQgLr5oSjTER5C\/r0Vy84kQBIgAQAgQIZJxyIpYYyHhLdsXs\/Gxnt9C48ESECNDqx6gFTh\/OPUipKEe8L8mmsIkG4CZM2FlSwWAAAw2HBLQ9QDZLsxYN3V8mJWr0ca+PgZIMvmn29eENYSCoD0O7CWzTsn1AFycum4hHuCfMmU5AunJgJkR4o2vihLFlSwWAAAwCDK4bErQCrVQKfx6Td9DZBSnmZaEFYRCgBX+aHF+BlatGqt6\/AoZyZ79+nzeQgDZD0BkgAJAEB8A+Sdu583ByzpgJrNa9r92scESEBhJ\/bo8YdMO7DKvzNizJg\/qxAg8\/MHJ9wTpGyVAEmABACAAGl13rBpb5sxXEl4y+b1yO6nn+GRAAlknB3yvGigIwFy1JhRmuoB0s+S98gEyIVnTGaxAABATAPk9kPvZPV65PwlARJQOjtUGT8\/IwrHpxUgpez1lAknKxEg+\/XLSbgnNPzi7UDuF2F+EzQZX5SK0mIWCwAAdLli9cpIB8jb7n08IUBuO\/hqVq9HAiwBEoh+A53K5Zd1nj1UIUCad1SDul9E5k1AgAQA4CtXr\/lWpAPk7Q\/8PGGEx52PPK9UQx8\/mBeLUpJHMACCa6AjJHjK+Ixsh8fq8+Ym3A9yBwwK7H5BgAQAIILWrl0T6QC55aFn21TpwHr7viezEiAJBYCr7HAk0wY6YszJEz9aOH9a1gOkXIPx7yM7jkHdLwiQAAAQIEPnjp\/+Y8IMyGxei5TPEiABpXNDkRcNdMTwMYWfqRAgK+eWJfx9pGmOfq+Qs5AESOs3QrXxRRmZn8eCAQCAGAbIXS8fzeq17Dz8HgESUDs31Bo\/O4WnTUk7QMq\/r8L5x9LTio\/ZzYCUbqym+0UrAdKikxIBEgCA+ATIuw4cPqYvlu5+9q2sXYfMngwiPBIggYxyQ7Pxs\/N\/27v3+KrKO9H\/p5K9s0MSshNCSEIgFwjhEkgCCMHGGG7CiYABBTqjSOqRizLVnYodUkeMWLyVgahY\/Z3RNqO\/Tsdpj2ZOx868bKv5jfZ3bDsdUztnju1pbcaDUyuOpiCXcFuHb8zWtTd77+zbWutZa33+eL9OX8d5sSHs7Dwfnmd9n4Wtm5KKxzu+\/gNlArK0tPBt\/Z9pw+6Dn3xW7Hj0eQKSgAQAgICMdm2G\/G+rfh8yvMeMeDT6SBrg8IAc0H\/vbNz1kO3vgMzNGTsQ7Q5I2Y0M+7zoJiAJSAAACMiRxZIMsbHq9yHHZ80ISKOPpAFuev5RdhKTCci1N9+lFZdMVCIgvV5PyFCgO597\/ZPPi6Wbbwv\/vOgiICO8GbyeDBYMAAC4MCDlGKkVv4d9Tzxr2vFVAhJIz\/OPE8urk37+0cZ3QLYRkJ++IUK+OCwYAABwX0A6ffoqAQlY\/\/yjmFbfeHrxotnKXeFRUFoe8nlRVlMX\/nnRQkASkAAAuDogu196a3ihdOinH75t1e\/h8TeGCEjAJc8\/irJpM0+reIXHaHdAXuAnIAlIAABcHZCPvHJ4eKEkQ2yseH157tKseCQgAeuffwxe4bFh\/RLLA1KO0Ua7wuPAjz80fOCW3d8UIQ+Ptq1ayKIBAAAXBaRVzz8efPFNUwNSRvSHLQp7CARg1FYIpOv5xy8c6tW8Pp8Szz8WTywYjHaFR4R\/bOonIEPfFH36L1DrsgYWDQAAXNC5p8vxASnPIFrx2nsPPmlqPEYZy99FIACjtkKv\/vtGhuAkG5AqXeExdqzvSLQrPLbs+4bhpxUISAAACEjbub\/nu5a99oPf+iEBCdjwcbetDz6T0gTWmbOrlZzAKsdWzfysICABACAgkdDu5zsEJKB+J7Tpv2cyx+YkHY+iZkGzNr+hxvJ4bF3ZGPJZkJWbN9oVHgECMta29KKZLBoAACAgDWV2PBKQQOrXd9RdcVVKAVlYOmXIDhNYjb7CwwkB2aX\/AjXUVrJoAACAgDTMfU\/1EpCADYdtpnJ9R3ACqwrHV2NNYDXjCg8CEgAAAhIJkGtDrAjICMfS2ogEIGoj1Kfz+g4ZoJNfWHhKhYAsyB\/3of7PJUNzgp8Tdz73evjnxKAhX18CEgAA59lzfzfBZ4CHX3pLlYBsIRSAqI3Qrf9+kecXU9l9vHJLh1ZRVfG+CgGZmek5pv+zSTQGPyd2PPq8KffFOiogqytLWDQAAHABsWeMx352lIAE1G+EAf33y9qb70opIOc0rRpSYYDOhvVLLjqiOspR924C8uI3R4v+i1Rc5GfRAAAAAemY+x8JSMDa46uioLjsmAoDdOT3oP9zycAc\/edE3dKrDZ\/ASkACAEBAQvEBOgQkYN3xVYlPVQfoLG7bEvI5UVBabsrnBAEJAAABiTjs7\/2JZQFp1sIQcNr01VSPr8oAnTx\/3gkVArK0ZPxx\/Z9tw+6Dn3xGHPjxhxcdbzXsa+ykgCzw57BoAACAgDTEwRfftCwgzVoYAjZvg7Z0H19tWv\/5U9OrJysxgXXMmEuG9H+2L\/a8\/MlnhPzvsD\/7AAEZ+U3iD3+TsGgAAICANMKh144QkIDabdCr\/z6pu+KqlOJRFFdUf7B40WzL47FtTVPMATqyGxn233sJyOhvFAISAACdHTeuI\/gMYFU8EpBAchtLG3c9lHJAyq8j8WZ1QDY31YX82eS5aP1nhDwPGfbn7yIgCUgAAOJyy9ZNBJ+DBugQkEBcTRDQf4\/kTShOOR63PviMlp2bd1KF46vV08qO6v98SzffZtlz0gQkAAAEJEbx1W+\/SkACNrr7cWHrppQD8sotHVpVTc2HKgTkuHHZh\/V\/vi37vhFzgI7syBKQ0d8s\/fovVuuyBhYPAAACkuhzzACdO5973bThGIATBmuKLxzqTTkg5QoQFZ5\/FOF\/vn3f\/60lA3ScEpB9BCQAAASkkR5\/Y8iygIywOOwjGoDow3PKZ81LOR5Vev5x+dIFIZ8BclxV\/xmxeufdpg3QISABAHCgjo6dRF8a7XviWUuPrxKQQMwWqDBieI7c\/5gzLu+0CruPc2qrQv58dUuvDvmMkIE6YV+DAAFJQAIAQEBa5MFv\/ZCABNRtgZ50D88RzdfepM2cXa3E8dWiovyQzwC5skP\/GZGVm2faAB2nBGTIm6ahtpLFAwCAgCT80ubACz8nIAGbXN2x9ua70hKQEyZVnJarM1R8\/lGei47xjLThQ7ac8MbpIiABACAgjXLotSMEJGCDDsgcm6Pd8fUfpByP8msM7\/StX2J5PLaubAz5\/pfdRv3ng+xGmv354Lg3ztxZ5YMsHgAABCThlw73Hnra0niMMiCjm3gA8Ti8+zio\/96QY6fp2H2UXczJ5WVn7PD84+K2LeGfD10EZIIBWTtjyrssHgAAbnbH7i8Rfw55\/jFKQHYRECAgjdl9FNXzms7Mb6hR4vjqxOLCmM8\/ykRWM59\/dEpAtoeM7S0rZPEAAHC1zj1dxF+aPPKP\/2eQgATcs\/sovJm+sypc3zHa849yF2T4f5evDQGZ4MWhxUV+Fg8AAAKS+EuLx346OEBAAmoP0Uzn7qNcAZJXUHBMhXgMv\/8x\/PnHLfu+Ef7Z0G\/K15+ABACAgERkj\/\/LuRMEJKD2vY\/p3H2c07RqqHpa2VEVAnLG9CmJPv\/YTUASkAAAEJAW2XvwScuff7RqSAZglzvgM7Oyz6dr91Fk5+WfkMmnKgRkYdGEkO992XG08v5HJwVkvf4Ll5PtY\/EAACAgCcCUffXbryoRkNMvvcKSRSKg+saRuHJLR9riceuDz2hZY7M\/UiEe5QqR8D+rPPNo5f2PjgnIkTdTyBePxQMAwM2Iv\/R49P\/\/\/TECElBqzT+g\/17Im1CctngU85avOzq1atIRFQJy8aLZId\/3Mm3V6vsfCUgAAAhIxPC1108cJyABNa\/tEDfc\/XhaA3Jsbt4xVY6vVteE3v+4dPNto30uBAhIAhIAAALSIvueeFaJ46sEJHDxI2uiZkFzWuNRYjQzM3NQhXgUmb6skD\/vjkef\/+Qz4cCPP4x0fUc9AZlCQG5aexkLCAAAAYmk7e\/9CQEJqLPW79d\/D3gys8584VBvWgPyQpC+q8r0VdkFDe8b\/WeCxGTYfx8w9e\/DidOYWpc1sIAAABCQSNrDL72lTEBGmLRYQVTAzUdX0zk4J8jjzTytyvHVmbOmJnp9Rw8BSUACAJCU7VtWE4Bp8Mgr7ygTkFZNWgRUPLpaNn3OyXTH48ZdD2l5\/rwTqhxfLSyeGPJnloE5+s8EGagT9nVpIyAJSAAAknLL1k0EYDoC8tV\/P0NAApau7\/3hR1fHeLwn5aqNdAfk1PrFJ+c31CgRj21rmhK+vkO+VgRkigG5\/PI5LCIAAAQkkr\/C43+89yEBCVi6vu824+jqHV\/\/wce7fOuXKBGQErIhO641dSGfBzKNNezr0mv6340Tz0Y31FayiAAAEJBI\/hnIH737PgEJWLa2bwt\/30+eUXcm3fEoll\/\/hZNlZRPPqHJ8taSsNOTPvXrn3SGfBxKUVl3fQUACAEBAIoqDr777LgEJWPbc46D+Pe\/1ZZ2VnUIjAnJs7rjjzU11SsSj7IKGf7\/LkdXgZ4EcZY1wfLWCgCQgAQAgIC3256\/87t9UiMcv9rwcvljsJzLgpucehQy5MSIe5e7HsdlZp1XZfVy8aHbIn1uG5eg\/D2SYjgqfB44MyNk1k1lEAABcqaNjJwGYBve\/+Jv3FA3IPkIDDg7I3vB4bL72JkPiUVTXN74zp7ZKUyUgyysmh\/zZ5XlH1Y6vOikgQ85JFxf5WUQAAAhIJG3v9958l4AErL3vsXzWPMPiMTg8R6aecnzVnQHZQkACAOC6gHzXiF93z\/2PaF\/+zs8+JCAB09by7eFxlDehWDPquUfRuPqPf182aYLG8VUCkoAEABCQ7gnI7xjx6+6+Zz8BCZg7NCfkfZ45Nkcz4r7HkOE5Obknli9doExATp5SYovjqwQkAAAM0bGzPqN2IL\/4l31KTGDdsu8blt\/5Bpg5cVWsvfkuQ+NRfv2xY33KXN0x2vFV+d+qHF91UkBWhH9RWUQAAAhIAjJZq3d2KRGQcgdc2Bqni\/CAgyauDpg5NCeopHL6UTkyapfjq7IbqdI0Zie9CQlIAAAB6a6A7Dfq1974p39+nIAEzL2uo+6KqwyPR7m6w+P1npVdP1UCsqgoP+bx1fziyedUOb5KQAIA4DB\/suN6NwXkr436tZf90faPCEjAvHg0cuKqnkTq3LnTlYlHmQIb6\/hqhOeghZ+AJCABAGCIjkI7kCvWXXeYgATMiceJ5dWGTlwN+sKhXqWu7hDzG2piHl9d3LZFueegnfSGDDlD3bZqIQsJAAABiaQsuXL1O4\/+84khAhJI63q9z6p4DO4+Vs+coczwHJHvz416fPXAjz\/UMrOyz4R9zdoJSIPekK3LGlhIAAAISCSlfXtAias86pZeram2eASSXKv3mH3Xo568jmq7j60rGy86nrrv+7+NNYV5UIm\/SwISAADnuH1XBwGYBoHOvdrVt33ltNUBOf3SK8IXkC3ECGx4bLXHirse9WS667TauUdV2n2cMX1KyNdE7nrUf\/9Pmj7nbNjXrYeAJCABAGAHMjXvOvkqDwISTnzm0ex4lN3HzKzs8+vWLdNUCkiPJyPk67Jh98FPvvdlJzLC8Jx6AjK9b9Be\/Re4cV41CwkAgOvcsftLbgvIfzHq116wYv1HBCRg73gM7j5On9twTKV4bG6quygQ5ZlHVe9+dGpAdum\/yA21lSwkAACu07mny20BOWDUr107v\/EEAQnYOx5l99HrG3tOpWcfRdmkCaF3YC69WvnhOQQkAAAEpBO8ZtSv3bKiVXv0dWsnscozUQQkiMfUdh+nTq8+oVI8Rrr7ccejz8ccnmP13Y8EJAAADrR9y2o3BuSvjfq1P7dlm\/blb\/\/TMSsDUrULxIFR1uP14VfrBa\/qsCIeVbz3MZ67H0umzhpScXiOEwMyoP9CV1eWsJgAALAD6Xz9Bk9iPatSQBIpUDweB6285zHcnMtXna6smnJcpXgU2dm+qHc\/frHnZWWH5zgxIFv0X+jiIj8LCQAAAYmULF7XrhGQwKjr8Lb\/9JnP\/EGleFR193H50gUx735c3LYl\/L\/3Kff3TUACAEBAIrLL117HDiQQew3eHmHHTCufNc+yeBTT6hefqJ1VeUq13ceqytKQr5MMyhrl6o52ApKABACAgLSJxqYl7EAC0dff3ZHise6KqywLR3HD3Y9rGR7PmQ3rl2iqD8+RgTnB7\/fVO+8O\/+8DSv69OzUgC\/w5LCQAAAQkg3RSsmrNtdq9\/\/C\/j1sRjxF2IwaJFqgyaTXDm\/lXKsajyCuc+IEMqlFt93FObVXI1yorNy\/k6g5fdu65sK9nFwFp\/Js55C+FhQQAwE123LjOrQFp2F2Q7dsD2tY\/\/2tLrvKIMExDrkaoIGBgdTx6MrN+GSke1958l+Xx2HrTn76f5fOeVC0eRxueE+HqDmWnLhOQAACwA2l3fUb++stuCGiKBOQnx9pGri8jJmH6pNUL8fhepDseN+56yPJ4lGcuMzzeoeamOuXicfGi2TGH58hVHipf3UFAAgDgUHvu73ZjQL5p5K9f17TinGIBGbLIlMd4iBuYMWl1TIbnRKR4tOKOx0gaV\/\/xu4WFeUruPhYV5Yce9V169Wi7jxUEpAUBufmaZhYTAABXcemwm36jB+kc6j91StGA1IckO5Iwao3dFel9Z+U1HXa5tiPa8Bz5\/o6x+9ir9PvBYW\/ufv0Xv3VZA4sJAAABiZS0bdys\/dl\/++ejVg3S2fHo88PTGctq6o6MEpFyiXuA4EE6n3cc+ceJi95vNQualYlHUVxR\/YGK13ZEurpDgjH4PS7f3xG+vi0EpHlv8j4CEgDgVtu3rCb4DLAj0KldfdtXLL0PUj+psa3j\/g+ycvM+iBGSvaoO34Ct1tUV4ZszQQtbNykTjmL19i+f8PkyP1Lt2g4hv6dYV3fIPZBh\/71P+fcGAQkAAAHJVR6xLVi1QYmA1Lt+71+cyMkvPBZj0E49IYQUrscbjPS8owqTVi8enOM5tXzpAk3F3cdIV3fIPwTFOKbeQkASkAAAmGLr9SvdHJA\/NvLXb776ek21gAzuSEa4fFx\/pLWNIEKC6+lApPeTSsNy9Cpmz\/+P4okFgyrGo\/B4MqJe3WHH3UcnBmS3\/i+hobaSBQUAwDVu2brJzQFp6FUeLStalQzIoDufez3SII6gdsIIqTzvqNKwHL3r7zr0UUZGxhkVj66OdnWHXXcfnRiQXQQkAICAdKXvGvnrt28PaA\/2vXNW5YiU3Ui5GoCIRDqfd6y74irlwjF4dDUrO+cjiTRVdx+zs30hX8vFbVtsv\/tIQAIAQEBylUecbj7Uq\/QuZJAsUolIpPq8o1DteUe9uU0rfid3K6oaj81NdVGv7ohy72MLAUlAAgBgqo6OnW4OyAGjX2P11j89Z4eAjLFAJSIR1\/2O3qyx51R83jH06OqY0yre+Rgkcav\/msqOY4x7H\/ts9b5x2DdBu\/4vo7yskAUFAICAdI9BI3\/9K9du0OwSkGLDnx54M8pgHaazEo4V4cMnP3nesWL6cRWfd9QfXR2TkXFSdvhUjUeZCOvU3UcnBmSL\/i+juMjPggIAQEC6x2tGPwcZePLFk3aKyM\/d+ejbUSKygpBy9ZTViEdW5fjz\/n\/8nbLxaIepq5F2H2XHMficst13HwlIAAAISCfpMfo1lt0QsNUupGi48pr\/iBALMjDFT1C5Khzro+06yt2Ewcvtu57rVzYeV2\/\/8okxGWOGVJ26KlpXNl709Q1+baNcuVNBQBKQAAAQkNZ40ujXuHTZmrN2C0hRt\/TqdyMsXHsJK9dcz9Ed5ZlYraymbvgamOEdsh8dUTYev3CoV8vweofkeKjKu49VlaVRdx8l1MO+\/j22fE858F9WPn0A2JPBggIA4Arbt6zW7tj9JbcH5BNGv8aqNddqdgzIkcEdkXYiu4gsR8dje7TjqkJ2xPTvkX1\/\/ytlA3JCWdXpadPK31c5HmWoT7TdxwjTkW17lNyJ3yghfzksKgAAbrDjxnVa554utwdkr9GvsSPQqX3pr350xo4BKTsgOfmFx+w+wANxn8obiGfXMeix\/lPKxuPC1k1aXkHBMZXjMdbuo3ytnfSPNwQkAAAOQUAOT2F91ejX+aM\/O3TOrruQspDN8GaeZKiOo8OxL1o4yhHKDbsPRnxv7P3bXygZjxt3PaR5M7POqnxlx2i7j3KFR4TvOT8BSUACAEBAWu8nRr\/G1VvvOGnXgIxxjUA\/AebccAxOWJVd6EjviYd\/+gcl41HuovR4M09f\/tm643bdfYzy\/Wbr+1id+A0Ucs5709rLWFQAAAhI9\/i10a\/RfmunZueAFEs33xZpUdtNjNnyPseeWOEou1\/hx1XDPfTyYSXveywoLjs2vXryKdXjMdruo1Ou7XBDQIb860vrsgYWFQAAx9t6\/Uri0aSA3H3Pfu3Pnu+3fUROmj7nbITgaCPMnLHjKM85Bi+vj+XRfz6u3f2df1IuIGcuWvIfhYX5H6kej6Js0oSIu49R\/qGmhYAkIAEAsNwtWzcRjya68YG\/PG73gNz3\/d9qvpxx53ke0lnhKPESfPYuHve\/+Bvl4nH59beezMz0HlX5vscguVYk0u5jlME5PY54HxKQAAA44xoPwu4T\/270a2ztOvSR3QNS7Hj0eZ6HtMf6ti3d4RjcfVRxaM6YDM+p1pWNmh12HydOHH820u6j0wbnuCogmxfNZGEBAHAFwvET\/2D0a9yx7xHNCQEZ45hdD+GmzD2OA+kOR\/G1X5xVbvJqcGjOoktnnbBDPEbbfZRJtxH+rgKOeV868ButS\/+X1VBbyaICAOCKeyAJx0\/0mfI6f\/evp50SkfK8nNMmRdp4LesfWc8OGhGOqh5dlaE5ufmFQ7WzKk\/ZIR5F6eSyi3YfZXCOXJfitME5BCQAADwDyQ5kitZv2\/WuUwJSnoeMsOgV9USdaWvY+tEmqganqqYSjipOXZV4HF9afrK8vPRDu8Tj4kWzI+4+1i292vHfRwQkAAAOELh1G+H4qV+Y8To7Ap3aXb1vnHNKRMrEzggL30Ei0pRjqn3xhGM8U1XtFo+i7oqrNH++3zY7j2KcP\/98+N9PlGeKuxz3nnV6QM6umczCAgDgeHfs\/hLhGOptM17nmtsfPOWUgBRRnt3qd8rwD8Xub+wa7flGsbhty\/AOcap\/t\/LMo4oTV+c0rRryjy\/8yA4TV4MuXTjnor+nnV\/7bqSpxgNO\/N5x6pSqT\/7iiov8LCwAAI7XuaeLaAz1HTNe58qNn\/\/Qqth75i1N+847mvbc7z72zQFN+6\/\/K\/VfV4KFiDR0ndo7WjTKceLVO+9OSziqOjAneF1HRkbGaTvFo\/xeM7OyLtp9jHJ0tcWR72OH3o9DQAIACEh3+2szXifQuVe7\/6W3TT3GKpHY+66mvfD+xb57RNP+8jepv0aEKwiISBN2G2WYUarPN4Z7rP+UkvG4evuXT4wZM+akXa7rCGpYMPeiv7fruv6fSH+f3Y59TxOQAAAQkA70glmvteUrTx43MyBltzFSPOrJbmQqryGTJKNMZiUiE3u2cdTdxuAx1XQ83xjpnse7vwAi9MQAAC9qSURBVPNPysXj2pvv0uwYj21rmi76u7v0qj\/SMrOyz7jh6CoBCQCAg9x5zz6iMdTABYNmvNbGbV8cMisev\/Hr0eMx6G8OGxqRDNaJPUl1cLRolCsf5JiqfJ2NeK8c+NERJeNx466HPr6rvanOVvEoKqqnnQ0\/alxVv\/isW46uOjkg\/eF\/iSwsAABORzBG9JpZx1jv+8GAKQH5rX+LPyCFHHVN5bnIGBHJdNbQI6rd8RxRFfKsnEzrNPJ9IvGoWjiKrQ8+o2V4PENyBYbd4nH50gUX\/V3OblrpqqOrjg3IkW9kAhIAQECi16zXWh+4d9CMgJShOYkEZDAin\/qVIREpAi6OxsDIbqwWz26jTLhN11CcWFSctPpJPHq9p+0Yj8PXduQXhAzOyZtQonkyfafceMSbgAQAgIBkEmuqx1hvuvUDFXcg0zVcZ5SI7DVz0TwSby1RVBh8PDXunUZfdu45o55ttGM8en1Z5+0aj5Gu7fBPnDQU4e\/dFbvyBCQAAASkU\/3CrNfafc9+bdf\/+4rh01glApMJyKC\/ftuQKz6CR1rbDXo0qX3kucK4dvt0+kbitmvk12hJJHRHQrU93mcaPz3WuOq4TFI16tlGO8Zjpi9Ls2s8yrUdvrHZofFYVHouwt99l2t24B0akCH\/MtS6rIHFBQCAgCQiDXXdlw8eUWUKq5FHWuUoZoyA6k91gIguGnsTDMZk47Jr5H7GtpH\/3RvvLmNQTn7h220d939gxhHVSHc87vv7XxGPBimvmBzX+8lVR7gdGpB9BCQAwC123LiOUIzuu2a91q6H\/sK0eyD\/9vepRaSQ47DJ\/h7ufO714ef6YiyoB0aeEUxkx69tZLdPswM50isxfe8\/\/O\/DZkejPh5VvOMxeFVHZtZY7bLL6m0bj5EG54zJyDgbYffdT0ASkAAA2MYtWzcRigoEpDArHGQHUZ5rTDUiZTfzyV8m\/1zk0s23xRNb\/SPPDgbCnlcM7v71JRpv0y+9IiK5VsHIaJQJqmYNw4nnjkeV41G+XnaOR5GbNy4sHj3nI7wv2lw3RIqABACAgOQIa3ocev3kGbMCItXnIfUDdr45kNpupMSbUdEmO50SqnL1RbzhJv93MrxGYk\/uWpTfX4whQDF3GYOvbfYzjaPFo4p3PIo123Zr3kyv1rqy0dbxOKe2Kp73SLcrpxA7NCBDjj80zqtmgQEAcKztW1YTiopE5COv\/cfbZoaEhF86IjK4G5nKnZESbOkKSdlJlIE9Eqfp\/pqFx2UwMIX8b\/n\/l\/+uUjDaJR4vX9+ueb32j0f5\/cezs+7au08dGpBd+r\/ghtpKFhgAAALSvV4y67Ue++nggNlB8TeH0xeRqV73EQw02bVLdMcvGI2y26diuKngwI+OKBuPcy9fpeXkZts+HkVRUf5o79dBI6+MISAJSAAAOMLqkucgH3n1339nRVikMyLTcd2HPiYlCGVnT54fHDlKemTKrHkf6nf8jNhpdGI8qhiOd3z9B9q0uQu0ggL\/8JUXdo\/H+Q018fyDR4tb45GABACAgHSDfzXrtQ58740BK+JCjp7K9RzpjMhUj7TC+fF4+399QSsoHD+8Y+eEeGxb06R5vZ7R4rHLzfHo5IAM6P+iqytLWGAAAAhIODYgjYpIuS4klTsj4dx4\/Pxd3cOxVVVZavtwTODoaq\/b49HJAdmi\/8suLvKzwAAAEJDu9qbKAbl5zyPvLVpz3flUB7cYEZHimbcIOeLxU63tt2oej0dbvGi2Y+IxjqOr\/W6775GAZIEBACAg3ex3KgdkzrhcbfKUkuGL12UCqIoRma7nImHvePzsms8Nx+PypQscE49ydNXjyRhtaE498UhAAgBAQLrHKTNe58\/\/rv\/dREOh4+s\/0PL9ucMLWdnR8foytdbtX1YyInku0r3xKMNyps6Zp+Xnj3PEpFU9+f4bZfexjXB0WUDmZPtYYAAAHCtw6zYCURH7e3+ScCys2LxTmzF9SsgddAXj87WpdYtSuovQqIiUX5OIdNc9jzfd99T58UVFWtmkCY4YlqM3p7ZqtHgMEI0uCMiRiAz5y2eBAQBwqo6OncSbjQOyem7DRc+SySJ96rQpmm9sdkpXXBgVkXJfJMN13BGPre23npNhORJaTgrH4D\/WjBKPPQQjAQkAAAEJZY6wyg6jrFOi7epIWMp\/37LvGylF5HfeISKJx8SPrM5asHj42UAnPe+o\/0ea7GxfrHjsIxYJSAAACEgY6uG+gbcTiYYb7v2L4WOBsRa6snjP9Pm0lj++JaVA+ZvDRCTxGJ+tDz6jFU6c6Jj7HSOR7zsmrhKQMQNy8zXNLDIAAAQkDPXYPx39dSLhMKuxZfj6gHimRI6fMF6b27I6pecivzlARBKPsS37o5s\/8nq9jjyyGr6zH2PiagWh6M6A7NO\/GVqXNbDIAAAQkDBUovGQ6csajsN4j9wVl07USqfOTCki\/\/I3H0cfEUk8hh9ZrZxV\/1F2dpYjj6zqn3uMcWUH13UQkAQkAICAhDn2PfFsQvEg9z3K\/Y+JLoCHh+tk56Y0XOfJX6Z\/uI5EJNNZ4\/fwT\/+gTDxe+8UHjns8njNOnLKa4HOPLQQiAUlAAgAISJjioWf73k8kIFq333lef31HIuTYa6oTWsVfv53eiPzWvxGGdrrnUXYd5za3Hs7IyDjd3FTn2HCM87nHduKQgCQgAQCucPuuDgJOAQdffPNwIhFRObvhfCqL9nRMaE33kdbnfkccjuahlw8rEY833P24lpUz7tj48XnHnLzrGOd9j8QjATkckN36N0ZDbSWLDACAI3Xu6SLgVBig89PBgURCItb1HfH6eEJrVsoRma6rPgjI6L72i7Pavr\/\/lRK7jrMvW3Esw+M5HX7\/qFPJP9TEiMcuopCADAZkFwEJACAgoeIAHXn+sbBoQtqGgsg1H4vbtqQcOd\/4tab97e+TD0iJUGIx8vOOXc\/1W\/+sY8d9Jz3ezDOTJhWdcMOuY\/D7IyNjTLR47CEICUgCEgDgKjtuXEdA2nCAzobdB7WqytK0LpInlJRqi9Zcdy4dwSPPMiYakkxijbzreP+Lv7E8HL9wqFcrqaw5JhNW3fCso35oTlaWl3gkIAlIAADYgVTL\/ud\/\/E5C9z8uXqKl+\/igLJblrkiJyFSu+dB75q34j7bKQB6i8VP7\/\/F3lk9ZleOqTevbT8laWAY2uWXXMfj9MC43m3gkIBMKyHb9G6W4yM8iAwBAQMIQD\/9\/b\/86kbjIKygc3jU0YtEsETlp+pzz6YrI4DOSEpN\/czj2wB3ZtZT\/O7dPWFXluGr2uLxTRUXjzxrxXrPxxFXikYCMGpAtBCQAgICEGb72+okjcQfGhbCTtYmROy\/TZ9VopdNmnUtnROrJUVUJRdl1lME5kUJSprsSjubb+uAz2sTJ5X+Q46puGZKTQDz+FQFIQBKQAAACkoC03QCdoqJ8wxfRU6dN0Uqnzjy77\/u\/NSWgJColGuX5SYlKiUj5f2Uwj5OfcZRrOVQIR3nOcWrdorc9noxzcmWFm46r6pVPmUg8EpAEJAAA0Wy9fiUBabH7nupNKDqWX7dj+Hk0MxbTEpG+7Jzzdz73uiWBJUdfnRiQj\/WfGh6OY\/UzjsHnHBf+541vZ2RkDFWUlwy1rWlyZTiKaVWTosXjfyf8CMh4ArJC\/8bxejJYaAAAHOeWrZu0Pfd3E3IW6v7hbz5IJD7mNDZp8xtqTFtU19XPsDQinXYdx1f+7l8tj8ZgOH726hv+IPc5TpjgP+PG5xyJRwLSiIgMeQOx0AAAOHEHkoiz+PnHn586mkiEFJVN0ZYvXWDq4lqehcvMyiYikzymqsrzjUGrt3\/5RHZu3kkJR7PfSyqqKC+OFo8vEXwEJAEJAEAYIs7y5x\/PJxIksiax4vk0iUjf2Gxty75vEIZxHlN98If\/psQx1aC1N9+l5eTlD00snnCWcPzY+IK8aPHYS+wRkAQkAAAEpFIeevblhKJEdgBz88ZZttiWiJQ1EREZ+5jqvr\/\/lTLRKEdVm6+9SfP6ss4Vl5YQjrppw7k5Y6PF45OEHgGZbEAO6t9MbasWstAAABCQSJtH\/vHwHxKJkx2PPq+VTpls6cJbnpXL9GURkYofU5WpqhKOmVljz5dMnnyOcPxU25rLNa\/XQzwSkIYEZJ\/+DdW6rIGFBgDAUXbcuI6Qs9Dj\/3L2ZCKhsnrn3drMWVMtX4B\/HJE+bcPugxxTVeyYqtzjWHfFVcNr1+mzZmpuH44T6b0bIx4fIPAISAISAIAYbt35eULOIvceejrhYFnctsXUCazxRKT8nty44yjXcKgSjcHnGydVzz7p8XrPzphRpbn5Oo5oZBfW48mIFI7nL9hE3BGQBCQAAASkws8\/9r2faLhMv\/QKTaWjiBIp4yeM1xrXXOeaeHzo5cPK7DjKMdXL13\/+TE5e\/umcnOzz8oyqFQOW7CD4\/G4EZy9oJewISEMCsnnRTBYbAADH3QNJzFnj0f\/x3juJxotVE1hHG0YiETm3ZbV24McfOno4zt6\/\/YUS4bhx10Na1eyG0\/J+qKos1Xi+MTb5GkWJx3+5oJyoIyDTGZBd+jdZQ20liw0AAAGJdD3\/+FEiASNxJusRVSdaFozP10qnznRcRMpxVXnOUYVnGy9dsU7zZmZq+fnjho8ys9s4+vuyqCg\/Wjz2EHMEJAEJAECC\/mTH9cScTZ5\/\/GLPy1rFzLlKL9inTpuilVTVaPu+\/1vH7DpaOVn14yOq7dq4\/ALN6\/VqM6ZPYShOAs\/oZmf7osVjgJAjIAlIAACScPuuDoLOAg888w\/HE40ZuTZjet08WxwXzMwaO3xnpZ3j0apdR4nGK7d0aBMmTR7ebZSvZ3NTHVGYnucd5Yq+NiKOgDQtIGfXTGaxAQBwlM49XQSdBQ6++ObhRINGrvC4\/Kp1tlrAX7PrQduF46P\/fNz0Zx1vuPtxbWHrJm3c+CLN6\/NpU6sriMYkj6zGeN6x\/4J6Ao6ANDogW\/RvvOIiP4sNAICj3LH7SwSdBb7Wf+JIMld4fHbZElsdIczJzdam1i2yzZHWAz86YsqEVdlllGs35L5Gry\/rfG5enjZzdjXRmOL7Ld+fGy0eey\/wE28EJAEJAECKOjp2EnQWeOJ\/nj+TzBUeV\/\/xJtvtCMlze7KOkh1UlQfsGHmv4x1f\/8Hw5FTZZSycVDEkX48pleVnZRAO9zWmZ8c7yv2OootoIyAJSAAACEhXDdARWbl52pq1S227O1RSVqr5snOUC0mZspruI6vBHUYJxqIp084PryPLyk7NnTudKzfMO7Iqzzu2EGwEpKUBWeDPYbEBAHCMHTeuIyAtcN9TvUmFjqpXeCRC4qmssupCSOZqSzffZvnR1sf6T6UcjxKLsrvYfO1NWvmseVpmVvbwsdTKGbO0eQvnE4zWTFnt58gqAWlVQPrD35AsOAAATroDkoA034HvvTGQaOhIaGXljHPU4n\/6rJrhaa1yd+SG3QdNn9oqw3ISed5R7mGUYTcSivLs4uSaOedkbShDb0rLy4djsaXlUo6kmmBObVW0cOTIKgGpREQSkAAAxwYkU1jN93DfwNvJ3AFZNWeBI48gyvNrcgxRrqzIvBBj0+ouPbr0+j95b8ejzw\/\/uY0Iy\/Bjq7KLKHEYDERRv3St7Cie908oGV4Djiso1EomlWiz5szU5NlF2VmU3z9BZx6J86KifI6sEpAEJAAAVh1hJSDNd+i1999L5g7IGQsuc8WxRAlK2WGSUCidMlkbl18QshabUDp5qGxazclJU2uOl1ZN\/zCo4YqVhxtb1w+Iy65a\/\/5nr1o\/OH\/JyqPyf6s3cdKkY0L\/a0q4lpRN0iYWTxiOWXn9YCTK74l4s578fcQYlMOUVQKSgAQAgHsgHTqBNYkdMzvdAWn0jqVEXSQSfZFE+79n99Axu44BooyAVC0g+\/Vv1NZlDSw4AACOsH3LagLSZHsPPplUQMrAmc+uvIqgALuOoYNy6gkyAlLFgOwjIAEAPAOJdHjklXeSCkg73gEJpHKUOd+fy6AcApKABABAtYAk6szz4Ld+mPTQFwnI1deuJS7g+CPKo0xYZdeRgCQgAQAgIF0yffWlt5IOSFmD8MwenKy5qS7WvY7sOhKQtgrIHv2bt3FeNYsOAAABCVOG5+gDksiAC4fkaCObOew6EpC2Csgu\/Zu4obaSRQcAwDFDdAg7c9z3VG\/S8bjv+7\/VfGNzzhMbcNlxVSasEpAEJAAAKuno2EncmeSr33416YD8Ys\/LWmXtgjNEB5xC7vqMMV2Vex0JSAISAAAC0t0OvPDzlAKybFrNScIDdif3b44yXXXgghYii4C0e0AG9G\/s8rJCFh0AAEcI3LqNuFP8+g6xeufd2pzGJgIEtr6WY5TnHAcZkkNAOikgW\/Rv8OIiP4sOAABDdGDaAB0JyEubLiNEYMsBOVWVpbHCURsZWMlxVQKSgAQAgICEuPfQ0ykF5NLNtxGQcGI4Ml2VgCQgAQDgGUiEe+Dp76UUkNMvvWL4jjzCBA4JR55zJCAdH5D1+jd9TraPRQcAwBE693QReCbY3\/uTlANSho8QKHBAOLYTUHDHHzLsG4BFBwCAHUjE6+GX3kopIMtnzz9GQELVqaqjDMcJDsghHEFAAgBAQCIeh147QkDCcfc4xhmOXQzIAQFJQAIACEiYNIFVFFdOf5eAhNU2rF+izamt0rKzfXEdVSUcQUDqbFp7GQsPAAABiVHte+LZlAOypHL67wlIWHmHYxzPN\/KMIwjIsIDs03+DtC5rYOEBALD9FR637+og8hSfwComV9WcICBh9m6jHFPN9+fGE459hCMISAISAOCCgGQKq\/oTWEVlzWztqtXLCBuYMhRHdhs9nox4wrGH6zhAQBKQAAACEgpNYBX18xu1+Qu4BxLGXcExY\/qUeJ5tDA7G6b6gghACAZlAQC6\/fA6LDwAAAQnDJ7CKlhWtWn0DAYn0RuP8hpp4j6iKfo6pgoBMLCC79N9EDbWVLD4AAAQkDJ\/AKgHavj2gTS6vIHyQ8jCcBKMxuNtYT\/SAgCQgAQAut+PGdQSkDSawPvLKO9rue\/Z\/PAV+AxGExJ9plOOpWVmZQ3FGo+hltxEEJAEJAAA7kCa776netASk\/FrFJZO0lSuXEEWI62hq2aQJWsaYMacTiEY5ohrg7kYQkAQkAABRA5LIU38CazAgV625VquaNu0MkYTwYJTrNmRyapxDcCJFIwNxQEAaEJBt+m+44iI\/iw8AAAGJmA6++GbaAjJ4jHVdG7uQbj+SGtxhTCIYiUYQkCYGZAsBCQAgIJEIib9UA1IiNPjryXUeNTOmDxFS7opF2V1MYPBNpEE4w880cjwVBCQBCQBASog8tSewCjkGG\/z1Ap17tUyf7\/yVyxcRWA6xYf2S4VCUY6hzaqu0oqL8ZHcWw3cZ5fGrFmIFBCQBCQAAO5A2cO+hp9MekMFnIQvGjz8h4UGAqf98osRhcCdRAlEmokokprCjGC0Yu0ceuWKXEQSkIgFZEf7NyuIDAEBAwsgJrOLBb\/3wol+7oqpamzq1\/IzTduFUJNEXTTAG9TyejHSGYawjqewwgoC0QUQSkAAAxwjcuo3QU3wCq5AQDf+1ZaBOUXHpuepp5UrutukjKzywDI4rpxnQxWIbg29AQBKQAABYpqNjJ6FnoAMv\/NywgNQ\/Dzm9Zqolz+rJFFCTdtzcQI6g9o2EYjs7iyAgCUgAAAhIJrAmZe\/BJ6O+hkRkcckkbcbMGi2dz0S2rmwcDsXgEU0iMSV9I4I7icHdxBaeVwQB6fyAHNB\/ILStWsgCBABgW3fes4\/QM9DjbwylJSBHex05zirPRBYWFZ29qrUpqZ3F5qa6T46bKhBaqunWhV8kwRgMqicQAAIyGJB9+g+61mUNLEAAAFzhgYvIrmE64lEiNN7XbFnRqmVm+s4vWlgX1\/2CsruY5kmgg7ro6tEFVntYYLHrBhCQBCQAAAQk0j2BVY7BJvK67dsDWp4\/\/3xpafHwMVT9LqMcSZXnFlM8jqp\/Vi\/AjhsAApKABAAQkEiRXL1hRUAGj7TKbqSsVUpKCrXSC1LYTQzuIBKJAAjIJAKyV\/\/h2rxoJgsQAAABCcOu8JBfJ9F4zM7J0YpLy5K5LqKHWARAQKY3ILv0H7YNtZUsQAAABCQu8vBLb1kSkHn+\/EQvo2\/nbkEABCQBCQBATLds3UTo2eAKDzkKm8jrer2ZsaLx\/Qu+yR2DAAhIAhIAAAJSIemIRyHDeOJ9zbaNmyNF49GRayg4lgqAgLQ6IKsrS1iEAAAISBhyhYfY98Szcb+u3AUZFo8\/ZqEKgIC0NiBb9B\/MxUV+FiEAAAIShlzhIeJ9zR2Bzki7jxxVBUBAEpAAABCQbrjCI5GArJ\/feNF9jSxSARCQBCQAAGlx687PE3uKX+GRyB2QPl9WeEC2s0gFQEAqFpAF\/hwWIQAAW+ro2EnsGeTgi2+aGpARhufIFR1+FqkACEg1IjLkQ5pFCACAgITeodeOpCUgD7zw87heb8bsueEB2cMCFQABSUACAEBAuugKDzkKO9pr7b5nf6ThOW0sUAEQkAQkAAAEpIsmsMownmSOr7I4BUBAKhyQm69pZiECACAgMeyr3341bQEpMcrxVQAEpP0Dsl\/\/Qd26rIGFCADAdu7Y\/SWCT+EBOmLfE88mM32V46sACEjFArKPgAQA2F3nni6CT+EBOvHcAdm+PcDxVQAEJAEJAAAB6fYBOo+\/MTTqa7WsaA0PyF4WpgAISAISAAAC0gbkyGm6AjKeOyArqqrDAzLAwhQAAaleQPboP6wbaitZiAAACEgMT001MyAjPP9Yz8IUAAGpXkB2EZAAAAIS4Q688HPT7oDcEei86P5HFqUACEgCEgAAAtImZNfQrID83JZt4QHZx6IUAAFJQAIAYIg\/+8pXiT5FB+jEcwdkhAE63SxKARCQagZku\/4Du7yskIUIAMB2CD51B+jEE5AzZs9lgA4AAtImAdmi\/8AuLvKzEAEAEJAM0ElrQCYxgbWFRSkAApKABACAgHTZAJ14AjJ8gM4FFSxKARCQBCQAAGl3y9ZNRJ\/CA3TiucKDCawACEj7BGS9\/gPb68lgMQIAICAZoJM2D7\/0VszXat8eCA\/IARakAAhItSMy5IObxQgAgIBkgI5ZV3hECEiu8ABAQBKQAAAQkG4coPPA098jIAEQkAQkAAAEJAN0Ric7mrFer23j5vCA7GVBCoCAVDsgB\/Uf3JvWXsaCBABgG4FbtxF+ig7QiWcCa8uK1vCA7GJBCoCAVDsg+\/Qf3K3LGliQAABso6NjJ+Gn6ACdeCawEpAACEgCEgAAApIBOtrBF98kIAEQkAQkAAAEJAN0Uh+gQ0ACICAdEJDLL5\/DggQAQEAyQCclj\/3saFyv2di0hIAEQEDaLCC79B\/cDbWVLEgAALZx+64O4k\/BATr3PdUb12tWVFWHB2QLC1IABCQBCQCAITr3dBF\/ig3QiWd4DgEJgIAkIAEAICBtSnYMzd59JCABEJAOCMjZNZNZkAAACEiX+eq3XzV995GABEBA2jMg2\/Qf3MVFfhYkAAAC0mXkyg2zdx8JSAAEpD0DsoWABAAQkO526LUjpk1e1fP5ssIDsoIFKQACkoAEAMAQe+7vJgAVGaAj90gm+rph8aixGAVAQBKQAAAYhvhTY4DO428MJfXaBCQAAtJ+AekP\/\/BmQQIAICAZoJOIAy\/8nIAEQEC6KCIJSAAAAelSD7\/0VsoBee+hpxN+3UDnXgISAAFJQAIAQEDaiQy\/SSUeZQBPMq\/bvj0QHpB9LEYBEJAEJAAAhrjp+ivPE4Cp2XvwyZR3H\/f3\/oSABEBAuiwgB\/Qf4K3LGliYAACUd8vWTUSgAgN0Er37MehzW7YRkAAISJsGZB8BCQAgIN1Hdg9TDUjZxUzmtVtWtIYHZDeLUQAEJAEJAAABqahHXnnHkucfowRkF4tRAAQkAQkAAAGpKLm\/MZWAlCtAkn3t+vmNBCQAAtKmAdmr\/wBvnFfNwgQAQEA6nFy9kerx1X1PPJv061dUVYcHZAuLUQAEpD0Cskv\/Ad5QW8nCBACgvMCt2wjBFDzw9PdSike5\/iOV1y8umURAAiAgCUgAAMzR0bGTEEzBgRd+nlJAHnzxzZReP\/wasQv8LEYBEJAEJAAABKQDB+ik8vxjoHPvRQHJQhQAAWmfgAzoP8CrK0tYmAAACEiHs\/L5x\/btAe6ABEBA2jggW\/Qf4sVFfhYmAAAC0sEk\/lINyFRef9Waa8MDspeFKAACkoAEAMAwt+\/qIAaTJMdPU4lHOf6ayus3Ni3hCg8ABCQBCQCAeTr3dBGDSZIBOKkEpAzgSeX1p1RMPRMWkG0sRAEQkPYJyAr9h7jXk8HCBABAQDrYodeOpBSQcgVImiew1rMQBUBA2isiQz7IWZgAAAhIZ9p78MmU4vHxN4ZSev0dgU4msAIgIAlIAAAISDu476nelAJyf+9PUnr9to2bmcAKgIB0QEAO6D\/MW5c1sDgBABCQDiQBmEpAyg5mKq9fP7+RAToACEgHBGQfAQkAsJM993cThEl4+KW3LJu+Kvz5BRoDdAAQkPYPyB79h3lDbSWLEwCA0ojB5MgzjFZNXw107o00QMfPIhQAAWm\/gOzSf5hPqyw+zOIEAEBAOsu9h562dPpqhOcf+1mAAiAg7RmQbfoP9PH5uR+yOAEAEJDOIgGYSkBKgKb5+cduFqAACEh7BmS9\/gM9I2PMGRYnAAAC0lnkCGqy8fjYz46m\/Po+XxbPPwIgIJ16lUfbqoUsUAAASrrpuhXnCMLEyRAcq55\/5P5HAASkwyexNi+aySIFAKCkre1tJwnCxFl5fLWxaUl4QPay+ARAQDpokE55WSGLFACAkm6+aQM7kAna98Szlu0+Rrm+o53FJwAC0t4B2aL\/YPd6MlikAACUdMvWTURhgr767VeTike59mPvwSfTfnz1ggoWnwAISPtH5KD+w3355XNYqAAACEgHOPjim0kF5P7en6T82hGOr3J9BwAC0iEB2cMxVgAAAek8MkU1mYBMdfeR46sACEgX3QcpNq29jMUKAEApgVu3EYUJkAhMJh5l1zLV1\/7clm2Rjq\/6WXgCICCdE5ED+g\/56soSFisAAKV0dOwkDBNw31O9lkxeFfXzG5m+CoCAdHhABtiFBAAQkM4hzzEmGo8Pv\/RWyq8b6NwbafexjfUWAALSWQHpDx+mw7OQAAAC0r4eeeWdhANSdi1Tfd2WFa3h8TjAWgsAAemCOyGZyAoAICDt+\/yjXMWRSDweeu1IWl47wvCcLtZZAAhIlzwLKfdCbr6mmYULAMByt+\/qIA7jJDGY6O7jg9\/6Ycqv27ZxM3c\/AiAgXRaQLeEf\/BxlBQCooHNPF3EYBwnBRONRrvswaPexh\/UVAALSZfdCisZ51SxeAAAEpA0kenRVfPXbr6b8uu3bA5F2H1tYWwEgIN0xUGeA5yEBAASk83cfJTjlmclUX7uiqjo8HvtYVwEgIN0TkfXhASnPQ7atWsgiBgBAQDro2Ue57oPdRwAgINMRke1EJACAgLSHew89bdnuY3HJJHYfARCQGI7I7kgRuWntZSxmAACm2nN\/N6EYgzzHaMXuY5TJq+w+AiAgGarzqQJ\/Dtd7AABMRSSm\/\/iq7FoaMHmV3UcABCQR+Z\/6OM4KACAg1STHUBONx4Mvvpny67asaGX3EQABiaiTWfuJSAAAAame+57qNf346u579ms+X1Z4PPaybgJAQIKIBAAQkA4LyAee\/l5Kr1k\/vzHS7mMFayYABCSISACApW66bsU5QjG9AZnK849Rru3oYq0EgIBEtIjsifCDQ2teNJOFDgAg7bZuuXqIUIxu3xPPJhSPj7zyTkpHVyMMzhmQ9QHrJAAEJBKazkpEAgAM2YG84eozhGJsEoXxBqTsWKZ5cE4bayMABCSSjsjGedUseAAABKTJu5CPvzE0ajw++K0fJv0aOwKdkeKRwTkACEgkFJFdkSKyurKERQ8AIC1u\/i8bzhOJo5PnGuV6jmBIPvazo8P\/Wzz80lsp7TxGObo6yOAcAAQkkonIdiISAGCUW7ZuIhAt1ti0JNLuY4B1EAACEkQkAEApgVu3EXEW+tyWbRxdBQAC0pCIbBs5zhLyQ6a8rFDbfE0ziyAAQFI6OnYSchYJdO7VfL6sSEdXmboKgIBEWiKyPlJEFvhziEgAAAFpM8Ulk5i6CgAEJBEJACAgkdRzj92sdQAQkCAiAQAEJD7RtnFzpHjsZ40DgIDki2BkRFbID5vwH0D5\/pyzRCQAIF537P4SUWeiKPc9cmUHABCQpkSkP1JEejwZ59tWLWRhBAAYVeeeLsLOJHLfY4ShOTz3CAAEJBEJACAgERqPUYbmcN8jABCQRCQAgIDEpyqqqiPFYw\/rGAAgIK2MyD4iEgBAQKqlfn5jxKE53PcIAASkCiHZE\/5DyuvJ0JZfPoeFEgCAgFQjHgeIRwAgIJUxZswlfxXhh5XWvGgmiyUAQAgizzir1lwbbeJqPesVACAgiUgAAAGJWHc9Eo8AQEDa6zgrEQkAICAtiUeu6wAAAtIWERmI9ENsds1kFk4AAILPvHhsZ10CAASkXSKyPdIPs+rKEhZPAEBAgngEAAISRCQAYBTXrTxH+Bk6bZV4BAAC0nkRWVzk1zZf08xCCgBc5qYbrj5D\/KVubsOlQ8QjABCQTo3I+pEpcCE\/5Ar8OUQkABCQSMDue\/ZrVdUzBolHACAgXRuRm9ZexqIKANxi81qOsKYQj3n+\/CNRrupg2ioAEJCOjMiB8B98Xk+G1rZqIYsqAHCBGzevIQaTsP223ccyM33vc88jABCQbotI\/wX9kSKydVkDiysAICAR5trrbnzvkksuORYhHgeIRwAgIF0bkaJ50UwWWADgYH+y80aiMAGLPtsyEOV5R\/k56mddAQAEpJsisifSD8WG2koWWQDgUB0dOwnDOJ93LC6Z9GaUeOwlHgGAgHRrSEaMyKopE4+x0AIAAtKtzzt6vd73osRjN+sHACAguSsywg\/J3JysQa75AAAC0k2WXLn6nSjhOMg1HQBAQCI0Ii+65sOX6TnGhFYAICDdcGS1bErl21HikWE5AEBAIt67IseMuWRo+eVzWHgBAAHpSO3bA1pGRsZJnncEAAISiUdkRbQJrQzXAQAC0mm7jgsvu+JUlHAUAdYGAEBAIr4Jrb2RfpiWlxVqPBcJAASkE3Ydc8flDXFkFQAISKQvJLsj\/WAt8OdoPBcJAASkXXcdG5uWaDF2HXs4sgoABCTSPFzH68nQmhfNZDEGAASkrXYd\/fkFWowpq2387AcAAhLpGa4zEOkHbnVlCUdaAcBGOvd0uS4cA517tRmz58badWRQDgAQkDDgucg+jrQCAAFpJy0rWrXMTN85dh0BgICENSHZFemHsBxpbZxXzeIMAAhIZY6r5vnzz7HrCAAEJKyPyJZIz0WK4iI\/R1oBgIC09LjqlIqpZ2KEozyS0cLPcwAgIKHIkVbZjVx++RwWagBAQKp0p6M2coqGXUcAICCh2pHW4J2Rm9ZexoINAAhIQ8NRnnPMyPDEikf5B88Kfm4DAAEJRaa0ZmSM+SXPRgKA+vbc3+2YeGzbuFnzeDxDHFcFAAISNjzSmpPt+2a0H+IyqbV1WQOLNwCwmFPCcWx2zrEY4SjP6Qf4+QwABCQUN62i+KaxWZlR\/zW4YnKRtu4\/c+UHABCQhoQjzzkCAAEJO6qcUtQX6wd8dWUJCzkAMNt1q2wbjjm5406OEo49POcIAAQkbGzKpMK52WMz34z2wz4n26c1L5rJgg4ATHLj5jW2G45DOAIAAQn3PR\/ZPmbMJe\/yfCQAWOyGtWftEo5er\/fMKOHIZFUAICDh4Igsv6A\/1mKguMhPSAKAgbbedP1JVcMx0LlXq5\/fqI0SjcEdx3p+tgIAAQl3hGTFyA9\/QhIACEjtc1u2aRVV1fGGIzuOAEBAwqUh2TJy\/ChmSPKMJACkT0fHTmWOqa5ac63mzy8gHAGAgOSLgIRDciDW4sHrydAaaiu1TWsvYwEIACm4ZesmS8NxR6Bz+Jiqz5c1WjQOch0HABCQQMxBO6OFpCgvK+R4KwDYKCBlt1Gu4SgumRTPbuPAyM8DwhEACEgg7pDsH22RIVeANM6r1jZf08yiEAAUDMgEdhuDE1Vb+DkIAAQkkMrR1p44Fh1adWUJu5IAoEBAJrjbKMdUu3m+EQAISCCdIekfeQ5mIJ5dSZ6VBADzA1ImqcZ5BYc2csqEY6oAAAIShsdk2wW98SxQ5FlJJrgCgHEBKUdUG5uWaHn+\/HNx7jZyfyMAgICEJSFZ4fVkPJDl8x4fbdEiE1xn10zW2lYtZPEIgIBMMSADnXuHr9+YWFx6lt1GAAABCdvJyfZd58\/L\/kU8C5kCf87w4B2OuAJwq8Ct25J+rnHG7LnxHlENPtvIbiMAgICEuruS2WMzuzMzPUcTOeLKFFcAbtLRsTPucEwwGrWRRwza+JkEACAgYbsJrplez3fiWfDIEVeZ4rr88jksLgG4PiCDw3C83sxEjqgGOKIKACAg4ZQJru0ZGWN+mUhM8rwkAKe6fVdHOqJxgOs3AAAEJBx\/xHVkwTMQzwJJrgRh+A4Ap+nc0xUSjZmZvnM81wgAICCBUY64joyTHyQmAbiFHNWf27BAy\/T5zicQjT081wgAICCBT2My7rsliUkAdiJDwmRYmBzNlyP6RCMAgIAE0vy8ZDIxyQAeAKpFo0yaTmB6KtEIACAgATNjkmmuAKwid9vKHbfFRX6iEQBAQAIKDN+REfV9CSzMPrlnUhZ2LHABpJsco5cTEAX+HKIRAEBAAk7ZmRSywGuoreS5SQBmP89INAIACEjAzjEZPOoqC0FZELIwBhBrlzGJo6n6expb+LwGABCQgLrTXOO+GoTdSQBp3GUU\/Rd0cU8jAICABOwXk\/Uj\/\/o\/kOjuJM9OAu7SuqwhmWcZg3pHTkJU8NkLACAgAWcN4elNdHEo14QEJ7ty3BVwzrFUOXWQxLFU+UemD0qK8v91wvhx2\/h8BQAQkIA7npsMHnUdSHTxKDsUwXsnCUrAXs8xyumCJI6lar5MT\/\/IP0JxNBUAQEAC7E4mtztJUALqHkmVHcZkg9HjGfO+J2PM4yP\/2OTnsxIAQEACiBaULSPPTvYnE5TBI688QwmYN\/RG\/gEn2SOp4pJLPnPc48l4kWcZAQAEJIB0HHftTua4q34ojyxuZVeEBT+Q+nHU4JTUJIfeaJd85jMfjbnkkhc4lgoAAAEJGH3ctT3Z5yfDj73KIpirQ4D4dxeTOY6q0zdyxUYLn2cAABCQgNVB2Z\/swlYWxbI4lkWyLJY5+gq3xqL+2UU5Dp5CLA6OPNfMDiMAAAQkYIsjr30pLH5DopKdSjiN\/CNJGmNRGzkR0EMwAgBAQAJOGMrTNbIbMpDiInk4KuXZL7mSQBbgTH6FHSaiyj+CyLHtNBxDDT+OypRUAAAISMDxx17TsksZbbeSYT2warhN8HnFNO0qBvWzuwgAAAEJ4NOorB95ljJtUakPS9n5Ce5Y8nwl0vGcovxDRXCwTRpDMRiLwWcXGXYDAAABCcDKqNRPgg3uWhKXiBWJspuY7P2KCewsEosAABCQAAw6\/hp8prLfgEX98I5ScOcyOBmWwHReIAaPmwafTUz2TsU4J6IGn1ls5xgqAAAEJADrB\/W0jyzQ+9IxrCeewJSdKQkQfWQyLVaN6abBCaf6HcQ0HzWNFYrdwV1FBtwAAEBAArBXWOp3LPsMDoiIx2SDR2WDgoHDFNn4p5gGyXHj8DA06HjpaEdP9TuKhCIAAAQkAAeHpT9s19L0uIw19CdIrivRh6d+p1NP1V1P+X2F\/171O4NB8ufU\/7lN2ClMNBKDu4kVfP8AAEBAAkCsncvgEJ8+BaImpfsz083OXw9dIHbr7lNkJxEAAAISAAwJzJaRnanwyBy0eVg5QfDvoidsB7GF9y8AACAgAah8TFZ\/VLZrJGqCgdNP7CW0W6iPQv3zh+wcAgAAAhKA66KzXhdE+h3Orgg7nXoDiobfQJTfb3fYn6sr7M\/NNRcAAICABAAFdkPTiV0\/AABAQAIAAAAACEgAAAAAAAhIAAAAAAABCQAAAAAgIAEAAAAABCQAAAAAgIAEAAAAABCQAAAAAAACEgAAAAAAAhIAAAAAQEACAAAAAAhIAAAAAAABCQAAAABQ3\/8FL4K38jaJ0Y4AAAAASUVORK5CYII=","width":145}
%---
%[text:image:7330]
%   data: {"align":"baseline","height":136,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZEAAAEECAYAAADpigmnAAAUoElEQVR42u3dT4hd53nHce29EcJxGFQZydDB1Z9USIwzHiR55LE0sWxF46qxMQ5EeJlC8aIbt12YQEFd1RQKWbTGG5dSvDJdeBcKKtSbooUXKgRqBC5eBNvFEFuRnen9Kfe1J2ONNPfec+597zmfwJfYsjSjOefc9\/s+f97n7Nnc3NwDAMA4uAgAABIBAJAIAIBEAAAkAgAAiQAASAQAQCIAABIB6nqY9+xZ3cZr4eLTT\/78hefW3wzHjh65XjhzavnGhfOrH2xlcXHx08Gf2RyFffv2fbH965xfO\/3Lrd+rfP9Q\/l4DNrb9ffe6jyARoHkpZLF9LQvw+lNn3l1aOvH+3Rb85zfWP3nx8tOfvfzis5vh9b+6\/C3+7e8ubv77P6zvyH+\/ubT52b\/+wUjkz9zra4a7\/V3K3\/PHP7rwef7udxNTftaV5aVr+dkPHXrk6uC\/XSnXxTMCEkGfBXFwuBheGUQEr0cOiQwGC+ZHZSF9Zn31s5+88MztP3954+uF91\/+duPrhfm\/\/vGJkRf8eWGrmPIzl58\/1yLiybUp1ykyHV67a4m6Br\/2yvDaHvesgUQwz6I4nsUsO+hLF9bezkJXooeFhYXb2YEXQfzTzy5\/vWh2VQxtEZlulc1f\/tmfbEa+gyjm862SiaiH0cwGwYBEUJssNhJRZDdcooksYlnM\/uYv\/vTO4tb16KH2qCaiLmm0rYJJymwYwVyRJgOJoE1Z7C2RxXZZlBpESTdZvOcnikmdqKTKnv3B2V8XueQeZ2MwjFwO+gyARDCyMLKInF87\/V5JQ5XIoqSfLMTdlUs2BLnXuedJP6bYn6iFWEAi2Ckl9Ury5tuFkcVEGgpJi5WoJc9GiViyyTh8+PCrUmEkgp61z2ZHmYJrFoOV5aVbSWeIMDBOxJJi\/qULa7fyLOWZ2hKtOPtCIuiiNPKBL1HGOGcjgLvxv\/985E60kmfruYvnvsyzdvLk8Q8H0cpbkYrPIolgjtJTSTEk1ZAP8qmVx+6kpvIBzwfdgodpS+UukYo2YxJBZeLYWFleeid56v3793+Z9JRIAzVKJemvpFBTrE8dbtheLPVFIpjBqe8rJdrITi9FT0VwzFNNJXW4UqhPlDIs0uv8IhG0JY58yI4dPXIzHzrRBroUpZQifVqKU0sZ8Ia0F4mgQXE89NB3f1PEobaBLlPSXknNHjr0yMeEQiIY8bDf0tKJn26NOPKhsrig70JJhCLlRSK4R3G81DhEHMDOQik1FEV5EnETBjuqhOrpVEkrbgqNahzA7mooOY\/y4IPfuZXORKfmSaRv8si7NG6kiJidla4qYPyRLDmLknTXgQMP\/2qY7hKdkEg3o44ctErUkR2UdBXQLPlMpWV4S3SidkIi3Rg7MjxUdSefaz4V0H50UtqFh7UTY1dIZD4L5XmAE2bnIKBaBzD92knqjKk3JtWVrkdrE4nMRb0jD2weXCkroJ5UV9LIGQ00fFWwugmJ1EV2OXlAV08\/\/lUeWB9coD6STk7dJLVJMiER8gBAJiQyvzWPpK3IA+iGTNRMSGSaL3m6UWoePohAN2SSDWFmdenmIpHWznmkVTdtg+m2UjAHulmAP3Dg4a8GUcn7hj6SSGMkZ5oDTOk9Jw+g+63B2SgOX\/H7hnoJiUyUukp4m9ZAhwSB\/h1afPnFZzdTLzl39tRL1kQSGWkc+\/m1028ldZXDSj5QQL+nB6cGeuzoketGqZDIrrqusvPIOHanzAGUFFcGPWZtyJBHayWJ7Bh9ZEyJl0AB2KmLa0tUspdEUARyPLWP5D9FHwDuF5WkySZRSZ\/bgcljyPD9A5tqHwBGrZUkc5EMBon0NH01CEl\/kdDUS6EAjNvBNRzs+D99K7r3Pn01EMjNFM+d+wAwKVvSW8dJpAdnP3JwMJ0WHn4ATZ52T2q8LzO4ejtxNzfZzCsAbZDUeOokOelOIh0soOfmqn8AaFskqZPkPe8kUnFRfDiS5GqGImZY2oXzqx8Mc5KbhcFN\/Ci\/\/sffO\/Z\/q2ce\/+3f\/\/XlTRIB0LQ00t2ZeVs5JhDWnljZ3LoWZW3KWpS16tKFtbcHv\/ZK1jASmXIxPCHigA9zUwY34s5AxNy4HAAK2894lF9P+qrc4IF47pCiutfXAhinIyvSyBqStejc2VN3\/jlrTNp+s+Zs36zm3\/Pr+e\/5fVm70hmaP59XSwyPGhwkkRYijqfPPfGzHARMKioXPjdh0oW\/7Bwu\/\/D8nYcgD4ABiwDuVzjPRrSsGfn3SQ8nZy3L18nXy6y+dI0Oa7d7SWTCd3ckn1huVptjSPIQZGeQ3URQdAewfSx8WR+y+Wwre1GEknpKOkgHEcrrNcuk2sjj0UcfTb7wTrg37REkuYHlYTE\/C+g3EUZS34k+pp2pyPfL961ZJlV2T9UyPTcyKQ+PWVpA\/4Ysls3krNPc5R3wi4uLn9Y2p6uq1FU6FvJ+45rqEmX0s7laQH9SV\/nMZwOZFFZt9Zi8tndleelaLVFJNYf\/yunxWrukyq4kUYlOLqC7bbpptAm1Zh+y\/iRTMzzKsNp7iaRwPi\/v7ig3LzsU50yA7nVd1Rh93KtWkwzJrF+ONdPiedJX6UCYt3pDuXk6uIBuEHFEIPPWSJPN7DC99U6vJDIcv35znlNDedjy0BEJMN+kA3SeswtlDH1eaTGLOsnMBJIb14X86TyFvwC+LZCa6x+jpNqHIrk5bZEQSEMi0bkFzKdAutIok58jP8+0RUIgDYpEagsgkEoikl90TiJ5bWQ6m7rcGkgkwPwU0bt6gLiIZFrF9qm18eaH6vr5itIiqP0X8BmddbE9XVvTaP+dyhiT\/DB9OaBXhrQ5kAjIFsz65x2+x2R1biWSd3\/kh+jbePWk7bqcugPmteicqRh9i7yGJ9v3zp1E8pfO+z\/62P6aB7aMi\/YBBuoopOdcWh9\/9mxojx09cn3uJHJ+7fRbfb1pZdZWojD1EaCOg8F9ncSdTW0G27ZVH2krClnNPKy+j09P6JwQ2gcZmN0C6hzX7za1Dz303d+08erdVtJYmXkvlSOtBdSwketzRmT7tWgjrdW4RPL2rbw8xU37ZgeQnZBuLWA2nz0vlPtmU5tO2cHG9qVqJZJQqY\/dWLspbHXxpD5QM4lAzLX7drfW8O2Ie6uUyPpTZ961WN794E\/kakcETG+xdF7r7iRTNIjQrlYnkXImxEIpNwvMmgjECKKd03x5k2xT0UhjEknBRuh4\/y4RqT5gOlGIa3HvVF\/q19VIJLWQhYWF20LH+49EEY0AopAuRSNqIVOORqT8AFFILdFIE7WRxjqyLIy7H79AuEB7C6MoZPfRSDq1Zi6R5NUMGxy9U0vqD2iWMqXXZ2v3ZBzKYD26MlOJZEKkYvHouyWn2IHmo\/y+TemdlKxDg0DgxswkMvjfxqmVx5xOl7cFquh+lFYfr047yUytSSf1vmdHPR7egAg0uzEz7HT8CO7kyeNvTF0iaQ1TUBd6AzWQuqyC+ngMR+V\/PAuJXMl7092E8YuAUlpAcykZBfXxyas7MnVkqhKRypLSAmpJZekQnV1Ka5JIRCpLSguoIpVlQzt5SmsgkQ+nJpF0ZV26sHbLxZ\/8xikGApNhQ9vcdRynS2vs96fbQRuDAtRw6lptsbmIbpyDh2NJJGGPA4bGNACzJkNNbWibO3iYOYitS6S09rrozX0IzNICxt+EJS3sWjTTMTrOLK2x6iFae5sNx9VFgPHz+Fp7Z1sXGWvgovCx+bqIawGoh9QQ2SVQaFUiS0sn3pfDb5ZEImpMwOg5fOdDmk+vX3z6yZ+3KpFM7XVArvnzIvrcgdE\/N17J3fyxgwQKrUlEUV2HCVBT6kUE33xxPYFCmxJZdciwndyud68DDhnWcl3blMgVOch27J85Wq4FoCFl1jz7g7O\/TsDQikRScJGDbM\/+rgOgNX7eOrRGksjK8tI1BeB2SKuihgVg9wVgKeD2arSHDj1ytRWJ5F28ClmKhIBmlG5f2xeeW3+zrUjkIwud8Q1ADQud1Ho75BzgsaNHrrdVWDdiwIcCcEak4\/WmZJ1ak4iLTCKA9G+3JXLh\/OoHJEIiAIlgrCMHo0zzJRGFQoBEMPaBw1EEcnBhYeG2C+zUOkAiJDKORFaf31j\/xAUmEYBESIRESAQgEZAIiQAkgjmRyNLSic9dYBIBSIREdGdVhre0ASRCInBOBCCRuSbvaCEREgFIBE6skwiAu5HUbwYFuhZzJpEchffOi3bIQDnvagFsumqQSGtTfGMnIaTwHCCRbl\/bSxfW3m5FIrGTd160Q171SSLA7kgqSzdjexI5c2r59VYkkrddsX97LXXe1QI4V1VDvWmwHr3SVmH9teTuXehmiTw0LQCjtaEeOvSIa9ECP\/7Rhc9zuLwtiaz+5IVnTPJtYVeVdJZrAYwWvbsO7VzXTG1vSyLGwTutDqgjdjwrMpIXRvnN3rPeDnkZlVoT4KxIDVmR82unf9mqRPIN2L\/59l5db8DoXUTeBtr8NV1\/6sy7rUok38CuufkcZAqFrgWgQ2ueOrPGTWddkb9vjkwA0GUC6GqsgZXlpVujdGaNK5HjiuuK6kANnDt7SnG9wbbpUYvqY0kk7Nu37wsztJrBzCxgss+P9HpzUwDOnFq+MRWJnF87\/Z6FrxmSyiJkYPyFT12kOSGPMu5kIomoizRXDxlEdeVwD4AxsZ5MzqmVx26PWg+ZRCIH3bhm6iHGyACTHzrUIt\/IhvaLsXwwzh8KJ08e\/9CNm\/zhd1gKmPywrs3Y5BvaUc+HNCGRN9y4yTshnP4HtMnPmucunvtysB5tTFUiafXdv3\/\/l26A1l6ghlZfmZHxN7QPPvidnA\/ZO1WJhIH9P5aOkcoCpLT6NeqkMYkcPnz4Vbtp4TdQw246nynp4bG7sjZmIpHSpWXu0+j92HZNgOh+1iQFuLi4+OlEHpjkD4eV5aVrToyONu\/HAUOgnYOHXu42GskkjXPAsFGJ5HDKgQMPf+WGOGEL1DABwiyt0TpER3mLYSsSCQOJ\/EoYufsuEtcKaK9IrE67+7T6JAX1RiWytHTip6unHxeN7CIKiURcC6C9dLE67e6uU6ax56hGFRIJKc7YYYtCAI0r8xGxHTt65HoTa39jEhGNiEKAmnL9mlfuG4WsViURhw9FIUBNO20NLDtHaumqbWrdb1QiObCSTi0Hfr79QItCgOm30uvUaqcjqzWJDNNa72cEgRvmYQZmSebT2bz9PonOMjy30eChaYmk2i8f+fuHebQcArM7xe4w9Den0\/POkHEHLU5NIiEnIDNa2E27aJ4PMEOSAdDy+7uMSEoNg8jspcYDhzYkUl5a1ecdQEljeRc9MFuSXu\/7OJRkQ5ospk9FIn1Pa+Wm6Q4B6tjQpTbS101tukLbSGO1LpFhy+\/VnB3pWzon0Yc0FlAP2cxmU9u3Bpf83Hl54CSj3mcqkZBTkX0qLPf1YQVs7uqLwFKbbroba+oSSQiVQ4h9aPtVBwHqP2iX+kgfRJLNe45ctL7Gt\/0NSn0k7\/Dt8ontPJR5OM3sAXxOa5BlNu9t1UGmLpHy3pGkeboqkjyYXogDEEkNhfRs2puY0FuVRMqQxi52bPUpRAa6UrtM6rlrIpm2QKYukSKSdAvkIF4XdjQEAhBJXwUyE4lsjUjmObVVQmICAYhk1uQMzCwEMjOJlIm\/+aHn8QBQRihEHjlMSCBAN2ok8\/p5jgCHhwmPz2Qtn5VEStdWfvi0os3Lzcv5jy7mUoG+iyQSiUzmpWabzWzOgRw7euTmNLqwqpRIOUeSXuacbK\/95iVqikC8XAroJuUzXvtZr9SUM1BxZXnpnVkKpAqJbB2RkjpJjemtyK3UP4y4B7pNyTYkMqlt+m8ipmRuksFJbbmGtbsaiZT0VkKzRCU1jA3JDctJ+1rlBqDdzsvIpJbPfjIgiT4ySqrJNxN2SiKFw4cPvxrTZicwC5nkASphbY27EQDTi0qSgcgU4FmlsfN9s7FeXFz8tM1Bip2SSKmV5OVW6eDKQj6NcyWRxVZ5GKIIoCzkEUlIvaTtRqB8\/a3yqCV1NVcS2SqTRCaZA3Nq5bHbSS81WZcoNyt5xqStEsKSB4CdCtrZYJa1ounNbb5evm4OZCe1X7M85kYi2+dvnTx5\/D8GF\/e3pc02u4JRFv1EG7lRiTgSpuZhyP9PY3cBoBtkHcmaUdaQiCVrStai3a4j+X35\/flz2cQuLCzczmY5o9tndeaj8xIpInl+Y\/2TRCO5ibn45UaWNNTd2P57EtFEJsQBYFKhJJuRNaVEKWVzutN6VH5PXiO+\/tSZdwf\/fKWmYnkvJLLTzYzZd8IDD2BazTn3Wov23Fl6508YnZcIAMwDJEIiAEAiJAIAJEIiAEAiJEIiAEiEREgEAEiERACAREgEAEiEREgEAImQCIkAIBESIREAIBESAQASIREAIBESIREAJEIiJAIAJEIiAEAiJAIAJEIiJAKAREiERACQCImQCACQCIkAAImQCACQCImQCAASIRESAQASIREAIBESAQASIRESAUAiJEIiAEiEREgEAEiERACAREgEAEiEREgEAImQCIkAAImQCACQCIkAAImQCIkAIBESIREAJEIiJAIAJEIiAEAiJAIAJEIiJAKAREiERACAREgEAEiERACAREiERACQCImQCAASIRESAQASIREAIBESAQASIRESAUAiJEIiAEAiJAIAJEIiAEAiJOJBBEAiJEIiAEiEREgEAEiERACAREgEAEiEREgEAImQCIkAAImQCACQCIkAAImQCACQCImQCAASIRESAQASIREAIBESAQASIRESAUAiJNKkRHIDAGCeIZEeEGGdXn5s86Unvlcdz699f\/OPFv\/wA\/cJc\/JZeu2HT65U+1laWFi47j6RCIkAJEIiJEIiJAISIRESIRESAUiEREiERAASAYmQCEAiJEIiJEIiIBESIRESIRGQCImQCImQCEAiJAISAUjEvSIREgFIhERIxJyuXeHBxzxJpObP0gMPPPCf7hOJAABIBABAIgAAEgEAgEQAACQCACARAACJAABIBAAAEgEATJP\/BznhcXRDXIH1AAAAAElFTkSuQmCC","width":210}
%---
%[text:image:925e]
%   data: {"align":"baseline","height":140,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAlgAAAJYCAYAAAC+ZpjcAABEi0lEQVR42u3dbZBedZ3g\/dm99+keEXB1uVVmBWHERVmJyIAryRCEhEgMnUzIE0mAEOgQEmLDkic6jwQIQRiCruimwg04lrIvLKidCQkhgWBBsVijBESgFO\/iHfsOqqaKrSl3ve7+tVxM03Qn1znXOec6D58Xn7LKCt1JA9f58v\/\/z+\/\/J61W608AAMiOHwIAgMACABBYAAACCwAAgQUAILAAAAQWAAACCwBAYAEACCwAAAQWAIDAAgAQWAAAAgsAAIEFACCwAAAEFgAAAgsAQGABAAgsAAAEFgCAwAIAEFgAAAgsAACBBQAgsAAABBYAAAILAEBgAQAILAAABBYAgMACABBYAAAILAAAgQUAILAAABBYAAACCwBAYAEACCwAAAQWAIDAAgAQWAAACCwAAIEFACCwAAAQWAAAAgsAQGABACCwAAAEFgCAwAIAEFgAAAgsAACBBQAgsAAAEFgAAAILAEBgAQAgsAAABBYAgMACABBYAAAILAAAgQUAILAAABBYAAACCwBAYAEAILAAAAQWAIDAAgBAYAEACCwAAIEFACCwAAAQWAAAAgsAQGABACCwAAAEFgCAwAIAQGABPfFfB66etPibMwbC9bNnPTD9gosPtV18\/pT\/+eWzJr0d\/\/vgf77m7\/\/+r28+NOTNIa3xPLd9+fue3nLFsP2Dc1t7185s7Vk94\/d71856e7QnB+cdet+G+Y8e3LRwIDy1edE8f48AgQWUyvpF8y55L55+HMF06YXTfhfBdPZX\/vIfPnLihNbRnHL6V1vbll7eOlJQJdUOrwiu\/37TtI49vqbv3YixfetnvzUyxEQYILCAzO3oX\/SliKh506bvm3XRN\/5HBNQXv3TeP3YSUEWG1Vh+fveNrZ9tW9oaiqZEsTWW9urY\/sE5L0aA\/TG+Fk\/0zwggsIBxDQXJ8UMmDxkY8lBs1\/3dlhWtMydManUTUyOdcMrZhYTVWF64a1VrKIpaf3fz9K5ja7QIryduueyN9qrX01sWn+SfKcAPAZoZVBFTW4Y8Nta5p0fWLRsOoqziasVlf9U6tH2gJ3E1elUrthDzCK3RK17t7caILv\/MgcAC6hdTJw+5asjOIYePFiGxypRVXJ137gWtWAnrdVj1KrRGn\/OKLcYDGxfstr0IAguoblA9dLS38saKq6y2A9cunFu6sBpr6zDeQiwqskavcsXWouACgQWU9\/zUzDRBNVJs49V51epobx8OBU9PQmt0cB3cePl257hAYAG9iaoJ7x1IP5xFYMye+o3GrFodadswDsL3MrJGbynGwXmjIkBgAflGVderVHnFVbxtGAfjqxpXIz17e3+hZ7OSrm75dwEEFpBdVL2TR0xkEVfxNY70huCL313feul7g8N+vXvb+1594LbWb35414f87if3Dv9v+9e9fP\/G9\/\/6Is9mJR1WWpS\/vfmSP4gtEFhAyaIqy7hat3j+cPj86gebh2PotQfvGI6j3\/7o7tb\/99\/u60gEVfx18TV+ed+6Um0ZHtgwv5SRJbZAYAEliqq0cXXMqRNbHz39otaxZ81qHXvugta\/nXRFa9uatR1H1HhRVeSqVFrP3Lqk1JEltkBgAR8ep7Az6zNV3cbVMadNbn30zBnDIXXcpCWt46fd+AGfmLqi9f2tG1KF1Rs\/vmd4peoXO9dU6lxWXLlThcgaeWYrZm4Z\/wACC5o0UuGqrN7+S2r0nKvhlal2TE2+9kMxNdoJF13Xem7XjtRhVeXD7zHKoWyH3zt9GzFmbRn9AAIL6jpWobAtwLHcds2i4dWp2OYba2XqaD5\/SfK4iq3AV3ZtrcXbheH5HSsrGVkjtxCNfQCBBVaruhRv4MXbelsGvtU6fsoNiaOq7Yzp\/YlXreKMVdW2AuseWVa1QGBBHc5WFb5aFSMRYsUo3uRrh06clzp+6qrC4iq2A6tweL3pkdVe1XJWCwQWlD2sJr+3DdiTVaoIm9Gx88R3bmt97KLrC4ur1x++s5arVnWOrLbhNxA3LRzw7zIILChLWMU24KGioyq24OKM03ix89JD3x4+lF5UXNXprFVd3y7sxN61s96O7UP\/boPAgl6G1ZtFR1WnwXPatGsKiauIvNiabFpc1Tmy2qMehBYILCjy4PpAUWHVyUrVWKbNW1ZIXMXE9jJNX++VMl0SnUdoxaXTDsSDwIK8wmpLEQfXI1jGO1PViW8tv6GwuGrKeatO7B+cW9vIah+If3Jw3iGhBQILKhNWESoxiDPJHX5jefj2janfGDxx2opEIxhE1YfvLizrBdFCCwQWlO2M1Tt5j1VIswWY9aH2JBPaxdX4XrhrVa3eLDxaaDmjBQILSnV4PYvVqqwOtX9s6ipxlaFnb+9vRGA5DA8CC5LMsTqc5zbgr3dvy2S1arS5V6ScdTUUV51e3CyuOvf0lisaFVnt6fDmaIHAgtGT1w\/leWg9yXiFpIYntae8Bmf9TWs6+h4xGV44JbNv\/ezGRVZ7jpbJ8CCwcIA9t8nrcV3MyCtr8tDNuat5S1Z5WzDnQ+9NOY813mR4B+ERWNC8uBrI6wB7EWHVNmH6NbmOY4hREeLKeayu3jjcMP9RnzkILGjGOas3q3Jw\/UjWf+um1G8MvvQ395rQXpADG+Y3OrLaB+Gdz0JgQX23Ax\/La9p62qGgacVbf6nmXQ39NT+959aOvkf8uQRSNluFQ4HR+MgK+9bPfsu2IQILbAeWZitwtJOmXJProfYmXtycp+e2LxdYtg0RWFCbsJqQx9uBvQyrcMVVy1PF1cTZ13f09V9\/+E5R5L7Cgt42XDTPZxUCC6oVV1vyGLcQ8dGrsApPfOe2VFuDn5q63KF2W4WlFNfu+MxCYEEDD7FHcMTly70Mq662BhOcu3Ko3VuFDsGDwILRh9h3Zv1AjLNIeUxeT2NZf7pLnAdW3uTcVYnsH5wrqsaxf3DOiw7BI7CgXGetDmd9zqroNwPzeGvw85dcZ1K7C6Erd+WOs1kILKjZWasynLMayxemXZ04rj4+ZUVHlzjHCp1zV+4qdDYLBBa07w\/MdNUqr4uYu7VtzdpUW4Px15l3VV4OvHe6muVeQwQWFBVXV2U51yq2A4ucwJ70rsFYiUoaV+f0LTOSwYH32szNOrBxwW6ffQgsqMg09jK9HTier89Zbmuwxvatny2iTIFHYEHPD7K\/WddD7GOJ0QrHT7kht61Bbw323vM7VoqnhOMcHIBHYEG2V900ZtWqm5lXEy711qDLoBtwAN5VOwgsKM+WYBVWrbo62D51VUdbgwaKGttgyxAEFrYEG7Vq1faJC5clDqxl13U2UDR+FsLG2AZbhiCw8JZgarFSU9Y3BMdz6fz+xHH1Z1M7e2vQwfby3lNoFWta6\/+9bkpr+TcnDZt8zrmtsyecM+yLZ5zd+ncnf3lc35j0l4d9diKw4MhxtTPLuVZVCqtuJrb\/8M6tHX39X\/1gs6CxitVz6+ec37r8ovOG4+nEU89qffykL7c+cuKErkw486v\/4DMUgQVjn7c6lNWWYBzirlpchfNmJl+9mjj7+o6+dqzkCRmrWL1YlYqYaq9CdRtSR3LiqV\/5P1deMuVrPlMRWJDxeas4yF7Gaewdj2VIGFcfS3CwPX42QsYqVpFB9dE\/m5BrUI3lY5\/5cmt538WbfLYisGh6XM3M6rxVFbcERzpjevLVqyuXrjKx3SpWz3178deHz0zlvULVqWOGXPvNKY\/5jEVg0eTD7I3eEmy7f+O63A62h7jEWsBYxcojqmLFqAxRNZbJX534O5+1CCyaFlcPZfWWYFW3BEeKWMprYvtrD94hXKxiZbb9V\/aoGu2sCV\/9Xz5zEVgYHppAvBFX9bBKO1T085dcZ\/XKKlZh4kxVvO1Xlaga7bOfP\/t\/G0qKwKLucXU4iwdQrMrUIa7Srl7FgXirV\/Vexep1VP2Xqy8aHqPQi4PqeYhREN4wRGBRO+sXzbvk0Y3Xv5rFeauqDQ7NevWq0\/sGrV65ozCNgZnnt075\/FdqEVVjvWH47av7VvpMRmBRC0suvXTeCZ89+w+PrFvmvFW3q1cJxjJYvar+HYVFhtWSaRNL8xZgnmJFbvaFF9znsxmBRS3iKj7Yuj1vVbe4SrN69fU5y61eNcj+wbm5h9U3J\/2n2mwDJhnjILIQWFTWjfMvu\/OEU84e\/kA7c8Kk1A+ZV3ZtrVVYWb2iU89tX97IsGrfMRjDStv3EYb2PYVjGe\/uwmOOEFkrZk59ymc1AotKmXPxJbtHfpidd+4FjT\/MbvWKNPaunVnLsDrmvZCKIIrfU0TSIzdMzS0o4+uPvP8wfgbxe5h0zsTXfWYjsKhkXIUVl\/1V4sPsMX28jnFl9YokfrZtaS3CKg6Yx8rS7MlfGx5SWpa5XnHx9IGNC3b77EZgUbm4ShpYdXtT0OoV3epm8Gis3MSIgsJXqIZiLt5GjKCKkCn7ZHqRhcCicnEVdt+4tKMHScRBneMqnDTlmtxWr+LKIEFi8Gi4dcEFhb8VGCtksUoVq0JVvKhaZCGwqFRcdRpYdRzDMNrDt2\/MdfXqpe8NCpKGj2yIAaFFzrGqelSJLAQWlY2rcGj7QOPjKpwxvT+31as3fnyPGGn4yIY4wH1MQWEVERezs+oQVSILgUUl4+poM7CaEldxvU2eq1cxK0yI1Nezt\/cfcUhoEQfY43vEOIQqnKkSWQgsah9XMQur6XEVzpuZ3+pV\/AxFSP3tWT3jAxEQb+N98pT8L2GO7xGH5eseVSILgUVl4upIM7BixaUJYRUilCKYkgTWOX3LOv76rz5wmwBp0GH3mBcV24FFbAOWZaSCyEJgUXvfX7Xk5vaE9rSB1aS4Cn2LViTeHowtRaMZGH3YPVaS8twOjDNcEW\/\/ZemFjQ4rkYXAolBDH\/IT4o3AJB\/YowOraXEVPj4lWWDFYfhOv3YMZBUf9Rcvilx8\/pTcw6oJ56vSeGrzonmeAQgscourIe8kDax4KDQ5rgZW3pR49er7Wzd0\/PVfvn+jAKm5tQvntpKsGgur7P3tzZf8QWQhsMgtruLDPmlgtae4x4H2psVVmmtx4td3+rWNZqj5BPctK4ZXgPNatTrzS38hrEQWAosextXxQw63P\/TTBFaT3hbsdjRDrHh1+vV\/vXubEKmp+PfG4fXyeXxN37tPb1l8kmcDAotM4ypNYN0w77JGxlWYMD3ZtThxVivJ13e4vX4eWbesdeaESbmEVVydc+PMvxRKIguBRQkC67Gu\/sv6M2e3Lp3f38i4SjOaId42dLjdqlUeA0LrOnW9V\/atn\/2WZwQCi7Rx9VBXD4GhuDpu8rWJppHXyZVLV+U2WNTkdqtWSQ6wC6J8PHHLZW94ViCwSBpXV433MNi29PKO4yrpdS91csJF1+U2msHkdqtWR\/OZz33FLKsCPLlh\/qOeGQgsOo2rmUd6IHRyBuu4SUtS3adXFzFmIc\/Boq89eIc4sWo19r97\/35CI6+16aWDGy\/f7tmBwKLjcQxpA+vYcxekvrC4LmI1Kq\/RDCHeyhQpVq1sBxrfgMCiOm8Mvnm0h8ORAuvYs+d8KB4mXHqdw+1HEee1zL6yatXNZczGLvTWntUzfu\/NQgQW4wXWoU4eEuMF1kfPmJbJ6kwTD7cn+fpmX1m1aovp7ksvmSxwSmLv2llve5YgsBgdVzs7fVCMFVjHnDY5s+2vqvvkhdcmCqxz+paZfWUae2JXzrh0+H7CZ25dIm5KZP\/gnBc9UxBYHPWNwfG2OT4QV6dObB0\/5QaBlXJye5LD7b\/90d2ipeF3CJ5y+leH\/yOn\/T1euGuVsCmZAxsX7PZswQ9BXB31UPtYxhrHkNUWWJWdNzPZ4fYY5ZDk67+ya6twqYBYWcpj1Sq2GeNrj\/5+e9fOFDYOvSOwqNqh9iMF1shxDEfSlMCKq27yOtxue7Aa7r3+ysxXreJgfKwcj\/c9bRM69I7AouTX4HQqtinGemNwPEkmlFfVtjVrE28PJvm52B4s\/6rVxedPyWXV6mjf2zah63QQWJQnrga6eZh88fw5iUIi4sPsq\/ST220PlluciSp61Wq0PatniBqT3hFYlODcVeqHSQy5PG3aNbluhVVR0tlXAytvsj1Yg1WreJuvF6tWox3ctFDQlJTzWAIL566O6hc71wzfgxfT2ZPERN2nuUcsJfl5xFmtJF\/f9mA5V61iqzzrNwSTrFqN9PyOlWLGeSwEFlU8dxV+88O7Ug3TPGlavae5nzqtP9fZV7YHyyWPVav2XKuuZm7dPF3QOI+FwKLs865GiwniaQ90J12xqdzVOAkPt8dl0O4edNXNWHOtunFgw3wxYz4WAouC4+rkNPOu2l763uAHHvgvPfTtXN+Yq\/PVOElj092D9b3qJotVq5F+tm2pkCn9fKzFEz2TBBb1CqzD3Z676nbmU13fJEy6PZj0PNqrD9wmcGq2ahVvHMa8rKx\/rz+\/+0YhU3KPr+l71zNJYFGfuNqSxbmrosOirtuDSa7GGV4t\/N6g0KnRqlXMyspy1Wq0fetnC5myj24YnHfIs0lg0fCRDCPPXY2W9E3COt5JmHR7MOnVOLFyKHTqcUFzXqtWprob3YDAojcjGVJvDcbB6qwnlzd9e7BvUbLzV689eIfgqcEFzRFrEW1F\/P6NazC6AYFF\/oG1s5tzVzF76YhbVykOuicdrtn07cFf\/WCz6Kn4qlUEW+F\/FuMaKmH\/4JwXPasEFtWLq8ndfEDHwepOAuCTF16b6\/UwTd4eDBG64qeYs1Z5XHVT1KqVcQ3VdXDTwgHPLIFFtQLrzaxGMhzJeTP7GzsPK+ndg0m3B01vr+YbgmmvusmScQ3V2ir0zBJYNOCtwVgxiblLnUZAmnNY629a08i7B5MOF40XDERQtd4QTHpBc15euGuVePFWIQKLMr01GIeq8w6NOmwT5n33oPEM+d4hWMdVq9H2rp0pXrxViMAiw8A6VMTWYDdbZRFkVZ\/qHncJ5nn3oPEM2YvZU3ncIZjlVTdZOrhpoXCpkL1rZ73tGSawKG9cDRS1NTjSsv5VibcJ44B4lQMr6RT7pNuDrz98pyjKUMyfihAq+1U3WXr29n7hUrWtwg3zH\/UsE1iUc+bVO3m\/NTjuuIapqxpz2D1iKemKXdLv8cqurcIoo9ELMTm9KatWrs2p\/l2FZmMJLMoXWI8VvTXY1TZhhQ+7x9uAeZ85iyGvAql8oxfKvmrlHFb17Vs\/+y3PNIFFTWZepd0a7PZtwqpenRPzrPIcrhp\/PwRS+Q6xV2HVyjkss7EQWJRk5tWR7hrM+1xSiDCr+\/T2pAf6XY+T\/hD77KnfyDysqrZq5RyW2VgILHp8sP2X960bflutV1tnVTyLlXR6e5pVOtfjlGc7sIqrVs5hOfCOwKLHB9t\/88O7sl\/dmZr8jcKkE87rPL09RPiKps63A\/N4O7DKq1bOYTnwjsCi+8B6KO2H7sv3b8wlQJJenVO1uVh5j2dw\/qp3FzOPnMZe5VUr57Dq44lbLnvDs05gUXxcndzrg+1j+ek9tyYPrCGnTuuv3XiGNNufzl\/17pxVGaexu5eQpzYvnuiZJ7CoyMT2LA+2ZzWyoQrDR4sYz2D+1fhhldc5qxCrYbEqVsefnXsJTXhHYFHAWIasD7ZneRYr\/pqkW2pFilW2PMczmH81tm1LL88trOLrrl04t\/Y\/wz2rZ4gVYxsQWHQQWIeLvMw5ja\/PWZ5qFStmTJX1PFbe4xncP\/jhsMrrAHuICe91OMTeif2Dc4VKhT2+pu9dzz6BRf5xdVXaD9lYHSlyXlSauVhlHUCadJBqhGLS7+H+wWLCquqjF9J45tYlQqXiDmxcsNszUGBR0qGiWY9lOJrYIksTWGnPL5VpRW7i7OsTf484Gyes8gur2A6s4yH2Tjy3fblIMXwUgUUeq1dZ3DdYxLmlskZWrKrlPaE+\/h4Jq\/y2A+t6iL1TIsUqFgKLHIaK5jWWIbcD7yWLrKS\/7zTfQ1jZDjRwFMNHBRbFB9aWtB+scfVKL+Okm63CMkRW0vNXac6Q\/fZHdzdq3ELeYdXk7UADR2t+hc7gvEOeiQKLhq9ejXRO37KuIquXbxcmPX8Vvz7p93j1gdtqP3k9BoTmNW5hpPg+TXk70MBRq1gILBq6ejVSRFI3kRVvJfZiTlYR56\/qesHzvddfOXz+Ke+oqvuw0Cw8v2OlQLGKhcCiTqtXH7hGp4vzWN2sEJX9\/FWdBozG6lEM78x7G7Cudwc66I5VLIFFMYE1UIfVqw\/c55dBZMWqUhGrWUWcv6rLgNFYrcrznsCxDrDHQXnh1Ll962cLlLqsYm2Y\/6hnpMCiR3OvyrR6NVLcOdhtYI1czcrzbFYR569iPllVH9iPrFvWunLGpYWtVjnA7qA75mIJLHo696qMq1d5RVasiOV1UXQR9w9WbcBonHOKLcDYmisqqkaGlQPsDrpjLpbAwupVUZH13iH4rEMr6XZmmtW0l+\/fKKqElYPuWMUSWFi9Km9ktUMri63D4fNiOd8\/GH5537pSb\/\/1IqqElYPuWMUSWOQVWIfqvHr1oUGkU7MPrfaQ0jTbdmniL81A1DIdcI9Vqjg0XtS8KmHloDvd27t21tuemQKLzuNqchNWr\/J4u\/BI57SSxlb8+iTfI832ZC8PuI8MqiIPqR\/trUBhla8DG+YLk5o5uGnhgGenwKKzwHoo7YdnPLCrGFjtewu7HUbaqTi83rfoyINLk\/5e0oyNKHKCe8yKinNUMfizDEE1ckCocQvFeebWJaKkZp645bI3PDsFFkePq5PTfnC+9L3BysZVltfqpJ2rFee2YoWrHUpJV8jS\/FnzmOAeK1MRU7HNFjHVqzNUnVxpY0Bo8Z7bvlyU1NBTmxdP9AwVWBw5sHam\/eB8\/eE7axFY7QGfcVi96NDqJtCKnOAeYdJekYqQilWgsobUWOerXGnTOz+\/+0ZBUkP7B+e86BkqsMjhWpx4E60ucTVyy7AXq1lp31yM32usgrVNW7Cy1X\/96uFYHE87lNoiPkaKVZ6Ip1CmbT3bgNW2Z\/UMUeL6HASW0QydiLM8dQuskatZRZ3NKtJxFy6vbDB1uloVYx6sVnmTECMbBBa9DqzDaT4sf7FzzfDr\/nUNrLY4lJ7rm4YFO\/Zri2sZVnHuK+4lFDLl9fSWKwRJDT2+pu9dz1KBxYfjakLTRjOk3TYcvh+wBqF17FmzahVVRiy4MocyHHZfNM8zVWCR0WiGqg0WFVp\/9NHTL6p8VMUhe1uA3iTEyAYEVu0Ot9dlNEO31+1U8YzWMadOtFKFK3Nw2F1gUcbD7a89eEfjA2vkNPjh6esVWdWqQlDFm4txUN2ZKm8S4rA7AqtRh9uF1fj3G5Y5to6bfG1p3\/xrr1LZ+vMmIQ67I7AaObn9lV1bxVSHYx5iRlWZthHL8gZhrFDFrK0IqkfWLRMeDXJw00IxYrI7AsvkdofbszscH6tbEVwxfb1JbxBGTMXqVAwwjaGmzlG5k1CImOyOwKpzYL2Z5sMxrlgRTNmd3YqD8vFWYlHX8+T5BmFs88Xk9Dg7FW\/5iSm8Sdg8e1bP+L1nrMBqclzNdLi9mRdNd\/MGYTugQvtKnTiE7uJkknjhrlVCpOYObrx8u2etwDL7KqEmTG7vhaTbhnG+K1bA2ncLxvbjyPsIR4qv3dYOpJGRNFo7mtpEAUY1YCaWwKKzwEo1++rl+zeKoZwkfeswzfeIs3Me7pTB3rUzhUjNZ2J51gos24MJvP7wnWIopwPwSeIqzmul+T6\/+eFdHu4Y1YBtQoFFmbYHzb7Kd5xDksA6dVp\/qu\/z6gO3ebjj0mdsEwosyrQ92KSLnYvWtyjZG4RxrirN9\/n17m0e7hjVQGE8cwWW7UHbg5V6gzBGO6T5PnF\/pIc7RjVgm1BgYXvQG4TjvEGY5vvEDDMPd4xqwDahwML2oDcIM3qDMHiwY1QD3iYUWNgebE5gFfAGoRENlM2e1TNEiG1CBJbtQcrxBmFsJxrRgFEN2CZEYFX87kHDRfMVE9iTBFYciE\/zfeKKIw91yuTAhvkCxN2ECKzKx9UEdw+WU4xcSBJYMdLBiAbMwqJKntq8aJ5nscCqa2ANuHuwnM6Y3l\/IG4TxooKHOmXys21LxUdDPDk475BnscCqa2AdTvMBGK\/1i6ByjWj46T23moGFWVhUyuNr+t71LBZYdYyr49N+AMbVKiKoHiMafnnfOg91SuX5HSvFR4M8vWXxSZ7JAst4hvf89kd3i6AajGgwAwuzsDCuQWBhPIMRDRmPaIhzdB7mCCyMaxBYlGA8g+nt5QustCMazMDCLCyMaxBYZBtXJxvPUJ8RDfHrBRYCi+qOa1g80bNZYNUlsK5K+8EXV6uIoHIFVgwlNQOLOjm4aaHwaJADGxfs9mwWWI0+fxVvnAmg8o1oSDsDS2Bh2CjOYQksnL8SWON4bteOVN8nrjvyMKeMnrl1ifBwDguB5fwVvRvR0M0MLENGMWwU57AEFs5fCawxnHDRdam\/T0zk9zBHYOEclsAim8Da6fyVGViGjFJmP7\/7RtHRMPsH57zoGS2wGnn\/oPNX5QysuBRaYGHYKO4lRGD1PrDcP1hifYtWFDIDK6478hBHYFEmntECq8pxNdn9g\/WagRVBZsgoho1Si3sJNy0c8KwWWFUNrC1pP+zETzHi2psiZmAJLAQWZfPk4LxDntUCq6qB9ViaD7p4nV\/8GDIKRdo\/OFd0NMxQVL\/lWS2wGjVg9JVdW8VPzYaMCixMc8fAUYFFNnF1vAGjFZiBNXVVIUNGBRYCizJ6esvikzyzBZYD7vR2ivtQjJnijsDCQXcEVm8Da8AB93oFVjdDRgUWprlTyoPuG+Y\/6pktsKoWWA854G6Ku8BCYFFmT9xy2Rue2QKraoF1yAF3U9zbfrFzjYc4AovS2bt21tue2QLLBHcyNbDypkKmuLsmB\/cRYqK7wCKbuDo57YdcDKQUP+Wc4i6wcF0OdfTU5sUTPbsFVu3fIPzdT+4VPyUNrCuXpnuLMP6eengjsPAmocCiR1fkxDkd4VPewHJNDgILV+YgsHobWDu9QeiaHIGF+wipgv2Dc1707BZYtX6D8Fc\/2Cx8BBYILLxJKLDI8g7CuE5F+JQ3sNJ+n9cfvtPDG4GFOwkFFr0a0RAPYuFTnI9PWeEeQhBYGNUgsCoSVxOMaKjhPYQCiwY4uGmh2GjsqIZF8zzDBVZtRzSInvIGVqx2CSxc+IxRDQgslzxTkoueBRYCC5c+Cyx6NAPLiIZi\/fSeWwsLrJfv3+jhjcDCLCyBRZeB9ZjAqt9Fz90EVvy99fBGYFFm+9bPfsszXGDVcgbWK7u2Ch+BBT317O39YsMsLARWaQPrsBlY9Qusbi56FlhUxXPbl4uNhnp8Td+7nuECq5YzsF578A7hI7BAYGEWlsAiy8AyA6tYfYtWCCwQWAgsgWXIKFmKYCoqsDy4EVgYNiqw6NGQ0d\/95F7hI7BAYGHYqMDCFPfmBNbAypsEFrX3\/I6VQkNgeZ4LLFPcKS6w4lC8wKIJhIZp7gis2kxxf\/G760WPwAKBhWnuAgvX5FTbOX3LBBYILASWwBJYZCkmswssEFgILIFV42tyBFZ9AyveDvXQRmDhuhyBhXsIBVaGgRXzzTy0EVgILIFFDwLLPYQCCwQWAktgIbAaF1jP7dohsBBYCCwElsAiy8BK+30EFgILgSWw6D6w3hRYAktgIbCooj2rZ\/zes1xglTWwWgJLYAksBBZV5VkusErpvHMvaH3kxAmJHXvWrEQPe6rjuElLUv0zAVC0f3fylwWWwCqntP9QCyyBBdBrxwzxLBdY9QqscxeIEYEF0HOe5QKrVoEVD2ExIrAABJbAQmAhsACBhcASWAgsAIElsAQWAgtAYAksgSWwEFiAwEJgCSwEFoDAEljGNCCwAASWwBJYBo0KLACBJbBwVQ4CC2iaj33GVTkCy2XPuOwZXPaMy54FVmMC602BJbAEFgKLKtqzesbvPcsFVlkD65DAElgCC4FFFe1dO+ttz3KBJbAoNLCe27VDYCGwEFgILIFFloG1bc1agYXAQmAhsKoUWK\/s2ip6BBYILASWwCLLwHrpe4Oip6aB9buf3OuhjcBCYAksugysLQJLYI3moY3AogqeHJx3yLNcYAksunJOn8ACgYXAEli1DqwXv7te9BTs63OWCywQWAgsgVWRwBpI+6EmegQWCCx6Glgb5j\/qWS6wyhpYkwVWPQNrYOVNAovae37HSqHRYAc3LRzwLBdYtQuseNtM+JQ3sOLXCyzq7rnty4WGwPI8F1ilDKwJaT\/YYl6S8BFYILDolac2L5rnWS6wyhxZAqsC+hatKCyw4i1RD28EFmXnGS6wahlYrz14h\/ApUBxaF1ggsBBYAqs6gXXYfYQCS2AhsKiSx9f0vesZLrDcR0jhgRWT3wUWdffs7f1iwzU5CKzSBtZjprkLLIFFFT295Qqx0VD71s9+yzNcYLkuh6799J5bCwusl+\/f6OGNwMIUd4GFae7NUFRgxfk6D28EFqa4CyxMcxdYo3x8ygqBhcDCkFEElmGjZBlYQWBRd0MPWbFhyCgCq36zsF5\/+E7hU6BYlRJY8E\/2rZ8tNszAQmCVOrDeNAur\/OJcVRGBFeHs4Y3Aoqz2rJ7xe89ugVXrWVi\/+sFm4VPiwIrRDmm+T2z9engjsDADS2DRfWDtNKpBYAksBBZVsH9wzoue3QKr1rOwfrFzjfApUFx\/I7Dgn4gNM7AQWLUd1fC7n9wrfkoaWFcuXZXq+8TfUw9vBBZGNAgsug+sk41qqF9gdXPhs4c3AovyjmhYPNGzW2DVflTDqw\/cJn4KMrDyJoEF7\/n53TeKDSMaEFjeJKT4C5\/PmN6f+nvF+ToPccrsue3LxYY3CBFYlQish7xJWK\/A6uY+wvj76iGOwKJsnrjlsjc8swWWS5+p7IXPAguBhUueBRY9fpPwtz+6W\/yU8T7CqasEFi56xhuECKweB9bxaT\/oXnvwDvFTVGANRZP7CEFgNdXTWxaf5JktsBpzJ+Eru7aKn5JOc39u1w6BhcDCHYQIrB4H1mMOursuR2BRBfsH54qOhtm3fvZbntUCq1FX5jjoXpxz+txHCO4hdEUOAstBd3o6zb1v0QqBhcDCAXcElonuHEkEUxHT3COYPcRxTQ4muAsssguswya6m+buuhwEFmXy+Jq+dz2jBVbVA2tnmg+7X963TgDVbJq7hzjuIaQs9g\/OedEzWmBVPbCuSvuh98aP7xFBJRs2esJF16X+Pi9+d72HOaa4UwoHNi7Y7RktsKoeWCcbOFqjae5dDBs1zR2BRVk8tXnxRM9ogdXYgaPOYdVr2OjL92\/0MKeUnrl1iegwYBSBVcnAesg5LMNGDRvFFHfK4IlbLnvDs1lgOYflHFbpZmENrLxJYFErBzctFB7OXyGwnMOit4GVdhaWYaMYMorzVwIL57CMahhHXK8jsBBYOH+FwKrwOaxf7FwjgmoyC+t3P7nXwxxDRnH+SmCRcWDNdC9hPUY1fHzKCsNGEVhU8\/7BjZdv90wWWHULrOPTfvjF4WgRlHNgTV1VyCyseDPUA50yeX7HSuHRIE9vWXySZ7LAci\/he2ICuAgq16iGn95zq2GjGDKK+wcRWCUJrIG0H4JxfkcI5ScucS5iFla8tOChTpn8bNtS8dEQTw7OO+RZLLDqGlgTjGuox6iGvkUrzMLCkFEqNp5h0TzPYoFlXMMocc2KEMpPDA8tYlRDhLKHOmVyYMN88WE8AwLLuAaqParBLCzMwMJ4BoFFycY1vP7wnWKo4qMa4uojD3XKZM\/qGQLEeAYEVm0i6x1T3csnoqmIUQ0e6piBRZH+9uZL\/uDZK7BsE9omrMyohrRvEsbYDQ92yuCFu1YJENuDCCzbhLYJ8xUH15ME1pVLV5mFhRlY2B5EYNkm5Ehi9EKSwIrRDkY1UGXP3LpEgDSAZ67Ask1om7BSbxKeOq0\/1fd59YHbPNwxAwvbgwIL24TN8NyuHYW8SWhUA0Y0YHtQYFHCbUJDR6t96bNRDZTF3rUzRYi3BxFYtgndTVjONwnj4uf437ZvLb+hNW3esuEzWuNZcdlfjWvtwrmt3Tcufd8j65aJAYxowPagwKKIbUJ3E5bjTcK0jjl1YusjJ05I7IRTzm6dd+4Fw66ccelwkG1bevlwiP3dlhWiASMasD0osOjmbsKYpSSIsvH9rRuGRy7EylLSYaNpffT0i1IFVifOnDCpdfH5U4bj697rr7QChhEN7h5EYDUysHam\/YCMszwCKflB9rjYOVaqkm4HZunYs2blFlhHCq\/ZU7\/x\/hakyDCiQYjU1\/7BOS96xgqspgfWyWk\/IF\/ZtVU0dTh+IYLqhIuu61lQfSiwvra48MAaS3urMVa6Dm0fEB4NcnDTQiFSY09tXjzRM1Zgiay\/vvmwmVjZilWqM6b3J34rsCjHTb62FIE11iqX4DKigWp7fE3fu56tAos\/BtZVDrtnc5aqzFE1WhkDa6zgirNcznHVz57VM8RITR3YuGC3Z6vA4o+BdXzamVhxr13TwyoOqJdp+y\/vNwl7Jd5gjDNcsbolUIxooLyzr57esvgkz1aBRQYzsZp42D0Oq8dbf1VZrSr6TcIixJuKMSLCVqI3CDH7CoFV5sCakPbDskkXQNchrHr5JmGesWVlqzp+tm2pGKnt4fZF8zxTBRYZHnZvwmT3vkUrahFWZXuTMI9tRGMgXPKMw+0Cyw+hFofdX33gtlqPWShqAKg3CbNzyulfHT4gb8K8NwhxuF1gUdnD7r+8b10ttwOLurqmWxGA8Xsded\/gtAUrW\/3Xr\/7APYWjjbxzMIy+lzBWg9pX40Sw2ELEG4Q43C6wKHiy++sP32nVqkdiKnyaP2dceZTm73U7yGIqe4RYBFiMVKjKqpaD8b3z87tvFCQmtyOwTHZv4siGXqxaRSDFqlMMKI15WvH7SPQ1pq5K9WeNFxSyfoDGllx7NSxWjsoaXrE6Z76WNwgxuV1gUYmRDb\/54V2V3hIsap7VqdP6hw\/Nt2NqLEl\/L0f6WuOJs3NFPVjbK14RXWXabozVN4fi3UGI0QwCiyICa3LTRjZEnOT6huDQ144p77FC1envaXgqfILvEQNPk\/65I4h79aCNla6YYxUrSWUIrvg9xO9HBOXrwIb5oqRmDm5aOODZKbDoPLIONWXwaERPXnGVNKpGT4hP+r2Sfo8Yr1GWB+\/I4IpxC70OLee0vEHI0e1dO+ttz0yBRUEjG6q0ipU0Yjp9oy\/OU8WWY9eragm+b2wppvk+8QZoGR\/EcT4qLn7u1RmuiDwH4l2Rg9EMAos8IuvNOq9iZR1XEVZptumOJOnKWpqoe\/n+jaV\/KMfqVpzf6kVsCa3sPL9jpSipkT2rZ\/zes1JgYRUrv7gaiqCsw6otDsMn+b2k2Y789e5tlXpI9yq2hJYrcrB6JbCwilVQXGWxFXgkw\/ceJvz9VOmgexaxFduIRR6Sdxg+vYObFgoTq1cILN4LrIE6rWJl9bZgzK1KMxYhzcDTvAeOlumgezdiUnsckBdaDriTvyc3zH\/UM1Jg0aPrc8q2ivXTe27NJK7SrBJ1dQ4r4e+vyInuZRRbeLGFWNSqljlaDri7FgeBRdrI2lKHVaxuh4jGIfYiVq1Gi1WpJL\/PWPUqw0T3sqxqxWDTou47dLG0A+6NWL0anHfIs1FgYRUrk+tvIs7yPGvV63NYRU5079VZraLma8WZMAfhHXC3eoXAovarWMODRLscFtrri6fzPof12x\/d3YiHfIRPvAmY9\/ZhhFxsUworB9ytXiGwqOUqVqw6dXPuqtdxVeQ5rKY98OOAet6hFaMknM\/6o71rZwoUq1cILLKei\/XS9wZ7EiZJ50iVMa6KOocVf4+a+OAvIrScz3LA3dwrBBa5zcWKeUtV2RosU1ylOYcVZ87qPnA0j9DKc3hpe1BpE3+2z21fLlDMvUJgkdcqVowCKHJrMN76Szvjqmzzu5Kew0pzL+HrD99pK6uAFa342k3bNnzm1iUixeoVAosOIutw2g\/a1x68o5QrPmV4WzDrc1hJ\/xx1GThaldCKtxqb8rbh\/sG5IqXCHl\/T965nn8CimMCanPaD9pf3rRt+kJfyYPvQX9OLOVedOmnKNbnfS1ingaNVCK3YNmzCNPg9q2cIlQo7uGnhgGefwKK4yDqU9sM2zvrkGSJxfirN6lVeFzZnpW\/RitzPkb2ya6uoOsJ4h7zmaMU0+Loegn\/hrlUipcL2rp31tmeewKLYwDq5mw\/dvMY2DF+HkyKu4m3DMsfV+\/coJpw8n\/R7xBauoDpyaOV532EdD8EbMFptT21ePNEzT2BRfGQ9lPZD9+X7N+YSIefN7E+1NVjWc1ejJT24n3TLM8JXSHU2GT5WnfKanfXIumUGjNJzT9xy2RuedQKLCg4fzXpsQ9qzV7H1VoW4SrP9mebPFufkRFRn4m3AvM5n1eXKHQNGDRVFYJEusgbKcuA96RmltNtovRTnxPIeOVHXi5\/zlNf5rKqPdPj53TeKlapeibNh\/qOecQKLCg8fzfLAe5q5V2kmnvfS8CpdzuManMMq3\/msqq5mPXt7v1gxVBSBRS\/GNoS4aLjoQZxlHSjaiZjVlee4Buewut82zGMifBVXs5y\/MpYBgUX3kfVYL+8pTDOaoWqrV0WOazAPq7zbhlVazXL+qnr2rZ\/9lmeawKJGB95ffeC21MHx0kPfTny4vWpnr7oZ1xA\/G\/Oweve2YVz03MTVLOevHGxHYFGCA++\/2Lkm9WysZf2rajdUtNfjGtxLmK17r78yl7cNy7ya5fyVg+0ILEoy4T3tVmHi7cEKzb0azzl9yxL9mePXu5ew94fgI4jyWM0q49ws569MbEdgkW1gTejmQznNZdBJtwfTnEkqmzi4nveWaASvMKrOIfiyTYF3\/qpqE9sXzfMME1iUP7K2FLVVmObtwaoebu82LJNuE8YIDUGU7yH4uk6Bd\/9gxbYGB+cd8uwSWDRgNlaSrcKkV+NU+XB70VPdY3yGEMpXxFAdV7PcP2jmFQKLks7G6vStwk9eeG2uZ5HqNNU95mcl\/R6xoiiEqjnSIcIt3mLsxZ\/nwIb54sXMKwQWOUbWzm62Co82gHR4PEPC7cGkQzfrNtX9p\/fc6tqcBl0gHdG2duHc4v8sN08XLxWwf3DOi55VAovqzsY6nPZDOoZdZn3+qi5x1XbqtHy3CV2bU7wIoqxXsyLcilrNen7HSvFSka1BM68EFg1+q\/BIdxV+fc7yRlyN08ttQuMa6rWaFfO48v69P3PrEgHjrUEEFmV\/qzD85od3ZbJ6E0FWt8AqYpvQuIZ6vWkYk+XzHE66b\/1sAeOtQQQWBUbW4W7OY8VKSrfTzOsynqHo0IwXDsROvd40zGs1y\/U45ff4mr53PZMEFvUKrJO7uatw9OiGNAfcX\/qbe2sZWEm3CZOOqoi5ZEKnnqtZWV+1YzxD+e8afGrz4omeSQKL+kXWVVmdx0p6wP0TU1fUMq7SbhMmHToaLxyInHquZmV5cbTxDOV2YOOC3Z5FAov6RtZjWZzHSrpqE9todQ2sNNuESeeBvbJrq8ApkTzuNMxiNct4hvLat372W55BAov6j254s9vzWEnfIKzjAfci7yY01b2cdxrG6lNZLo42nsFIBgQWFR\/dENtVp027prEDRrO6mzDpz+SX960TNiUTK055rGaluWrn4KaFYsZIBgQWJYisgW4eLF88f443CLu8mzB+vW3C+qxm5XHVTpLVrD2rZ4iZMo5k2DD\/Uc8cgYXzWB2LrYxjz+48suIgeN0DK81k+yQ\/F9uE5V\/NihlXvVjNeuGuVWLGuSsEFnU4j9X+8D9u0pJGXpEznqSzweJlAduE9RLzrYpezTK93bkrBBblPI\/1TtrA+shnzm4dN\/naTA90V9l5M\/tzvTrHNmF1VrOyvmqnvZo11puGe9fOFDWlm3fl3JXA8kMQWQnnY8V\/SY\/80D\/m1Imt46fc0Kg7CMcT1+DkeXWObUIXR4+em2V70LwrBBbljqydSQ70jv7QP+a0yQLrPZ+88NpcZ2LZJnRx9Mi5WbYHy2X\/4JwXPVMQWIyOrENpAyt89IxpAivFENYY75Dk68dEfeHiqp32nYZLvjFR2JTE3rWz3vYsQWCR+tD7eIEVjj1rVuOGjI55dU7CmVhJDru7m9BVO21\/euKXWn\/yyc+0jj\/pz1s7Fk8WOQ61I7Co8qH3IwXWcGSdu6DRgZVmJlbSVT53E1rNCv\/q0\/9hOLDCP\/vkSa0zz\/yPYsehdgQWJY6smd0E1ujxDU0MrLjMOc\/D7q89eIdQsZrV+uef+uz7gdX2Lz\/92Vb\/9P8kfAp0cOPl2z07EFh0Pel929LLj\/7hP2J8QxMDK8QIhrwmu8d9kCKl2atZ\/\/en\/+OH4mqk\/+fU01rfvfoCAWRSOwKLEkbWQ109EN6LrKYGVprD7kkmu\/\/qB5sFSoNXs\/7lp047YmDZNszfE7dc9oZnBQKLzK7TSfRf3EORden8\/kYGVprD7n2LOh\/K+vrDd4qTBq9m\/bNPnnzUwGr7F5\/+bGvxxeeKItfgILAo2ZuFh0dfBZLkv7RvmHfZ8JZWEyNrwvRrEgVW0qn3ZmI1czXr33z6ix3H1Ugf\/cyft1b1fU0gdenxNX3vemMQgUXmkdXJIffR13vEW29NjKw0k90HVt5kJhZHXM36F5\/6XKrAajvxc\/\/BWAfjGBBYlG18Q5rAir8uIquJq1gxgiGvkQ1mYjVvCvyfnnjm8NmqbgKr7dTTT289cN2Fwsk4BgQWZYispIEVV3q0HxhxMLtpgRUrUklXsWLMQ6df\/+X7N4qRBt1p+K8\/fXomcTX6ILzQElcILHocWUkDK\/4LfOTDoomRFWer8hrZ4LB7M8S9gxefP6X1f33qzzMNLKHVGXGFwCJ331+15Ob2f02nCawmRla8HZjn4FGH3ZvhhbtWDQ8RjbcC84iskaFlhtY\/ObBxwW6f\/QgsCjHn4kt2dxNYTYusNCMbzunr\/CzWqw\/cJkAa4OktVww\/8B+5YepwBGV1FstheHGFwKKCkXXK6V8d94HRpLcLz5vZn9vgUZPdm2HP6hkfePhH\/Bx\/0udyjaz2ZdJNvH5HXCGwKH1kHemh0ZTISjOyIckUfJPd6+3Z2\/vHDYErLj43123DkQNLz\/uLMxtxTktcIbCoRGQd7eHRlMiKw+t5rWIZ2VBv+wfnHjUKitg2HLl9WNfp8OIKgUVlIivePBRZ97Uevn1jrqtYL31vUIzU9HB7p3Hw3asvHI6fIiKrvar1uS98obX2soniCgQWRUdWJ4EV4m243\/7o7lpH1klTrsltFes3P7xLkNT4cHsSWxf85fDVOEWFVh1iS1whsKhcZMWgxE4fJr\/YuabWkbVtzdpcV7GMbKjhRPebp6eOhjic\/qf\/\/tRCQyv880+dNLyS1nf+VypxZktcIbCoZGS1r8tJElkxQNP1OclXsV578A5RUiM\/27Y0k4CYNvErhRyEH8+\/+bNThle3IrjKMvohwi9W28QVAovKRtZ4s7COJmLBKpZVrCbbu3ZmplHR69AaOdA0tjDjYH78nmKl7Scrp+QWU\/H15174F8Pf7xOfPW34ZxC\/h0lf\/Ytf+8xGYFEpV\/f1fac98f3MCZNSP2Be2bXVKpZVrEZ6bvvy3IKjLKE1lgivEFuMEURtEUnjGfnrYqWs\/TXGe6sy\/v\/r+r7+lM9qBBaVtOTSS+ed8Nmz\/9DJqIYjiRlPdXvD0CoWWYxmqHNo5bl61vf1iff5jEZgUYvIemTdsq4eNnUc42AViyxGM2QhhpUW\/dZhL0RMiisEFrWxftG8Sx7deP2r3T506vaGYZpVrAmXXmcVqwEObJjfk4Pfq\/rOK3SOVtEH7XdcPWOlz2QEFrUy9NA4fsjhLB4+dTr8nngVa0hcu2MVq75+fveNPX\/DLgaWxnmmumwfxqiKRd+Y\/DWfxQgs6hxZj2XxEIpzWU1dxfr8JVaxDBYtTrx9F2\/eVTWuPv250\/\/301sWn+QzGIFFE0LroSweRHU5l5VmFSvCzCpWPVevuhksmvfcqLjsObbaqhJXZ5x55v\/ymYvAommRNZDFAynOZcUVMVUOrPs3rkscWBFlVrGsXvVKDAste2xNPPfsN33WIrBoamTNHPJOFg+mX+\/eVunIOmN6f+LIunLpqo6+dkzFFy9Wr\/KOrbK8hRhjGK7+5uTHfMYisGh6ZE0Y8mYWD6iXvjdY2S3DOLieNLA+lmBsQ\/xsRIzVqyK2EePMVgz7\/FcnntKTNwX7L71wk89WBBb80+H3Q03fMjxvZn9uw0djvIWIsXrVi7cR28GV9wrXxz\/7+f\/jTUEEFowdWjuzemBVccswVqNimGjSyPrhnZ1dJxRvXooZq1e9Fhcsj7wXMIvw+sKXzvwHn6EILDhyZF2V1bmseMuwaoNJL53fn9uB99g+jRU+QWP1qqzbi+27BeNM11h3C45lysRzD\/vsRGBBweeyIihefeC2SkXWJy5MPrZh2XU3dfS1Y2VP1Fi9qoM9q2f8\/qnNi+b5zERgQY+GkrYPwL\/x43tqO3w0yT2FsbInbMpz56DVq+T2rZ\/9luGhCCwowbysqq1mnTTlmtzuKYyXAMRNs+8crLInN8x\/1GcjAgtKtmVYldWs4bENU27IbcL7K7u2Cpwee37HSsFkSxCBBfXaMqzCalaMYEgaWB+fsqKjrUIH3ntv3\/rZwsmWIAIL6veWYXs1q6xvGr700LeHgylpZJ3Tt8yE95J79vZ+4dSBv735kj8c2Lhgt88+BBYUE1knDzmc5QMv3q4r4xT4VAfeE2wVvnz\/RsHTA3tWzxBQR\/H4mr53n9q8eKLPPAQWFB9aW7J86MWlyLGqU7bI+sK0q20VGsvQrIPsg\/MO+YxDYEHvD8BnuppVtkPwaSe8f\/4SbxUay1CxVau1ff\/oIDsCC8p1AH5n1g\/DeNOuLNuGy\/pXpdoqHFh5k7cKS2T\/4FwhNY79g3NedJAdgQXlDK3JWY5zKNvbhmlmY8XKV4x8MIDUwfYyj184uGnhgM8wBBY07GxWWc5nPfGd21JtFX5q6vKOvn5sizqPld99gw62O2uFwIK6nM06lPWDMs5nxZmlXkXWFVctT7VVOHH29UY39NDBTQsF1Qh7185621krBBZU\/6qdd+oUWqm2Coesv2mN81g98Nz25aJqxFwrV90gsMAU+KOKOVJFv3GY9q3CJOexzMeyNWgaOwgs6Nkh+LZf\/WBzoRPh13\/rplSrWCdcdF3rpb+5t6P5WA69u8zZIXYQWNDzbcOitw4nTE+3VXjG9H6H3r01aDsQBBbktm34UF4P1yJCK+4qjBWpNJE1b8mqjr5HrMqJrHRbg00eKPrELZe9YTsQgQXNDq2T83jbcOR4h9cevCO3yPr+1g2t46fckOuhd28WJrdv\/ewGvx3o\/kDwQ4APns86nGdo5XWh9Nwrrk8VWHHoPQKtk+8RkSic3DV4pIuZnbMCgQVHCq2r8joIn+eB+NOmpTuP9bGhyOrkUmiRZSTDeAfYD2xcsNtnBwgsSBJa7+T5MI639CJasljV6uY8Vvx1IstFzkkPsAsrEFjQzUH4LXmHVhwiz2JV6+HbN6abjzXkxGkrOv4+ImvsQ+17185sxpuBg\/MOOcAOAgsqE1rts1pxuXTa4aXfWp7uwHuS8Q3eLvyw\/YNzhRUgsKCL0BrI+4zWyCnxabYQp81bVlhkRRC6Z3Bhrc9YxSwrYQUCC2pzGH50bMW4hLwPvSeNrKZPfP\/ZtqUOrwMCC3IKrUNFPtQ7Wdnq5tB70shq6gXRdYyrmGMlrEBgQdnmaD1U9EM+Ymu8M1tPfOe21scuur6wyIoVtqacy3p+x8pavTEYk9fNsQKBBWWfDL+ziAPxY419iJWkkVf0DE96T\/lmYZrIitCLa4LEVTUOru8fnPOiyesgsKBqB+KvynM6fKerW1sGvpX6Op00kdUe5VDH1aw6xFVMXY9tQAfXQWBB1WNrwnvbh+\/0Kgxuu2ZR65jTJreOPWtW67hJSxJH1imXXN\/xMNKRB+DrdDarynEVq1WxDfjU5kXz\/DsJAgusamVo29LLWx85ccL7jjl1YuujZ85oHXvugtZxk6\/NdOL76G3DGKRa9StwqhhXVqtAYEFTz2q9WWQozJ76jQ9E1mixyvV+dI2x0vWJqSs6viB6vNCq2tZh1d4WjBELzlaBwAKx9dc3zyxyC\/FokfWh6IqVrtMvGt5ejPD6t5OuaG1bszb1lT6xdRhntKpwGP6ZW5dUagvw4MbLt\/t3CgQWMH5slSqyxrJu8fzhSIpVqV\/v3jYcTfEGY5I7FduxFV+jTFPh427BAxvmV2O8gqgCgQWUZ2Uri8iKr3Fo+8ARR0dEhIWIsLZ4uzFibLQIrvjf9q+LNyHbf31RcfXCXatKe3GzlSoQWEA+sfVm2SLrzAmTWo+sW1aLNwWfvb2\/dIfZ40yVqAKBBRQz9mFLVm8jZhFZJ5xydmvtwrmVDavYEizTpc3x9t+Tg\/MOGasAAgvo3eiHrle3Vlz2V11HVjjv3Ataf7dlReVGMOxZPaM0q1RGKoDAAso5\/uGqNME1ek5W3Vez4qzV\/sG5PQ2qmFFlnAIILKC6wbWzky3FiKwIpDqvZsV24NNbrij0rFVs+cVsKkEFAguob3RNfu8M12NjrXLFgfWsIivE9uOR3jSsW1jF6tS+9bPfijNUBzctHPDPHAgsoLnnuCK6Bt7bWjwUK0\/xdmBWkRXBFqtjvdoKjAPseYTV3rWz3o6tvic3zH80Ysr5KUBgAUe0o3\/RlxZ\/c8bAvGnT98266Bv\/48tnTXr7i1867x+7Ca1TTv9qIaEVq1Vxxc2+9bMzWZGKkIotvvaqlG0+QGABmVu\/aN4lEV9Dfjz9gosPXXrhtN9FgJ39lb\/8h16FVrwNGFuASYeExvmoCKj2tl57NcqIBEBgAaXzXweunvRehA1cP3vWAxFibRefP+V\/RpDF\/z74n6\/5+9iWPNpbjxFQbRFSId4CjKBqrzKNNhxMbe+Fk3gCBBYAgMACABBYAAAILAAAgQUAILAAABBYAAACCwBAYAEAILAAAAQWAIDAAgBAYAEACCwAAIEFACCwAAAQWAAAAgsAQGABACCwAAAEFgCAwAIAQGABAAgsAACBBQCAwAIAEFgAAAILAEBgAQAgsAAABBYAgMACAEBgAQAILAAAgQUAgMACABBYAAACCwAAgQUAILAAAAQWAIDAAgBAYAEACCwAAIEFAIDAAgAQWAAAAgsAAIEFACCwAAAEFgCAwPJDAAAQWAAAAgsAQGABACCwAAAEFgCAwAIAQGABAAgsAACBBQCAwAIAEFgAAAILAEBgAQAgsAAABBYAgMACAEBgAQAILAAAgQUAgMACABBYAAACCwAAgQUAILAAAAQWAIDAAgBAYAEACCwAAIEFAIDAAgAQWAAANfL\/A\/r3uVmPsB5WAAAAAElFTkSuQmCC","width":140}
%---
%[text:image:4769]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j4gbEASHJNlwZYtW\/93dHTixDCDQTRMDKRn8FhATBDNmTOH\/CAiBI4cOQI2HETTLBW9fv2a\/FRUtPXVf\/WeuyRhkB6iLQBp2HLvP0kYpGfUglELhpMFNM9oNKlw6FHp06TZAgAoeVix9Bg9oQAAAABJRU5ErkJggg==","width":24}
%---
%[text:image:857c]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:896a]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[text:image:7792]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:362e]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:05d0]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:569e]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:slider:1507]
%   data: {"defaultValue":6,"label":"Choose a point, t=a: ","max":20,"min":0,"run":"Section","runOn":"ValueChanged","step":0.1}
%---
%[control:slider:8bf1]
%   data: {"defaultValue":3,"label":"Select the radius, Δt, around a: ","max":10,"min":1,"run":"Section","runOn":"ValueChanging","step":1}
%---
%[control:button:4d83]
%   data: {"label":"Generate Coffee Plot","run":"Section"}
%---
%[control:slider:1076]
%   data: {"defaultValue":0.5,"label":"Time t = ","max":1.2,"min":0,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:button:348d]
%   data: {"label":"Generate Basketball Plot","run":"Section"}
%---
%[control:button:44ae]
%   data: {"label":"Generate Model","run":"Section"}
%---
%[control:slider:7f76]
%   data: {"defaultValue":2.5,"label":"h = ","max":2.5,"min":-2.5,"run":"Section","runOn":"ValueChanging","step":0.2}
%---
%[control:button:0691]
%   data: {"label":"Generate Graph","run":"Section"}
%---
%[text:image:1234]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:editfield:60ae]
%   data: {"defaultValue":" x^3","label":"Enter f(x) here ","run":"Section","valueType":"MATLAB code"}
%---
%[text:image:1371]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[control:button:9021]
%   data: {"label":"Interpret f(x) and graph","run":"Section"}
%---
%[control:slider:92f5]
%   data: {"defaultValue":1,"label":"Pick a value for x1: ","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:457d]
%   data: {"defaultValue":-4,"label":"Pick a value for x2: ","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[text:image:64cb]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:6c5d]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[control:slider:519f]
%   data: {"defaultValue":3,"label":"At the point x = ","max":25,"min":0,"run":"Section","runOn":"ValueChanging","step":1}
%---
%[control:button:8410]
%   data: {"label":"Run","run":"Section"}
%---
%[text:image:71bf]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[control:editfield:53c5]
%   data: {"defaultValue":" exp(x)*cos(x)+x^2","label":"Define a function g(x) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:slider:857c]
%   data: {"defaultValue":-3,"label":"Select a point x=a: ","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:button:7259]
%   data: {"label":"Graph","run":"Section"}
%---
%[text:image:9ee5]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:dropdown:5288]
%   data: {"defaultValue":"\"undefined\"","itemLabels":["undefined","positive","negative","zero"],"items":["\"undefined\"","\"positive\"","\"negative\"","\"zero\""],"label":"The slope at x=a is ","run":"Section"}
%---
%[control:button:4c67]
%   data: {"label":"Check Answer","run":"Section"}
%---
%[text:image:5d6e]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:5b36]
%   data: {"label":"Create graph","run":"Section"}
%---
%[control:editfield:540f]
%   data: {"defaultValue":0,"label":" x =","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:955c]
%   data: {"defaultValue":0,"label":" x =","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:71cf]
%   data: {"defaultValue":0,"label":" x =","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:765a]
%   data: {"defaultValue":0,"label":" x =","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:7dfe]
%   data: {"defaultValue":0,"label":"x = ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:6e6f]
%   data: {"defaultValue":0,"label":"x = ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:0227]
%   data: {"defaultValue":0,"label":"x1 = ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:7383]
%   data: {"defaultValue":0,"label":"x2 = ","run":"Nothing","valueType":"Double"}
%---
%[control:button:512d]
%   data: {"label":"Check Answers","run":"Section"}
%---
%[text:image:545f]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:6488]
%   data: {"align":"baseline","height":81,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAU0AAABHCAYAAACDHBUWAAAJ0klEQVR42u2dS2wVVRjH23tLoSUtLU8XLEoNe5LGfRO7kwWbuiYuupCYuKu4sYmJdoduMLBQMcEFQoLRGEgxIRGCDySIoCgpkYgSAlQCpFBuyzj\/oV9z7rnzOHPvmbnz+E\/yz72dex5zpt\/53e+c8525HY7jdFAURVFm4k2gKIoiNCmKoghNiqIoQpOiKIrQpJ7f3I6OUVdTFJWiRtn3CM08Q3OqY8M2p2P7yxSVvGBrrs2x7xGa+YYmjPmV9ykqecHWCE1Ck9CkKEKT0CQ0KYrQJDQpQpMiNAlNitCkCE2K0CQ0KUKTIjQJTYrQJDQJTUKToghNQjN7cBsgNKkyQ3N5N9EAeUBoGqla6Xz0wrquD2wbDaFJ5Qiazuquzid9ayrTZAKhaWQwI0M9NRjNxr7q64QmVUZoHprY6vWD\/p7KfZv9gNAsKDR\/n95u3WgITSpP0EQfkH7gjryWXK9zzj2\/m4wgNEMNBnpvfIuzpb+rtnZ15W4rT40hNKk8QlPvBy5Ar\/LpSQbQxE3Mi2xD05bREJpUnqEp2rtzk+M6EEvu6Otyq\/AsAldCG5eHI0loQj++86KzZ2y909tdWRxcW73opt1BaFJlgqbaD3q6K7XN\/V1n3PRDzdaTd64QmgYGoxvN1vWrTpgYDaFJFQWaej9AetN+QGiWFJqq0ewa6ffqXddbPRoWppQWNHe88bFz5cYd54+b94z00TcXSgOS6S\/OlafNKUBTdGpyaKUfxAnXIzRLCE3daNas6lwIMpq0oDn61mFnobZofM9+uX67ULDAl4bf+bcPna5rN\/4mNO31AdN+QGgSmg1G89Jwz0pgsGo0aULz8UKtVNDcve9rz7vGgVe\/NCcvXK9r99nfbhKaCfQBNVwP\/WCgt7qX0CQ0jY1GjfFsFzS\/v\/qP8+GXPwUKwMk7IDDklmP21n++aXa9e6zOVvA3oZlcHzCJdSY0CU1fo0FgMIzGLfd4O6A5dfi7ws\/fmUBTwIkvisIDMyPQVMP10A+WY513NcuV8+fPO0eOHPFeCc2CQlM1GsS2lRGaA6\/u865J1EreoPym0Iw7N6rWi2tJu\/1FgWZQrLMpV2ZnZ52RkRE9brLuswMHDhhzYnp62suDvIRmRqEJeaEZGYUm0qhHUOf++dqtwLlQvQzA4qsfrnnv5Xrmn9S891GLMKgfc46St7a45An5cZy+dMMZem2\/kU1gekLKNGkjpivuPphfqVO9frQ5KJ\/N9hcVmmpf8JwIQ64IMPE6OTnpTExM1H02ODjozM3NGXMCaaU8QpPQbBmayNuMRwfYqMd8yGIUVveDwn5wXmAV+r9208ZZ6NLvi95GQA5fClGRB09rS86e\/Sd9YWuj\/WWApoTrmXAFQ3HxLnUwwrvEeXiOcQ\/AF3kx3C89NG2I0IwPTd2TqxteuWlxqDDEe72ez09fqYOWpJeYUhxLz56trHzH9TTDoOkHTKzEA7pzDx83XJc+L2qj\/QlAM1N9QJcJVwSMfl6heKBxvMxmvM22QDNsAndmZsb7zHR+Iapxafyz8wRNdHh0Wj+JF2YLmioUFpeeecNomQvE67GzV+vSYPgalD8olhIenQ4skznNMGiiTLXuv27fb4j31IGOIbzN9icFzaz2BxNogg0YigvcwAnxDMELnB8bG2uaM8iLMqLY0xZoyreFPveAhsh5QrM9cZo2oanWq0NFwPHk6WId0OUzibOU4WucUKhWofn3nQd1w++gAHl8yahQVK+x1fYTmo0HuODnBYMbGJLrQ\/O4nJEyohaR2jY8F6qPj4+vnBseHja6aEIzf9AMmhZQ4Sj1Ayb6sNh2yFEQNLGgpHp\/YUHv8HBVb1P3lJttP6EZ7GyBF+JpAnIQgCgeKIDYLGfgeeK8urCUKWiiofLNgYuViVi1cYSmfWh+eupSQ9iOHgKTBDSDyvjs218boKHnxR7xtKAZt271QL022k9ohocH+XFC4KhDMw5nxAONYlBbF4JUN9nPjSY0870Q1Ao0W1kgaRWaJqFIIgyp\/eoiNNOFpiwCtcIZSRe1GNT21XNxt02X+wnNckETR9ytnTahGVU3Pc3sQ9OUM7mBpswvmMwlEJrpQPPNg6eMPL1\/7z1MDJrqXOEnM5dShaYEzUfVrQfUq\/OfhGY2hudxOCMxoJkensvkrTQ4rNGEZnrQ1MNl\/Ob19MUam9DUy8YKc5xtiyo0AfY40NTrDlvRxn0JCokiNNOFpniSfvww5UzmF4LUeQbML8jNsDmvSWg2B019BRnhMjq0EGOYFDQhxDTq5QeBUz+vhgLh8MsXdn2y3VE8bcRk+u1FV8OFcOC+EZrtgaZfyFFczsgiUSZDjvQVLX1ewtYKOncENf\/ADoBSBQcCvDFsh\/AecYlJQhNQ0rcaojwMlxHqI08ownUC4GqZOK9eOwCMdsMzDFolV69Pr1vKkAgDlKMCE\/dC98azCs2s7ggy3UYZBE2\/4Pa4nJHzmQxuF1dabaDacFuLQtx73jw09RjEyC9CbRhrAxrY022y79yvbh3qevujrs+vbqR\/ML\/gBbyrwPSbN80oNHP\/wI4gaPpto4zDGT\/oZm4bJdxmv2E4Lh6f2doRRGjWz0\/GeTRc0MMyxPM8fu7PwA6v19ssNABvebKR3yEA0\/PB+\/SDPrxQ0+uLqjtsochW+\/louMZRahAf9Ad2xOGMDM1N1lT4lKOCP08T82wYOsqT2ePGPCI95vjkIRlYIZYwHAxjpVx9eKrXq8736eUHlaHOWaJO\/ESF+iNwuC5MFwSVjTyY31TTqzt\/TK4PdaMOtBtlwKvELh7kDcpju\/18CLH50cxDOwBODONNvExCswRPbqeoMv3cBQCIYXmc6T14pshjClpCs+C\/EURR\/GG19LhCaBbg1ygpij\/hS2hmHppZ+t1zikobmmL\/yGcCS0KzxNBErJkYy7re6tEwYyE0qaJBE\/bvRYW46beuX3XCfR2KWw+hWRJoirH0dFdqpsZCaFJFgaZq\/5v7u87EhSWhWSJoirH0dlcWB9dWL7ppd8Qol9Ckcg\/NvTs3eeFzG\/uqlxFr2WpfKzQ086KkoKkH5jZRLqFJ5Raardp\/UbnSYeNG5F26wYixLAfmjrZQLqFJ5Q6aEmvct6Yy557fTUYQmoEGExWYS2hSRYambfsnNAsOTQnMtWkshCaVJ2hKrDGZQGhGqlrpfBQn1ozQpAoIzSnb9k9oFtvTHEioXEKTygU0KUIzKzAmNClCk9CkCE2K0CQ0KUKTIjQpQpPQpAhNitAkNCmK0CQ0CU2KIjQJTUKT0KQITUKTigXNDdueGzNFJS3YGqFJaOYcmqPLOy0oKi2Nsu8RmhRFUYQmRVEUoUlRFEVoUhRFUaL\/AdskP7rZYM9nAAAAAElFTkSuQmCC","width":380}
%---
%[text:image:13b3]
%   data: {"align":"baseline","height":93,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAU0AAABHCAYAAACDHBUWAAAKeUlEQVR42u2dTWwVVRTH2\/fKR1spLSpoQkxT48YVSePKDYndyYJNXakhLrqQaNxV3Ehiol2YoInB4AKDCS5AYsRPUkxIFI1QEVEExRJBAvJVvuWjLeP7v3Ce513uzNyZzkzfvPnf5B\/Km5k3d86753fPPffOTIvneS0URVGUm2gEiqIoQpOiKIrQpCiKIjQpiqIITYqiKEKToiiKohEoiqIITYqiKEKToiiK0KQoiiI0KYqiCE2KoiiKRqAoiiI0KYqiCE2KoihCM7eGa2npzvBcHtVcmkFb6KX\/EZq5VLnUevWBhW1vZQHPqqM9+QbVLJoZNL177ylvzLLTpgjNxEDW39s+Oa+t9cZ9C8rPE5pUVtBc2d\/lzZ\/TejOrTpsiNBMD2aGRR7xNQ0ur8OxqL11MC56EJqHp1+6y6LQpQjNRaIpeH1ziLelqm+ycVzpX2bac0KTShKYI8KxEnNML5pcmKttWFjGPnltoFs3IZuM14VlpyIeTgiehSWhm3e7u1LHhS+6hWSQj+zVeaM+rD3urBxZ5HXNLUz2d5f2VfZcRmlSa0BQZ7a6X\/kxo5gKaJjzb55Ymly6a81XcRkxoEppx2h32XdzVtj1OuyM0Cc1ZgaZuxJjxxDELO8ofRZ3xJDQJzTjtbudwb+yZdkKT0JxVaM60EROahOZM291jfe0eZtoXzC+N0J9zBs3x8XFvw4YN3sjIiDc6OlooaPo14jB4EpqEZhLtLsryuCB\/nm0fLhQ0h4aGbDPZtTI8POz19\/dH\/iHwA+I4\/JsHaEZtxIQmoZlku5OZ9p7O8nG\/mXY\/fw7zYfgg\/HjLli2Z+HZTQxMXLUYeGBioGn9wcLC2HcaUbVHLxMSE19PTUxV6wbxA01xrB3hWvndVHGiuWveZ98HXv3gHj531xk9dqNOeP056I1u\/95a9sDFTOHy+909vxdqtDQOrhqnPLENTw7NzXmm60mH\/asLT5s9hPgw\/lO0acmn6dlNDs6+vr3qB2si27WNjY7HCdPlB\/b6\/kaEZFgG4QPP3E+dDbXRzcsr76\/RFb\/nLm1MHw9iRU7XzZgmqla9tq3YgjVKfRoZm0AoPmz+H+bDAEYDLyrebFpq6BzLDdhR8Frcn0gU\/Fr4nKNpsZGiaEYAsVI4DzRu3prxL125U\/56avl23bXJq2gqWJHXy\/JX\/G\/2XP6UOIkTRKNO3b1ej69muT16gaVvhceeBIJF8GAU5TmxHBJqVbzctNNHDiMFtOQ0Y1Azp4xTkTfA9+DfP0DQjgKjQXLv5m7ptvc+trw7PEWlqcKYZceKcpy9e8\/4+e7n6d9ogwrXgmqoTFRZoZl2fvEHTXOFh+nOYD6Mg92hGlGn7dlNCE72OhOcQ\/oZxIX3hEHoz3WthHxhdf65\/DGzXvZoMD3COIGgmpTQbr4bnTKGpozFEoFKQ\/\/QDHiAk6n5qnRMkZf80okhdHxv0wqCZRqcQ1UYamo3e7rQ\/u\/iwRKJmRJm2bzclNKX38bkH3NcYkgC25TJkGGBLDtt+JHM7IrgsGl6SDTgJaJpwwbBdTw7B8XcdOFZnL+yDCPWVTbt8z\/fuF\/vqbVzZDiBLeem9nXXbbRNSb3+yt7b9TCUilMmtiSvX70ovoLw\/eqB2bFBBPc36wAYynI9apyg2CoJmHtqcqw\/LMiREgdofs\/DtpoQmLlzyGpIPQfguBhEj2ZK8+jgZEuA42wydmXT2G0IUHZqQ5DpRxNEBAwxd9fD9+s3J2v+RK9RQQDSnt5nQ1NsBKcDPBjyRbL81OV07j1kfgb2ASr4nqBw\/c8laH31O1zpFtVGzQDPMh\/1KFr5diJymOYMWloeEwaXnQQ8jvZ5fYjksh0Jo1kddWKaEzz794UjtM4ABs9CAC2AiUEQ0JcNQDSEBC5Y2\/XjklBVSgEkt0qjAyBx+62hSzoFjkE5AHWQYvG334Tp4Yl9EhKi\/fI5OAZM90Or1O3yhGbVOUW3ULNAM8+G4cwxJ+HYhoSmLZf0Mq0N56WnEyEE\/BHo5QtMu7fz4G\/k5AY7N6TVkZdZdQwjHmMNbE1I4h9\/+gI6UHfuO1qULbADSM+ECwLCcpg2aUeoUx0ZFh2YWvl1IaIohgma8dSgfNPQmNN2guf\/o6bpIU+ccz13+txaliX429jch9OGug06Q0ufVx0i6wG9GHxEd9sc1YgZcF7nWONCMUqc4Nio6NLPwbQ7PHY4PWifG4bkbNHWkhqVIcHrXIhMrGkIAigukAD8Z8mLYbcLONkTGYnwzZ5okNF3rFMdGHJ6n79uFhGZQsticvZNQPiiE50RQMDT1MFOiKD1cD707487CcD8IhUFKljzh3ACWPjcArofmepIFBbD\/7tCJuomsmULTtU5xbFR0aGbh24WEpoTnes2XrbeCwTC75rdUgUuO3KCpl8sAPubSGttQ26a40DRzhXrdqF5\/iUkagSDgqfONtmudCTRd6hTHRnmFJp6FkAQ0s\/DtQkJT357ldy+r7l30QwPMaFLOY977SmjeDSIMSSWK0kNUgNRloXZcaJqz0jL0Rm5RH7\/7txO+kZte9pMENF3qFMdGeYPmxy8+VHtkYRLQzMK3CwlNHaJrQ8Hgfg8IkNyGGcrb7n0t+h1BAAKW3QA0GgwaLACAeaeQjvqw3XwQRlxomtATSOH79T6I+KRoeKEO+jo0NPVtoqg\/6i3XEVbfsDrFsVFe7giyPRw7CWhm4duFhaYt92Gu4fLrwfQxLk9TKcK95xoqek2jwAAzvWakBLDq48y7cHAccopJQBPn0kXSBOaj7iTiQ12wD2ROCkkUiuuxFeQiXerrUqeoNmr0e8\/Rxp59vNv6GpakoJm2bzf1o+FwsX7G1uu15C4D\/Bt014G5XcJ9v\/xJnqCZxFOOzAIHx0ywLPa2CduwSD3QfglA0wQc8oV+60ltYPrnwlXr0B23c5pQlfvrw+rrWqcoNmpUaOoOeXFX27e2F6\/Z\/DnIh4OG6Gn6dqHfEeQy0+YyDAj7UZv1eZqIzAAQgAbDWUAUM834DEuCXB9AjCEncp\/yMGN8D4bK+EwPRwEPfDfgYnuAxky36\/2kLrguXCf2x3E43hwO4\/+4Mwn746HDT7+53fl8rnVytVEjQtP1\/ehJviMoTd8u\/IvVbPmPKD9KUC6zkaGZxJPbKb7uIkjvPPNgtY1VRjDngmCZBjTT9G2+jTKDwncEUUWCZpSXqRXZnwnNBocm30ZJaKbd7tDGnni0szoj7tLGCE1CsyGhyfeeU2lD0\/Laim76M6GZO2jqhmwu7SA0Cc0k2p3fC9Loz4RmrqCZVEMmNAnNoHa3ZsX91SVqPZ3l\/ZXty+jPhGbuoCmw7JhbmkqiIROahKat3fktUUuqfedFuYZmkYzsB03XdXCEJqEZty3EnRGnGgyahTOcAU2Bpes6OEKT0IzbFrDqorujvIZ+SGjmEppZ9Pp5iuKpdEc7lbI27ow4RWjOOjQBS\/T6HCJRFKFJhahcar0aZa0lRVGEZtEjTcKSoghNiqIoitCkKIoiNCmKoghNiqIoQpOiKIrQpCiKIjQpiqIoQpOiKIrQpCiKIjQpiqIITYqiKEKToiiqgPoP6jnKIU9xpRwAAAAASUVORK5CYII=","width":436}
%---
%[text:image:4a24]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
