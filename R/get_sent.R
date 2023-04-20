gpt_sent <- function(txt) {
  p1="for each item do sentiment analysis.
Range from -1 to 1.
Set sentiment scores as a variable of OutputVector, decimal 2.
show me OutputVector."
  p2=p2=paste(txt,collapse='\n')
  prompt=paste0(p1,"\nitems:\n",p2)
  x = ask_chatgpt(prompt)
  y=str_extract(x,"OutputVector: .*$") %>% 
    str_remove(fixed("OutputVector: [")) %>% 
    str_remove(fixed("]")) %>% 
    str_split(',',simplify = TRUE) %>% as.numeric()
  y
}
