message_factory <- function(user_prompt,system_content=NULL,file=NULL) {
  if(is.null(system_content)) {
    system_content = "You are a helpful assistant. "
  } else {
    system_content = paste0("You are a helpful assistant. ", system_content," ")
  }
  return_language <- Sys.getenv("OPENAI_RETURN_LANGUAGE")
  if (nchar(return_language) > 0) {
    return_language <- paste0(system_content,"You return all your replies in ", return_language, ".")
  }
  mssg=list(
    list(role="system",content=return_language),
    list(role = "user", content = user_prompt)
  )
  if(!is.null(file)) {
    mssg=c(fromJSON(file,simplifyDataFrame = FALSE),mssg)
  }
  return(mssg)
}
