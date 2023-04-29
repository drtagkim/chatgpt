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
  if (grepl(literal()$gpt3_5, model)) {
    messages = message_factory(prompt,system_content,conversation_file)
    post_res = send_data_to_openai_chat(params,messages,openai_api_key)
  } else {
    post_res = send_data_to_openai_completion(params,prompt,openai_api_key)
  }
  if (!post_res$status_code %in% literal()$normal_status) {
    stop(content(post_res))
  }
  content(post_res)
}
