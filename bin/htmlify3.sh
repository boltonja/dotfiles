#!/bin/sh
# new and improved!

PICS=/tmp/$$.pics
HTML=index.html

find . -name "*.[GgjJmMPpZzAa][IiPpNnVv][FfPpGgIi]"  -print |
   egrep -v -e xvpics -e '\/t-' -e '\/w-' -e '\/r-' | 
   sort -t/ -k3 > $PICS

echo "title for this page?"
read TITO

cat > $HTML <<HERE
<HTML>
<TITLE>$TITO</TITLE>
<BODY BGCOLOR="#778899">
<H2>$TITO</H2>
<TABLE BORDER>
<TR>
<TH ALIGN=CENTER>Picture</TH>
<TH ALIGN=CENTER>Size (Kbytes)</TH>
<TH ALIGN=CENTER>Description</TH>
</TR>
HERE
#<TH ALIGN=CENTER>Image Source</TH>
#<TH ALIGN=CENTER>Where's Waldo?</TH>

while read f
do
   DIR=`dirname "$f"`
   FIL=`basename "$f"`
   IMG=
   WAL=
   if [ -f "$DIR/r-$FIL" ]
   then
      # rotated images
      PRE="$DIR/t-r-$FIL"
      PREL="$DIR/r-$FIL"
      IMG="$DIR/t-$FIL"
      IMGL="$DIR/$FIL"
   else 
      if [ -f "$DIR/b-$FIL" ]
      then
         # brightened images
         PRE="$DIR/t-b-$FIL"
         PREL="$DIR/b-$FIL"
         IMG="$DIR/t-$FIL"
         IMGL="$DIR/$FIL"
      else
         # normal images
         PRE="$DIR/t-$FIL"
         PREL="$DIR/$FIL"
      fi
   fi

   if [ -f "$DIR/w-$FIL" ]
   then
      WAL="$PRE"    # don't spoil the fun with a doctored thumbnail!
      WALL="$DIR/w-$FIL"
   fi

   echo "<TR>" >> $HTML
   LINE='<TD ALIGN=CENTER><A HREF="'"$PREL"'"><IMG SRC="'"$PRE"'" ALT="Thumbnail"></IMG></A></TD>'
   echo $LINE >> $HTML

   SIZ=`du -sk "$PREL" |awk '{print $1}'`

   echo "<TD ALIGN=RIGHT>"$SIZ"k</TD>" >> $HTML
   
#   if [ "$IMG" != "" ]
#   then
#      LINE='<TD ALIGN=CENTER><A HREF="'"$IMGL"'"><IMG SRC="'"$IMG"'" ALT="Thumbnail"></IMG></A></TD>'
#   else
#      LINE="<TD ALIGN=CENTER>N/A</TD>"
#   fi
#   echo $LINE >> $HTML

#   if [ "$WAL" != "" ]
#   then
#      LINE='<TD ALIGN=CENTER><A HREF="'"$WALL"'"><IMG SRC="'"$WAL"'" ALT="Thumbnail"></IMG></A></TD>'
#   else
#      LINE="<TD ALIGN=CENTER>N/A</TD>"
#   fi
#   echo $LINE >> $HTML

DESC=`basename "$f"`

cat >> $HTML <<HERE
<TD ALIGN=CENTER>$DESC</TD>
<TR>
HERE
   
done < $PICS


cat >> $HTML <<HERE
</TABLE>
</BODY>
</HTML>
HERE

rm -f $PICS
