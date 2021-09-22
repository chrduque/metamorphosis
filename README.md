# photometric_FeH

This is the R code to calculate the photometric metallicity estimations described in Duque-Arribas et al. (in prep.):\
(INSERT LINK WHEN AVAILABLE)

Really easy to use! Just download/clone both files, photometric_FeH.R and chains.rds, in the desired folder and set it as your working directory:
```
setwd("~/Documents/myfolder")
```

Then
```
source("photometric_FeH.R")
```
So now you are able to use the function 'estimate_FeH'. The input arguments of this function are the photometric/astrometric data and their errors, and the chosen diagram. For example, for the best calibration in Table 5:
```
FeH_post = estimate_FeH(W1=,eW1=,W2=,eW2=,BP=,eBP=,RP=,eRP=,K=,eK=,parallax=,eparallax=,diagram='W1W2-BPRP-K')
```
The output of this function will be a vector of 12000 elements, which is the posterior distribution for the metallicity of your star. You will receive a message with the median and MAD values of this distribution.

If you are interested in estimating the metallicity for a star sample of N stars stored in the table 'mydata', you can use the function with a loop and store the posterior distributions in a matrix:
```
FeH_post_matrix = matrix(nrow=N, ncol=12000)
for (i in 1:435) {
  FeH_post_matrix[i, ] = estimate_FeH(W1=mydata$W1mag[i],W2=mydata$W2mag[i],BP=mydata$phot_bp_mean_mag[i],RP=mydata$phot_rp_mean_mag[i],K=mydata$Kmag[i],parallax=mydata$parallax[i],                      
                                      eW1=mydata$e_W1mag[i],eW2=mydata$e_W2mag[i],eBP=mydata$phot_bp_mean_mag_error[i],eRP=mydata$phot_rp_mean_mag_error[i],eK=mydata$e_Kmag[i],eparallax=mydata$parallax_error[i],
                                      diagram='W1W2-BPRP-K')
}
```

Each row in FeH_post_matrix is the posterior distribution of one of your stars. You can calculate all the median values of these distributions using:
```
apply(posteriors, 1, median)
```
