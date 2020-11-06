##########################
# CS 381 Project Tester  #
# Project 2              # 
##########################

# run in project root directory 
#    python lab2-tester.py 

import os
import sys

# convert window line endings 
def convert_line_endings(file_path):
    WINDOWS_LINE_ENDING = b'\r\n'
    UNIX_LINE_ENDING = b'\n'
    with open(file_path, 'rb') as open_file:
        content = open_file.read()
    content = content.replace(WINDOWS_LINE_ENDING, UNIX_LINE_ENDING)
    with open(file_path, 'wb') as open_file:
        open_file.write(content)

def main(argv, arc):
    # make directory
    try:
        os.mkdir("./myouts")
    except OSError:
        pass
    
    file = 'lab2.pl'
    if arc > 1:
        file = sys.argv[1]
        print(file)

    for file_name in os.listdir("./tests"):
        if file_name.split('.')[1] == 'in':
            # run the script, save test.myout
            os.system('perl ' + file + " < ./tests/{} > ./myouts/{}.myout".format(file_name,file_name.split('.')[0]))
            
            # set line endings to unix
            myout_file = './myouts/' + file_name.split('.')[0]+'.myout'
            convert_line_endings(myout_file)
            
            # compare test.out and test.myout
            print("#####################")
            print('Test', file_name.split('.')[0])
            print("---------------------")
            os.system("diff ./myouts/{}.myout ./tests/{}.out".format(file_name.split('.')[0],file_name.split('.')[0]))
    print("#####################")        

if __name__ == "__main__":
    # execute only if run as a script
    main(sys.argv, len(sys.argv))