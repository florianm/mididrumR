#' Deploy the MIDI mapper script to a given target directory and make executable
#'
#' @param dir The target directory, default: "~" (home directory)
#' @param overwrite Whether to overwrite an already existing script at the
#'   target directory, default: FALSE
#' @return The path to the deployed script. You will want to edit and adjust
#'   this script before running it.
#' @export
#' @examples
#' \dontrun{
#'  target_file <- deploy_script()
#' }
deploy_script <- function(dir="~", overwrite=FALSE){
  script <- fs::file_copy(
    system.file("extdata", "mididrumR.sh", package = "mididrumR"),
    dir,
    overwrite=overwrite
  )
  fs::file_chmod(script, "a+rwx")
  # fs::file_info(script)$permissions
  message(glue::glue("Script deployed to {script}"))
  script
}
