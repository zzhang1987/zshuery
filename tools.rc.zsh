
# some handy tools
function merge_pdf()
{
  output=`basename $1  .pdf`
  pdftk "$@"  cat output "$output"_merged.pdf
}

