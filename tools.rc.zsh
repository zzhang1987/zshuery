
# some handy tools
function merge_pdf()
{
  output=`basename $1  .pdf`

  echo "The merged PDF is: ""$output"_merged.pdf

  pdftk "$@"  cat output "$output"_merged.pdf
}

