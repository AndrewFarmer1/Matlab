%{
  function createReportCellArray used in Assign10.m
  Submitter's name: Andrew Farmer
  Group Members: Lane Jemison, Sarah Pepper, Alexis Jackson
  Group Number: 
  Due date: 11/22/19
  Project Summary: This function is responsible for printing out the stats
  information and writing all this data to the xls file
  Collboration Statement: In order to complete this assignment we referred
  to the online Matlab documentation, the Matlab book section 11.10, in
  class examples, and in class notes
%}
function outCell = createReportCellArray(stats, labels)
printReport(stats,labels)
createCellArray(stats,labels)
function [] = printReport(stats,labels)
spreadsheet_Title = labels{1,1};
%determine the index of the largest spread game and the value
[largest_Spread_Value,largest_Spread_Index] = max(stats(:,8));
%determine the date of the game with the largest spread 
largest_Spread_Date = labels{largest_Spread_Index+2,1};
%Retrieve the full string of the latest opponent
largest_Spread_Opponent = labels{largest_Spread_Index+2,3};
%Store only the name of the team without the vs.
name = largest_Spread_Opponent(3:length(labels{largest_Spread_Index+2,3}));
%Print out the title based off the title in the spreadsheet
fprintf('%s\n',spreadsheet_Title)
%Print out the win loss stats for all games referenced from the matrix
fprintf('Overall season record: %d-%d \n',stats(1,7),stats(2,7))
%Prunt out the SEC win loss stats referenced from the matric
fprintf('SEC season record: %d-%d  \n',stats(3,7),stats(4,7))
%Print out the value of the largest dpreas, its date, and the opponent
fprintf('Largest point spread was %.d on %s against%s \n',largest_Spread_Value,largest_Spread_Date,name)
function outCell = createCellArray(stats,labels)
%Find all opponents with vs in thier title as this indicates a home game
home_Game_Index = strfind(labels((3:length(labels')),3),'vs');
%initalize a varaible to use in the for loop
n =1;
for i=1:length(home_Game_Index')
    %if the value contains a 'vs' in its title save its data to a new
    %matrix
    if home_Game_Index{i,1} == 1
        %Create a matrix that only contains stats for home games
        home_Game_Stats(n,:) = stats(i,:);
        %Create a n by 2 matrix of strings that only consists of home games
        home_Game_Labels{n,1} = labels{i+2,1};
        home_Game_Labels{n,2} = labels{i+2,3};
        n = n+1;
    end
end 
%Calculate the average attendance for all games in the season
average_Home_Game_Attendance = mean(stats(:,5));
%Use a for loop to compare SEC game attendance to Average attendance
for i =1:length(home_Game_Stats(:,1)')
    %If more people attend the Sec game than an average game
    if home_Game_Stats(i,5) > average_Home_Game_Attendance
        %Add an asterik in the labels array as a literal string
        home_Game_Labels(i,3) = {'*'};
    end
end
%create a variable witht the sheet name to make code cleaner
sheet_Name = 'Au home games';
%create a varaible with the file name to make code cleaner
Au_File_Name = 'AU_stats10.xls';
%Calculate the time spent from the hours and minutes given by stats
home_Game_Stats(:,9) = home_Game_Stats(:,3)+(home_Game_Stats(:,4)./60);
%Write the data to all the correct rows in the spreadsheet making sure that
%we do not hardcode the positons of each data point
%Title of spreadsheet
xlswrite(Au_File_Name,labels(1,1),sheet_Name,'A1:A1')
%Create the headers for each row
xlswrite(Au_File_Name,[labels(2,1),labels(2,(3:5))],sheet_Name,'A2:D2');
%Since W-L and Hours are unique strings not previously used pass them in as
%string literals
xlswrite(Au_File_Name,{'W-L','Hours'},sheet_Name,'E2:F2');
%Add the word attend from the labels matrix
xlswrite(Au_File_Name,labels(2,8),sheet_Name,'G2:G2');
%Add all the values of date
xlswrite(Au_File_Name,home_Game_Labels(:,1),sheet_Name,'A3')
%Add all the values of Opponent name
xlswrite(Au_File_Name,home_Game_Labels(:,2),sheet_Name,'B3')
%Add all the Auburn score from Stats 
xlswrite(Au_File_Name,home_Game_Stats(:,1),sheet_Name,'C3')
%Add all the opponents score from stats
xlswrite(Au_File_Name,home_Game_Stats(:,2),sheet_Name,'D3');
%read the Ascii code and use char to convert the ascii into string and
%place in the spreadsheet
xlswrite(Au_File_Name,char(home_Game_Stats(:,6)),sheet_Name,'E3');
%Insert our calculated hours from our matrix
xlswrite(Au_File_Name,home_Game_Stats(:,9),sheet_Name,'F3');
%Insert Attendance
xlswrite(Au_File_Name,home_Game_Stats(:,5),sheet_Name,'G3')
%Insert our asterisk for all games that had over average attendance
xlswrite(Au_File_Name,home_Game_Labels(:,3),sheet_Name,'H3')
%use sprintf in order to make a varaible so that we can add the average
%attendance text and number and make sure it is always after the last row
%written
final_Attendance_Text_Cell_Location = sprintf('A%.f',length(home_Game_Stats(:,1)')+3);
final_Attendance_Num = sprintf('G%.f',length(home_Game_Stats(:,1)')+3);
%Add the text and numbers to the spreadsheet using our previously made
%varaiables as the range so that they always come last
xlswrite(Au_File_Name,average_Home_Game_Attendance,sheet_Name,final_Attendance_Num);
xlswrite(Au_File_Name,{'Average Attendance: '},sheet_Name,final_Attendance_Text_Cell_Location);

