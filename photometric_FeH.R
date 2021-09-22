# Load MCMC chains
chains = readRDS(file = "chains.rds")

estimate_FeH = function(BP=NULL,G=NULL,RP=NULL,J=NULL,H=NULL,K=NULL,W1=NULL,W2=NULL,parallax=NULL,eBP=NULL,eG=NULL,eRP=NULL,eJ=NULL,eH=NULL,eK=NULL,eW1=NULL,eW2=NULL,eparallax=NULL,diagram='W1W2-BPRP-K'){
  # Color-color-magnitude diagrams
  if (diagram == 'W1W2-BPRP-K' & !is.null(W1) & !is.null(W2) & !is.null(BP) & !is.null(RP) & !is.null(K) & !is.null(parallax)){x1=W1; ex1=eW1; x2=W2; ex2=eW2; y1=BP; ey1=eBP; y2=RP; ey2=eRP; z1=K; ez1=eK; z2=parallax; ez2=eparallax} 
  else if (diagram == 'W1W2-BPRP-H' & !is.null(W1) & !is.null(W2) & !is.null(BP) & !is.null(RP) & !is.null(H) & !is.null(parallax)){x1=W1; ex1=eW1; x2=W2; ex2=eW2; y1=BP; ey1=eBP; y2=RP; ey2=eRP; z1=H; ez1=eH; z2=parallax; ez2=eparallax} 
  else if (diagram == 'W1W2-BPRP-J' & !is.null(W1) & !is.null(W2) & !is.null(BP) & !is.null(RP) & !is.null(J) & !is.null(parallax)){x1=W1; ex1=eW1; x2=W2; ex2=eW2; y1=BP; ey1=eBP; y2=RP; ey2=eRP; z1=J; ez1=eJ; z2=parallax; ez2=eparallax} 
  else if (diagram == 'W1W2-BPRP-G' & !is.null(W1) & !is.null(W2) & !is.null(BP) & !is.null(RP) & !is.null(G) & !is.null(parallax)){x1=W1; ex1=eW1; x2=W2; ex2=eW2; y1=BP; ey1=eBP; y2=RP; ey2=eRP; z1=G; ez1=eG; z2=parallax; ez2=eparallax} 
  # Color-color diagrams
  else if (diagram == 'W1W2-BPRP' & !is.null(W1) & !is.null(W2) & !is.null(BP) & !is.null(RP)){x1=W1; ex1=eW1; x2=W2; ex2=eW2; y1=BP; ey1=eBP; y2=RP; ey2=eRP}
  else if (diagram == 'W1W2-GJ' & !is.null(W1) & !is.null(W2) & !is.null(G) & !is.null(J)){x1=W1; ex1=eW1; x2=W2; ex2=eW2; y1=G; ey1=eG; y2=J; ey2=eJ}
  else if (diagram == 'W1W2-GH' & !is.null(W1) & !is.null(W2) & !is.null(G) & !is.null(H)){x1=W1; ex1=eW1; x2=W2; ex2=eW2; y1=G; ey1=eG; y2=H; ey2=eH}
  else if (diagram == 'W1W2-GK' & !is.null(W1) & !is.null(W2) & !is.null(G) & !is.null(K)){x1=W1; ex1=eW1; x2=W2; ex2=eW2; y1=G; ey1=eG; y2=K; ey2=eK}
  else if (diagram == 'W1W2-GW1' & !is.null(W1) & !is.null(W2) & !is.null(G)){x1=W1; ex1=eW1; x2=W2; ex2=eW2; y1=G; ey1=eG; y2=W1; ey2=eW1}
  else if (diagram == 'W1W2-GW2' & !is.null(W1) & !is.null(W2) & !is.null(G)){x1=W1; ex1=eW1; x2=W2; ex2=eW2; y1=G; ey1=eG; y2=W2; ey2=eW2}
  else if (diagram == 'W1W2-RPJ' & !is.null(W1) & !is.null(W2) & !is.null(RP) & !is.null(J)){x1=W1; ex1=eW1; x2=W2; ex2=eW2; y1=RP; ey1=eRP; y2=J; ey2=eJ}
  else if (diagram == 'W1W2-RPH' & !is.null(W1) & !is.null(W2) & !is.null(RP) & !is.null(H)){x1=W1; ex1=eW1; x2=W2; ex2=eW2; y1=RP; ey1=eRP; y2=H; ey2=eH}
  else if (diagram == 'W1W2-RPK' & !is.null(W1) & !is.null(W2) & !is.null(RP) & !is.null(K)){x1=W1; ex1=eW1; x2=W2; ex2=eW2; y1=RP; ey1=eRP; y2=K; ey2=eK}
  else if (diagram == 'W1W2-RPW1' & !is.null(W1) & !is.null(W2) & !is.null(RP)){x1=W1; ex1=eW1; x2=W2; ex2=eW2; y1=RP; ey1=eRP; y2=W1; ey2=eW1}
  else if (diagram == 'W1W2-RPW2' & !is.null(W1) & !is.null(W2) & !is.null(RP)){x1=W1; ex1=eW1; x2=W2; ex2=eW2; y1=RP; ey1=eRP; y2=W2; ey2=eW2}
  # Color-magnitude diagrams
  else if (diagram == 'GJ-G' & !is.null(parallax) & !is.null(G) & !is.null(J)){x1=G; ex1=eG; x2=J; ex2=eJ; y1=G; ey1=eG; y2=parallax; ey2=eparallax}
  else if (diagram == 'GH-G' & !is.null(parallax) & !is.null(G) & !is.null(H)){x1=G; ex1=eG; x2=H; ex2=eH; y1=G; ey1=eG; y2=parallax; ey2=eparallax}
  else if (diagram == 'GK-G' & !is.null(parallax) & !is.null(G) & !is.null(K)){x1=G; ex1=eG; x2=K; ex2=eK; y1=G; ey1=eG; y2=parallax; ey2=eparallax}
  else if (diagram == 'GW1-G' & !is.null(parallax) & !is.null(G) & !is.null(W1)){x1=G; ex1=eG; x2=W1; ex2=eW1; y1=G; ey1=eG; y2=parallax; ey2=eparallax}
  else if (diagram == 'GW2-G' & !is.null(parallax) & !is.null(G) & !is.null(W2)){x1=G; ex1=eG; x2=W2; ex2=eW2; y1=G; ey1=eG; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPJ-G' & !is.null(parallax) & !is.null(G) & !is.null(J) & is.null(RP)){x1=RP; ex1=eRP; x2=J; ex2=eJ; y1=G; ey1=eG; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPH-G' & !is.null(parallax) & !is.null(G) & !is.null(H) & is.null(RP)){x1=RP; ex1=eRP; x2=H; ex2=eH; y1=G; ey1=eG; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPK-G' & !is.null(parallax) & !is.null(G) & !is.null(K) & is.null(RP)){x1=RP; ex1=eRP; x2=K; ex2=eK; y1=G; ey1=eG; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPW1-G' & !is.null(parallax) & !is.null(G) & !is.null(W1) & is.null(RP)){x1=RP; ex1=eRP; x2=W1; ex2=eW1; y1=G; ey1=eG; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPW2-G' & !is.null(parallax) & !is.null(G) & !is.null(W2) & is.null(RP)){x1=RP; ex1=eRP; x2=W2; ex2=eW2; y1=G; ey1=eG; y2=parallax; ey2=eparallax}
  else if (diagram == 'BPRP-G' & !is.null(parallax) & !is.null(G) & !is.null(BP) & is.null(RP)){x1=BP; ex1=eBP; x2=RP; ex2=eRP; y1=G; ey1=eG; y2=parallax; ey2=eparallax}
  
  else if (diagram == 'GJ-J' & !is.null(parallax) & !is.null(G) & !is.null(J)){x1=G; ex1=eG; x2=J; ex2=eJ; y1=J; ey1=eJ; y2=parallax; ey2=eparallax}
  else if (diagram == 'GH-J' & !is.null(parallax) & !is.null(G) & !is.null(H) & !is.null(J)){x1=G; ex1=eG; x2=H; ex2=eH; y1=J; ey1=eJ; y2=parallax; ey2=eparallax}
  else if (diagram == 'GK-J' & !is.null(parallax) & !is.null(G) & !is.null(K) & !is.null(J)){x1=G; ex1=eG; x2=K; ex2=eK; y1=J; ey1=eJ; y2=parallax; ey2=eparallax}
  else if (diagram == 'GW1-J' & !is.null(parallax) & !is.null(G) & !is.null(W1) & !is.null(J)){x1=G; ex1=eG; x2=W1; ex2=eW1; y1=J; ey1=eJ; y2=parallax; ey2=eparallax}
  else if (diagram == 'GW2-J' & !is.null(parallax) & !is.null(G) & !is.null(W2) & !is.null(J)){x1=G; ex1=eG; x2=W2; ex2=eW2; y1=J; ey1=eJ; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPJ-J' & !is.null(parallax) & !is.null(J) & is.null(RP)){x1=RP; ex1=eRP; x2=J; ex2=eJ; y1=J; ey1=eJ; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPH-J' & !is.null(parallax) & !is.null(H) & is.null(RP) & !is.null(J)){x1=RP; ex1=eRP; x2=H; ex2=eH; y1=J; ey1=eJ; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPK-J' & !is.null(parallax) & !is.null(K) & is.null(RP) & !is.null(J)){x1=RP; ex1=eRP; x2=K; ex2=eK; y1=J; ey1=eJ; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPW1-J' & !is.null(parallax) & !is.null(W1) & is.null(RP) & !is.null(J)){x1=RP; ex1=eRP; x2=W1; ex2=eW1; y1=J; ey1=eJ; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPW2-J' & !is.null(parallax) & !is.null(W2) & is.null(RP) & !is.null(J)){x1=RP; ex1=eRP; x2=W2; ex2=eW2; y1=J; ey1=eJ; y2=parallax; ey2=eparallax}
  else if (diagram == 'BPRP-J' & !is.null(parallax) & !is.null(BP) & is.null(RP) & !is.null(J)){x1=BP; ex1=eBP; x2=RP; ex2=eRP; y1=J; ey1=eJ; y2=parallax; ey2=eparallax}
  
  else if (diagram == 'GJ-H' & !is.null(parallax) & !is.null(G) & !is.null(J) & !is.null(H)){x1=G; ex1=eG; x2=J; ex2=eJ; y1=H; ey1=eH; y2=parallax; ey2=eparallax}
  else if (diagram == 'GH-H' & !is.null(parallax) & !is.null(G) & !is.null(H)){x1=G; ex1=eG; x2=H; ex2=eH; y1=H; ey1=eH; y2=parallax; ey2=eparallax}
  else if (diagram == 'GK-H' & !is.null(parallax) & !is.null(G) & !is.null(K) & !is.null(H)){x1=G; ex1=eG; x2=K; ex2=eK; y1=H; ey1=eH; y2=parallax; ey2=eparallax}
  else if (diagram == 'GW1-H' & !is.null(parallax) & !is.null(G) & !is.null(W1) & !is.null(H)){x1=G; ex1=eG; x2=W1; ex2=eW1; y1=H; ey1=eH; y2=parallax; ey2=eparallax}
  else if (diagram == 'GW2-H' & !is.null(parallax) & !is.null(G) & !is.null(W2) & !is.null(H)){x1=G; ex1=eG; x2=W2; ex2=eW2; y1=H; ey1=eH; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPJ-H' & !is.null(parallax) & !is.null(J) & is.null(RP) & !is.null(H)){x1=RP; ex1=eRP; x2=J; ex2=eJ; y1=H; ey1=eH; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPH-H' & !is.null(parallax) & !is.null(H) & is.null(RP)){x1=RP; ex1=eRP; x2=H; ex2=eH; y1=H; ey1=eH; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPK-H' & !is.null(parallax) & !is.null(K) & is.null(RP) & !is.null(H)){x1=RP; ex1=eRP; x2=K; ex2=eK; y1=H; ey1=eH; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPW1-H' & !is.null(parallax) & !is.null(W1) & is.null(RP) & !is.null(H)){x1=RP; ex1=eRP; x2=W1; ex2=eW1; y1=H; ey1=eH; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPW2-H' & !is.null(parallax) & !is.null(W2) & is.null(RP) & !is.null(H)){x1=RP; ex1=eRP; x2=W2; ex2=eW2; y1=H; ey1=eH; y2=parallax; ey2=eparallax}
  else if (diagram == 'BPRP-H' & !is.null(parallax) & !is.null(BP) & is.null(RP) & !is.null(H)){x1=BP; ex1=eBP; x2=RP; ex2=eRP; y1=H; ey1=eH; y2=parallax; ey2=eparallax}
  
  else if (diagram == 'GJ-K' & !is.null(parallax) & !is.null(G) & !is.null(J) & !is.null(K)){x1=G; ex1=eG; x2=J; ex2=eJ; y1=K; ey1=eK; y2=parallax; ey2=eparallax}
  else if (diagram == 'GH-K' & !is.null(parallax) & !is.null(G) & !is.null(H) & !is.null(K)){x1=G; ex1=eG; x2=H; ex2=eH; y1=K; ey1=eK; y2=parallax; ey2=eparallax}
  else if (diagram == 'GK-K' & !is.null(parallax) & !is.null(G) & !is.null(K)){x1=G; ex1=eG; x2=K; ex2=eK; y1=K; ey1=eK; y2=parallax; ey2=eparallax}
  else if (diagram == 'GW1-K' & !is.null(parallax) & !is.null(G) & !is.null(W1) & !is.null(K)){x1=G; ex1=eG; x2=W1; ex2=eW1; y1=K; ey1=eK; y2=parallax; ey2=eparallax}
  else if (diagram == 'GW2-K' & !is.null(parallax) & !is.null(G) & !is.null(W2) & !is.null(K)){x1=G; ex1=eG; x2=W2; ex2=eW2; y1=K; ey1=eK; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPJ-K' & !is.null(parallax) & !is.null(J) & is.null(RP) & !is.null(K)){x1=RP; ex1=eRP; x2=J; ex2=eJ; y1=K; ey1=eK; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPH-K' & !is.null(parallax) & !is.null(H) & is.null(RP) & !is.null(K)){x1=RP; ex1=eRP; x2=H; ex2=eH; y1=K; ey1=eK; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPK-K' & !is.null(parallax) & !is.null(K) & is.null(RP)){x1=RP; ex1=eRP; x2=K; ex2=eK; y1=K; ey1=eK; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPW1-K' & !is.null(parallax) & !is.null(W1) & is.null(RP) & !is.null(K)){x1=RP; ex1=eRP; x2=W1; ex2=eW1; y1=K; ey1=eK; y2=parallax; ey2=eparallax}
  else if (diagram == 'RPW2-K' & !is.null(parallax) & !is.null(W2) & is.null(RP) & !is.null(K)){x1=RP; ex1=eRP; x2=W2; ex2=eW2; y1=K; ey1=eK; y2=parallax; ey2=eparallax}
  else if (diagram == 'BPRP-K' & !is.null(parallax) & !is.null(BP) & is.null(RP) & !is.null(K)){x1=BP; ex1=eBP; x2=RP; ex2=eRP; y1=K; ey1=eK; y2=parallax; ey2=eparallax}
  
  else{print('ERROR: Invalid input arguments.')}
  
  # Now we perfom the random samples:
  if (diagram %in% c('W1W2-GJ', 'W1W2-GH', 'W1W2-GK', 'W1W2-RPJ', 'W1W2-RPH', 'W1W2-RPK', 'W1W2-GW1', 'W1W2-GW2', 'W1W2-RPW1', 'W1W2-RPW2', 'W1W2-BPRP')) {
    X = rnorm(12000, mean=x1, sd=ex1) - rnorm(12000, mean=x2, sd=ex2)
    Y = rnorm(12000, mean=y1, sd=ey1) - rnorm(12000, mean=y2, sd=ey2)
    a = chains[[diagram]]$a
    b = chains[[diagram]]$b
    c = chains[[diagram]]$c
    d = chains[[diagram]]$d
    e = chains[[diagram]]$e
    FeH = (-a-b*X-c*X^2+Y)/(d+e*X)
    print(paste('Estimated metallicity:',round(median(FeH),3),'+-',round(mad(FeH),3)))
    return(FeH)
  }
  else if (diagram %in% c('GJ-G', 'GH-G', 'GK-G', 'RPJ-G', 'RPH-G', 'RPK-G', 'GW1-G', 'GW2-G', 'RPW1-G', 'RPW2-G', 'BPRP-G',
                          'GJ-J', 'GH-J', 'GK-J', 'RPJ-J', 'RPH-J', 'RPK-J', 'GW1-J', 'GW2-J', 'RPW1-J', 'RPW2-J', 'BPRP-J',
                          'GJ-H', 'GH-H', 'GK-H', 'RPJ-H', 'RPH-H', 'RPK-H', 'GW1-H', 'GW2-H', 'RPW1-H', 'RPW2-H', 'BPRP-H',
                          'GJ-K', 'GH-K', 'GK-K', 'RPJ-K', 'RPH-K', 'RPK-K', 'GW1-K', 'GW2-K', 'RPW1-K', 'RPW2-K', 'BPRP-K')) {
    X = rnorm(12000, mean=x1, sd=ex1) - rnorm(12000, mean=x2, sd=ex2)
    Y = rnorm(12000, mean=y1, sd=ey1) + 5*log10(rnorm(12000, mean=y2, sd=ey2)/100)
    a = chains[[diagram]]$a
    b = chains[[diagram]]$b
    c = chains[[diagram]]$c
    d = chains[[diagram]]$d
    e = chains[[diagram]]$e
    FeH = (-a-b*X-c*X^2+Y)/(d+e*X)
    print(paste('Estimated metallicity:',round(median(FeH),3),'+-',round(mad(FeH),3)))
    return(FeH)
  }
  else if (diagram %in% c('W1W2-BPRP-G', 'W1W2-BPRP-J', 'W1W2-BPRP-H', 'W1W2-BPRP-K')){
    X = rnorm(12000, mean=x1, sd=ex1) - rnorm(12000, mean=x2, sd=ex2)
    Y = rnorm(12000, mean=y1, sd=ey1) - rnorm(12000, mean=y2, sd=ey2)
    Z = rnorm(12000, mean=z1, sd=ez1) + 5*log10(rnorm(12000, mean=z2, sd=ez2)/100)
    a = chains[[diagram]]$a
    b = chains[[diagram]]$b
    c = chains[[diagram]]$c
    d = chains[[diagram]]$d
    e = chains[[diagram]]$e
    f = chains[[diagram]]$f
    FeH = (-a-b*X-c*X^2-f*Z+Y)/(d+e*X)
    print(paste('Estimated metallicity:',round(median(FeH),3),'+-',round(mad(FeH),3)))
    return(FeH)
  }
  else{print('Diagram not supported.')}
}
