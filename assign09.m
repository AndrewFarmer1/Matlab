%{
  Assign09.m
  Submitter's name: Andrew Farmer
  Group Members: Lane Jemison, Sarah Pepper, Alexis Jackson
  Group Number: 
  Due date: 11/15/19
  Project Summary: This project read an excel spreasheet if and only if it exists and store the data
  into a variable ,and then print out the data in a report for nth many
  game datas. After print the reports it creates 4 seperate graphs based on
  the data in a subplot and displays them. 
  Collboration Statement: In order to complete this assignment we referred
  to class notes, the help function, Matlab's online documentation, and in
  class examples
%}
clc, clear all
%*****CONSTANTS****
AU_FILE_NAME = 'AU_stats09.xls';
%*****INPUTS*****
if exist(AU_FILE_NAME,'file')
    all_Au_Game_Stats = xlsread(AU_FILE_NAME);
%Read the touchdowns, extra points, fields goals made from all the Game
%Stats
    au_Refined_Stats = [all_Au_Game_Stats(:,(1:2)),all_Au_Game_Stats(:,6),all_Au_Game_Stats(:,10),all_Au_Game_Stats(:,12),all_Au_Game_Stats(:,14)];
%*****COMPUTE*****
%Compute the total number of pointsand add it to the prexisting matrix
au_Refined_Stats(:,7) = ((au_Refined_Stats(:,3)+au_Refined_Stats(:,4)).*6) + au_Refined_Stats(:,5) + (au_Refined_Stats(:,6) .*3);
[num_Of_Games,num_Of_Stats] = size(au_Refined_Stats);
%*****OUTPUT*****
%Print out the most recent game date 
fprintf('2019 Auburn Football as of %0.2d/%0.2d \n',[au_Refined_Stats(num_Of_Games,(1:2))])
%Print out the Headers
fprintf('      Rush   Pass Extra Field Total\nDate  TDs    TDs   Pts  Goals Points \n')
%Print the values for each header using only one fprintf
fprintf('%0.2d/%0.2d  %2.0f     %2.0f    %2.0f   %2.0f    %3.0f \n',[au_Refined_Stats(:,1)';au_Refined_Stats(:,2)';au_Refined_Stats(:,3)';au_Refined_Stats(:,4)';au_Refined_Stats(:,5)';au_Refined_Stats(:,6)';au_Refined_Stats(:,7)'])
%Graph the bar graph of longest plays in the subplot
subplot(2,2,1);
bar(1:num_Of_Games,[all_Au_Game_Stats(:,7),all_Au_Game_Stats(:,11),all_Au_Game_Stats(:,15)])
%Make the title and Legend for the bar graph of Longest plays
title('2019 Auburn Longest Play')
legend('Rushing','Passing','FG')
%Create a pie graph using the yards for rushing, passing and, FGs in the
%subplot
subplot(2,2,2)
pie([mean(all_Au_Game_Stats(:,7)),mean(all_Au_Game_Stats(:,11)),mean(all_Au_Game_Stats(:,15))])
legend('Rushing','Passing','FG')
title('2019 Auburn Average Yards')
%Graph the second overlapping bar graph for total yards in subplot
subplot(2,2,3)
bar(1:num_Of_Games,[all_Au_Game_Stats(:,5),all_Au_Game_Stats(:,9)],'stacked')
title('2019 Auburn Total Yards')
legend('Rushing','Passing')
%Graph the field goals missed versus field goals made
subplot(2,2,4)
%calculate field goals missed and graph the results  
pie([sum(all_Au_Game_Stats(:,13))-sum(all_Au_Game_Stats(:,14)),sum(all_Au_Game_Stats(:,14))])
title('Auburn Field Goal breakdown')
legend('FGs Missed','Fgs Made')
%If the file does not exist display a message
else
    fprintf('This File does not exist in this directory \n')
end