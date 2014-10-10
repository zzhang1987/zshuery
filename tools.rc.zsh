
# some handy tools
function merge_pdf()
{
  output=`basename $1  .pdf`

  echo "The merged PDF is: ""$output"_merged.pdf

  pdftk "$@"  cat output "$output"_merged.pdf
}

function ip-addr() 
{
  wget -qO- http://ipecho.net/plain
  echo
}

function copyfile 
{
  
  [[ $OSTYPE != darwin* ]] && echo "copyfile only works for OSX." &&  return 1

  [[ "$#" != 1 ]] && return 1
  local file_to_copy=$1
  cat $file_to_copy | pbcopy
}

