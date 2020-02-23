library(plumber)
library(pins)

# Load the pinned model
board_register_github(repo = "drorberel/pins_try", token = '782b26a27a348c1c0b0d14ce8e6a964ab7d7742a')


m <- pin_get("mtcar-model", board = "github")

#* @get /mpg
#* @param hp Horsepower
#* @param cyl Number of cylinders
#* @param disp Displacement
function(hp, cyl, disp) {
  predict(m, list(hp = as.numeric(hp), cyl = as.numeric(cyl), disp = as.numeric(disp)))
}