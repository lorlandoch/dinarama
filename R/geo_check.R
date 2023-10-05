#' geo_check
#'
#' Un metodo rapido para chequear lances de pesca que caen en tierra o puertos
#' el default "tierra" usa un mapa de Sudamerica
#' si usamos "mvd" se aplica un poligono que abarca el puerto de Montevideo
#' si usamos "lpl" se aplica un poligono que abarca el puerto de La Paloma
#'
#'
#' @param lat latitud del lance
#' @param long longitud del lance
#' @param poly el poligono con el que intersectamos los lances
#'
#' @return
#' un vector binario indicando 1=sobre tierra y 0 sobre agua y alternativamente un plot
#' @export
#'
#' @examples
#' \dontrun{
#' long<-c(-55,-55,-55,-55,-55, -56.204417, -54.143567)
#' lat<-c(-37,-36,-35,-34,-33, -34.897430, -34.652272)
#' geo_check(lat=lat, long=long, poly="tierra")}

geo_check<-function (lat, long, poly= "tierra"){


if (poly == "tierra")   {sa <- c("Argentina", "Bolivia", "Brazil", "Chile", "Colombia", "Ecuador",
                "Guyana", "Paraguay", "Peru", "Suriname", "Uruguay", "Venezuela", "Falkland Islands")
                        SA <- giscoR::gisco_get_countries(country = sa)
                        equis<- sf::st_union(sf::st_geometry(SA$geometry))}

if (poly == "mvd") equis<- sf::st_sf(sf::st_sfc(sf::st_polygon(list(as.matrix(mvd)))), crs = 4326)

if (poly == "lpl") equis<- sf::st_sf(sf::st_sfc(sf::st_polygon(list(as.matrix(lpl)))), crs = 4326)

  lances<- data.frame(lat=lat, long=long)
  lancesproj<- lances %>% sf::st_as_sf(coords = c("long", "lat"), crs = 4326)
  geocheck<- as.numeric(sf::st_intersects(lancesproj, equis, sparse=FALSE))


  return(geocheck)
}
