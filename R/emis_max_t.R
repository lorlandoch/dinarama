
#' tiempo maximo sin emisiones
#'
#' calcula el tiempo maximo sin emisiones para un barco (en horas) desde información vms
#'
#'
#' @param datos la planilla de info vms con el tiempo en formato POSIXct usar tiempo_vms
#' @param barco el nombre del buque
#' @param unidad  unidad de tiempo en ingles ("hours", "minutes")
#'
#' @return
#' el maximo tiempo sin emisiones entre la primera y la ultima emision
#' @export
#'
#' @examples
#'
#'
emis_max_t<-function(datos, barco, unidad="hours"){
  timetable<-datos$tiempo[datos$nombre==barco]
  #maxima diferencia entre cada emision (time1) y la anterior (time2)
  round(as.numeric(max(difftime (
    time2= c(timetable[1], timetable[1:length(timetable)-1]),
    time1=timetable, units = unidad))) ,0)

}
