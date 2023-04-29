send_data_to_openai_chat <- function(params,messages,openai_api_key) {
  post_res = POST(
    gen_api_uri_chat(),
    add_headers("Authorization" = paste("Bearer", openai_api_key)),
    content_type_json(),
    body = toJSON(c(params, list(messages = messages)), auto_unbox = TRUE)
  )
  post_res
}
send_data_to_openai_completion <- function(params,prompt,openai_api_key) {
  post_res <- POST(
    gen_api_uri_completion(),
    add_headers("Authorization" = paste("Bearer", openai_api_key)),
    content_type_json(),
    body = toJSON(c(params, list(prompt = prompt)), auto_unbox = TRUE)
  )
  post_res
}

