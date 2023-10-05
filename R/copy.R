#' copy
#'
#' funcion barata que copia una tabla al portapapeles y asi lo podes pegar en Excel sin comerte el coco
#' @param x la tabla, dataframe o matriz que queremos copiar
#'
#' @return
#' una tabla separada por ";" y con decimales "." que queda en el portapapeles
#' @export
#'
#' @examples
#' copy(mvd)
#' #anda y pegalo en otro lado, besis
copy<- function(x) {
  write.table(x, "clipboard", dec=".", sep=";", row.names=F)
}



