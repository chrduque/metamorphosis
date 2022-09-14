chains = readRDS(file = "chains.rds")

metamorphosis = function(X=NULL,Y=NULL,Z=NULL,eX=0,eY=0,eZ=0,diagram="W1W2-BPRP-M_G"){
  if (diagram %in% c('W1W2-GJ', 'W1W2-GH', 'W1W2-GK', 'W1W2-RPJ', 'W1W2-RPH', 'W1W2-RPK', 'W1W2-GW1', 'W1W2-GW2', 'W1W2-RPW1', 'W1W2-RPW2', 'W1W2-BPRP')) {
    X = rnorm(7500, mean=X, sd=eX)
    Y = rnorm(7500, mean=Y, sd=eY)
    a = chains[[diagram]]$`beta[1]`
    b = chains[[diagram]]$`beta[2]`
    c = chains[[diagram]]$`beta[3]`
    d = chains[[diagram]]$`beta[4]`
    e = chains[[diagram]]$`beta[5]`
    sigma = chains[[diagram]]$sigma
    nu = chains[[diagram]]$nu
    mu = a+b*X+c*Y+d*Y^2+e*X^2
    FeH = rt.scaled(n=7500,df=nu,mean=mu,sd=sigma)
    print(paste('Estimated metallicity:',round(median(FeH),3),'+-',round(mad(FeH),3)))
    return(FeH)
  }
  else if (diagram %in% c('GJ-M_G', 'GH-M_G', 'GK-M_G', 'RPJ-M_G', 'RPH-M_G', 'RPK-M_G', 'GW1-M_G', 'GW2-M_G', 'RPW1-M_G', 'RPW2-M_G', 'BPRP-M_G',
                          'GJ-M_J', 'GH-M_J', 'GK-M_J', 'RPJ-M_J', 'RPH-M_J', 'RPK-M_J', 'GW1-M_J', 'GW2-M_J', 'RPW1-M_J', 'RPW2-M_J', 'BPRP-M_J',
                          'GJ-M_H', 'GH-M_H', 'GK-M_H', 'RPJ-M_H', 'RPH-M_H', 'RPK-M_H', 'GW1-M_H', 'GW2-M_H', 'RPW1-M_H', 'RPW2-M_H', 'BPRP-M_H',
                          'GJ-M_K', 'GH-M_K', 'GK-M_K', 'RPJ-M_K', 'RPH-M_K', 'RPK-M_K', 'GW1-M_K', 'GW2-M_K', 'RPW1-M_K', 'RPW2-M_K', 'BPRP-M_K')) {
    X = rnorm(7500, mean=X, sd=eX)
    Y = rnorm(7500, mean=Y, sd=eY)
    a = chains[[diagram]]$`beta[1]`
    b = chains[[diagram]]$`beta[2]`
    c = chains[[diagram]]$`beta[3]`
    d = chains[[diagram]]$`beta[4]`
    e = chains[[diagram]]$`beta[5]`
    sigma = chains[[diagram]]$sigma
    nu = chains[[diagram]]$nu
    mu = a+b*X+c*Y+d*Y^2+e*X^2
    FeH = rt.scaled(n=7500,df=nu,mean=mu,sd=sigma)
    print(paste('Estimated metallicity:',round(median(FeH),3),'+-',round(mad(FeH),3)))
    return(FeH)
  }
  else if (diagram %in% c('W1W2-BPRP-M_G', 'W1W2-BPRP-M_J', 'W1W2-BPRP-M_H', 'W1W2-BPRP-M_K')){
    X = rnorm(7500, mean=X, sd=eX)
    Y = rnorm(7500, mean=Y, sd=eY)
    Z = rnorm(7500, mean=Z, sd=eZ)
    a = chains[[diagram]]$`beta[1]`
    b = chains[[diagram]]$`beta[2]`
    c = chains[[diagram]]$`beta[3]`
    d = chains[[diagram]]$`beta[4]`
    e = chains[[diagram]]$`beta[5]`
    f = chains[[diagram]]$`beta[6]`
    sigma = chains[[diagram]]$sigma
    nu = chains[[diagram]]$nu
    mu = a+b*X+c*Y+d*Z+e*Y^2+f*Z^2
    FeH = rt.scaled(n=7500,df=nu,mean=mu,sd=sigma)
    print(paste('Estimated metallicity:',round(median(FeH),3),'+-',round(mad(FeH),3)))
    return(FeH)
  }
  else{print('Diagram not supported.')}
}
