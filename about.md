---
title: "About Stiffme app"
author: "Pablo Ortega"
date: "July, 25 2018"
output:
  prettydoc::html_pretty:
    theme: architect
    highlight: github
---

# Purpose

The idea behind the app is to deliver an easy, fast and interactive way to produce stiff diagrams.
The app is free to use, and the only thing I ask is to share the app with your friends, colleagues, students, researchers, etc.

# How to use
There is no other app to generate Stiffs easier to use than this one. The only thing you have to do is to upload your chemical data. As a rule, you have to provide all the ions necessary to build the diagram: Na, Ca, Mg, HCO3, SO4 and Cl, and you have to supply the coordinates of the points. In addition we recommend to add the name to each point. In the next table there is an examples of the data format.

```
library(knitr)
library(kableExtra)
dataexample = read.csv("data/data.csv")
knitr::kable(iones, format = "hmtl")
```
knitr::kable(dataexample)


You can include code snippets of languages other than R, but note that
the block header has no curly brackets around the language name.

```cpp
// [[Rcpp::export]]
NumericVector timesTwo(NumericVector x) {
    return x * 2;
}
```

You can also write math expressions, e.g. $Y = X\beta + \epsilon$,
footnotes^[A footnote here.], and tables, e.g. using `knitr::kable()`.

```{r, echo=FALSE, results='asis'}
knitr::kable(head(iris, 10))
```

# Source code


Full source code is available from the [stiffme github repository.](https://www.google.cl) Comments, bug reports and pull requests are always welcome.

