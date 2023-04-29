literal <- function() {
  list(
    no_api="`OPENAI_API_KEY` not provided.",
    echo_user_input_info=paste0("\n ---- Your input ---- :\n\n", prompt, "\n")
  )
}
