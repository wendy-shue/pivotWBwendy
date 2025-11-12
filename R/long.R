#'@title wide data to long data
#'@description Pivoting data format from wide to long.
#'@param data A data frame in wide format
#'@return A long data frame.
#'@author Wendy Shue
#'@examples
#'long(maternal_mortality)
#'@export

#library(tidyr)
long <- function(data){
  temp_name=deparse(substitute(data))
  temp <- data |> tidyr::pivot_longer(
    cols=starts_with("X"),
    names_to = "year",
    values_to = temp_name,
    names_prefix="X"
  ) |> dplyr::select(c("iso","year",temp_name))
  return(temp)
}

