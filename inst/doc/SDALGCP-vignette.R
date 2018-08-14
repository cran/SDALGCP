## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval= FALSE
)

## ------------------------------------------------------------------------
#  require(SDALGCP)

## ------------------------------------------------------------------------
#  data("PBCshp")

## ------------------------------------------------------------------------
#  data <- as.data.frame(PBCshp@data)

## ------------------------------------------------------------------------
#  data("pop_den")

## ------------------------------------------------------------------------
#  pop_den[is.na(pop_den[])] <- 0

## ------------------------------------------------------------------------
#  FORM <- X ~ propmale + Income + Employment + Education + Barriers + Crime +
#    Environment +  offset(log(pop))

## ------------------------------------------------------------------------
#  phi <- seq(500, 1700, length.out = 20)

## ---- results = "hide",  warning = FALSE, message = FALSE----------------
#  my_est <- SDALGCPMCML(data=data, formula=FORM, my_shp=PBCshp, delta=200, phi=phi, method=1, pop_shp=pop_den,
#                        weighted=TRUE, par0=NULL, control.mcmc=NULL)

## ---- results = "hide",  warning = FALSE, message = FALSE----------------
#  summary(my_est)
#  #and for confidence interval use
#  confint(my_est)

## ---- results = "hide",  warning = FALSE, message = FALSE----------------
#  phiCI(my_est, coverage = 0.95, plot = TRUE)

## ---- results = "hide",  warning = FALSE, message = FALSE----------------
#  Dis_pred <- SDALGCPPred(para_est=my_est,  continuous=FALSE)

## ---- results = "hide",  warning = FALSE, message = FALSE----------------
#  #to map the incidence
#  plot(Dis_pred, type="incidence", continuous = FALSE)
#  #and its standard error
#  plot(Dis_pred, type="SEincidence", continuous = FALSE)
#  #to map the covariate adjusted relative risk
#  plot(Dis_pred, type="CovAdjRelRisk", continuous = FALSE)
#  #and its standard error
#  plot(Dis_pred, type="SECovAdjRelRisk", continuous = FALSE)
#  #to map the exceedance probability that the incidence is greter than a particular threshold
#  plot(Dis_pred, type="incidence", continuous = FALSE, thresholds=0.0015)

## ---- results = "hide",  warning = FALSE, message = FALSE----------------
#  Con_pred <- SDALGCPPred(para_est=my_est, cellsize = 300, continuous=TRUE)

## ---- results = "hide",  warning = FALSE, message = FALSE----------------
#  #to map the covariate adjusted relative risk
#  plot(Con_pred, type="relrisk")
#  #and its standard error
#  plot(Con_pred, type="SErelrisk")
#  #to map the exceedance probability that the relative risk is greter than a particular threshold
#  plot(Con_pred, type="relrisk", thresholds=2)

## ---- results = "hide",  warning = FALSE, message = FALSE----------------
#  my_est <- SDALGCPMCML(data=data, formula=FORM, my_shp=PBCshp, delta=200, phi=phi, method=1,
#                        weighted=FALSE,  plot=FALSE, par0=NULL, control.mcmc=NULL, messages = TRUE, plot_profile = TRUE)

