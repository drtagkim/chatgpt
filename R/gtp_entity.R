
gpt_entity <- function(txt) {
  p0 = "Extract entities from:"
  p1 = paste0(p0,txt)
  x = ask_chatgpt(p1)
  y = x %>% str_split(fixed('\n'),simplify=TRUE)
  y = y[stringr::str_starts(y,"- ")]
  str_remove(y,fixed("- "))
}
