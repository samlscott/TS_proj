---
# IMPORTANT: Change settings here, but DO NOT change the spacing.
title: "A Replication: Identifying Aggregate Supply and Demand Shocks in SouthAfrica"
subtitle: "Innovation Accounting Replication and Robustness Checks"
documentclass: "elsarticle"
Thesis_FP: FALSE
# Entry1: "An unbelievable study with a title spanning multiple lines."
# Entry2: "\\textbf{Nico Katzke}" # textbf for bold
# Entry3: "A thesis submitted toward the degree of Doctor of Philosophy"
# Uni_Logo: Tex/Logo.png # Place a logo in the indicated location (from your root, e.g. defaults to ~/Tex/Logo.png) and uncomment this line. Leave uncommented for no image
# Logo_width: 0.3 # If using a logo - use this to set width (size) of image
# Entry4: "Under the supervision of: \\vfill Prof. Joe Smith and Dr. Frank Smith"
# Entry5: "Stellenbosch University"
# Entry6: April 2020
# Entry7:
# Entry8:
# Comment: ----- Follow this pattern for up to 5 authors
AddTitle: TRUE # Use FALSE when submitting to peer reviewed platform. This will remove author names.
Author1: "Samantha Scott" # First Author - note the thanks message displayed as an italic footnote of first page.
Ref1: "Stellenbosch University, Cape Town, South Africa" # First Author's Affiliation
Email1: "20945043\\@sun.ac.za" # First Author's Email address
#Author2: "Samantha Scott"
#Ref2: "University of Götten.."
#Email2: "20945043\\@sun.ac.za"
#CommonAffiliation_12: TRUE
#Ref2: "Stellenbosch University, Cape Town, South Africa" # If Author 1 and 2 have a common affiliation. Works with _13, _23, etc.
#Author3: "Emma Terblanche"
#Email3: "21777039\\@sun.ac.za"
#CommonAffiliation_23: TRUE
#CorrespAuthor_3: TRUE  # If corresponding author is author 3, e.g., use CorrespAuthor_3: TRUE
keywords: "Econometrics \\sep Time Series \\sep VAR \\sep SVAR \\sep Blanchard-Quah" # Use \\sep to separate
#JELCodes: "L250 \\sep L100"
# ----- Manage headers and footers:
#BottomLFooter: $Title$
#BottomCFooter:
#TopLHeader: \leftmark # Adds section name at topleft. Remove comment to add it.
BottomRFooter: "\\footnotesize Page \\thepage" # Add a '#' before this line to remove footer.
addtoprule: TRUE
addfootrule: TRUE               # Use if footers added. Add '#' to remove line.
# --------- page margins:
margin: 2.3 # Sides
bottom: 2 # bottom
top: 2.5 # Top
HardSet_layout: TRUE # Hard-set the spacing of words in your document. This will stop LaTeX squashing text to fit on pages, e.g.
linenumbers: FALSE # Used when submitting to journal
# ---------- References settings:
# You can download cls format here: https://www.zotero.org/ - simply search for your institution. You can also edit and save cls formats here: https://editor.citationstyles.org/about/
bibliography: Tex/ref.bib       # Do not edit: Keep this naming convention and location.
csl: Tex/harvard-stellenbosch-university.csl # referencing format used.
# By default, the bibliography only displays the cited references. If you want to change this, you can comment out one of the following:
#nocite: '@*' # Add all items in bibliography, whether cited or not
# nocite: |  # add specific references that aren't cited
# ---------- General:
RemovePreprintSubmittedTo: TRUE  # Removes the 'preprint submitted to...' at bottom of titlepage
Journal: "Journal of Finance"   # Journal that the paper will be submitting to, if RemovePreprintSubmittedTo is set to TRUE.
toc: TRUE                       # Add a table of contents
numbersections: TRUE             # Should sections (and thus figures and tables) be numbered?
fontsize: 11pt                  # Set fontsize
linestretch: 1.2                # Set distance between lines.
link-citations: TRUE            # This creates dynamic links to the papers in reference list.
### Adding additional latex packages:
# header-includes:
output:
  pdf_document:
    keep_tex: TRUE
    keep_md: TRUE
    template: Tex/TexDefault.txt
    fig_width: 3.5 # Adjust default figure sizes. This can also be done in the chunks of the text.
    fig_height: 3.5

