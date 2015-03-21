
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

function copyfile() 
{
  
  [[ $OSTYPE != darwin* ]] && echo "copyfile only works for OSX." &&  return 1

  [[ "$#" != 1 ]] && return 1
  local file_to_copy=$1
  cat $file_to_copy | pbcopy
}

function avi2mp4()
{
  output=`basename $1  .avi`

  [[ "$#" != 1 ]] && return 1
  local in=$1

  ffmpeg -i $in  -b:a 128k -vcodec mpeg4 -b:v 1200k -flags +aic+mv4 "$output".mp4
}

function git_up_all()
{
  SAVEIFS=$IFS
  IFS=$(echo -en "\n\b")
  
  for i in `find . -maxdepth 1 -type d`
  do
    cd "$i"
      echo "  --> "`pwd`
      git up  2>/dev/null
    [[ ! $i == "."  ]] && cd ..
  done
  IFS=$SAVEIFS
}
