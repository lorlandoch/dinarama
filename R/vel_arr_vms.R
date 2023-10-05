#' vel_arr_vms
#'
#' indica si la velocidad corresponde a velocidad de arrastre vms
#'
#' @param vel velocidad vms en mn/h(nudos)
#' @param vmax velocidad maxima considerada como arrastre < o =4.5
#' @param vmin velocidad minima considerada como arrastre > o =3.5
#'
#' @return
#' un vector binario donde los 1's indican velocidad de arrastre
#' @export
#'
#' @examples
#' vel<-c(2,3,4,5,6,4,3.8)
#' vel_arr_vms(vel)
vel_arr_vms<- function(vel, vmax=4.5, vmin=3.5) {
  as.numeric(vel>=vmin & vel <=vmax)
}

