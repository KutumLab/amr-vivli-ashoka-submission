rm(list=ls())
# path_working <- "/Users/rintukutum/Documents/office/ashoka/research/research-chartxamr/amrxvivli/amr-vivli-ashoka-submission"
# setwd(path_working)
reg_subtype_envr <- readr::read_csv(
  'results/regression_results_combined.csv'
)

subtype_envir <- data.frame(
  reg_subtype_envr[,c('year','index','regressor',"R-squared","P-value")]
)

unique(subtype_envir$regressor)
# [1] "T2M"         "QV2M"        "RH2M"        "T2M_MAX"     "T2M_MIN"    
# [6] "PRECTOTCORR"
var_names <- c(
  "Mean temp(°C)", "Spec. Humidity",
  "RH(%)", "Max temp(°C)", 
  "Min temp(°C)",
  "Precipitation (mm)"
)
names(var_names) <- unique(subtype_envir$regressor)
library(ggplot2)
library(ggpubr)
inx_sig <- subtype_envir$P.value < 0.05
subtype_envir$R.squared <- round(
  subtype_envir$R.squared,1)
fig02_atlas_gears<-ggplot(na.omit(subtype_envir[inx_sig,]),
                          aes(x=regressor,y=index)) +
  geom_point(aes(
    fill=R.squared,size=-log10(P.value)),
             shape=21) +
  facet_grid(facets = .~year) +
  ylab('Significant subtypes (25/32)') +
  xlab('Environmental parameters') +
  theme_pubr() +
  theme(axis.text.x = element_text(
    angle = 45,vjust = 1,hjust = 1
  )) +
  scale_x_discrete(
    limit = names(var_names)[c(6,3,1,5,4,2)],
    label = var_names[c(6,3,1,5,4,2)]
  ) +
  scale_fill_gradient(
    low = '#F7F7F7',
    high = '#053061'
  )
fig02_atlas_gears
write.csv(na.omit(subtype_envir[inx_sig,1:3]),
          '../data/01-heatmap-subtype-envr-ATLAS-GEARS.csv',
          row.names = FALSE)

pdf('figures/figure-02-subtype-envr-ATLAS-GEARS.pdf',
    width = 8,height = 6.5)
fig02_atlas_gears
dev.off()


