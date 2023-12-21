
# <span style="color:rgb(213,80,0)">Calculus: Derivatives</span>

[![View on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/99249-calculus-derivatives) or [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Derivatives&project=Derivatives.prj)

![MATLAB Versions Tested](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2FMathWorks-Teaching-Resources%2FCalculus-Derivatives%2Frelease%2FImages%2FTestedWith.json)

**Curriculum Module**

_Created with R2021a. Compatible with R2021a and later releases._

# Information

This curriculum module contains interactive [MATLAB® live scripts](https://www.mathworks.com/products/matlab/live-editor.html) that teach fundamental concepts and basic terminology related to derivative calculus. There is a focus on numerical approximation and graphical representation as tools for understanding the concepts of calculus. 

## Background

You can use these live scripts as demonstrations in lectures, class activities, or interactive assignments outside of class. The derivatives module is divided into five scripts and a practice app. The first covers the [limit definition of the derivative](#H_727F8117) and includes several motivating examples for the study of derivatives. The second covers [derivatives of powers and the linearity of derivatives](#H_77AFFCCB) working from the limit definition of the derivative, including an application to parabolic motion. The third covers [derivatives of exponentials, natural logarithms, sines and cosines](#H_9F419170) as well as discussing higher order derivatives. Applications include population growth and oscillatory behavior. The fourth script presents visualizations of [the product and chain rule for derivatives](#H_DBF5C0DF) as well as randomly generated practice problems. Applications include related rates and the quotient rule for derivatives. The fifth script presents [approximation of differentiable functions](#H_98D870A0) by polynomials, including tangent lines, and leading up to Taylor polynomials. The [Calculus Flashcards app](#H_A8913F44) allows users to select the types of derivative (or integral) rules they wish to practice, generate randomized problems, and track their progress within a session.


The instructions inside the live scripts will guide you through the exercises and activities. All interactive exercises offer feedback while reflection questions are more open-ended and do not include solutions in this module. Get started with each live script by running it one section at a time. To stop running the script or a section midway (for example, when an animation is in progress), use the <img src="Images/EndIcon.png" width="19" alt="EndIcon.png"> **Stop** button in the **RUN** section of the **Live Editor** tab in the MATLAB Toolstrip.

## Contact Us

Solutions are available upon instructor request. Contact the [MathWorks teaching resources team](mailto:onlineteaching@mathworks.com) if you would like to request solutions, provide feedback, or if you have a question.

<a name="H_30BC7141"></a>
## Prerequisites

Mathematically, this module assumes a knowledge of functions that is standard in precalculus course materials regarding powers, exponentials, absolute values, logarithms, sines, cosines, rational functions, and asymptotes. In addition, this module assumes basic fluency with limits in discussing the limit definition of the derivative.


Minimal MATLAB fluency is required to use this module; primarily it is standard calculator-type mathematics such as using \texttt{*} for multiplication and <samp>/</samp> for division. For commands that go beyond interacting with a calculator, the necessary knowledge is included in the module. If you want to improve your MATLAB knowledge, [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted) is a free two-hour introductory tutorial that teaches the essentials of MATLAB. 

<a name="H_330E72C3"></a>
## Getting Started
### Accessing the Module
### **On MATLAB Online:**

Use the [<img src="Images/OpenInMO.png" width="136" alt="OpenInMO.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Derivatives&project=Derivatives.prj) link to download the module. You will be prompted to log in or create a MathWorks account. The project will be loaded, and you will see an app with several navigation options to get you started.

### **On Desktop:**

Download or clone this repository. Open MATLAB, navigate to the folder containing these scripts and double-click on [Derivatives.prj](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Derivatives&project=Derivatives.prj). It will add the appropriate files to your MATLAB path and open an app that asks you where you would like to start. 


Ensure you have all the required products ([listed below](#H_E850B4FF)) installed. If you need to include a product, add it using the Add-On Explorer. To install an add-on, go to the **Home** tab and select  <img src="Images/AddOnsIcon.png" width="16" alt="AddOnsIcon.png"> **Add-Ons** > **Get Add-Ons**. 

<a name="H_E850B4FF"></a>
## Products

MATLAB®  and the Symbolic Math Toobox™ are used throughout. Tools from the Curve Fitting Toolbox™ are used in <samp>TranscendentalsRules.mlx</samp>.

<a name="H_E8C62B23"></a>
# Scripts
<a name="H_727F8117"></a>
## [The Definition of the Derivative](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Derivatives&project=Derivatives.prj&file=Definition.mlx)
| **<samp>Definition.mlx</samp>** | **In this script, students will...**  |
| :-- | :-- |
| <img src="https://github.com/MathWorks-Teaching-Resources/Calculus-Derivatives/blob/release/Images/SecantTangent2.gif" width="171" alt="Secant lines"> |-  explain the limit definition of the derivative and its relationship to secant lines. <br>-  identify the sign of the derivative at a point as positive, negative, or zero based on the graph of a function. <br>-  identify points where the derivative of a continuous function does not exist and explain why with reference to the definition of the derivative. <br>-  recognize $f^{\prime } (x)$ , $\frac{\textrm{d}f}{\textrm{d}x}$ , and $\frac{\textrm{d}}{\textrm{d}x}\left\lbrack f(x)\right\rbrack$ as equivalent notation for the derivative of $f$ with respect to $x$ .  |

<a name="H_77AFFCCB"></a>
## [Derivatives of Polynomials](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Derivatives&project=Derivatives.prj&file=PowerRules.mlx)
| **<samp>PowerRules.mlx</samp>** | **In this script, students will...**  |
| :-- | :-- |
| <img src="Images/image_4.png" width="171" alt="image_4.png"> |-  explain why the limit definition of the derivative results in the power rule for derivatives. <br>-  compute the derivatives of linear combinations of powers by hand. <br>-  apply derivatives to solve practical questions.  |

<a name="H_9F419170"></a>
## [Derivatives of Transcendental Functions](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Derivatives&project=Derivatives.prj&file=TranscendentalsRules.mlx)
| **<samp>TranscendentalsRules.mlx</samp>** | **In this script, students will...**  |
| :-- | :-- |
| <img src="https://github.com/MathWorks-Teaching-Resources/Calculus-Derivatives/blob/release/Images/DerivativeOfSine.png" width="171" alt="Numerical derivative of sine"> |-  determine the functional relationship of the derivatives of sines, cosines, exponentials, and natural logarithms. <br>-  explain the pattern in the derivatives of $\sin (ax)$ , $\cos (ax)$ , and $\exp (ax)$ for constant values of $a$ and that the derivative of $\ln (ax)$ does not fit the simple pattern. <br>-  apply the correct units to derivatives of any order. <br>-  explore simple first- and second-order differential equations that describe a physical system and use them to create mathematical models of the system.  |

<a name="H_DBF5C0DF"></a>
## [Chain Rule and Product Rule](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Derivatives&project=Derivatives.prj&file=TranscendentalsRules.mlx)
| **<samp>CombinationRules.mlx</samp>** | **In this script, students will...**  |
| :-- | :-- |
| <img src="https://github.com/MathWorks-Teaching-Resources/Calculus-Derivatives/blob/release/Images/productRuleIcon.png" width="171" alt="product rule"> |-  explain why the chain rule is $\frac{\textrm{d}}{\textrm{d}x}\left\lbrack f(g(x))\right\rbrack =f^{\prime } (g(x)) \cdot g^{\prime } (x)$ . <br>-  apply the chain rule to calculate derivatives. <br>-  explain why the product rule is $\frac{\textrm{d}}{\textrm{d}x}\left\lbrack f(x)\cdot g(x)\right\rbrack =f(x)\cdot \frac{\textrm{d}g}{\textrm{d}x}+\frac{\textrm{d}f}{\textrm{d}x}\cdot g(x)$ . <br>-  apply the product rule to calculate derivatives. <br>-  practice fluently recognizing and applying the rules for computing derivatives.  |

<a name="H_98D870A0"></a>
## [Taylor Polynomials](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Derivatives&project=Derivatives.prj&file=TaylorPolynomials.mlx)
| **<samp>TaylorPolynomials.mlx</samp>** | **In this script, students will...**  |
| :-- | :-- |
| <img src="Images/taylorpolyexample.gif" width="171" alt="animation of Taylor polynomial approximation"> |-  compute tangent lines. <br>-  compute quadratic approximations. <br>-  compute higher order polynomial approximations.  |

<a name="H_A8913F44"></a>
# App: [Calculus Flashcards](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Derivatives&project=Derivatives.prj&file=CalculusFlashcards)

Practice recognizing and solving standard computational problems in calculus.

<p style="text-align:left"><img src="Images/image_8.png" width="371" alt="image_8.png"></p>

<a name="H_F61733D7"></a>
# License

The license for this module is available in the [LICENSE.md](https://github.com/MathWorks-Teaching-Resources/Calculus-Derivatives/blob/release/LICENSE.md).

# Related Courseware Modules
| **Courseware Module** | **Sample Content** | **Available on:**  |
| :-- | :-- | :-- |
| [**Calculus: Integrals**](https://www.mathworks.com/matlabcentral/fileexchange/105740-calculus-integrals) | <img src="Images/image_9.png" width="171" alt="image_9.png"> | [<img src="Images/OpenInFX.png" width="91" alt="OpenInFX.png">](https://www.mathworks.com/matlabcentral/fileexchange/105740-calculus-integrals)<br>[<img src="Images/OpenInMO.png" width="136" alt="OpenInMO.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj)<br> [GitHub](https://github.com/MathWorks-Teaching-Resources/Calculus-Integrals)   |
| [**Fourier Analysis**](https://www.mathworks.com/matlabcentral/fileexchange/106725-fourier-analysis) | <img src="Images/image_12.png" width="171" alt="image_12.png"> | [<img src="Images/OpenInFX.png" width="91" alt="OpenInFX.png">](https://www.mathworks.com/matlabcentral/fileexchange/106725-fourier-analysis)<br>[<img src="Images/OpenInMO.png" width="136" alt="OpenInMO.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Fourier-Analysis&project=FourierAnalysis.prj)<br>[GitHub](https://github.com/MathWorks-Teaching-Resources/Fourier-Analysis)  |
| <br>[**Numerical Methods with Applications**](https://www.mathworks.com/matlabcentral/fileexchange/111490-numerical-methods-with-applications) | <img src="Images/image_15.png" width="171" alt="image_15.png"> | <br>[<img src="Images/OpenInFX.png" width="91" alt="OpenInFX.png">](https://www.mathworks.com/matlabcentral/fileexchange/111490-numerical-methods-with-applications)<br>[<img src="Images/OpenInMO.png" width="136" alt="OpenInMO.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Numerical-Methods-with-Applications&project=NumericalMethods.prj)  <br>[GitHub](https://github.com/MathWorks-Teaching-Resources/Numerical-Methods-with-Applications)   |


Or feel free to explore our other [modular courseware content](https://www.mathworks.com/matlabcentral/fileexchange/?q=tag%3A%22courseware+module%22&sort=downloads_desc_30d).

# Educator Resources
-  [Educator Page](https://www.mathworks.com/academia/educators.html) 
<a name="H_0FA5DA18"></a>
# Contribute 

Looking for more? Find an issue? Have a suggestion? Please contact the [MathWorks teaching resources team](mailto:%20onlineteaching@mathworks.com). If you want to contribute directly to this project, you can find information about how to do so in the [CONTRIBUTING.md](https://github.com/MathWorks-Teaching-Resources/Calculus-Derivatives/blob/release/CONTRIBUTING.md)  page on GitHub.


 *©* Copyright 2023 The MathWorks™, Inc



