#
# 
# remove latex auxiliary files
#
function texclean()
{
  
  ext=(synctex.gz dvi blg bbl aux log out) 
  
  for texfile in `ls -1 *tex`
  do
    for e in ${ext[*]}
    do
       basefile=`basename $texfile .tex`
       [[ -f "$basefile.$e" ]] && mv -f "$basefile.$e" /tmp/
    done
  done
}
