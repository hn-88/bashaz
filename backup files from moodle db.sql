select contenthash from <your moodle prefix>_files where (mimetype like 'application/vnd.moodle.backup' and filename not like '.' and id < 100)