#abstract: |
  #Abstract to be written here. The abstract should not be too long and should provide the reader with a good understanding what you are writing about. Academic papers are not like novels where you keep the reader in suspense. To be effective in getting others to read your paper, be as open and concise about your findings here as possible. Ideally, upon reading your abstract, the reader should feel he / she must read your paper in entirety.
editor_options: 
  markdown: 
    wrap: 72
---

<!-- First: Set your default preferences for chunk options: -->

<!-- If you want a chunk's code to be printed, set echo = TRUE. message = FALSE stops R printing ugly package loading details in your final paper too. I also suggest setting warning = FALSE and checking for warnings in R, else you might find ugly warnings in your paper. -->



\newpage 























\newpage
# Introduction

The paper *Identifying aggregate supply and demand shocks in South Africa* is an application of a structural VAR method to identify supply and demand shocks for the South African economy since the 1960s. The aim of this investigation is to replicate the innovation accounting presented by Du Plessis, Smit and Sturzenegger (2007), with additional robustness checks. Using data found from an alternative source, it is evident that the model does not present the same results as the impulse response functions are significantly different to that of the original paper. As such, the results of this paper are not consistent with theoretical priors presented by Du Plessis, Smit and Sturzenegger (2007).

After conducting several robustness checks, it is clear that the residuals of two of the main variables, namely the government consumption to GDP ratio as well as the real interest rate, are not white noise. It is also made evident that seasonally adjusting the real interest rate and differencing the variable by one to achieve stationarity significantly impacted the results of the model.

# Data 

The data used is quarterly data from FRED, dating back to the second quarter of 1960 up until 2007. Similarly to the original paper, a robustness check is conducted using a shorter sample is used from the fourth quarter of 1983. Unlike the original paper, the data used is not seasonally adjusted. The variables used in the model are the first difference of the log of real GDP ($y_t$), the ratio of government consumption to GDP ($g_t$), as well the real interest rate ($r_t$). $r_t$ is calculated using the monthly nominal interest rate as well as the monthly CPI data. Below is the equation used to calculate $r_t$.

$$ r_t = ((1 + Avg(i_{mt-1}, i_{mt}, i_{mt+1}))/(1+(ln(CPI_{mt-2}) - ln(CPI_{mt+1}))) ^ 4 - 1)*100 $$
Figures 1, 2 and 3 represent the variables used in the model. As seen in the Appendix, when an Augmented Dickey-Fuller test is conducted, it is evident that $y_t$ is stationary, as the p-value is less than 0.05. However, both $g_t$ and $r_t$ are non-stationary. In the original paper (2007), $r_t$ is stationary. To test the impact of the difference between the $r_t$ variables, a robustness check is conducted where the real interest rate is seasonally adjusted and made stationary. 

![](TS_proj_files/figure-latex/unnamed-chunk-12-1.pdf)<!-- --> 

![](TS_proj_files/figure-latex/unnamed-chunk-13-1.pdf)<!-- --> 

![](TS_proj_files/figure-latex/unnamed-chunk-14-1.pdf)<!-- --> 







# Methodology

A structural VAR model is created to identify supply and demand shocks for the South African economy since the 1960s. The demand the variables, $y_t$, $g_t$ and $r_t$ are proxies for a supply shock, a fiscal shock and a monetary shock, respectively. In the three variable model, Du Plessis, Smit and Sturzenegger (2007) present three restrictions necessary to identify the structural shocks and the dynamics of the structural system. The first two restrictions require that fiscal and monetary policy shocks have no long-run effects on real GDP. The final restriction in that the long run effect of monetary policy on the stance of fiscal policy is also restricted to zero. These restrictions create a lower-triangular matrix, which is replicated for this investigation. The reduced form VAR in this investigation was estimated with three lags. The original paper (2007), conducted the estimation using four lags. The results of the SVAR model are presented as impulse response functions, as well as through a variance decomposition.

# Results

This section is a discussion of the results, as well as a comparison to those of Du Plessis, Smit and Sturzenegger (2007). 
The authors make use of innovation accounting, which entails the consideration of the impulse response and variance decomposition of SVAR models. The first step of innovation accounting is to inspect the impulse response functions of the identified shocks to determine whether they match theoretical priors about discretion and magnitude of impact. The results of the model using the longer dataset (1960+) are presented as impulse response functions in the subsections below. 

## Impulse Response of real GDP for each of the identified shocks

In the original paper (2007), the impulse response functions of real GDP for each of the identified shocks are consistent with theoretical priors. The supply shock has a permanent impact on real GDP, while the demand shocks have transitionary impacts. In opposition, the results of this paper indicates that the the supply shock has a transitory impact while the demand shocks have permanent, negative impacts on real GDP.

