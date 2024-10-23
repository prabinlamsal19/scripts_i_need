#
# Regular cron jobs for the pubget-all package
#
0 4	* * *	root	[ -x /usr/bin/pubget-all_maintenance ] && /usr/bin/pubget-all_maintenance
