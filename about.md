---
title: "About Stiffme app"
author: "Pablo Ortega"
date: "July 25, 2018"
output: html_document
---

# Purpose

The idea behind the app is to deliver an easy, fast and interactive way to produce stiff diagrams.
The app is free to use, and the only thing I ask is to share the app with your friends, colleagues, students, researchers, etc.

# How to use
Generate Stiff Diagrams in this app is very straight forward. The only thing you have to do is to upload the chemical data. As a rule, you have to provide all the ions necessary to build the diagrams: Na, Ca, Mg, HCO3, SO4 and Cl, and you have to supply coordinates of the points. In addition we recommend to add the name to each point. In the next table there is an example of how to order your data.

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:center;"> id </th>
   <th style="text-align:center;"> x </th>
   <th style="text-align:center;"> y </th>
   <th style="text-align:center;"> Fecha </th>
   <th style="text-align:center;"> Na </th>
   <th style="text-align:center;"> Ca </th>
   <th style="text-align:center;"> Mg </th>
   <th style="text-align:center;"> Cl </th>
   <th style="text-align:center;"> HCO3 </th>
   <th style="text-align:center;"> SO4 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> Well1 </td>
   <td style="text-align:center;"> 412574.6 </td>
   <td style="text-align:center;"> 7357124 </td>
   <td style="text-align:center;"> 1/1/2015 </td>
   <td style="text-align:center;"> 1722 </td>
   <td style="text-align:center;"> 1002.7 </td>
   <td style="text-align:center;"> 70.2 </td>
   <td style="text-align:center;"> 2531.7 </td>
   <td style="text-align:center;"> 53 </td>
   <td style="text-align:center;"> 2683.3 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Well2 </td>
   <td style="text-align:center;"> 410038.0 </td>
   <td style="text-align:center;"> 7351154 </td>
   <td style="text-align:center;"> 3/14/2018 </td>
   <td style="text-align:center;"> 2200 </td>
   <td style="text-align:center;"> 2341.0 </td>
   <td style="text-align:center;"> 110.0 </td>
   <td style="text-align:center;"> 6151.0 </td>
   <td style="text-align:center;"> 48 </td>
   <td style="text-align:center;"> 2171.0 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Well3 </td>
   <td style="text-align:center;"> 411012.0 </td>
   <td style="text-align:center;"> 7357324 </td>
   <td style="text-align:center;"> 1/2/2015 </td>
   <td style="text-align:center;"> 1822 </td>
   <td style="text-align:center;"> 1102.7 </td>
   <td style="text-align:center;"> 74.0 </td>
   <td style="text-align:center;"> 2631.7 </td>
   <td style="text-align:center;"> 153 </td>
   <td style="text-align:center;"> 2783.3 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Well4 </td>
   <td style="text-align:center;"> 414585.0 </td>
   <td style="text-align:center;"> 7355024 </td>
   <td style="text-align:center;"> 1/3/2018 </td>
   <td style="text-align:center;"> 1592 </td>
   <td style="text-align:center;"> 872.7 </td>
   <td style="text-align:center;"> 89.0 </td>
   <td style="text-align:center;"> 2401.7 </td>
   <td style="text-align:center;"> 57 </td>
   <td style="text-align:center;"> 2553.3 </td>
  </tr>
</tbody>
</table>

# Considerations
* For now only CRS = WGS 84 UTM 19S is supported
* If there is missing data in the CSV the app will not compute your diagram. More exceptions will be added in the future updates.
* Future updates will include more options to format and filter your diagrams. Also we will include a reference Piper diagram.

# About GeoJSON vs Esri Shape
We are committed to deliver open and free to use apps and software. In this way, all the Stiff diagrams will be exported in geoJSON file (open and free) instead of shape (Esri owned). If you need a .shp please convert it yourself with a software like [QGIS](https://qgis.org/es/site/forusers/download.html)

# Source code
Full source code is available from the [Stiff me GitHub repository.](https://github.com/p-ortega/stiffme) Comments, bug reports and pull requests are always welcome.

# References
Stiff, H.A., Jr., 1951, The interpretation of chemical water analysis by means of patterns: Journal of Petroleum Technology, v. 3. no. 10, section 1: p15,16 and section 2: p3.
