gpt_sent <- function(txt) {
  p0='
Task: sentiment analysis 
DO NOT reply anything but the score.
Give me scores as numbers (decimal=2).
Score range should be -1(negative) to 1(positive)
Text:'
  p1=paste0(p0,txt)
  x=ask_chatgpt(p1)
  y=x %>% str_extract('[0-1.-]+[0-9]{0,2}') %>% as.numeric()
  y
}
