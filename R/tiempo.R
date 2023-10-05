#' tiempo
#'
#' construye tiempo de cala y vira en formato POSIXct ("%Y-%m-%d %H:%M") y calcula las horas de pesca (h_pesca)
#' corrige la fecha de vira si se pasan las 00:00
#'
#' @param input la fecha del lance
#' @param h_cala la hora de cala del lance formato texto  ej. "11:30"
#' @param h_vira la hora de vira del lance formato texto  ej. "0:15"
#' @param format "%d/%m/%Y"...el formato de la fecha input
#'
#' @return
#' tabla con 3 columnas t_cala y t_vira (POSIXct) y h_pesca (horas de pesca)
#' @export
#'
#' @examples
#' cala<- c("11:15", "10:20", "19:30")
#' vira<- c("15:37", "19:00", "06:00")
#' fecha<- c("12/10/2021","13/10/2021", "13/10/2021" )
#' tiempo(fecha, cala, vira)

tiempo<-function (input, h_cala, h_vira, format="%d/%m/%Y" ){

  #1 transformar la fecha a formato date
  input<- as.Date(input, format=format)

  #2 calculo la diferencia entre la hora de cala y vira
  calavira<-difftime (time2=readr::parse_time(as.character(h_cala)),
                      time1=readr::parse_time(as.character(h_vira)),
                      units = "hours")

  #3 cuando la difencia de horas es menor de 0 implica que ha pasado un dia
  amanece<-as.numeric(calavira<0)

  #4 genero tiempo de cala y vira c/hora (si amanece=1 +1 dia a la fecha de cala)
  t_cala <- as.POSIXct(paste(input, h_cala), format="%Y-%m-%d %H:%M")
  t_vira <- as.POSIXct(paste((input + amanece), h_vira), format="%Y-%m-%d %H:%M")

  #5 horas de pesca
  h_pesca<- round( as.numeric( difftime(time1= t_vira,
                                        time2= t_cala, units="hours")), 2)

  return(data.frame(t_cala, t_vira, h_pesca))
}
