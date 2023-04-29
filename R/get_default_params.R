get_default_params <- function() {
  model <- Sys.getenv("OPENAI_MODEL", "gpt-3.5-turbo")
  params <- list(
    model = model,
    max_tokens = as.numeric(Sys.getenv("OPENAI_MAX_TOKENS", 256)),
    temperature = as.numeric(Sys.getenv("OPENAI_TEMPERATURE", 1)),
    top_p = as.numeric(Sys.getenv("OPENAI_TOP_P", 1)),
    frequency_penalty = as.numeric(Sys.getenv("OPENAI_FREQUENCY_PENALTY", 0)),
    presence_penalty = as.numeric(Sys.getenv("OPENAI_PRESENCE_PENALTY", 0))
  )
  params
}
