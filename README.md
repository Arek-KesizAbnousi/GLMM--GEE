# Generalized linear mixed model (GLMM) and Generalized estimating equation (GEE)

  
 # Data  
Sample of 11 to 17 year olds, 117 boys and 120 girls,
and asked questions about marijuna usage. The data was collected over a five year period.
The outcome is count.

     
 # Code implementation.
   
   - R packages : library(lme4) , library(gee)
   - Fit a GLMM to the data and Fit a GEE to the data.
   - Concluded  the coefficient(s) obtained from GMM are conditional on intra-class correlation but GEE
     gives marginal effects.Thus, coefficients do not have same interpretation.



 # Conlusion
  We know that coefficients obtained from mixed model are conditional on intra-class correlation but GEE
gives marginal effects, so they are not same/similar So we can say the coefficients for sex in the mixed model
and GEE do not have same interpretation
