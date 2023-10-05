#' tiempo_vms
#'
#' construye tiempo en formato POSIXct ("%Y-%m-%d %H:%M") para datos de vms
#'
#' @param fecha la fecha, como sale del vms
#' @param hora la hora, como sale del vms
#' @param format ="%d/%m/%Y" es el default, se puede modificar
#'
#' @return
#' un vector con la fecha POSIXct ("%Y-%m-%d %H:%M")
#' @export
#'
#' @examples
#' fecha<- c("25/1/2022", "25/1/2022", "25/1/2022", "25/1/2022", "25/1/2022", "25/1/2022")
#' hora<- c("0:10", "1:10", "2:12", "3:12", "4:12","5:12")
#' tiempo_vms(fecha, hora)
tiempo_vms<-function (fecha, hora,format="%d/%m/%Y" ){
fecha<- as.Date(fecha, format = c("%d/%m/%Y"))
hora<- readr::parse_time(as.character(hora))
return(as.POSIXct(paste(fecha, hora), format="%Y-%m-%d %H:%M"))
}


