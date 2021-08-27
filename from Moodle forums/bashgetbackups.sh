echo 'Creating contenthash list.';
mysql -u root -p moodle23 -e 'select contenthash from `mdl_files` where (`mimetype` like "application/vnd.moodle.backup" and `filename` not like ".") INTO OUTFILE "/var/www/moodle23data/backupscontenthashlist"';
echo 'Listing contenthash list.  [q] to exit listing and go to next step.';
more backupscontenthashlist;
echo 'Creating filename list.';
mysql -u root -p moodle23 -e 'select filename from `mdl_files` where (`mimetype` like "application/vnd.moodle.backup" and `filename` not like ".") INTO OUTFILE "/var/www/moodle23data/backupsfilenamelist"';
echo 'Listing backupsfilenamelist.  [q] to exit listing and go to next step.';
more backupsfilenamelist;
echo 'Getting contenthash ....';
for f in $(cat backupscontenthashlist);
do
find ./filedir/ -name "$f" >> backupsfilepaths;
echo "Found: "; echo "$f"
done
more backupsfilepaths
echo 'Getting backup file paths ...';
for f in $(cat backupsfilepaths)
do
for n in $(cat backupsfilenamelist)
do
cp -a "$f" ./extracted/"$n";
done
done
echo 'Listing backup files in extracted directory.';
ls -l ./extracted/;
echo 'Cleaning up ....';
rm backupscontenthashlist;
rm backupsfilepaths;
rm backupsfilenamelist;
ls backups*;

