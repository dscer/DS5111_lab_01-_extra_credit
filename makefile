#make pg1065.txt (raw data)
pg1065.txt:
	wget https://www.gutenberg.org/cache/epub/1065/pg1065.txt

# make raven_lines.txt processed data, which should include ONLY the lines that include any upper/lower combination of raven, (Raven, RAVEN etc). Use cat and grep and the > operator
raven_lines.txt:
	cat pg1065.txt | grep -w -i 'raven' > raven_lines.txt

# make number_of_Raven.txt, which should include a count of the lines including the word Raven, note the upper and lower case. Use cat, grep, and wc -l
one_Raven.txt:
	 cat pg1065.txt | grep -w 'Raven' | wc -l > one_Raven.txt

# make number_of_RAVEN.txt, which should include a count of the lines including the word RAVEN, note the upper and lower case. Use cat, grep, and wc -l
two_RAVEN.txt:
	 cat pg1065.txt | grep -w 'RAVEN' | wc -l > two_RAVEN.txt
	 
# make number_of_raven.txt, which should include a count of the lines including the word raven, note the upper and lower case. Use cat, grep, and wc -l
three_raven.txt:
	cat pg1065.txt | grep -w 'raven' | wc -l > three_raven.txt

# make all which should create all
.PHONY: all
all: pg1065.txt raven_lines.txt one_Raven.txt two_RAVEN.txt three_raven.txt

# Just a comment, there is something that caught me off guard, the OS treats all as case-insensitive, thus the names
# of the files created by the jobs collide.  No worries, you did this right as you were not aware.  If you want you can rename the files so 
# they don't collide, replacing the `number_of_` with `one_`, `two_` etc... let let me know if you do and we can add a couple more points for that.

# make clean which should remove all files generated
.PHONY: clean
clean:
	rm pg1065.txt || true
	rm raven_lines.txt || true
	rm one_Raven.txt || true
	rm two_RAVEN.txt || true
	rm three_raven.txt || true
	#rm *.txt || true
	ls -la
