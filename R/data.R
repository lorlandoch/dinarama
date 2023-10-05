#' mvd
#'
#' Una serie de 9 puntos georreferenciados que delimitan el puerto de Montevideo
#' (el primer y ultimo punto se repiten)
#' @format Un data frame con 2 columnas y 9 filas:
#' \describe{
#'   \item{long}{longitud geografica}
#'   \item{lat}{latitud geografica}
#'   ...
#' }
"mvd"

#' lpl
#'
#' Una serie de 12 puntos georreferenciados que delimitan el puerto de La Paloma
#' (el primer y ultimo punto se repiten)
#' @format Un data frame con 2 columnas y 12 filas:
#' \describe{
#'   \item{long}{longitud geografica}
#'   \item{lat}{latitud geografica}
#'   ...
#' }
"lpl"
#' subcuadrantes de pesca en la ZCP
#'
#' Una base de datos que contiene las geometrias de los subcuadrantes incluidos en la ZCP
#' asì como su nombre y el area total
#'
#' @format Un data frame con 3 columnas y pila de filas:
#' \describe{
#'   \item{id}{el número de cuadrante y la letra que identifica subcuadrante}
#'   \item{geometry}{la geometrìa de cada sub cuad}
#'   \item{m2}{el area en m2 de cada subcuadrante}
#'   ...
#' }
"cuadzcp"
