path <- rstudioapi::getSourceEditorContext()$path
path <- gsub(".Rmarkdown", ".markdown", path)
lines <- readLines(path)
both <- blogdown:::split_yaml_body(lines)
writeLines(
  paste(
    glue::glue_collapse(both$yaml, sep = "\n"),
    downlit::downlit_md_string(glue::glue_collapse(both$body, sep = "\n")),
    sep = "\n"
  ),
  con = path
)