![](TS_proj_files/figure-latex/unnamed-chunk-18-1.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-18-2.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-18-3.pdf)<!-- --> 

\newpage
## Impulse Response of the real interest rate for each of the identified shocks

The impulse response functions in the original paper suggest that a positive supply shock raises the real interest rate temporarily. This is also indicated in the results of this investigation, however, the real interest rate is slower to respond to the rise in the supply shock than in the original paper. Du Plessis, Smit and Sturzenegger (2007) find that  positive fiscal shock lowers the real interest rate temporarily, which indicates that a fiscal stimulus is met with accomodating monetary policy. However, this is not the result of this investigation. As indicated below, a positive fiscal shock results in a an increase in the real interest rate, which is slow to respond. 

![](TS_proj_files/figure-latex/unnamed-chunk-19-1.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-19-2.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-19-3.pdf)<!-- --> 

\newpage
## Impulse Response of the government consumption to real GDP for each of the identified shocks

Du Plessis, Smit and Sturzenegger (2007)'s results find that GDP responds faster to a positive supply shock than government expenditure. The results of this investigative present a similar result, as indicated in the impulse response functions below. However, a positive supply shock results in government expenditure to fall below zero before moving back towards zero. The impulse response functions of the investigation indicate that a positive supply shock results in government expenditure to rise before moving back to zero. 

![](TS_proj_files/figure-latex/unnamed-chunk-20-1.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-20-2.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-20-3.pdf)<!-- --> 

\newpage
## Variance Decomposition 

A variance decomposition indicates the amount of information that each variable contributes to the other variables in the model. The variance decomposition therefore determines how much of the forecast error variance of each of the variables can be explained by exogenous shocks to the other variables (Lütkepohl, 2010).

The variance decomposition of real GDP shows the proportion of the variance of real GDP which can be accounted for by the three identified shocks over various horizons. The first plot below is the variance decomposition of real GDP for the longer sample. The second plot presents the variance decomposition of real GDP for a shorter sample. In the larger sample, both $g_t$ and $r_t$ are initially dependent on the value they are set to be. However, as time passes, it is evident that $g_t$ and $r_t$ are impacted by $y_t$.


![](TS_proj_files/figure-latex/unnamed-chunk-21-1.pdf)<!-- --> 

![](TS_proj_files/figure-latex/unnamed-chunk-22-1.pdf)<!-- --> 

# Robustness Checks

In this section, four robustness checks are conducted to test whether estimated effects of interest are sensitive to changes in model specifications. First, the real interest rate variable ($r_t$) is manually seasonally adjusted, and made stationary. Second, the residuals of the time series variables are investiagted in order to determine if they are white noise. Third, the number of lags specified in the model is altered. Lastly, a reduced sample (from the fourth quarter of 1983) is used in place of the larger sample.

## Removing Seasonality

For the last robustness check, the data used to calculate the real interest rate is seasonally adjusted. Further, the real interest rate data is differenced by 1, resulting in a stationary time series. As seen in the Appendix, the new, seasonally adjusted data that is differenced by 1 is stationary, with a p-value of 0.01 when an Aumented Dickey-Fuller test is conducted. The new real interest rate variable is depicted below:

![](TS_proj_files/figure-latex/unnamed-chunk-23-1.pdf)<!-- --> 

As depicted by the impulse response function of the real interest rate for each of the identified shocks in the Appendix, the method of removing seasonality and making the variable $r_t$ stationary, the new impulse response functions are more comparable to those of the original paper than previosuly. This indicates that removing seasonality from the main variables is essential. 

## Residuals 

As the next robustness check, the residuals of the variables $y_t$, $g_t$, $r_t$, as well as the seasonally adjusted, normalised real interest rate variable are investigated in order to determine whether their respective residuals are white noise. White noise is defined as a time series that  is purely random. The residuals are defined as the difference between the fitted model and the data. If the model is a good fit, the residuals should be white noise.

\newpage
Below is the result of a check for residuals for the $y_t$ variable. As indicated by the figures, the residuals of $y_t$ are white noise. The residuals are random, with no apparent trend. However, the autocorrelation in the second and third lags are significantly larger than zero. When conducting a Ljung_Box test, the p-value in greater that 0.01. As such we cannot reject the null hypothesis, indicating that the time series does not contain an autocorrelation.


