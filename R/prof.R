#' prof
#'
#' devuelve la profundidad de un set de coordenadas geográficas basado en data:
#' class      : RasterLayer;
#' dimensions : 185, 185, 34225  (nrow, ncol, ncell);
#  extent     : -59.5011, -50.06996, -40.00042, -33.74665  (xmin, xmax, ymin, ymax);
#' crs        : +proj=longlat +datum=WGS84 +no_defs;
#' values     : 16.276, 17.65286  (min km2, max km2).


#'
#' @param lat latitud del lance
#' @param long longitud del lance
#'
#' @return
#' un vector indicando la profundidad en metros
#' @export
#'
#' @examples
#' long<-c(-55,-55,-55,-55,-55, -56.204417, -54.143567)
#' lat<-c(-37,-36,-35,-34,-33, -34.897430, -34.652272)
#' prof(lat=lat, long=long)

prof<-function (lat, long){
zeta<- raster(z)

  lances<- data.frame(lat=lat, long=long)

  lancesproj<- lances %>% sf::st_as_sf(coords = c("long", "lat"), crs = 4326)

  prof<-raster::extract(z, lancesproj)

  return(prof)
}
