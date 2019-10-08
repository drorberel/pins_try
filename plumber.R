library(plumber)
library(pins)

# Load the pinned model
board_register("rsconnect", 
               server = "https://colorado.rstudio.com/rsc"),
               # use an API key so that the API can access the model on Connect
               key = Sys.getenv("RSC_KEY"))

m <- pin_get("sean/mtcar-model", board = "rsconnect")

#* @get /mpg
#* @param hp Horsepower
#* @param cyl Number of cylinders
#* @param disp Displacement
function(hp, cyl, disp) {
  predict(m, list(hp = as.numeric(hp), cyl = as.numeric(cyl), disp = as.numeric(disp)))
}