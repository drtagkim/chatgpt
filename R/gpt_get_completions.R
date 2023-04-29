#' Get GPT Completions Endpoint
#'
#' @param prompt The prompt to generate completions for.
#' @param system_content system contents, default = NULL
#' @param conversation_file conversation data, default = NULL
#' @param openai_api_key OpenAI's API key.
#'
#' @importFrom httr add_headers content content_type_json POST
#' @importFrom jsonlite toJSON
#'
gpt_get_completions <- function(prompt, system_content = NULL,conversation_file=NULL,openai_api_key = Sys.getenv("OPENAI_API_KEY")) {
  if (nchar(openai_api_key) == 0) {
    stop(literal()$no_api)
  }
  params = get_default_params()
  if (as.logical(Sys.getenv("OPENAI_VERBOSE", TRUE))) {
    cat(literal()$echo_user_input_info)
  }
  if (grepl("gpt-3.5-turbo", model)) {
    messages = message_factory(prompt,system_content,conversation_file)
    post_res = POST(
      gen_api_uri_chat(),
      add_headers("Authorization" = paste("Bearer", openai_api_key)),
      content_type_json(),
      body = toJSON(c(params, list(messages = messages)), auto_unbox = TRUE)
    )
  } else {
    post_res <- POST(
      gen_api_uri_completion(),
      add_headers("Authorization" = paste("Bearer", openai_api_key)),
      content_type_json(),
      body = toJSON(c(params, list(prompt = prompt)), auto_unbox = TRUE)
    )
  }
  if (!post_res$status_code %in% 200:299) {
    stop(content(post_res))
  }
  content(post_res)
}
