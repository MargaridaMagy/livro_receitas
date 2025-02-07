sort_headers <- function("03_sopas.Rmd") {
  lines <- readLines("03_sopas.Rmd")
  headers <- grep("^## (?!#)", lines, value = TRUE, perl = TRUE)
  sorted_headers <- sort(headers)
  sorted_lines <- lines
  header_indices <- grep("^## (?!#)", lines, perl = TRUE)
  
  for (i in seq_along(header_indices)) {
    sorted_lines[header_indices[i]] <- sorted_headers[i]
  }
  
  writeLines(sorted_lines, "03_sopas.Rmd")
  message("Headers sorted in: ", "03_sopas.Rmd")
}

rmd_files <- list.files(pattern = "\\.Rmd$")
lapply(rmd_files, sort_headers)

bookdown::render_book("index.Rmd")