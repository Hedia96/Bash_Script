#!/bin/bash

#################################################################
# first challenge  about file has some number			#
#102
#071								#
#210								#
#153								#
# but summation doesnt work right by this script		#	
# THE REASON is 071						#
#THE SOlution is  						#
#       1- remove 0 before 71 beceause it interpreted	        #
#              as octal              				#
# OR    2- write command to force shell understand this file    #
#		decimal                               		#
#		< <(sed -E s/^0+// sample.data)			#
# remove leading zeros						#
#	3- fix the argument inside loop base # value		#
#		without need to sed 				#
#################################################################


############################################################
#  declare is an builtin function                          # 
#  syntax is: declare option varible = value               #    
#  some option -a ->variable is an array                   #
#              -i -> var will be treated as an integer 	   #
#		-f,-p,-r,-t,-x	    			   #
# if use + insteadof - that means turn off the attribute   #
# 							   #
############################################################
declare -i SUM=0

###############################################################
# while read is   used for read from file 		      #
# there is another way by using for loop and cat command dueto#
# cat here split words by space but it  prints  line by line  # 				      
# for line in $(cat file.txt )			              #
#do                                                           #
#	echo"$line"                                 	      #
#done						              #
# unlike while read preserve the words within aline	      #
#Example:						      #
# file.txt  						      #
#apples							      #
#orange						 	      #
#set and files						      #
#-----------------------------------			      #
# for will print					      #
#apples                                                       #
#orange                                                       #
#set							      #
#and						              #
# files							      #
#---------------------------------			      #
# while read prints 					      #
# apples						      #
#orange							      #
# set and files						      #
###############################################################


while read X 
do
	SUM+=$((10#$X)) # this command  effects on shell how it inerpreater to 
			# understand the number depends on its base but the deafult is octal
done <  sample.data
#done < <(sed -E s/^0+// sample.data)
echo "sum is :$SUM"
