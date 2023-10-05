#' nomspp
#'
#' accede a la base de datos de especies y brinda un nombre común acordado, con opcion a obtener especie, familia y orden
#'     Utilizar con cuidado!! muchas veces la especie cambia con la categorìa o zona de la operativa de pesca, ante la duda chequealo con Ernesto!
#'     Ademas en caso de trabajar con descarte usar filename="Y:/Dinarama/Codigos_descarte.csv"
#'     Base datos especie: columnas digitado,	nom_spp,	spp,	familia,	orden.
#'     Incluye mensaje de error para especies no encontradas
#'
#' @param digitado el nombre de especie digitado en el parte de pesca
#' @param filename = "Y:/Dinarama/Codigos_nom_spp.csv"
#' @param spp  queres la especie? =T
#' @param familia  queres la familia? =T
#' @param orden queres el orden? =T
#'
#' @return vector nom_spp con los nombres comunes acordados mas info taxonomica
#' @export
#'
#' @examples lista_especies<- c("MERLUZA CARIOCA", "MERLUZA CCC", "MERLUZA CHICA",
#'  "MERLUZA COLA", "MERLUZA de COLA","MERLUZA DE COLA", "MERLUZA de COLA   HOKY ",
#'  "MERLUZA.de.COLA...HOKY.", "MERLUZA.CARIOCA")
#'  nomspp(lista_especies)
#'  nomspp(lista_especies, spp=TRUE)
nomspp<-function (digitado, filename="Y:/Dinarama/Codigos_nom_spp.csv", spp=F, familia=F, orden=F){
  require(tidyverse)

  ### 0 todo a caracter
  digitado<- as.character(digitado)
  ### 1 cargo diccionario de buques
  nom_spp<-read.table(filename, dec=".", sep=";", header=TRUE)
  # elimino duplicados
  nom_spp<-unique(nom_spp)

  # selecciono variables
  seleccion<- c("digitado", "nom_spp")
  if (spp==TRUE) seleccion<- append(seleccion, "spp")
  if (familia==TRUE) seleccion<- append(seleccion, "familia")
  if (orden==TRUE) seleccion<- append(seleccion, "orden")
  nom_spp<- nom_spp %>% dplyr::select(dplyr::all_of(seleccion))

  ### 2 advierto por faltantes en el diccionario
  faltantes<-unique(digitado)[!unique(digitado) %in% unique(nom_spp$digitado)]
  ifelse (length(faltantes)>0,
          print(paste0 ("no identificado: ", faltantes)),
          print("todas las spp identificadas") )

  ### 3 realizo la union y agrego dato de categor?a por defecto
  dummy<- data.frame( digitado, dum= rep("SIN NOMBRE" , length(digitado)) )

  #### salida ####
  out<- data.frame( dplyr::left_join( dummy, nom_spp) %>% dplyr::select(-dum, -digitado) )
  return(out)
}



