context("Testing rendering of HTML document with RMarkdown and nibscdoc template")

rmd_forHTML <- system.file("extdata/test_html.Rmd", package = "nibscdoc")
rmd_forWord <- system.file("extdata/test_word.Rmd", package = "nibscdoc")

docx_file <- gsub("\\.Rmd$", ".docx", rmd_forWord)
html_file <- gsub("\\.Rmd$", ".html", rmd_forHTML)

test_that("html output", {
  html <- rmarkdown::render(rmd_forHTML, output_file = html_file, quiet = TRUE)
  expect_equal(basename(html), basename(html_file))
})

test_that("word output", {
  word <- rmarkdown::render(rmd_forWord, output_file = docx_file, quiet = TRUE)
  expect_equal(basename(word), basename(docx_file))
})
