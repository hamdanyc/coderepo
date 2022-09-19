#! /bin/awk 
# Keywords:Border,conflict,immmigrant

awk FNR==1 {print "=== Keywords:Border,conflict,immmigrant\n"};
    	FNR <=5 {print};
	/border/ {gsub("border","\033[31mborder\033[0m");print;{getline;for(i=1; i<=5; i++);getline;print}};
	/crisis/ {gsub("crisis","\033[31mcrisis\033[0m");print;{getline;for(i=1; i<=5; i++);getline;print}};
	/conflict/ {gsub("conflict","\033[31mconflict\033[0m");print;{getline;for(i=1; i<=5; i++);getline;print}};
	/immigrant/ {gsub("immigrant","\033[31mimmigrant\033[0m");print;{getline;for(i=1; i<=5; i++);getline;print}};
	/protest/ {gsub("protest","\033[31mprotest\033[0m");print;{getline;for(i=1; i<=5; i++);getline;print}};
