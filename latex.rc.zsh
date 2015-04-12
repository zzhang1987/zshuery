#
# 
# remove latex auxiliary files
#
function texclean()
{
  
  ext=(synctex.gz dvi blg bbl aux log) 
  
  for texfile in `ls -1 *tex`
  do
    for f in ${ext[*]}
    do
       [[ -f $texfile.$f ]] && mv -f $texfile.$f /tmp/
    done
  done
}
