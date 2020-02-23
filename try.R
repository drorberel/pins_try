library(pins)

nchar(Sys.getenv("GITHUB_PAT")) > 0

## token must be checked for 'repo: public_repo' 
board_register_github(repo = "drorberel/pins_try", token = '782b26a27a348c1c0b0d14ce8e6a964ab7d7742a')




## store
pin(iris, description = "The iris data set", board = "github")
pin(mtcars, description = "The motor trend cars data set", board = "github")


## get
iris_local <- pin_get("iris", board = "github")
mtcars_local <- pin_get("mtcars", board = "github")

# discover
pin_find("data", board = "github", extended = TRUE)





# Plumber / API -----------------------------------------------------------

library(plumber)
r <- plumb("plumber.R")  # Where 'plumber.R' is the location of the file shown above
r$run(port=8000)


