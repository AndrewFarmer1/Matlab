%{
  Function outputReportGraph used in Assign08a.m
  Submitter's name: Andrew Farmer
  Group Members: Lane Jemison, Sarah Pepper, Alexis Jackson
  Group Number: 100
  Due date: 11/6/19
  Project Summary: This function is used by assign08. m in order to output
  the report and graph of both Auburn's and their opponents football stats
  Collboration Statement: In order to complete this project we referred to
  class notes and used the in class slides and exmaples
%}
function [] = outputReportGraph (date, rushing, passing, name, figureNum)
%print stat report and draw graph
%Print the headers for Report
fprintf('2019 Season Stats for %s \n          Rushing          Passing \n',name)
fprintf('Date  Att Yds per Att  Att Yds per Att \n')
%For every game played print out the stats for both teams
for i = 1: length(date')
%print the date in the specfied format
fprintf('%02d/%02d  ',[date(i,1);date(i,2)])
%print the rushing yards with the computed average
fprintf('%2.0f %3.0f %5.2f',rushing(i,1),rushing(i,2),rushing(i,5))
%Print the passing yards with the computed average
fprintf('     %2.0f %3.0f  %5.2f \n',passing(i,1),passing(i,2),passing(i,5))
end
%Add an extra line space so the text matches the example and is more
%readable
fprintf('\n')
%Save the graph title as variable name so that its modular
titleText = sprintf('2019 Season stats for %s', name);
%the figure command makes the graph pop up in front of opened windows
figure(figureNum)
%make a bar graph with a line for each game with passing in red and rushing
%in blue
bar(1:length(date'),[rushing(:,2),passing(:,2)]) 
%make the title of the graph equal to the variable we made
title(titleText)
%create a Y label Yards
ylabel('Yards')
%Create a X label Yards
xlabel('Game')
