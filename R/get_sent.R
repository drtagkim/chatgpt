gpt_sent <- function(txt) {
  p1="For each item do sentiment analysis.
Range from -1 to 1.
Show me scores in HTML table at the end."
  if(length(txt)==1) {
    txt1=c(txt,"null")
  } else {
    txt1=txt
  }
  p2=paste(txt1,collapse='\n')
  prompt=paste0(p1,"\nitems:\n",p2)
  x = ask_chatgpt(prompt)
  y = rvest::read_html(x)
  y = y %>% html_table()
  if(length(y)>0) {
    y=y[[1]]
    if(length(txt)==1) y=y[1,]
  } else {
    y = NULL
  }
  y
}
