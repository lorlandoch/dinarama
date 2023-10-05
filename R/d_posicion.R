#' d_posicion
#'
#'devuelve la posicion geografica recalculada a partir de el cuadrante y subcuadrante
#'asigna todos las posiciones al centro del cuadrante facilitando el uso de geom_tile para plotear
#' @param cuad columna con cuadrantes
#' @param subcuad la columna con los subcuadrante
#'
#' @return dos columnas latR y longR (Recalculada)
#'
#' @export
#'
#' @examples
#' cuad<-c(345,365,363,361)
#' subcuad<-c("c","d", "b","a" )
#' d_posicion(cuad=cuad, subcuad=subcuad)
#'
d_posicion<- function(cuad, subcuad) {
  out<-data.frame(latR= -as.numeric(paste0 (substr(cuad, 1,2), ".5")),
                  longR= -as.numeric(paste0 ( "5", substr(cuad, 3,3), ".5" )))
  if(missing(subcuad)) {out %>% dplyr::select(latR, longR)
  } else {
    cbind(out,subcuad) %>% dplyr::mutate(latR = dplyr::case_when (subcuad=="a" ~ latR + 0.25,
                                                    subcuad=="b" ~ latR + 0.25,
                                                    subcuad=="c" ~ latR - 0.25,
                                                    subcuad=="d" ~ latR - 0.25),

                                  longR = dplyr::case_when (subcuad=="a" ~ longR - 0.25,
                                                     subcuad=="b" ~ longR + 0.25,
                                                     subcuad=="c" ~ longR - 0.25,
                                                     subcuad=="d" ~ longR + 0.25)) %>%
      dplyr::select(latR, longR)


  }
}
