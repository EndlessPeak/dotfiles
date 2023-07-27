ranger() {
  # local ID="$$"
  mkdir -p /tmp/$USER
  local OUTPUT_FILE="/tmp/$USER/joshuto-cwd"
  env joshuto --output-file "$OUTPUT_FILE" $@
  local exit_code=$?

  # echo "Exit code: $exit_code"
  case "$exit_code" in
    # regular exit
    0)
      ;;
    # output contains current directory
    101)
      # echo $(cat "$OUTPUT_FILE")
      local JOSHUTO_CWD=$(cat "$OUTPUT_FILE")
      cd "$JOSHUTO_CWD"
      ;;
    # output selected files
    102)
      ;;
    *)
      echo "Exit code: $exit_code"
      ;;
  esac
}
