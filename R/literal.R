literal <- function() {
  list(
    no_api = "`OPENAI_API_KEY` not provided.",
    gpt3_5 = "gpt-3.5-turbo",
    echo_user_input_info = paste0("\n ---- Your input ---- :\n\n", prompt, "\n"),
    normal_status = 200:299
  )
}
