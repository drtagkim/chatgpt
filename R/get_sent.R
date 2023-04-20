gpt_sent <- function(txt) {
  prompt = paste(
    "task:sentiment analysis",
    "score range:-1(negatvie) to 1(positive)",
    "decimal:2",
    "output:showconverted score and judge",
    sep = '\n'
  )
  r0 = ask_chatgpt(paste0(prompt,"\ntext:",txt))
  r1 = str_extract(r0,'[01]?\\.[0-9]{1,2}')
  as.numeric(r1)
}
