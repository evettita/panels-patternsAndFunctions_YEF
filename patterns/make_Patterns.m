%make_Patterns

%% LIGHT ON dots 2 LED wide at each location on the screen
%   The dot location is encoded as combinations of x dim and y dim
%   xpos = 56 and y pos = 16 are the full screen dark. 

clear all;
numOfPanelsAcross = 7;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

DOT_WIDTH = 2; % number of LED dots wide

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up
LEDdotsVertically = numOfPanelsVertically * LEDdotsPerPanel;% 16 for yvette's current set up

%Save general infomation about pattern layout
pattern.x_num = LEDdotsAcross; % this variable will where the dot is on the screen in x, last dim = 56 is blank
pattern.y_num = LEDdotsVertically; 		% Y will store where the dot is on the screen in y, last dim = 16 is blank

pattern.num_panels = 14; 	% This is the number of unique Panel IDs required.
pattern.gs_val = 2; 	% This pattern gray scale value

Pats = zeros(LEDdotsVertically, LEDdotsAcross, pattern.x_num, pattern.y_num); 	%initializes the array with zeros

% Construct the dot patterns within each dimention
% zeros 0 = dark, ones 1 = light

for ypos = 1: LEDdotsVertically - ( DOT_WIDTH - 1)   
    % build intial dot pattern for this y position
    dot_pattern = zeros( LEDdotsVertically , LEDdotsAcross) ;
    dot_pattern( ypos: ypos + DOT_WIDTH - 1 , 1 : DOT_WIDTH ) = 1; % draw light dot into matrix
    

    for xpos = 1: LEDdotsAcross - ( DOT_WIDTH - 1)
        
        % shift dot_pattern to each different location depending on current
        % x pos
        Pats(:, :, xpos , ypos) = ShiftMatrix (dot_pattern, (xpos - 1),'r','y'); % place 
       
    end
end

% Make sure whole matrix is blank when x or y is max  = 0 for a blank
% screen,
Pats(:, : , pattern.x_num, pattern.y_num) = 0;

pattern.Pats = Pats; 		% put data in structure 

pattern.Panel_map = [4, 5, 12, 14, 6, 11, 13 ; 1 , 2 ,7, 10, 3, 8, 9]; 	% define panel structure vector - YEF arena updated 8/2017

pattern.BitMapIndex = process_panel_map(pattern);
pattern.data = Make_pattern_vector(pattern);
 
 %% SAVE pattern place to save patterns to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\patterns';
 str = [directory_name '\Pattern_001_2pixelBrightDot']; 	% name must begin with ‘Pattern_’
 save(str, 'pattern');
 
%% %% LIGHT ON dots 4 LED wide at each location on the screen
%   The dot location is encoded as combinations of x dim and y dim
%   xpos = 56 and y pos = 16 are the full screen dark. 

clear all;
numOfPanelsAcross = 7;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

DOT_WIDTH = 4; % number of LED dots wide

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up
LEDdotsVertically = numOfPanelsVertically * LEDdotsPerPanel;% 16 for yvette's current set up

%Save general infomation about pattern layout
pattern.x_num = LEDdotsAcross; % this variable will where the dot is on the screen in x, last dim = 56 is blank
pattern.y_num = LEDdotsVertically; 		% Y will store where the dot is on the screen in y, last dim = 16 is blank

pattern.num_panels = 14; 	% This is the number of unique Panel IDs required.
pattern.gs_val = 2; 	% This pattern gray scale value

Pats = zeros(LEDdotsVertically, LEDdotsAcross, pattern.x_num, pattern.y_num); 	%initializes the array with zeros

% Construct the dot patterns within each dimention
% zeros 0 = dark, ones 1 = light

for ypos = 1: LEDdotsVertically - ( DOT_WIDTH - 1)   
    % build intial dot pattern for this y position
    dot_pattern = zeros( LEDdotsVertically , LEDdotsAcross) ;
    dot_pattern( ypos: ypos + DOT_WIDTH - 1 , 1 : DOT_WIDTH ) = 1; % draw light dot into matrix
    

    for xpos = 1: LEDdotsAcross - ( DOT_WIDTH - 1)
        
        % shift dot_pattern to each different location depending on current
        % x pos
        Pats(:, :, xpos , ypos) = ShiftMatrix (dot_pattern, (xpos - 1),'r','y'); % place 
       
    end
end

% Make sure whole matrix is blank when x or y is max  = 0 for a blank
% screen,
Pats(:, : , pattern.x_num, pattern.y_num) = 0;

pattern.Pats = Pats; 		% put data in structure 

