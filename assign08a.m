%{
  Assign08a.m
  Submitter's name: Andrew Farmer
  Group Members: Lane Jemison, Sarah Pepper, Alexis Jackson
  Group Number: 100
  Due date: 11/8/19
  Project Summary: This program reads the stats for both Auburn and their
  opponent and prints a report and a graph
  Collboration Statement: In order to complete this project we referred to
  class notes and used the in class slides and exmaples
%}
clc, clear all
%*****CONSTANTS*****
AU_FILE_NAME = 'AU_stats08.txt';
OPP_FILE_NAME = 'opp_stats08.txt';
%*****INPUTS*****
%If and only if both of the files exist
if exist(AU_FILE_NAME, 'file') && exist(OPP_FILE_NAME, 'file')
%Read the textfile and save the Game data for Auburn
   [au_Game_Stats(:,1),au_Game_Stats(:,2),au_Game_Stats(:,3),au_Game_Stats(:,4),au_Game_Stats(:,5),au_Game_Stats(:,6),au_Game_Stats(:,7),au_Game_Stats(:,8),au_Game_Stats(:,9),au_Game_Stats(:,10)] = textread(AU_FILE_NAME, '%d%d%d%d%d%d%d%d%d%d');
%Read the entire data file and save the game data for the Opponents 
   [opp_Game_Stats(:,1),opp_Game_Stats(:,2),opp_Game_Stats(:,3),opp_Game_Stats(:,4),opp_Game_Stats(:,5),opp_Game_Stats(:,6),opp_Game_Stats(:,7),opp_Game_Stats(:,8),opp_Game_Stats(:,9),opp_Game_Stats(:,10)] = textread(OPP_FILE_NAME,'%d%d%d%d%d%d%d%d%d%d');
%Read the Auburn Game data and save only month and date in a 2x2
   au_Game_Date_Month_And_Day = au_Game_Stats(:,(1:2));
%Read the Auburn data and only save the passing Stats in 4x4 matrix
    au_Rushing_Stats = au_Game_Stats(:,(3:6));
%Create a 4x4 matrix of Auburns Rushing stats from Auburn data
    au_Passing_Stats = au_Game_Stats(:,(7:10));
%Read the Opp game data and save the month and date in 2x2 matrix
    opp_Game_Month_Date = opp_Game_Stats(:,(1:2));
%read the opp game data and save the the rushing stats in 4x4 matrix
    opp_Rushing_Stats = opp_Game_Stats(:,(3:6));
%Save the Passing stats for the opponents in a 4x4 matrix
    opp_Passing_Stats = opp_Game_Stats(:,(7:10));
%*****COMPUTE*****
%Calculate rushing per attempt yardage and add it to a new column in the old matrix
au_Rushing_Stats(:,5) = au_Rushing_Stats(:,2) ./ au_Rushing_Stats(:,1);
%Calculate the Passing Yards per attempt for the Auburn and add it to old
%matrix
au_Passing_Stats(:,5) = au_Passing_Stats(:,2)./ au_Passing_Stats(:,1);
%Calculate the Rushing yards per attmept for the Opponent and add to old
%matrix
opp_Rushing_Stats(:,5) = opp_Rushing_Stats(:,2) ./ opp_Rushing_Stats(:,1);
%Calculate the Passing Yards per attempt for the Opponent and add to old
%matrix
opp_Passing_Stats(:,5) = opp_Passing_Stats(:,2)./ opp_Passing_Stats(:,1);
%Call the outputReportGraph function using the Auburn data
outputReportGraph(au_Game_Date_Month_And_Day,au_Rushing_Stats,au_Passing_Stats,'Auburn',1)
%Call the outputReportGraph using the opponent data
outputReportGraph(opp_Game_Month_Date,opp_Rushing_Stats,opp_Passing_Stats,'Opponents',2)
%*****OUTPUT*****
%if one of the files does not exist produce an error
else
    fprintf('One or more of the files does not exist in this directory \n')
end