%{
  Assign08a.m
  Submitter's name: Andrew Farmer
  Group Members: Lane Jemison, Sarah Pepper, Alexis Jackson
  Group Number:
  Due date: 11/8/19
  Project Summary: This program reads the stats for both Auburn and their
  opponent and prints a report and a graph
  Collboration Statement: 
%}
clc, clear all
%*****CONSTANTS*****
AU_FILE_NAME = 'AU_stats08.txt';
OPP_FILE_NAME = 'opp_stats08.txt';
%*****INPUTS*****
%If and only if both of the files exist
if exist(AU_FILE_NAME, 'file') && exist(OPP_FILE_NAME, 'file')
%Read the textfile and save the month and date in a 2x2 for Auburn
    [au_Game_Date_Month_And_Day(:,1),au_Game_Date_Month_And_Day(:,2)] = textread(AU_FILE_NAME, '%d%d%*d%*d%*d%*d%*d%*d%*d%*d');
%Read the entire data file and only save the rushing data in 4x4 for Auburn
    [au_Rushing_Stats(:,1),au_Rushing_Stats(:,2),au_Rushing_Stats(:,3),au_Rushing_Stats(:,4)] = textread(AU_FILE_NAME,'%*d%*d%d%d%d%d%*d%*d%*d%*d');
%Read the entire data file and only save the passing Stats in 4x4 for auburn
    [au_Passing_Stats(:,1),au_Passing_Stats(:,2),au_Passing_Stats(:,3),au_Passing_Stats(:,4)] = textread(AU_FILE_NAME,'%*d%*d%*d%*d%*d%*d%d%d%d%d');
%Read the date for the opponent in a 2x2 matrix
    [opp_Game_Month_Date(:,1),opp_Game_Month_Date(:,2)] =  textread(OPP_FILE_NAME, '%d%d%*d%*d%*d%*d%*d%*d%*d%*d');
%Save the rushing data for the opponents in a 4x4 matrix
    [opp_Rushing_Stats(:,1),opp_Rushing_Stats(:,2),opp_Rushing_Stats(:,3),opp_Rushing_Stats(:,4)] =textread(OPP_FILE_NAME,'%*d%*d%d%d%d%d%*d%*d%*d%*d');
%Save the Passing stats for the opponents in a 4x4 matrix
    [opp_Passing_Stats(:,1),opp_Passing_Stats(:,2),opp_Passing_Stats(:,3),opp_Passing_Stats(:,4)] = textread(OPP_FILE_NAME,'%*d%*d%*d%*d%*d%*d%d%d%d%d');
%*****COMPUTE*****
%Determine the number of games played by the Opponent
opp_Num_Games = length(opp_Game_Month_Date');
%Calculate per attempt yardage and add it to a new column in the old matrix
au_Rushing_Stats(:,5) = au_Rushing_Stats(:,2) ./ au_Rushing_Stats(:,1);
%Calculate the Passing Yards per attempt for the Opponent and add it to old
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
outputReportGraph(opp_Game_Month_Date,opp_Rushing_Stats,opp_Passing_Stats,'Opponent',2)
%*****OUTPUT*****
%if one of the files does not exist produce an error
else
    fprintf('One or more of the files does not exist in this directory \n')
end