pattern.Panel_map = [4, 5, 12, 14, 6, 11, 13 ; 1 , 2 ,7, 10, 3, 8, 9]; 	% define panel structure vector - YEF arena updated 8/2017

pattern.BitMapIndex = process_panel_map(pattern);
pattern.data = Make_pattern_vector(pattern);
 
 %% SAVE pattern place to save patterns to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\patterns';
 str = [directory_name '\Pattern_002_4pixelBrightDot']; 	% name must begin with ‘Pattern_’
 save(str, 'pattern');


%% LIGHT ON dots 2 LED wide vertical bar
%   The bar's horizontal location is encoded in x dim 
% whether the bar is on or not is encoded in y dim
%   xpos = 56 and/or y pos = 2 are the full screen dark. 

clear all;
numOfPanelsAcross = 7;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

BAR_WIDTH = 2; % number of LED dots wide

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up
LEDdotsVertically = numOfPanelsVertically * LEDdotsPerPanel;% 16 for yvette's current set up

%Save general infomation about pattern layout
pattern.x_num = LEDdotsAcross; % this variable will where the dot is on the screen in x, last dim = 56 is blank
pattern.y_num = 2; 		% Y will encode if the bar is displayed=1, not displayed= 2;

pattern.num_panels = 14; 	% This is the number of unique Panel IDs required.
pattern.gs_val = 2; 	% This pattern gray scale value

Pats = zeros(LEDdotsVertically, LEDdotsAcross, pattern.x_num, pattern.y_num); 	%initializes the array with zeros

% Construct the dot patterns within each dimention
% zeros 0 = dark, ones 1 = light

% build intial bar pattern 
bar_pattern = zeros( LEDdotsVertically , LEDdotsAcross) ;
bar_pattern( : , 1 : BAR_WIDTH ) = 1; % draw light dot into matrix


for xpos = 1: LEDdotsAcross - ( BAR_WIDTH - 1)
    
    % shift dot_pattern to each different location depending on current
    % x pos
    Pats(:, :, xpos , 1) = ShiftMatrix (bar_pattern, (xpos - 1),'r','y'); % place
    
end


% Make sure whole matrix is blank when x or y is max  = 0 for a blank
% screen,
Pats(:, : , pattern.x_num, pattern.y_num) = 0;

pattern.Pats = Pats; 		% put data in structure 

pattern.Panel_map = [4, 5, 12, 14, 6, 11, 13 ; 1 , 2 ,7, 10, 3, 8, 9]; 	% define panel structure vector - YEF arena updated 8/2017

pattern.BitMapIndex = process_panel_map(pattern);
pattern.data = Make_pattern_vector(pattern);
 
 %% SAVE pattern place to save patterns to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\patterns';
 str = [directory_name '\Pattern_003_2pixelBrightVertBar']; 	% name must begin with ‘Pattern_’
 save(str, 'pattern');

%% LIGHT ON dots 2 LED wide horizonal bar
%   The bar's vertical location is encoded in y dim 
% whether the bar is on or not is encoded in x dim
%   xpos = 2 and/or y pos = 16 are the full screen dark. 

clear all;
numOfPanelsAcross = 7;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

BAR_WIDTH = 2; % number of LED dots wide

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up
LEDdotsVertically = numOfPanelsVertically * LEDdotsPerPanel;% 16 for yvette's current set up

%Save general infomation about pattern layout
pattern.x_num = 2; %  X will encode if the bar is displayed=1, not displayed= 2;
pattern.y_num = LEDdotsVertically; 		% Y will store where the dot is on the screen in y, last dim = 16 is blank

pattern.num_panels = 14; 	% This is the number of unique Panel IDs required.
pattern.gs_val = 2; 	% This pattern gray scale value

Pats = zeros(LEDdotsVertically, LEDdotsAcross, pattern.x_num, pattern.y_num); 	%initializes the array with zeros

% Construct the dot patterns within each dimention
% zeros 0 = dark, ones 1 = light
for ypos = 1: LEDdotsVertically - ( BAR_WIDTH - 1)
    % build  bar pattern for this ypos
    bar_pattern = zeros( LEDdotsVertically , LEDdotsAcross) ;
    bar_pattern(  ypos: ypos + BAR_WIDTH - 1, : ) = 1; % draw light dot into matrix
    
    % store that matrix in this ydim for Pats
    Pats(:, :, 1 , ypos) = bar_pattern; % place
    
    
end

% Make sure whole matrix is blank when x or y is max  = 0 for a blank
% screen,
Pats(:, : , pattern.x_num, pattern.y_num) = 0;

pattern.Pats = Pats; 		% put data in structure 