![](TS_proj_files/figure-latex/unnamed-chunk-24-1.pdf)<!-- --> 

\newpage
The figures below indicate that the residuals for the $g_t$ variable are not white noise. When conducting a Ljung-Box test, the p-value is smaller than 0.01, thus we can reject the null hypothesis. Therefore, the time series does contain an autocorrelation and  the residuals are not white noise.


![](TS_proj_files/figure-latex/unnamed-chunk-25-1.pdf)<!-- --> 

\newpage
The figures below are checks for residuals for the $r_t$ variable. The figures indicate that the residuals are not white noise. The autocorrelation in all of the lags are larger than zero. The Ljung-Box test indicates that there is correlation in the time series, as the p-value is lower than 0.01.


![](TS_proj_files/figure-latex/unnamed-chunk-26-1.pdf)<!-- --> 

\newpage
The figures below present a check for residuals for an interest rate variable that has been seasonally adjusted and made stationary. The residuals seem to be random, without an apparent trend. The autocorrelation in the first two lags are greater than zero. When conducting a Ljung-Box test, the p-value is less than 0.01. As such, we can reject the null hypothesis. Therefore, the time series contains autocorrelation, and the residuals are not white noise.


![](TS_proj_files/figure-latex/unnamed-chunk-27-1.pdf)<!-- --> 

\newpage
## Lag Selection 

According to Ozcicek and Mcmillin (1999:517-518), overfitting, which entails selecting a higher order lag length than the true lag length, causes an increase in the mean-square forecast errors of the VAR. Underfitting the lag length results in autocorrelated errors. As such, it is important to test whether the number of lags selected may influence the results of the model.

As another robustness check, additional models are generated with more and less variables than the initial model. First, a model with more lags (6) than the selected amount (3), and second, less lags (2) than the lag order selection number. As seen by the impulse response functions of these additional models, the results were not greatly impacted by a change in the number of lags. 

## Reduced Sample

As another robustness check, a smaller sample is used, dating from the fourth quarter of 1963 to the last quarter of 2006. The same method is applied to assess whether the sample selected may alter the results. As seen by the impulse response functions in the Appendix, using a smaller sample (1983+) does not significantly impact the results, as they are comparable to the impulse response functions of the larger sample (1960+).

# Conclusion 

This investigation served as an attempt to replicate the innovation accounting in Du Plessis, Smit and Sturzenegger (2007)'s paper, using data from an alternative source. A structural VAR method was applied to identify aggregate supply and aggregate demand shocks for the South African economy from the 1960s. The impulse response functions of this investigation differed from those of the original paper, resulting in the functions being inconsistent with theory. Additional robustness checks were conducted, for example a residual check, which revealed that two of the three main variables used in the model contain residuals that are not white noise. Other robustness checks altering lag selection, as well as reducing the sample, indicated that model specifications did not impact the results of the model. However, by altering the real interest rate for the variable to be seasonally adjusted and stationary the impulse response functions were impacted significantly. 

\newpage

# Reference List

Du Plessis, S., Smit, B. and Sturzenegger, F., 2007. Identifying aggregate supply and demand shocks in South Africa. Journal of African economies, 17(5):765-793.

Lütkepohl, H. 2010. Variance Decomposition. In: Durlauf, S.N., Blume, L.E. (eds) Macroeconometrics and Time Series Analysis. The New Palgrave Economics Collection. Palgrave Macmillan, London.

Ozcicek, O & McMillin, W. D. 1999. Lag Length Selection in Vector Autoregressive Models: Symmetric and Asymmetric Lags. *Applied Economics*, 31(4):517-524. 

\newpage

# Appendix 

## Forecast

![](TS_proj_files/figure-latex/unnamed-chunk-28-1.pdf)<!-- --> 

![](TS_proj_files/figure-latex/unnamed-chunk-29-1.pdf)<!-- --> 

![](TS_proj_files/figure-latex/unnamed-chunk-30-1.pdf)<!-- --> 


## Testing for Stationarity


```
## 
## 	Augmented Dickey-Fuller Test
## 
## data:  real_gdp1
## Dickey-Fuller = -3.7922, Lag order = 5, p-value = 0.0208
## alternative hypothesis: stationary
```

```
## 
## 	Augmented Dickey-Fuller Test
## 
## data:  rg83
## Dickey-Fuller = -3.5737, Lag order = 4, p-value = 0.03979
## alternative hypothesis: stationary
```

