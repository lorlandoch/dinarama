#' cr_jabba
#'
#' Calcula la captura de reemplazo para un modelo JABBA con sus intervalos de credibilidad
#' @param modelo = un modelo JABBA
#'
#' @return
#' captura de reemplazo de las medias (mu) y del intervalo de credibilidad superior (uci) e inferior (lci)
#' @export
#'
#' @examples
cr_jabba<-function (modelo){
  K<-modelo$estimates["K","mu"]
  Kl<-modelo$estimates["K","lci"]
  Ku<-modelo$estimates["K","uci"]
  r<-modelo$estimates["r","mu"]
  rl<-modelo$estimates["r","lci"]
  ru<-modelo$estimates["r","uci"]
  m<-modelo$estimates["m","mu"]
  ml<-modelo$estimates["m","lci"]
  mu<-modelo$estimates["m","uci"]
  B<-tail(data.frame(modelo$timeseries[, ,"B"])$mu,1)
  Bl<-tail(data.frame(modelo$timeseries[, ,"B"])$lci,1)
  Bu<-tail(data.frame(modelo$timeseries[, ,"B"])$uci,1)

  return(data.frame( mu= (r/(m-1))* B *(1 - (B/K)^(m-1)) ,
                     lci=(rl/(ml-1))* Bl *(1 - (Bl/Kl)^(ml-1)),
                     uci= (ru/(mu-1))* Bu *(1 - (Bu/Ku)^(mu-1)) ) )
}
