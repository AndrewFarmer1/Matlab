%{
  Assign10.m
  Submitter's name: Andrew Farmer
  Group Members: Lane Jemison, Sarah Pepper, Alexis Jackson
  Group Number: 
  Due date: 11/22/19
  Project Summary: This project reads data for Auburn Football from a
  spreadsheet and then prints a report and then writes new data to the same
  file the data was read from
  Collboration Statement: In order to complete this assignment we referred
  to the online Matlab documentation, the Matlab book section 11.10, in
  class examples, and in class notes
%}
clc, clear all
%*****CONSTANTS*****
    au_File_Name = 'AU_stats10.xls';
    input_Spreadsheet = 'AU season';
    output_Spreadsheet = 'AU home games';
if exist(au_File_Name,'file')
%*****INPUTS*****
% Read the input spreadsheet and store the values in au_Game_Stats
   [au_Game_Stats, labels, all] = xlsread(au_File_Name,1);
   num_Of_Games = length(au_Game_Stats(:,1)');
   %For every game played determine if Auburns score was higher than
   %opponent
   %Intilize the values for total au losses and wins
   au_Season_Wins = 0;
   au_Season_Losses = 0;
   %For every game played 
   for i=1:num_Of_Games
       %For every game find the point spread
       au_Game_Stats(i,8) = abs(au_Game_Stats(i,1)-au_Game_Stats(i,2));
       %see if auburn has a larger score than opponent
       if au_Game_Stats(i,1) > au_Game_Stats(i,2)
           %Add to a new column in matrix with the ascii value of w 
           au_Game_Stats(i,6) = 'w';
           %make a counter for the number of total season wins
           au_Season_Wins = au_Season_Wins +1;
       else
           %Add to a new column in matrix with the ascii value of l
           au_Game_Stats(i,6) = 'l';
           %iterate the total loss counter for auburn
           au_Season_Losses = au_Season_Losses +1;
       end
   end
   %Find which games were SEC opponents and determines if we won them or
   %not
   %initialize the variable for Sec Wins and Losses
   sec_Wins = 0;
   sec_Losses = 0;
   %Use strfind on the Cell array to find the locations where * appears
   sec_Opponents_Location = strfind(labels((3:length(labels)),2),'*');
   %Iterate through the length of array created from str find
   for i=1:length(sec_Opponents_Location')
       %If the cell contained an *
       if sec_Opponents_Location{i,1} == 1
           %if the Cell contained a W
           if au_Game_Stats(i,6) == 119
               %Iterate the win counter
                sec_Wins = sec_Wins + 1;
            %If the cell contained an L 
           elseif au_Game_Stats(i,6) == 108
               %iterate the loss counter
                    sec_Losses = sec_Losses +1;
           end
       end
   end
%Store all the Win loss stats to the matrix of stats
au_Game_Stats((1:4),7)=[au_Season_Wins,au_Season_Losses,sec_Wins,sec_Losses]; 
%*****OUTPUT*****
%call the function to write to the spreadsheet and display the data
createReportCellArray(au_Game_Stats,labels)
else
    %if the file does not exist display an error
    fprintf('This file does not exist in this directory')
end