#' posicion
#'
#' transforma posiciones geograficas hexadecimal a decimal, asigna cuadrante y subcuadrante
#'
#' @param lat latitud
#' @param long longitud
#' @param hex si las posiciones estan en formato hexadecimal dinara (ej. 3526) hex=T, si estan en decimales hex=F
#' @param cuad queres el cuadrante? =T
#' @param subcuad queres el subcuadrante? =T
#'
#' @return una tabla con lat, long (decimales), cuad y subcuad dependiendo de las opciones
#' @export
#'
#' @examples
#' lat<-c(3526,3510,3450)
#' long<-c(5430, 5200, 5210)
#' posicion(lat, long)
posicion<-function (lat, long, hex=T, cuad=T, subcuad=F){


  ifelse (hex==T, outlat<- (-as.numeric(substr(lat,1,2)) - as.numeric(substr(lat,3,4)) /60),
          outlat<-lat)

  ifelse (hex==T, outlong<- (-as.numeric(substr(long,1,2)) - as.numeric(substr(long,3,4)) /60),
          outlong<-long)

  if(cuad!=T) return(data.frame(lat=outlat,long=outlong))

  cuad<- as.numeric(paste0(as.numeric(substr(outlat, 2,3)), as.numeric(substr(outlong, 3,3))))
  minlat<-as.numeric(substr(outlat, 5,6))
  minlat[is.na(minlat)]<-0
  minlong<-as.numeric(substr(outlong, 5,6))
  minlong[is.na(minlong)]<-0

  if(subcuad!=T ) return(data.frame(lat=outlat,long=outlong, cuad))

  subcuad<- dplyr::case_when(
    minlat>=50 & minlong>=50 ~"c",
    minlat>=50 & minlong<50 ~"d",
    minlat<50 & minlong>=50 ~"a",
    minlat<50 & minlong<50 ~"b" )

  return(data.frame(lat=outlat, long=outlong, cuad, subcuad))

}

#cuadrante(lat=datos$latitud3, long=datos$longitud3, hex=F, cuad=T)
## aplico cirterio de subdivision si latitud >= o < 50, longitud igual
#######################################################################################################
### Funcion para determinar el cuadrante de un lance incluyendo la transformacion de las posiciones ###
#######################################################################################################
### lat, long ...  latitud y longitud de los lances                                                 ###
### hex=T ... los lances estan en formato hexadecimal de parte de pesca (ej lat=3427)               ###
###           en caso que no transformar a decimal antes de aplicar la funcion y poner hex=F        ###
### cuad = T ... devuelve el cuadrante estad?stico                                                  ###
### subcuad =F ... poner subcuad=T para obtener el subcuadrante                                     ###
#######################################################################################################



