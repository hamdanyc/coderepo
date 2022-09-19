#! /bin/awk 
# Keywords:leader,policies,relation

FNR==1 {print "=== Keywords:diplomacy,issue,leader,policy,relation\n"};
  FNR <=5 {print};
  /diplomacy/ {gsub("diplomacy","\033[31mdiplomacy\033[0m");print;{getline;for(i=1; i<=5; i++);getline;print}};
  /issue/ {gsub("issue","\033[31missue\033[0m");print;{getline;for(i=1; i<=5; i++);getline;print}};
  /leader/ {gsub("leader","\033[31mleader\033[0m");print;{getline;for(i=1; i<=5; i++);getline;print}};
  /policy/ {gsub("policy","\033[31mpolicy\033[0m");print;{getline;for(i=1; i<=5; i++);getline;print}};
  /policies/ {gsub("policies","\033[31mpolicies\033[0m");print;{getline;for(i=1; i<=5; i++);getline;print}};
  /relation/ {gsub("relation","\033[31mrelation\033[330\033[0m");print;{getline;for(i=1; i<=5; i++);getline;print}};
