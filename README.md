## [Vivli AMR Surveillance Open Data Re-use Data Challenge](https://amr.vivli.org/data-challenge/data-challenge-overview/)
**Team ID: 9049**
## Proposal Title:
**Novel approach to analysis of AMR: looking at the composite resistance phenotype**
## Date of Submission (dd-mmm-yy):
30th July 2023
## Research Team Members details (put the Lead Applicant 1st in the table):
| Team Member Name        | Role in the Data Challenge                   | Affiliation                               | Email                         | Country |
| ----------------------- | ------------------------------------------ | ----------------------------------------- | ----------------------------- | ------- |
| [Shraddha Karve](https://www.ashoka.edu.in/profile/shraddha-karve/)          | Conceptualization of subtype analysis, formulation of EOI and final report | Trivedi School of Biology, Ashoka University | shraddha.karve@ashoka.edu.in | India   |
| [Rintu Kutum](https://www.ashoka.edu.in/profile/rintu-kutum/)             | Data analysis and final report              | Department of Computer Science, Ashoka University | rintu.kutum@ashoka.edu.in   | India   |
| [Devojit Kumar Sarma](https://nireh.icmr.org.in/DKSarma.php)           | Conceptualization of climatic correlations and final report | ICMR-National Institute For Research in Environmental Health (ICMR-NIREH), Bhopal                               | devojit.sarma@icmr.gov.in    | India   |
| Vasundhara Karthikeyan  | Data wrangling and analysis                 | Trivedi School of Biology, Ashoka University | vasundhara.karthikeyan@ashoka.edu.in | India   |
| Ragul N                 | Data wrangling and analysis                 | Department of Computer Science, Ashoka University | ragul.n_asp24@ashoka.edu.in  | India   |

## Datasets included in the analysis (Tick all those that apply):
| Project                                                      | Status |
| ------------------------------------------------------------ | ------ |
| GSK – SOAR 201818                                            |        |
| Johnson & Johnson – Bedaquiline Drug Resistance Assessment in MDR-TB (DREAM) |        |
| Paratek - KEYSTONE                                           | ✔      |
| Pfizer – ATLAS_Antibiotics                                   |        |
| Pfizer – ATLAS_Antifungals                                   |        |
| Shionogi – SIDERO-WT                                         | ✔      |
| Venatorx – GEARS                                            |        |

## Objectives
<p align:"justify">The escalating challenge of antimicrobial resistance (AMR) poses a significant global concern for public healthcare systems<sup>1,2</sup>. Current AMR surveillance and molecular mechanism studies traditionally focus on specific drug-bug combinations, like carbapenem-resistant Klebsiella pneumoniae, designated as a priority pathogen by the WHO<sup>3</sup>. While wastewater and environmental surveillance aim to detect Klebsiella species and genes conferring carbapenem resistance<sup>4</sup>, it is known that resistance genes for one antibiotic often coexist with genes for resistance to others<sup>5</sup>. To address these complexities, we propose a novel analysis approach using Klebsiella pneumoniae as a model. We consider the resistance profile of an isolate for a set of common antibiotics across two datasets, ATLAS and GEARS. We term this composite phenotype, encompassing resistance/sensitivity to a group of antibiotics, a 'subtype' of the pathogen. Our primary objective is to track and study the prevalence of different subtypes across time and space, enabling a more comprehensive understanding of AMR dynamics. We then explore the impact of climatic parameters on the prevalence of different Klebsiella pneumoniae subtypes, aiming to uncover additional insights into antibiotic resistance patterns. Rising temperatures and climate change have been associated with recent antibiotic resistance developments, as bacterial growth and genetic material dissemination are closely tied to temperature conditions<sup>6</sup>. Heavy rainfall has been linked to bacterial mutagenesis and antibiotic resistance gene expression<sup>7</sup>. Rising local temperatures in the United States and Europe have shown correlations with increased antibiotic resistance at the population level in various pathogens<sup>8,9</sup>.</p>

## Methods: 
**1. Generating unique subtypes and their frequencies for different datasets**
We chose a priority pathogenic species, Klebsiella pneumoniae as an example for the kind of analysis we propose. We used Pfizer-Atlas and Venatorx datasets which included data on K. pneumoniae from diverse specimens like blood, urine, pus, etc. The MIC values in the ATLAS and the GEARS datasets were interpreted using the CLSI 2020 and 2021 breakpoint criteria respectively. To ensure consistency, we evaluated data from 2018 to 2021 for the subtype study, allowing for a comprehensive comparison of results between the two datasets.

We next shortlisted the antibiotics which were common for K. pneumoniae across the two chosen datasets. These were cefepime, ceftazidime, gentamicin, levofloxacin, piperacillin-tazobactam. Antibiogram of every isolate were then represented by a string of five ‘R’ (for resistant) or  ‘S’ (for sensitive) denoting the resistance status of that isolate for that antibiotic. We call every unique string of R and S as a subtype.

**2. Testing the impact of climatic parameters on the subtype prevalence**
We chose five different climatic parameters, two were the proxy of precipitation (daily average rainfall in mm and percent relative humidity) and other three were the proxy of temperature (maximum, minimum and mean temperature). Daily average values of rainfall (mm), maximum, minimum and mean temperature (°C), and RH (%), all measured at 2 metres from ground level, were collected from 1st January 2018 to 31st December 2021 and yearly average values were estimated . The parameters were extracted from the National Aeronautics and Space Administration (NASA) Langley Research Center Prediction of Worldwide Energy Resource Project (NASA. POWER LARC Data Access Viewer, Available at [POWER-LARC-NASA data access viewer](https://power.larc.nasa.gov/data-access-viewer/) accessed on 29 date 07 Month 2023, which is based on Modern-Era Retrospective analysis for Research and Applications version 2 (MERRA-2) dataset merged with Goddard Earth Observing System Model (GEOS) version 5.12.4. Using the [POWER-LARC-NASA API](https://power.larc.nasa.gov/docs/tutorials/service-data-request/api/) we retrieved the data using the Python request module.

The climate parameters namely, relative humidity, specific humidity and precipitation were log10 transformed and later were used for regression analysis.

**3. Multivariate Regression analysis**
Regression analysis was performed on the prevalence of thirty-two subtypes of Klebsiella pneumonia across 63 countries from 2018 to 2021 with six climate variables (768 regression analysis in total). P-value less than 0.05 was considered statistically significant for a given regression model.

All the analysis was done using Python (python 3.1.12) and R statistical programming language (R 4.2.1). For reproducibility of the work we have used the Conda environment.  Data analysis and visualization  in Python was done using statsmodels (0.14.0), pandas (1.5.3), matplotlib (3.7.1), seaborn (0.12.2) and geopandas (0.9.0) modules . Data visualization  in R was done using ggplot2 (3.4.0), ggpubr (0.4.0) and RColorBrewer (1.1.3) packages.

## Results: 
### Antibiotic subtype shows significant association with climate variables:

The subtype study carried out using the merged ATLAS and GEARS dataset and focusing on five antibiotics (cefepime, ceftazidime, gentamicin, levofloxacin, and piperacillin-tazobactam) identified 33 distinct subtypes of Klebsiella pneumoniae between 2018 and 2021 (Table 1 and Figure 1). Notably, the analysis highlighted that the extreme subtypes, RRRRR (~13%) and SSSSS (~55%), accounted for approximately 70% of the isolates (Table 1). We then explored the relationship between the regional patterns (averaged) of the most prevalent subtypes in the merged dataset (RRRRR and SSSSS) and the global climatic variables including precipitation, relative humidity (RH) and temperature (mean, minimum and maximum temperature) averaged over 2018-2021. Precipitation and relative humidity showed higher correlations with many of the subtypes than the temperature variables over the years (Figure 2). Owing to the consistent strength of correlation of precipitation and relative humidity with the most prevalent subtypes (RRRRR and SSSSS) across the years, we focused our analysis on the association between these parameters and the predominant subtypes.

**Table 1:** Subtype prevalence of K. pneumonia from 2018 to 2021.

| subtype |  2018   |  2019   |  2020   |  2021   |
| ------- | ------- | ------- | ------- | ------- |
|  RRRRR  | 0.143330| 0.153526| 0.149340| 0.173929|
|  RRRRS  | 0.032605| 0.026412| 0.026776| 0.022974|
|  RRRSR  | 0.018868| 0.022639| 0.024513| 0.017730|
|  RRRSS  | 0.032109| 0.022508| 0.024639| 0.017231|
|  RRSRR  | 0.059914| 0.069347| 0.061848| 0.072044|
|  RRSRS  | 0.020689| 0.019516| 0.022753| 0.013984|
|  RRSSR  | 0.008606| 0.012620| 0.010434| 0.012236|
|  RRSSS  | 0.025323| 0.026932| 0.024136| 0.025596|
|  RSRRR  | 0.002979| 0.001041| 0.000629| 0.001998|
|  RSRRS  | 0.001159| 0.002602| 0.001508| 0.001873|
|  RSRSR  | 0.000331| 0.000260| 0.000251| 0.000375|
|  RSRSS  | 0.002317| 0.002472| 0.002388| 0.003371|
|  RSSRR  | 0.000828| 0.001301| 0.000880| 0.000999|
|  RSSRS  | 0.001324| 0.001301| 0.001886| 0.001249|
|  RSSSR  | 0.000331| 0.000520| 0.000377| 0.000125|
|  RSSSS  | 0.003476| 0.004294| 0.002766| 0.002997|
|  SRRRR  | 0.001655| 0.003513| 0.003394| 0.002747|
|  SRRRS  | 0.008441| 0.008977| 0.009177| 0.006493|
|  SRRSR  | 0.003145| 0.001821| 0.003017| 0.003121|
|  SRRSS  | 0.012910| 0.011319| 0.010811| 0.009240|
|  SRSRR  | 0.003310| 0.004424| 0.004525| 0.003621|
|  SRSRS  | 0.007448| 0.006505| 0.007417| 0.006368|
|  SRSSR  | 0.003145| 0.007156| 0.006914| 0.008990|
|  SRSSS  | 0.019033| 0.015092| 0.017096| 0.019978|
|  SSRRR  | 0.006124| 0.004684| 0.001131| 0.003746|
|  SSRRS  | 0.006620| 0.006245| 0.006160| 0.005868|
|  SSRSR  | 0.002152| 0.001171| 0.000629| 0.001748|
|  SSRSS  | 0.010262| 0.010669| 0.011439| 0.013485|
|  SSSRR  | 0.006455| 0.008587| 0.005657| 0.005494|
|  SSSRS  | 0.029957| 0.029534| 0.026524| 0.022600|
|  SSSSR  | 0.023337| 0.028363| 0.027404| 0.022475|
|  SSSSS  | 0.501821| 0.484647| 0.503583| 0.495318|

![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/figure-1-complete-workflow.png)
**Figure 01: Complete workflow of integration of AMR data with environmental parameters.** (A) Illustration showing conversion for gram negative pathogens antibiotics data (FEP, CAZ, GEN, LVX, and TZP) to subtype for clinical isolates for different countries, (B) Illustration showing year wise (2018) prevalence of 32 subtypes for the given antibiotics, (C) Illustration showing 6 environmental parameters across countries for a given year (2018), (D) Regression analysis showing relationship between RRRRR subtype prevalence with relative humidity (RH2M).

**Figure 02: Bubble plot representing significant association post regression analysis across different subtypes of K. pneumonia and global climatic parameters from 2018 to 2021 using ATLAS and GEARS data.** The color intensity represents the R-squared value and size of the point represents the -log10(p-value), where bigger size implies statistical significance.

### Association of relative humidity with all-susceptible-subtype (SSSSS) and all-resistance-subtype (RRRRR)
Post the multivariable regression analysis, we found that there is a strong association between the all-susceptible subtype and the relative humidity (Figure 3) and this was consistent across all the regions. We see that there is a significant inverse relationship between RH and SSSSS subtype with time (2021). We saw a similar trend between RH and RRRRR subtype across all the regions. With 2020, showing a significant inverse relationship between the RRRRR subtype and RH (Figure 4).

![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/figure-3-ab-GEA-ATS.png)
![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/figure-3-c-GEA-ATS.png)
**Figure 03: Regression analysis between all-susceptible-subtype prevalence (0-1) with relative humidity (log10 transformed).** Heatmap showing (A) prevalence of all-susceptible-subtype (SSSSS) and (B) log10(relative humidity) for 2018 across 63 countries. (C) Scatterplot between SSSSS subtype and relative humidity (RH2M) with the regression line from 2018 to 2021 (for 2018 and 2021 corresponding p-values were less than 0.05).

![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/figure-4-ab-GEA-ATS.png)
![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/figure-4-c-GEA-ATS.png)
**Figure 04: Regression analysis between all-resistance-subtype prevalence (0-1) with relative humidity (log10 transformed).** Heatmap showing (A) prevalence of all-resistance-subtype (RRRRR) and (B) log10(relative humidity) for 2020. (C) Scatterplot between RRRRR subtype and relative humidity (RH2M) with the regression line from 2018 to 2021 (for 2020 corresponding p-value was less than 0.05).

## Impact of the work:

Majority of the AMR  studies consider a  drug-bug combination as the standard unit of analysis. We propose extending this approach to include the resistance status against all the relevant antibiotics. This proposed ‘subtype analysis’ is more relevant for molecular mechanisms of resistance as well as resistance evolution as it considers the entire resistance phenotype of the isolate. One logistic limitation of this approach is that only those antibiotics may be considered which are common across the different datasets or specimens that one aims to study. 

The analysis of spatiotemporal interaction between prevalent subtypes with climate variables is an example of how subtype analysis can be integrated into a one-health paradigm. It can potentially provide important insights into the intricate relationships that lead to the transmission and persistence of antibiotic resistance in the environment. This understanding can guide targeted therapies and strategies to address the multifaceted challenge of antibiotic resistance while also preserving antibiotic efficacy for future generations. Future work in this area can focus on defining the most relevant proxies for climatic parameters. 


## References
1. Burnham, J. P. (2021). Climate change and antibiotic resistance: a deadly combination. Therapeutic Advances in Infectious Disease, 8. https://doi.org/10.1177/2049936121991374

2. Frost, I., Kapoor, G., Craig, J., Liu, D., & Laxminarayan, R. (2021). Hot Topic Status, challenges and gaps in antimicrobial resistance surveillance around the world. Journal of Global Antimicrobial Resistance, 25, 222–226. https://doi.org/10.1016/j.jgar.2021.03.016

3. ICMR. (2021). Annual Report 2021: Antimicrobial Resistance Research and Surveillance Network.

4. MacFadden, D. R., McGough, S. F., Fisman, D., Santillana, M., Brownstein, J. S., & Clim Chang Author manuscript, N. (2018).
Antibiotic Resistance Increases with Local Temperature. 8(6), 510–514. https://doi.org/10.1038/s41558-018-0161-6

5. McGough, S. F., MacFadden, D. R., Hattab, M. W., Mølbak, K., Santillana, M., Sarah, M. F., Derek, M. R., Mohammad, H. W., Kåre, M., & Mauricio Rates, S. (n.d.). Rates of increase of antibiotic resistance and ambient temperature in Europe: a cross-national analysis of 28 countries between 2000 and 2016. 1. https://doi.org/10.2807/1560

6. Murray, C. J., Ikuta, K. S., Sharara, F., Swetschinski, L., Robles Aguilar, G., Gray, A., Han, C., Bisignano, C., Rao, P., Wool, E., Johnson, S. C., Browne, A. J., Chipeta, M. G., Fell, F., Hackett, S., Haines-Woodhouse, G., Kashef Hamadani, B. H., Kumaran, E. A. P., McManigal, B., … Naghavi, M. (2022). Global burden of bacterial antimicrobial resistance in 2019: a systematic analysis. The Lancet, 399(10325), 629–655. https://doi.org/10.1016/S0140-6736(21)02724-0

7. Pal, C., Bengtsson-Palme, J., Kristiansson, E., & Larsson, D. G. J. (2015). Co-occurrence of resistance genes to antibiotics, biocides and metals reveals novel insights into their co-selection potential. BMC Genomics, 16(1), 1–14. https://doi.org/10.1186/S12864-015-2153-5/FIGURES/9

8. Ratkowsky, D. A., Olley, J., McMeekin, T. A., & Ball, A. (1982). Relationship between temperature and growth rate of bacterial cultures. Journal of Bacteriology, 149(1), 1–5. https://doi.org/10.1128/JB.149.1.1-5.1982

9. WHO publishes list of bacteria for which new antibiotics are urgently needed. (n.d.). Retrieved July 31, 2023, fromhttps://www.who.int/news/item/27-02-2017-who-publishes-list-of-bacteria-for-which-new-antibiotics-are-urgently-needed
## Supplementary Tables
**Table S1:** Subtype prevalence of K. pneumonia in **Atlus** from 2018 to 2021 
| subtype |  2018   |  2019   |  2020   |  2021   |
| ------- | ------- | ------- | ------- | ------- |
|  RRRRR  | 0.149810| 0.154545| 0.155338| 0.179757|
|  RRRRS  | 0.032238| 0.025162| 0.026211| 0.025450|
|  RRRSR  | 0.019595| 0.022890| 0.025322| 0.019599|
|  RRRSS  | 0.034345| 0.022565| 0.025618| 0.018137|
|  RRSRR  | 0.061104| 0.067695| 0.063379| 0.072254|
|  RRSRS  | 0.021492| 0.018506| 0.023249| 0.014919|
|  RRSSR  | 0.008850| 0.012987| 0.010662| 0.011994|
|  RRSSS  | 0.023177| 0.026948| 0.024878| 0.026766|
|  RSRRR  | 0.003582| 0.001136| 0.000592| 0.002194|
|  RSRRS  | 0.001475| 0.003247| 0.001629| 0.002194|
|  RSRSR  | 0.000211| 0.000325| 0.000296| 0.000439|
|  RSRSS  | 0.002739| 0.002760| 0.002517| 0.003803|
|  RSSRR  | 0.001054| 0.001623| 0.000740| 0.000731|
|  RSSRS  | 0.001686| 0.001623| 0.002073| 0.001463|
|  RSSSR  | 0.000000| 0.000649| 0.000296| 0.000146|
|  RSSSS  | 0.003371| 0.004545| 0.002814| 0.003364|
|  SRRRR  | 0.001475| 0.003896| 0.003406| 0.003072|
|  SRRRS  | 0.008850| 0.008279| 0.009625| 0.006582|
|  SRRSR  | 0.003371| 0.001948| 0.003110| 0.002779|
|  SRRSS  | 0.014539| 0.012338| 0.011106| 0.008922|
|  SRSRR  | 0.003161| 0.004058| 0.004591| 0.002633|
|  SRSRS  | 0.007796| 0.005844| 0.007256| 0.005997|
|  SRSSR  | 0.003582| 0.006656| 0.006664| 0.008483|
|  SRSSS  | 0.019174| 0.015747| 0.016881| 0.018283|
|  SSRRR  | 0.006953| 0.004870| 0.001185| 0.003803|
|  SSRRS  | 0.005900| 0.006656| 0.006368| 0.006143|
|  SSRSR  | 0.001896| 0.001461| 0.000740| 0.001755|
|  SSRSS  | 0.010114| 0.012013| 0.011402| 0.014626|
|  SSSRR  | 0.007164| 0.008279| 0.005627| 0.005412|
|  SSSRS  | 0.031606| 0.027273| 0.026951| 0.023402|
|  SSSSR  | 0.023177| 0.028247| 0.026507| 0.021793|
|  SSSSS  | 0.486515| 0.485227| 0.492966| 0.483107|

**Table S2:** Subtype prevalence of K. pneumonia in **GEARS** from 2018 to 2021 
| subtype |  2018   |  2019   |  2020   |  2021   |
| ------- | ------- | ------- | ------- | ------- |
|  RRRRR  | 0.119599| 0.149410| 0.115641| 0.139932|
|  RRRRS  | 0.033951| 0.031455| 0.029950| 0.008532|
|  RRRSR  | 0.016204| 0.021625| 0.019967| 0.006826|
|  RRRSS  | 0.023920| 0.022280| 0.019135| 0.011945|
|  RRSRR  | 0.055556| 0.076016| 0.053245| 0.070819|
|  RRSRS  | 0.017747| 0.023591| 0.019967| 0.008532|
|  RRSSR  | 0.007716| 0.011140| 0.009151| 0.013652|
|  RRSSS  | 0.033179| 0.026868| 0.019967| 0.018771|
|  RSRRR  | 0.000772| 0.000655| 0.000832| 0.000853|
|  RSRRS  | 0.000000| 0.000000| 0.000832| 0.000000|
|  RSRSR  | 0.000772| 0.000000| 0.000000| 0.000000|
|  RSRSS  | 0.000772| 0.001311| 0.001664| 0.000853|
|  RSSRR  | 0.000000| 0.000000| 0.001664| 0.002560|
|  RSSRS  | 0.000000| 0.000000| 0.000832| 0.000000|
|  RSSSR  | 0.001543| 0.000000| 0.000832| 0.000000|
|  RSSSS  | 0.003858| 0.003277| 0.002496| 0.000853|
|  SRRRR  | 0.002315| 0.001966| 0.003328| 0.000853|
|  SRRRS  | 0.006944| 0.011796| 0.006656| 0.005973|
|  SRRSR  | 0.002315| 0.001311| 0.002496| 0.005119|
|  SRRSS  | 0.006944| 0.007208| 0.009151| 0.011092|
|  SRSRR  | 0.003858| 0.005898| 0.004160| 0.009386|
|  SRSRS  | 0.006173| 0.009174| 0.008319| 0.008532|
|  SRSSR  | 0.001543| 0.009174| 0.008319| 0.011945|
|  SRSSS  | 0.018519| 0.012451| 0.018303| 0.029863|
|  SSRRR  | 0.003086| 0.003932| 0.000832| 0.003413|
|  SSRRS  | 0.009259| 0.004587| 0.004992| 0.004266|
|  SSRSR  | 0.003086| 0.000000| 0.000000| 0.001706|
|  SSRSS  | 0.010802| 0.005242| 0.011647| 0.006826|
|  SSSRR  | 0.003858| 0.009830| 0.005824| 0.005973|
|  SSSRS  | 0.023920| 0.038663| 0.024126| 0.017918|
|  SSSSR  | 0.023920| 0.028834| 0.032446| 0.026451|
|  SSSSS  | 0.557870| 0.482307| 0.563228| 0.566553|


## Supplementary figures

![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/supplementary-figure-3-ab-ATS.png)
![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/supplementary-figure-3-c-ATS.png)
**Figure S3: ATLAS data only - regression analysis between all-susceptible-subtype prevalence (0-1) with relative humidity (log10 transformed)** 
![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/supplementary-figure-3-ab-GEA.png)
![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/supplementary-figure-3-c-GEA.png)
**Figure S4: GEARS data only - regression analysis between all-susceptible-subtype prevalence (0-1) with relative humidity (log10 transformed)**

![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/supplementary-figure-4-ab-ATS.png)
![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/supplementary-figure-4-c-ATS.png)
**Figure S5: ATLAS data only - regression analysis between all-resistance-subtype prevalence (0-1) with relative humidity (log10 transformed)** 
![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/supplementary-figure-4-ab-GEA.png)
![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/supplementary-figure-4-c-GEA.png)
**Figure S6: GEARS data only - regression analysis between all-resistance-subtype prevalence (0-1) with relative humidity (log10 transformed)**