pattern.Panel_map = [4, 5, 12, 14, 6, 11, 13 ; 1 , 2 ,7, 10, 3, 8, 9]; 	% define panel structure vector - YEF arena updated 8/2017

pattern.BitMapIndex = process_panel_map(pattern);
pattern.data = Make_pattern_vector(pattern);
 
 %% SAVE pattern place to save patterns to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\patterns';
 str = [directory_name '\Pattern_004_2pixelBrightHorizBar']; 	% name must begin with ‘Pattern_’
 save(str, 'pattern');

 
%% LIGHT ON dots 4 LED wide vertical bar
%   The bar's horizontal location is encoded in x dim 
% whether the bar is on or not is encoded in y dim
%   xpos = 56 and/or y pos = 2 are the full screen dark. 

clear all;
numOfPanelsAcross = 7;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

BAR_WIDTH = 4; % number of LED dots wide

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up
LEDdotsVertically = numOfPanelsVertically * LEDdotsPerPanel;% 16 for yvette's current set up

%Save general infomation about pattern layout
pattern.x_num = LEDdotsAcross; % this variable will where the dot is on the screen in x, last dim = 56 is blank
pattern.y_num = 2; 		% Y will encode if the bar is displayed=1, not displayed= 2;

pattern.num_panels = 14; 	% This is the number of unique Panel IDs required.
pattern.gs_val = 2; 	% This pattern gray scale value

Pats = zeros(LEDdotsVertically, LEDdotsAcross, pattern.x_num, pattern.y_num); 	%initializes the array with zeros

% Construct the dot patterns within each dimention
% zeros 0 = dark, ones 1 = light

% build intial bar pattern 
bar_pattern = zeros( LEDdotsVertically , LEDdotsAcross) ;
bar_pattern( : , 1 : BAR_WIDTH ) = 1; % draw light dot into matrix


for xpos = 1: LEDdotsAcross - ( BAR_WIDTH - 1)
    
    % shift dot_pattern to each different location depending on current
    % x pos
    Pats(:, :, xpos , 1) = ShiftMatrix (bar_pattern, (xpos - 1),'r','y'); % place
    
end

% Make sure whole matrix is blank when x or y is max  = 0 for a blank
% screen,
Pats(:, : , pattern.x_num, pattern.y_num) = 0;

pattern.Pats = Pats; 		% put data in structure 

pattern.Panel_map = [4, 5, 12, 14, 6, 11, 13 ; 1 , 2 ,7, 10, 3, 8, 9]; 	% define panel structure vector - YEF arena updated 8/2017

pattern.BitMapIndex = process_panel_map(pattern);
pattern.data = Make_pattern_vector(pattern);
 
 %% SAVE pattern place to save patterns to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\patterns';
 str = [directory_name '\Pattern_005_4pixelBrightVertBar']; 	% name must begin with ‘Pattern_’
 save(str, 'pattern'); 

 %% Full field illumination ydim = 1 light, y dim = 2 dark
%   The bar's horizontal location is encoded in x dim 
% whether the bar is on or not is encoded in y dim
%   xpos = 56 and/or y pos = 2 are the full screen dark. 

clear all;
numOfPanelsAcross = 7;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

BAR_WIDTH = 4; % number of LED dots wide

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up
LEDdotsVertically = numOfPanelsVertically * LEDdotsPerPanel;% 16 for yvette's current set up

%Save general infomation about pattern layout
pattern.x_num = 1; % this variable will where the dot is on the screen in x, last dim = 56 is blank
pattern.y_num = 2; 		% Y will encode if the bar is displayed=1, not displayed= 2;

pattern.num_panels = 14; 	% This is the number of unique Panel IDs required.
pattern.gs_val = 2; 	% This pattern gray scale value

Pats = zeros(LEDdotsVertically, LEDdotsAcross, pattern.x_num, pattern.y_num); 	%initializes the array with zeros

% Make the whole matrix of y = 1 LEDs all ON
ONIndex = 1;
Pats(:, : , :, ONIndex) = 1;

pattern.Pats = Pats; 		% put data in structure 

pattern.Panel_map = [4, 5, 12, 14, 6, 11, 13 ; 1 , 2 ,7, 10, 3, 8, 9]; 	% define panel structure vector - YEF arena updated 8/2017

pattern.BitMapIndex = process_panel_map(pattern);
pattern.data = Make_pattern_vector(pattern);
 
 %% SAVE pattern place to save patterns to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\patterns';
 str = [directory_name '\Pattern_006_fullFieldIllumination']; 	% name must begin with ‘Pattern_’
 save(str, 'pattern'); 
 %%
 
 

 