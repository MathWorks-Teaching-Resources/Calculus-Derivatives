# Calculus Derivatives [![View <File Exchange Title> on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/99249-calculus-derivatives)
**Curriculum Module**  
_Created with R2021a. Compatible with R2021a and later releases._  

## Description ##
This curriculum module contains interactive [live scripts](https://www.mathworks.com/products/matlab/live-editor.html) that teach basic concepts of derivative calculus. There is a focus on numerical approximation and graphical representation as tools for understanding the concepts of calculus. 

The derivatives module is divided into four scripts. The first covers the limit definition of the derivative and includes several motivating examples for the study of derivatives. The second covers derivatives of powers and the linearity of derivatives working from the limit definition of the derivative, including an application to parabolic motion. The third covers derivatives of exponentials, natural logarithms, sines and cosines as well as discussing higher order derivatives. Applications include population growth and oscillatory behavior. The fourth script presents visualizations of the product and chain rule for derivatives as well as randomly generated practice problems. Applications include related rates and the quotient rule for derivatives.

These lessons can be used as part of a lecture, as activities in an instructional setting, or as interactive assignments to be completed outside of class. All interactive exercises offer feedback while reflection questions are more open-ended and do not include solutions in this module. 

The instructions inside the live scripts will guide you through the exercises, examples, and activities. Get started with each live script by running it one section at a time. To stop running the script or a section midway (for example, when an animation is in progress), use the **Stop** button in the **Run** section of the **Live Editor** tab in the MATLAB Toolstrip.

## Prerequisite Domain Knowledge ##
This module assumes a knowledge of functions that is standard in precalculus course materials regarding powers, exponentials, absolute values, logarithms, sines, cosines, rational functions, and asymptotes. In addition, this module assumes basic fluency with limits in discussing the limit definition of the derivative.

## Suggested Prework ##
[MATLAB Onramp](https://www.mathworks.com/learn/tutorials/matlab-onramp.html) – a free two-hour introductory tutorial that teaches the essentials of MATLAB.<br>

## Details ##
**`derivativeDefinition.mlx`**
An interactive script that facilitates exploration of the limit definition of the derivative and the relationship between slopes and derivatives. 

<img src="https://user-images.githubusercontent.com/88841524/133808342-49edbbd4-d381-4c63-bd2c-64c485728c71.gif" width="500">

**Learning Goals:**
- Explain the limit definition of the derivative and its relationship to secant lines
- Identify the sign of the derivative at a point as positive, negative, or zero based on the graph of a function
- Identify points where the derivative of a continuous function does not exist and explain why with reference to the definition of the derivative
- Recognize f'(x), df/dx, and d/dx[f(x)] as equivalent notation for the derivative of f with respect to x

## ##
**`derivativeRulesPolynomials.mlx`**
An interactive script that facilitates exploration of the results of applying the limit definition of the derivative to powers to identify the power rule for derivatives. After introducing the linearity rules, there is the opportunity to generate and check random problems to practice applying the linearity and power rules for derivatives and an application to parabolic motion. 

<img src="https://user-images.githubusercontent.com/88841524/133293628-e7954ef1-4cf9-413b-be38-9ec565285f59.png" width="500">

**Learning Goals:**
- Explain why the limit definition of the derivative results in the power rule for derivatives
- Compute the derivatives of linear combinations of powers by hand
- Apply derivatives to solve practical questions

## ##
**`derivativeRulesTranscendentals.mlx`**
An interactive script that facilitates exploration of the derivatives of sines, cosines, exponential functions, natural logarithms, higher order derivatives, and unit analysis of derivatives.

<img src="https://user-images.githubusercontent.com/88841524/133293596-fdff62a2-77d9-40bd-b5ca-253e8ace2350.png" width="500">

**Learning Goals:**
- Determine the functional relationship of the derivatives of sines, cosines, exponentials, and natural logarithms
- Explain the pattern in the derivatives of sin(ax), cos(ax), and exp(ax) for constant values of a and that the derivative of ln(ax) does not fit the simple pattern
- Apply the correct units to derivatives of any order
- Explore simple first and second order differential equations that describe physical systems to create mathematical models of the system

## ## 
**`derivativeRulesCombinations.mlx`**
An interactive script that presents visualizations of the chain rule and product rule as well as the opportunity to practice derivatives.

<img src="https://user-images.githubusercontent.com/88841524/133293543-8bd879ff-9b17-4143-8798-e8c6d43514a2.gif" width="500">

**Learning Goals:**
- Explain why the chain rule is d/dx[f(g(x))] = f'(g(x))*g'(x)
- Apply the chain rule to calculate derivatives
- Explain why the product rule is d/dx[f(x)*g(x)] = f(x)*g'(x)+f'(x)*g(x)
- Apply the product rule to calculate derivatives
- Fluently recognize and apply the rules for computing derivatives


## Products ##
MATLAB&reg;, Symbolic Math Toolbox&trade;, Curve Fitting Toolbox&trade;

## License ##
The license for this module is available in the [LICENSE.md](LICENSE.md) file in this GitHub repository.

## Support ##
Have any questions or feedback? Contact the <a href="mailto:onlineteaching@mathworks.com">MathWorks online teaching team.</a>

# #
_Copyright 2021 The MathWorks, Inc._