```
## 
## 	Augmented Dickey-Fuller Test
## 
## data:  Real_interest1$Real_interest_rate
## Dickey-Fuller = -2.6335, Lag order = 5, p-value = 0.3112
## alternative hypothesis: stationary
```

```
## 
## 	Augmented Dickey-Fuller Test
## 
## data:  ri83$Real_interest_rate
## Dickey-Fuller = -2.7977, Lag order = 4, p-value = 0.2473
## alternative hypothesis: stationary
```

```
## 
## 	Augmented Dickey-Fuller Test
## 
## data:  ri_sa$seasonally_differenced
## Dickey-Fuller = -5.7783, Lag order = 5, p-value = 0.01
## alternative hypothesis: stationary
```

```
## 
## 	Augmented Dickey-Fuller Test
## 
## data:  g_g_not_s$Value
## Dickey-Fuller = -0.66065, Lag order = 5, p-value = 0.9724
## alternative hypothesis: stationary
```

```
## 
## 	Augmented Dickey-Fuller Test
## 
## data:  gg83$Value
## Dickey-Fuller = -2.3567, Lag order = 4, p-value = 0.4292
## alternative hypothesis: stationary
```

## Ljung-Box Tests 


```
## 
## 	Box-Ljung test
## 
## data:  y_t
## X-squared = 0.63753, df = 1, p-value = 0.4246
```


```
## 
## 	Box-Ljung test
## 
## data:  g_t
## X-squared = 179.82, df = 1, p-value < 2.2e-16
```


```
## 
## 	Box-Ljung test
## 
## data:  r_t
## X-squared = 181.77, df = 1, p-value < 2.2e-16
```


```
## 
## 	Box-Ljung test
## 
## data:  r_t_sa
## X-squared = 56.161, df = 1, p-value = 6.672e-14
```

\newpage
## Removing Seasonality and Non-stationarity Impulse Response Functions

Impulse Response of real GDP for each of the identified shocks:

![](TS_proj_files/figure-latex/unnamed-chunk-36-1.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-36-2.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-36-3.pdf)<!-- --> 
\newpage
Impulse Response of the real interest rate  for each of the identified shocks:

![](TS_proj_files/figure-latex/unnamed-chunk-37-1.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-37-2.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-37-3.pdf)<!-- --> 
\newpage
Impulse Response of the government consumption to real GDP for each of the identified shocks:

![](TS_proj_files/figure-latex/unnamed-chunk-38-1.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-38-2.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-38-3.pdf)<!-- --> 

\newpage
## Lag Selection Impulse Response Functions

Impulse Response of the real GDP for each of the identified shocks:

![](TS_proj_files/figure-latex/unnamed-chunk-39-1.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-39-2.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-39-3.pdf)<!-- --> 

\newpage
Impulse Response of the real interest rate for each of the identified shocks:

![](TS_proj_files/figure-latex/unnamed-chunk-40-1.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-40-2.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-40-3.pdf)<!-- --> 

\newpage
Impulse Response of the government consumption to real GDP for each of the identified shocks:

![](TS_proj_files/figure-latex/unnamed-chunk-41-1.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-41-2.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-41-3.pdf)<!-- --> 

\newpage

Impulse Response of the real GDP for each of the identified shocks:

![](TS_proj_files/figure-latex/unnamed-chunk-42-1.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-42-2.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-42-3.pdf)<!-- --> 

\newpage
Impulse Response of the real interest rate for each of the identified shocks:

![](TS_proj_files/figure-latex/unnamed-chunk-43-1.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-43-2.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-43-3.pdf)<!-- --> 

\newpage
Impulse Response of the government consumption to real GDP for each of the identified shocks:

![](TS_proj_files/figure-latex/unnamed-chunk-44-1.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-44-2.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-44-3.pdf)<!-- --> 

\newpage
## Reduced Sample Impulse Response Functions

Impulse Response of real GDP for each of the identified shocks:

![](TS_proj_files/figure-latex/unnamed-chunk-45-1.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-45-2.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-45-3.pdf)<!-- --> 
\newpage
Impulse Response of the real interest rate  for each of the identified shocks:

![](TS_proj_files/figure-latex/unnamed-chunk-46-1.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-46-2.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-46-3.pdf)<!-- --> 
\newpage
Impulse Response of the government consumption to real GDP for each of the identified shocks:

![](TS_proj_files/figure-latex/unnamed-chunk-47-1.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-47-2.pdf)<!-- --> ![](TS_proj_files/figure-latex/unnamed-chunk-47-3.pdf)<!-- --> 
