## Model Management with Pins

Every data science project I've worked on has the one or two files that just don't fit anywhere. Perhaps it is the trained model object saved in an RDS file. Perhaps it is the small CSV with explanatory metadata. Instead of emailing around these pesky files, or redeploying code just to update these objects, use pins! 

The [pins](https://rstudio.github.io/pins) package helps you manage objects that don't fit anywhere else, giving you all the benefits of RStudio Connect.

This repository contains a really simple example:

1. The `model_generator.Rmd` file creates a simple linear model, and then pins the model object on RStudio Connect.

2. The `plumber.R` script loads the pinned model from RStudio Connect and surfaces it as a production API. 

This approach has many benefits:

1. I can update the model without redeploying the API. In fact, I can schedule the R Markdown document to regularly retrain the model automatically!
2. The handoff between the R Markdown document and the API is seamless. The code for both works no matter where it runs - whether it is on my desktop, the server, or in production on Connect. No more surprises from misconfigured file paths!
3. If I wanted the model to be available to other content, such as a shiny app, I wouldn't have to email someone the RDS file, or needlessly duplicate it!
