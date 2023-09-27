## [Vivli AMR Surveillance Open Data Re-use Data Challenge](https://amr.vivli.org/data-challenge/data-challenge-overview/)
**Team ID: 9049**
## Proposal Title:
**Novel approach to analysis of AMR: looking at the composite resistance phenotype**
## Date of Submission (dd-mmm-yy):
30th July 2023
## Research Team Members details (put the Lead Applicant 1st in the table):
| Team Member Name        | Role in the Data Challenge                   | Affiliation                               | Email                         | Country |
| ----------------------- | ------------------------------------------ | ----------------------------------------- | ----------------------------- | ------- |
| [Shraddha Karve](https://www.ashoka.edu.in/profile/shraddha-karve/) [SK]          | Conceptualization of subtype analysis, formulation of EOI and final report | Trivedi School of Biology, Ashoka University | shraddha.karve@ashoka.edu.in | India   |
| [Rintu Kutum](https://www.ashoka.edu.in/profile/rintu-kutum/) [RK]             | Data analysis and final report              | Department of Computer Science, Ashoka University | rintu.kutum@ashoka.edu.in   | India   |
| [Devojit Kumar Sarma](https://nireh.icmr.org.in/DKSarma.php) [DS]           | Conceptualization of climatic correlations and final report | ICMR-National Institute For Research in Environmental Health (ICMR-NIREH), Bhopal                               | devojit.sarma@icmr.gov.in    | India   |
| Vasundhara Karthikeyan  | Data wrangling and analysis [VK]                 | Trivedi School of Biology, Ashoka University | vasundhara.karthikeyan@ashoka.edu.in | India   |
| Ragul N                 | Data wrangling and analysis [RN]                 | Department of Computer Science, Ashoka University | ragul.n_asp24@ashoka.edu.in  | India   |

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

The subtype study carried out using the merged ATLAS and GEARS dataset and focusing on five antibiotics (cefepime, ceftazidime, gentamicin, levofloxacin, and piperacillin-tazobactam) identified 33 distinct subtypes of Klebsiella pneumoniae between 2018 and 2021 (Figure 1 and Table 1). Notably, the analysis highlighted that the extreme subtypes, RRRRR (~13%) and SSSSS (~55%), accounted for approximately 70% of the isolates (Table 1). We then explored the relationship between the regional patterns (averaged) of the most prevalent subtypes in the merged dataset (RRRRR and SSSSS) and the global climatic variables including precipitation, relative humidity (RH) and temperature (mean, minimum and maximum temperature) averaged over 2018-2021. Precipitation and relative humidity showed higher correlations with many of the subtypes than the temperature variables over the years (Figure 2). Owing to the consistent strength of correlation of precipitation and relative humidity with the most prevalent subtypes (RRRRR and SSSSS) across the years, we focused our analysis on the association between these parameters and the predominant subtypes.

![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/figure-1-complete-workflow.png)
**Figure 1: Complete workflow of integration of AMR data with environmental parameters.** (A) Illustration showing conversion for gram negative pathogens antibiotics data (FEP, CAZ, GEN, LVX, and TZP) to subtype for clinical isolates for different countries, (B) Illustration showing year wise (2018) prevalence of 32 subtypes for the given antibiotics, (C) Illustration showing 6 environmental parameters across countries for a given year (2018), (D) Regression analysis showing relationship between RRRRR subtype prevalence with relative humidity (RH2M).

**Table 1:** Subtype prevalence of K. pneumonia from 2018 to 2021.

| Subtype | 2018(%) | 2019(%) | 2020(%) | 2021(%) |
| ------- | ---- | ---- | ---- | ---- |
| RRRRR   | 14.33 | 15.35 | 14.93 | 17.39 |
| RRRRS   | 3.26  | 2.64  | 2.68  | 2.30  |
| RRRSR   | 1.89  | 2.26  | 2.45  | 1.77  |
| RRRSS   | 3.21  | 2.25  | 2.46  | 1.72  |
| RRSRR   | 5.99  | 6.93  | 6.18  | 7.20  |
| RRSRS   | 2.07  | 1.95  | 2.28  | 1.40  |
| RRSSR   | 0.86  | 1.26  | 1.04  | 1.22  |
| RRSSS   | 2.53  | 2.69  | 2.41  | 2.56  |
| RSRRR   | 0.30  | 0.10  | 0.06  | 0.20  |
| RSRRS   | 0.12  | 0.26  | 0.15  | 0.19  |
| RSRSR   | 0.03  | 0.03  | 0.03  | 0.04  |
| RSRSS   | 0.23  | 0.25  | 0.24  | 0.34  |
| RSSRR   | 0.08  | 0.13  | 0.09  | 0.10  |
| RSSRS   | 0.13  | 0.13  | 0.19  | 0.12  |
| RSSSR   | 0.03  | 0.05  | 0.04  | 0.01  |
| RSSSS   | 0.35  | 0.43  | 0.28  | 0.30  |
| SRRRR   | 0.17  | 0.35  | 0.34  | 0.27  |
| SRRRS   | 0.84  | 0.90  | 0.92  | 0.65  |
| SRRSR   | 0.31  | 0.18  | 0.30  | 0.31  |
| SRRSS   | 1.29  | 1.13  | 1.08  | 0.92  |
| SRSRR   | 0.33  | 0.44  | 0.45  | 0.36  |
| SRSRS   | 0.74  | 0.65  | 0.74  | 0.64  |
| SRSSR   | 0.31  | 0.72  | 0.69  | 0.90  |
| SRSSS   | 1.90  | 1.51  | 1.71  | 2.00  |
| SSRRR   | 0.61  | 0.47  | 0.11  | 0.37  |
| SSRRS   | 0.66  | 0.62  | 0.62  | 0.59  |
| SSRSR   | 0.22  | 0.12  | 0.06  | 0.17  |
| SSRSS   | 1.03  | 1.07  | 1.14  | 1.35  |
| SSSRR   | 0.65  | 0.86  | 0.57  | 0.55  |
| SSSRS   | 3.00  | 2.95  | 2.65  | 2.26  |
| SSSSR   | 2.33  | 2.84  | 2.74  | 2.25  |
| SSSSS	  | 50.18	| 48.46	| 50.36	| 49.53 |

![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/figure-02-subtype-envr-ATLAS-GEARS.png)
**Figure 2: Bubble plot representing significant association post regression analysis across different subtypes of K. pneumonia and global climatic parameters from 2018 to 2021 using ATLAS and GEARS data.** The color intensity represents the R-squared value and size of the point represents the -log10(p-value), where bigger size implies statistical significance.

### Association of relative humidity with all-susceptible-subtype (SSSSS) and all-resistance-subtype (RRRRR)
Post the multivariable regression analysis, we found that there is a strong association between the all-susceptible subtype and the relative humidity (Figure 3) and this was consistent across all the regions. We see that there is a significant inverse relationship between RH and SSSSS subtype with time (2021). We saw a similar trend between RH and RRRRR subtype across all the regions. With 2020, showing a significant inverse relationship between the RRRRR subtype and RH (Figure 4).

![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/figure-3-ab-GEA-ATS.png)
![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/figure-3-c-GEA-ATS.png)
**Figure 3: Regression analysis between all-susceptible-subtype prevalence (0-1) with relative humidity (log10 transformed).** Heatmap showing (A) prevalence of all-susceptible-subtype (SSSSS) and (B) log10(relative humidity) for 2018 across 63 countries. (C) Scatterplot between SSSSS subtype and relative humidity (RH2M) with the regression line from 2018 to 2021 (for 2018 and 2021 corresponding p-values were less than 0.05).

![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/figure-4-ab-GEA-ATS.png)
![alt text](https://github.com/KutumLab/amr-vivli-ashoka-submission/blob/main/figures/figure-4-c-GEA-ATS.png)
**Figure 4: Regression analysis between all-resistance-subtype prevalence (0-1) with relative humidity (log10 transformed).** Heatmap showing (A) prevalence of all-resistance-subtype (RRRRR) and (B) log10(relative humidity) for 2020. (C) Scatterplot between RRRRR subtype and relative humidity (RH2M) with the regression line from 2018 to 2021 (for 2020 corresponding p-value was less than 0.05).

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

## Supplementary Tables
**Table S1:** Subtype prevalence of K. pneumonia in **ATLAS** from 2018 to 2021 
| Subtype   | 2018(%)  | 2019(%)  | 2020(%)  | 2021(%)  |
| ------ | ----- | ----- | ----- | ----- |
| RRRRR  | 14.98 | 15.45 | 15.53 | 17.98 |
| RRRRS  | 3.22  | 2.52  | 2.62  | 2.54  |
| RRRSR  | 1.96  | 2.29  | 2.53  | 1.96  |
| RRRSS  | 3.43  | 2.26  | 2.56  | 1.81  |
| RRSRR  | 6.11  | 6.77  | 6.34  | 7.23  |
| RRSRS  | 2.15  | 1.85  | 2.32  | 1.49  |
| RRSSR  | 0.88  | 1.30  | 1.07  | 1.20  |
| RRSSS  | 2.32  | 2.69  | 2.49  | 2.68  |
| RSRRR  | 0.36  | 0.11  | 0.06  | 0.22  |
| RSRRS  | 0.15  | 0.32  | 0.16  | 0.22  |
| RSRSR  | 0.02  | 0.03  | 0.03  | 0.04  |
| RSSRS  | 0.27  | 0.28  | 0.25  | 0.38  |
| RSSRR  | 0.11  | 0.16  | 0.07  | 0.07  |
| RSSRS  | 0.17  | 0.16  | 0.21  | 0.15  |
| RSSSR  | 0.00  | 0.06  | 0.03  | 0.01  |
| RSSSS  | 0.34  | 0.45  | 0.28  | 0.34  |
| SRRRR  | 0.15  | 0.39  | 0.34  | 0.31  |
| SRRRS  | 0.88  | 0.83  | 0.96  | 0.66  |
| SRRSR  | 0.34  | 0.19  | 0.31  | 0.28  |
| SRRSS  | 1.45  | 1.23  | 1.11  | 0.89  |
| SRSRR  | 0.32  | 0.41  | 0.46  | 0.26  |
| SRSRS  | 0.78  | 0.58  | 0.73  | 0.60  |
| SRSSR  | 0.36  | 0.67  | 0.67  | 0.85  |
| SRSSS  | 1.92  | 1.57  | 1.69  | 1.83  |
| SSRRR  | 0.70  | 0.49  | 0.12  | 0.38  |
| SSRRS  | 0.59  | 0.67  | 0.64  | 0.61  |
| SSRSR  | 0.19  | 0.15  | 0.07  | 0.18  |
| SSRSS  | 1.01  | 1.20  | 1.14  | 1.46  |
| SSSRR  | 0.72  | 0.83  | 0.56  | 0.54  |
| SSSRS  | 3.16  | 2.73  | 2.70  | 2.34  |
| SSSSR  | 2.32  | 2.82  | 2.65  | 2.18  |
| SSSSS  | 48.65 | 48.52 | 49.30 | 48.31 |


**Table S2:** Subtype prevalence of K. pneumonia in **GEARS** from 2018 to 2021 
| Subtype | 2018(%)  | 2019(%)  | 2020(%)  | 2021(%)  |
| ------- | ----- | ----- | ----- | ----- |
| RRRRR   | 11.96 | 14.94 | 11.56 | 13.99 |
| RRRRS   | 3.40  | 3.15  | 3.00  | 0.85  |
| RRRSR   | 1.62  | 2.16  | 2.00  | 0.68  |
| RRRSS   | 2.39  | 2.23  | 1.91  | 1.19  |
| RRSRR   | 5.56  | 7.60  | 5.32  | 7.08  |
| RRSRS   | 1.77  | 2.36  | 2.00  | 0.85  |
| RRSSR   | 0.77  | 1.11  | 0.92  | 1.37  |
| RRSSS   | 3.32  | 2.69  | 2.00  | 1.88  |
| RSRRR   | 0.08  | 0.07  | 0.08  | 0.09  |
| RSRRS   | 0.00  | 0.00  | 0.08  | 0.00  |
| RSRSR   | 0.08  | 0.00  | 0.00  | 0.00  |
| RSRSS   | 0.08  | 0.13  | 0.17  | 0.09  |
| RSSRR   | 0.00  | 0.00  | 0.17  | 0.26  |
| RSSRS   | 0.00  | 0.00  | 0.08  | 0.00  |
| RSSSR   | 0.15  | 0.00  | 0.08  | 0.00  |
| RSSSS   | 0.39  | 0.33  | 0.25  | 0.09  |
| SRRRR   | 0.23  | 0.20  | 0.33  | 0.09  |
| SRRRS   | 0.69  | 1.18  | 0.67  | 0.60  |
| SRRSR   | 0.23  | 0.13  | 0.25  | 0.51  |
| SRRSS   | 0.69  | 0.72  | 0.92  | 1.11  |
| SRSRR   | 0.39  | 0.59  | 0.42  | 0.94  |
| SRSRS   | 0.62  | 0.92  | 0.83  | 0.85  |
| SRSSR   | 0.15  | 0.92  | 0.83  | 1.19  |
| SRSSS   | 1.85  | 1.25  | 1.83  | 2.99  |
| SSRRR   | 0.31  | 0.39  | 0.08  | 0.34  |
| SSRRS   | 0.93  | 0.46  | 0.50  | 0.43  |
| SSRSR   | 0.31  | 0.00  | 0.00  | 0.17  |
| SSRSS   | 1.08  | 0.52  | 1.16  | 0.68  |
| SSSRR   | 0.39  | 0.98  | 0.58  | 0.60  |
| SSSRS   | 2.39  | 3.87  | 2.41  | 1.79  |
| SSSSR   | 2.39  | 2.88  | 3.24  | 2.65  |
| SSSSS   | 55.79 | 48.23 | 56.32 | 56.66 |

## Acknowledgements
SK, RK, DK, VK and RN would like to thank Vivli AMR Surveillance Open Data Re-use Data Challenge organisers and reviewers for their critical inputs and suggestions.
SK and RK would like to thank [The Rockefeller Foundation](https://www.rockefellerfoundation.org/), [Mphasis F1 Foundation](https://www.mphasis.com/home/corporate/community-social-responsibility.html) for the initial funding & fellowship supports for subtype analysis for AMR in India. SK would also like to funding support from SERB. Additionally, RK and RN would like to thank the Centre for Computational Biology and Bioinformatics for High Performance Computing facility at Ashoka University. RN thanks Mphasis F1 Foundation for his fellowship support. DS acknowledges support of ICMR-NIREH. 






