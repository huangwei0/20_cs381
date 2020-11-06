## CS381 - Programming Language Fundamentals
## Lab 2 README

To run and interact with program's stdin:
	perl lab2.pl
See commands and usage on last page of the PDF
The program will not run any of the commands until you type CTRL+D


To run a single test:
	perl lab2.pl < ./tests/t30.in > t30.myout
	diff ./tests/t30.out t30.myout


To run all tests:
	python3 lab2-tester.py


Tests t30-t39 test the "mcw" function
Tests t40-t59 test the "sequence" function