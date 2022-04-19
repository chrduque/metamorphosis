## METaMorPHosis: METallicity for M dwarfs using PHotometry

DRAFT

This is the R code to calculate the photometric metallicity estimations described in Duque-Arribas et al. (in prep.):\
(INSERT LINK WHEN AVAILABLE)

Really easy to use! Just download/clone both files, metamorphosis.R and chains.rds, in the desired folder, start a R session, and set it as your working directory:
```
R
setwd("~/Documents/myfolder")
```

Then
```
source("metamorphosis.R")
```
So now you are able to use the function 'metamorphosis()'. The input arguments of this function are the photometric/astrometric data, their errors, and the chosen diagram. For example, for HD 38529 B and using the best calibration in Table 4:
```
FeH_post = metamorphosis(X=0.049,eX=0.006,Y=2.403,eY=0.005,Z=9.187,eZ=0.003,diagram='W1W2-BPRP-G')
```
The output of this function will be a vector of 7500 elements, which is the posterior distribution for the metallicity of your star. You will receive a message with the median and MAD values of this distribution.

If you are interested in estimating the metallicity for a star sample of N stars stored in the table 'mydata', you can use the function with a loop and store the posterior distributions in a matrix:
```
FeH_post_matrix = matrix(nrow=N, ncol=7500)
for (i in 1:N) {
  FeH_post_matrix[i, ] = metamorphosis(X=mydata$W1W2[i],Y=mydata$BPRP[i],Z=M_G[i],                      
                                      eX=mydata$e_W1W2[i],eY=mydata$e_BPRP[i],eZ=mydata$e_M_G[i],
                                      diagram='W1W2-BPRP-G')
}
```

Each row in FeH_post_matrix is the posterior distribution of one of your N stars. You can calculate all the median values of these distributions using:
```
apply(posteriors, 1, median)
```

Alternatively, you can use the following shinyapp: [https://chrduque.shinyapps.io/metamorphosis/](https://chrduque.shinyapps.io/metamorphosis/). Just choose your diagram, enter your data and see the posterior distribution of the photometric metallicity for your star!
