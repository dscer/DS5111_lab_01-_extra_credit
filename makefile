#make pg1065.txt (raw data)
pg1065.txt:
	wget https://www.gutenberg.org/cache/epub/1065/pg1065.txt

# make raven_lines.txt processed data, which should include ONLY the lines that include any upper/lower combination of raven, (Raven, RAVEN etc). Use cat and grep and the > operator
raven_lines.txt:
	cat pg1065.txt | grep -w -i 'raven' > raven_lines.txt

# make number_of_Raven.txt, which should include a count of the lines including the word Raven, note the upper and lower case. Use cat, grep, and wc -l
number_of_Raven.txt:
	 cat pg1065.txt | grep -w 'Raven' | wc -l > number_of_Raven.txt

# make number_of_RAVEN.txt, which should include a count of the lines including the word RAVEN, note the upper and lower case. Use cat, grep, and wc -l
number_of_RAVEN.txt:
	 cat pg1065.txt | grep -w 'RAVEN' | wc -l > number_of_RAVEN.txt
	 
# make number_of_raven.txt, which should include a count of the lines including the word raven, note the upper and lower case. Use cat, grep, and wc -l
number_of_raven.txt:
	cat pg1065.txt | grep -w 'raven' | wc -l > number_of_raven.txt

# make all which should create all
.PHONY: all
all: pg1065.txt raven_lines.txt number_of_Raven.txt number_of_RAVEN.txt number_of_raven.txt

# make clean which should remove all files generated
clean:
	rm pg1065.txt || true
	rm raven_lines.txt || true
	rm number_of_Raven.txt || true
	rm number_of_RAVEN.txt || true
	rm number_of_raven.txt || true
	#rm *.txt || true
	ls -la
