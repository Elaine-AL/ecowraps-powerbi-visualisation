# render_refresh.R
library(rmarkdown)

# Render the Rmd file to HTML (or PDF/Word)
rmarkdown::render("import_excel_to_postgres.Rmd",
                  output_format = "html_document",
                  output_file = "import_excel_to_postgres.html")

# Optional: add timestamp logging
cat("Rendered report at", Sys.time(), "\n")
