#' buque
#'
#' Accede la base de datos de buques y corrige los nombres mal digitados, proporciona categoria del buque
#'     Base datos buques: columnas digitado,	buque,	buque_id,	categ,	potHP,	eslora
#'     Incluye mensaje de error para buques no encontrados
#'
#' @param digitado el nombre del buque digitado en los partes de pesca
#' @param filename la ubicación del archivo base de datos por default es "Y:/Dinarama/Codigos_buque.csv"
#' @param categ queres incluir la categorìa del buque? =T
#' @param pareja es el barco principal? =F o la pareja =T
#'
#' @return vector buque con los nombres de los buques con categoria o sin ella
#'
#' @export
#'
#' @examples digitado<- c("ANTARES", "ANTARES 1", "ANTARES I")
#' buque(digitado, categ=TRUE)
#'

buque<-function (digitado, filename="Y:/Dinarama/Codigos_buque.csv", categ=TRUE, pareja=FALSE){

    ### 0 todo a caracter
  digitado<- as.character(digitado)
  ### 1 cargo diccionario de buques
  buques<-read.table(filename, dec=".", sep=";", header=TRUE)
  # elimino duplicados
  buques<-unique(buques)
  # selecciono variables
  buques<- buques %>% dplyr::select(digitado, buque, categ)

  ### 2 advierto por faltantes en el diccionario
  faltantes<-unique(digitado)[!unique(digitado) %in% unique(buques$digitado)]
  ifelse (length(faltantes)>0,
          print(paste0 ("no identificado: ", faltantes)),
          print("todos los buques identificados") )

  ### 3 realizo la union y agrego dato de categor?a por defecto
  dummy<- data.frame(digitado)

  #### salida ####
  ifelse (categ==TRUE,
          #con categ
          out<- data.frame( dplyr::left_join( dummy, buques) %>% dplyr::select(buque, categ) ),
          #sin categ
          out<- data.frame( dplyr::left_join(dummy, buques) %>% dplyr::select(buque) )
  )

  if(pareja==TRUE) out<-dplyr::rename(out, pareja=buque)
  out<- data.frame(out)

  return(out)
}
