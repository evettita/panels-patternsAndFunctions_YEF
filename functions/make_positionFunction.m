%% make_positionFunctions
% script used to build position function, this script works following the
% update of the panel code in 8/2017 to v1.3

%% Position function 1 and 2, x and y postion values for dotRandLocIpsi stimulus
% build position function for the dots at random position stimulus
% build xpos and ypos values together, yes scramble them in the same way. 
% NOTE these functions can be used with either 2 or 4 LED wide dots but it
% might waste time for the 4 led since there will be a couple of blank
% dimentions when the dot would go off the side of the screen so the screen
% is just blank

PANELS_FRAME_RATE = 50; %Hz
FLASH_DURATION = 0.5; % seconds
BETWEEN_FLASH_DURATION = 0.5; % seconds
DOT_WIDTH = 2; % LEDs wide

numOfPanelsAcross = 7;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up
LEDdotsVertically = numOfPanelsVertically * LEDdotsPerPanel;% 16 for yvette's current set up

xposMin = 1;
xposMax = 39; % LED position at midline
yposMin = 1;
yposMax = LEDdotsVertically - ( DOT_WIDTH );  % LED panels position

% build 2 arrays that together would sample every other location in a 16X56 matrix
xpossPosition = xposMin : 2 : xposMax; 
ypossPosition = yposMin : 2 : yposMax;

% expand x pos array
xpositionArray = repmat( xpossPosition , 1 , length( ypossPosition ) );
% expand y pos array 
ypositionArray = repmat( ypossPosition , 1 , length( xpossPosition ));
ypositionArray = sort( ypositionArray );

xpositionOrder = [];
ypositionOrder = [];

NUM_REPs = 5; % number of times this will cycle thru different random order of dot locations
for i = 1: NUM_REPs 
    
    currRandomOrder = randperm( numel(xpositionArray) );
    
    % add another round of rand values to x pos order
    xpositionOrder = [xpositionOrder xpositionArray( currRandomOrder ) ]; % without replacements
    % add another round of rand values to y pos order
    ypositionOrder = [ypositionOrder ypositionArray( currRandomOrder ) ]; % without replacements

end


% build actual positionFunction
xpositionFunction = [];
ypositionFunction = [];

% last position of the final array in this pattern
BLANK_DIM_X = LEDdotsAcross - 1;% subtract 1 b/c controller add this to starting position which is default to 1.
BLANK_DIM_Y = LEDdotsVertically -1;% subtract 1 b/c controller add this to starting position which is default to 1.

for j = 1: length( xpositionOrder )
    barPeriod_X = xpositionOrder(j)* ones(1, FLASH_DURATION * PANELS_FRAME_RATE );  
    barPeriod_Y = ypositionOrder(j)* ones(1, FLASH_DURATION * PANELS_FRAME_RATE );  
    
    blankPeriod_X = BLANK_DIM_X * ones(1, BETWEEN_FLASH_DURATION * PANELS_FRAME_RATE )   ; % 
    blankPeriod_Y = BLANK_DIM_Y * ones(1, BETWEEN_FLASH_DURATION * PANELS_FRAME_RATE )   ; % 
    
    xpositionFunction = [xpositionFunction barPeriod_X blankPeriod_X];
    ypositionFunction = [ypositionFunction barPeriod_Y blankPeriod_Y];
end 

func_X = xpositionFunction;
func_Y = ypositionFunction;

%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
func = func_X;
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_001_dotsIpsi_Xpos']; 
 save(str_x, 'func'); % variable must be named 'func'

 
func = func_Y;
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_y = [directory_name '\position_function_002_dotsIpsi_Ypos']; 	
 save(str_y, 'func'); % variable must be named 'func'

%% x and y postion values for dotRandLocalSearch stimulus
% Plan: user will specific with initial x position where on the screen
% hoizontally the stimulus should start.   Then the stimulus will span a
% couple of rows (9) to the right of that region and the full y range.
% build position function for the dots at random position stimulus
% build xpos and ypos values together, yes scramble them in the same way. 
PANELS_FRAME_RATE = 50; %Hz
FLASH_DURATION = 0.5; % seconds
BETWEEN_FLASH_DURATION = 0.5; % seconds
DOT_WIDTH = 2; % LEDs wide

numOfPanelsAcross = 7;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up
LEDdotsVertically = numOfPanelsVertically * LEDdotsPerPanel;% 16 for yvette's current set up

xposMin = 1;
xposMax = 9; % LED position at midline
yposMin = 1;
yposMax = LEDdotsVertically - ( DOT_WIDTH );  % LED panels position

% build 2 arrays that together would sample every other location in a 16X56 matrix
xpossPosition = xposMin : 2 : xposMax; 
ypossPosition = yposMin : 2 : yposMax;

% expand x pos array
xpositionArray = repmat( xpossPosition , 1 , length( ypossPosition ) );
% expand y pos array 
ypositionArray = repmat( ypossPosition , 1 , length( xpossPosition ));
ypositionArray = sort( ypositionArray );

xpositionOrder = [];
ypositionOrder = [];

NUM_REPs = 5; % number of times this will cycle thru different random order of dot locations
for i = 1: NUM_REPs 
    
    currRandomOrder = randperm( numel(xpositionArray) );
    
    % add another round of rand values to x pos order
    xpositionOrder = [xpositionOrder xpositionArray( currRandomOrder ) ]; % without replacements
    % add another round of rand values to y pos order
    ypositionOrder = [ypositionOrder ypositionArray( currRandomOrder ) ]; % without replacements

end


% build actual positionFunction
xpositionFunction = [];
ypositionFunction = [];

% last position of the final array in this pattern
BLANK_DIM_X = LEDdotsAcross - 1;% subtract 1 b/c controller add this to starting position which is default to 1.
BLANK_DIM_Y = LEDdotsVertically -1;% subtract 1 b/c controller add this to starting position which is default to 1.

for j = 1: length( xpositionOrder )
    barPeriod_X = xpositionOrder(j)* ones(1, FLASH_DURATION * PANELS_FRAME_RATE );  
    barPeriod_Y = ypositionOrder(j)* ones(1, FLASH_DURATION * PANELS_FRAME_RATE );  
    
    blankPeriod_X = BLANK_DIM_X * ones(1, BETWEEN_FLASH_DURATION * PANELS_FRAME_RATE )   ; % 
    blankPeriod_Y = BLANK_DIM_Y * ones(1, BETWEEN_FLASH_DURATION * PANELS_FRAME_RATE )   ; % 
    
    xpositionFunction = [xpositionFunction barPeriod_X blankPeriod_X];
    ypositionFunction = [ypositionFunction barPeriod_Y blankPeriod_Y];
end 

func_X = xpositionFunction;
func_Y = ypositionFunction;

%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
func = func_X;
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_003_dotsLocalSearch_Xpos']; 
 save(str_x, 'func'); % variable must be named 'func'

 
func = func_Y;
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_y = [directory_name '\position_function_004_dotsLocalSearch_Ypos']; 	
 save(str_y, 'func'); % variable must be named 'func'
 
 

%% Position function 5 and 6, x and y postion values for dotRandLoc stimulus
% build position function for the dots at random position stimulus
% build xpos and ypos values together, yes scramble them in the same way. 
% NOTE these functions can be used with either 2 or 4 LED wide dots but it
% might waste time for the 4 led since there will be a couple of blank
% dimentions when the dot would go off the side of the screen so the screen
% is just blank

PANELS_FRAME_RATE = 50; %Hz
FLASH_DURATION = 0.5; % seconds
BETWEEN_FLASH_DURATION = 0.5; % seconds
DOT_WIDTH = 2; % LEDs wide

numOfPanelsAcross = 7;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up
LEDdotsVertically = numOfPanelsVertically * LEDdotsPerPanel;% 16 for yvette's current set up

xposMin = 1;
xposMax = 55; % All LEd locations
yposMin = 1;
yposMax = LEDdotsVertically - ( DOT_WIDTH );  % LED panels position

% build 2 arrays that together would sample every other location in a 16X56 matrix
xpossPosition = xposMin : 2 : xposMax; 
ypossPosition = yposMin : 2 : yposMax;

% expand x pos array
xpositionArray = repmat( xpossPosition , 1 , length( ypossPosition ) );
% expand y pos array 
ypositionArray = repmat( ypossPosition , 1 , length( xpossPosition ));
ypositionArray = sort( ypositionArray );

xpositionOrder = [];
ypositionOrder = [];

NUM_REPs = 5; % number of times this will cycle thru different random order of dot locations
for i = 1: NUM_REPs 
    
    currRandomOrder = randperm( numel(xpositionArray) );
    
    % add another round of rand values to x pos order
    xpositionOrder = [xpositionOrder xpositionArray( currRandomOrder ) ]; % without replacements
    % add another round of rand values to y pos order
    ypositionOrder = [ypositionOrder ypositionArray( currRandomOrder ) ]; % without replacements

end


% build actual positionFunction
xpositionFunction = [];
ypositionFunction = [];

% last position of the final array in this pattern
BLANK_DIM_X = LEDdotsAcross - 1;% subtract 1 b/c controller add this to starting position which is default to 1.
BLANK_DIM_Y = LEDdotsVertically -1;% subtract 1 b/c controller add this to starting position which is default to 1.

for j = 1: length( xpositionOrder )
    barPeriod_X = xpositionOrder(j)* ones(1, FLASH_DURATION * PANELS_FRAME_RATE );  
    barPeriod_Y = ypositionOrder(j)* ones(1, FLASH_DURATION * PANELS_FRAME_RATE );  
    
    blankPeriod_X = BLANK_DIM_X * ones(1, BETWEEN_FLASH_DURATION * PANELS_FRAME_RATE )   ; % 
    blankPeriod_Y = BLANK_DIM_Y * ones(1, BETWEEN_FLASH_DURATION * PANELS_FRAME_RATE )   ; % 
    
    xpositionFunction = [xpositionFunction barPeriod_X blankPeriod_X];
    ypositionFunction = [ypositionFunction barPeriod_Y blankPeriod_Y];
end 

func_X = xpositionFunction;
func_Y = ypositionFunction;

%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
func = func_X;
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_005_dotsFullScreen_Xpos']; 
 save(str_x, 'func'); % variable must be named 'func'

 
func = func_Y;
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_y = [directory_name '\position_function_006_dotsFullScreen_Ypos']; 	
 save(str_y, 'func'); % variable must be named 'func'


%% Position function 7, x  postion values for barRandLoc stimulus
% build position function for the bar at random position stimulus
% build xpos 
PANELS_FRAME_RATE = 50; %Hz
FLASH_DURATION = 0.5; % seconds
BETWEEN_FLASH_DURATION = 0.5; % seconds

numOfPanelsIncludingFictive = 12;

numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up
LEDdotsVertically = numOfPanelsVertically * LEDdotsPerPanel;% 16 for yvette's current set up

xposMin = 1;
xposMax = LEDdotsAcross - 2; % subtract 1 + 1 b/c controller add this to starting position which is default to 1 and so not to sample blank dim

% build 2 arrays that together would sample every other location in a 16X56 matrix
xpossPosition = xposMin : 2 : xposMax; 

xpositionOrder = [];

NUM_REPs = 5; % number of times this will cycle thru different random order of dot locations
for i = 1: NUM_REPs 
    
    currRandomOrder = randperm( numel(xpossPosition) );
    
    % add another round of rand values to x pos order
    xpositionOrder = [xpositionOrder xpossPosition( currRandomOrder ) ]; % without replacements
end

% build actual positionFunction
xpositionFunction = [];

% last position of the final array in this pattern
BLANK_DIM_X = (numOfPanelsIncludingFictive * LEDdotsPerPanel) - 1;% subtract 1 b/c controller add this to starting position which is default to 1.

for j = 1: length( xpositionOrder )
    barPeriod_X = xpositionOrder(j)* ones(1, FLASH_DURATION * PANELS_FRAME_RATE );   
    
    blankPeriod_X = BLANK_DIM_X * ones(1, BETWEEN_FLASH_DURATION * PANELS_FRAME_RATE )   ; % 
    
    xpositionFunction = [xpositionFunction barPeriod_X blankPeriod_X];
end 

func = xpositionFunction;

%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_007_barRandLoc_Xpos']; 
 save(str_x, 'func'); % variable must be named 'func'


%% Position function 8, Static array for when you don't want the other channel to move

PANELS_FRAME_RATE = 50; %Hz

POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels


positionArray = zeros(1, POSITION_FUNCTION_LENGTH);

func = positionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_008_Static0']; 
 save(str_x, 'func'); % variable must be named 'func'

%% Position function 9, pattern ON and OFF alternation/ intervleave
PATTERN_FLASH_DURATION = 2; % seconds, 100ms
INTER_FLASH_DURATION = 2; % seconds
POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels
PANELS_FRAME_RATE = 50; %Hz

% Warning zero indexing for the positino funciton!!
YDim1 = 0;% displays full pattern on the screen (dim = 1) if this is zero indexing now... which i think it should be for position functions
YDim2 = 1;% displays full dark screen (dim = 2), if this is zero indexing now... which i think it should be for position functions

positionArray = [];
switchingCounter = true;
while (length (positionArray) < POSITION_FUNCTION_LENGTH)

    if(switchingCounter)
        % build interflash period and add it to the position array
        currFlashSegment = YDim2 * ones(1, INTER_FLASH_DURATION * PANELS_FRAME_RATE);
        positionArray = [ positionArray,  currFlashSegment ];
        switchingCounter = false;
        
    else
        % build flash period and add it to the position array
        currFlashSegment = YDim1 * ones(1, PATTERN_FLASH_DURATION * PANELS_FRAME_RATE);
        positionArray = [ positionArray,   currFlashSegment ];
        switchingCounter = true;
    end
      
end

func = positionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_009_2sOFF_2sON']; 
 save(str_x, 'func'); % variable must be named 'func'

%% Position function 10, pattern ON and OFF alternation/ intervleave
PATTERN_FLASH_DURATION = 0.5; % seconds
INTER_FLASH_DURATION = 0.5; % seconds
POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels
PANELS_FRAME_RATE = 50; %Hz

% Warning zero indexing for the positino funciton!!
YDim1 = 0;% displays full pattern on the screen (dim = 1) if this is zero indexing now... which i think it should be for position functions
YDim2 = 1;% displays full dark screen (dim = 2), if this is zero indexing now... which i think it should be for position functions

positionArray = [];
switchingCounter = true;
while (length (positionArray) < POSITION_FUNCTION_LENGTH)

    if(switchingCounter)
        % build interflash period and add it to the position array
        currFlashSegment = YDim2 * ones(1, INTER_FLASH_DURATION * PANELS_FRAME_RATE);
        positionArray = [ positionArray,  currFlashSegment ];
        switchingCounter = false;
        
    else
        % build flash period and add it to the position array
        currFlashSegment = YDim1 * ones(1, PATTERN_FLASH_DURATION * PANELS_FRAME_RATE);
        positionArray = [ positionArray,   currFlashSegment ];
        switchingCounter = true;
    end
      
end

func = positionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_010_500msOFF_500msON']; 
 save(str_x, 'func'); % variable must be named 'func'

 %% Position function 11, pattern ON and OFF alternation/ intervleave
PATTERN_FLASH_DURATION = 1; % seconds
INTER_FLASH_DURATION = 10; % seconds
POSITION_FUNCTION_LENGTH = 10000; % this how many frames long these normally are... set by panels
PANELS_FRAME_RATE = 50; %Hz

% Warning zero indexing for the positino funciton!!
YDim1 = 0;% displays full pattern on the screen (dim = 1) if this is zero indexing now... which i think it should be for position functions
YDim2 = 1;% displays full dark screen (dim = 2), if this is zero indexing now... which i think it should be for position functions

positionArray = [];
switchingCounter = true;
while (length (positionArray) < POSITION_FUNCTION_LENGTH)

    if(switchingCounter)
        % build interflash period and add it to the position array
        currFlashSegment = YDim2 * ones(1, INTER_FLASH_DURATION * PANELS_FRAME_RATE);
        positionArray = [ positionArray,  currFlashSegment ];
        switchingCounter = false;
        
    else
        % build flash period and add it to the position array
        currFlashSegment = YDim1 * ones(1, PATTERN_FLASH_DURATION * PANELS_FRAME_RATE);
        positionArray = [ positionArray,   currFlashSegment ];
        switchingCounter = true;
    end
      
end

func = positionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_011_10sOFF_1sON']; 
 save(str_x, 'func'); % variable must be named 'func'

%% ~15Deg/s RIGHTWARD Motion either Gratting or bar:
PANELS_FRAME_RATE = 50; %Hz
POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels
numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up

PATTERN_SPEED_DEG_PER_SEC = 15;% deg/s  
DEGREES_PRE_PIXEL = 3; % deg %CHECK!  THIS IS APPROXIMATE!!

% Warning zero indexing for the position funciton!!
XDimMin = 0;% 
XDimMax = LEDdotsAcross;% 

positionArray = [];
switchingCounter = true;

pixelPerSecond = PATTERN_SPEED_DEG_PER_SEC / DEGREES_PRE_PIXEL; % corresponding LED pixel per second
%how many frames should be spent at each function position.
framesDwellPerPixel =  PANELS_FRAME_RATE / pixelPerSecond; % frames/pixel=( (frames/s) / (pixel/s) )

currFrameCounter = XDimMin;
while (length (positionArray) < POSITION_FUNCTION_LENGTH) && (currFrameCounter <= XDimMax)
    
    addToArray = currFrameCounter * ones( 1,  framesDwellPerPixel );

    positionArray = [positionArray addToArray ];
    
    currFrameCounter = currFrameCounter + 1;     
end


func = positionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_012_movingRightPattern_15degS']; 
 save(str_x, 'func'); % variable must be named 'func'
 

 %% ~15Deg/s LEFTWARD Motion either Gratting or bar:
PANELS_FRAME_RATE = 50; %Hz
POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels
numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up

PATTERN_SPEED_DEG_PER_SEC = 15;% deg/s  
DEGREES_PRE_PIXEL = 3; % deg %CHECK!  THIS IS APPROXIMATE!!

% Warning zero indexing for the position funciton!!
XDimMin = 0;% 
XDimMax = LEDdotsAcross;% 

positionArray = [];
switchingCounter = true;

pixelPerSecond = PATTERN_SPEED_DEG_PER_SEC / DEGREES_PRE_PIXEL; % corresponding LED pixel per second
%how many frames should be spent at each function position.
framesDwellPerPixel =  PANELS_FRAME_RATE / pixelPerSecond; % frames/pixel=( (frames/s) / (pixel/s) )

currFrameCounter = XDimMax - 1;
while (length (positionArray) < POSITION_FUNCTION_LENGTH) && (currFrameCounter > XDimMin)
    
    addToArray = currFrameCounter * ones( 1,  framesDwellPerPixel );

    positionArray = [positionArray addToArray ];
    
    currFrameCounter = currFrameCounter - 1;  
end

func = positionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_013_movingLeftPattern_15degS']; 
 save(str_x, 'func'); % variable must be named 'func'
 

 %%  Interleaved moving bar stimulus 15 DEg/s   rightward then leftward
PANELS_FRAME_RATE = 50; %Hz
POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels
numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 96 for yvette's set up including fictive panels

PATTERN_SPEED_DEG_PER_SEC = 15;% deg/s  
DEGREES_PRE_PIXEL = 3; % deg THIS IS APPROXIMATE!!

% Warning zero indexing for the position funciton!!
XDimMin = 0;% 
XDimMax = LEDdotsAcross;% 

rightwardPositionArray = [];
leftwardPositionArray = [];

pixelPerSecond = PATTERN_SPEED_DEG_PER_SEC / DEGREES_PRE_PIXEL; % corresponding LED pixel per second
%how many frames should be spent at each function position.
framesDwellPerPixel =  PANELS_FRAME_RATE / pixelPerSecond; % frames/pixel=( (frames/s) / (pixel/s) )

%Build Rightward segement of array:
currFrameCounter = XDimMin;
while (length (rightwardPositionArray) < POSITION_FUNCTION_LENGTH) && (currFrameCounter <= XDimMax)
    
    addToArray = currFrameCounter * ones( 1,  framesDwellPerPixel );

    rightwardPositionArray = [rightwardPositionArray addToArray ];
    
    currFrameCounter = currFrameCounter + 1;     
end

%Build leftward segement of array:
currFrameCounter = XDimMax;
while (length (leftwardPositionArray) < POSITION_FUNCTION_LENGTH) && (currFrameCounter >= XDimMin)
    
    addToArray = currFrameCounter * ones( 1,  framesDwellPerPixel );

    leftwardPositionArray = [leftwardPositionArray addToArray ];
    
    currFrameCounter = currFrameCounter - 1;  
end

NUM_TIMES_TO_REPEAT_GRATING_ROTAION = 1;
func = [ repmat( rightwardPositionArray , 1, NUM_TIMES_TO_REPEAT_GRATING_ROTAION)  repmat( leftwardPositionArray , 1, NUM_TIMES_TO_REPEAT_GRATING_ROTAION) ];

%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_014_movingPatternRightLeft_15degS']; 
 save(str_x, 'func'); % variable must be named 'func'

 %%  Interleaved moving bar stimulus 50 deg/s
PANELS_FRAME_RATE = 50; %Hz
POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels
numOfPanelsAcross = 12;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 96 for yvette's set up including fictive panels

PATTERN_SPEED_DEG_PER_SEC = 50;% deg/s  
DEGREES_PRE_PIXEL = 3; % deg %CHECK!  THIS IS APPROXIMATE!!

% Warning zero indexing for the position funciton!!
XDimMin = 0;% 
XDimMax = LEDdotsAcross;% 

rightwardPositionArray = [];
leftwardPositionArray = [];

pixelPerSecond = PATTERN_SPEED_DEG_PER_SEC / DEGREES_PRE_PIXEL; % corresponding LED pixel per second
%how many frames should be spent at each function position.
framesDwellPerPixel =  PANELS_FRAME_RATE / pixelPerSecond; % frames/pixel=( (frames/s) / (pixel/s) )

%Build Rightward segement of array:
currFrameCounter = XDimMin;
while (length (rightwardPositionArray) < POSITION_FUNCTION_LENGTH) && (currFrameCounter <= XDimMax)
    
    addToArray = currFrameCounter * ones( 1,  framesDwellPerPixel );

    rightwardPositionArray = [rightwardPositionArray addToArray ];
    
    currFrameCounter = currFrameCounter + 1;     
end

%Build leftward segement of array:
currFrameCounter = XDimMax - 1;
while (length (leftwardPositionArray) < POSITION_FUNCTION_LENGTH) && (currFrameCounter > XDimMin)
    
    addToArray = currFrameCounter * ones( 1,  framesDwellPerPixel );

    leftwardPositionArray = [leftwardPositionArray addToArray ];
    
    currFrameCounter = currFrameCounter - 1;  
end

NUM_TIMES_TO_REPEAT_GRATING_ROTAION = 5;
func = [ repmat( rightwardPositionArray , 1, NUM_TIMES_TO_REPEAT_GRATING_ROTAION)  repmat( leftwardPositionArray , 1, NUM_TIMES_TO_REPEAT_GRATING_ROTAION) ];

%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_015_movingGratingRightLeft_50degS']; 
 save(str_x, 'func'); % variable must be named 'func'
 
 %% Position function 16, x  postion values for barRandLoc stimulus
% build position function for the bar at random position stimulus
% build xpos 
PANELS_FRAME_RATE = 50; %Hz
FLASH_DURATION = 0.5; % seconds
BETWEEN_FLASH_DURATION = 0.5; % seconds

numOfPanelsIncludingFictive = 9;

numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up
LEDdotsVertically = numOfPanelsVertically * LEDdotsPerPanel;% 16 for yvette's current set up

xposMin = 1;
xposMax = LEDdotsAcross - 2; % subtract 1 + 1 b/c controller add this to starting position which is default to 1 and so not to sample blank dim

% build 2 arrays that together would sample every other location in a 16X56 matrix
xpossPosition = xposMin : 2 : xposMax; 

xpositionOrder = [];

NUM_REPs = 5; % number of times this will cycle thru different random order of dot locations
for i = 1: NUM_REPs 
    
    currRandomOrder = randperm( numel(xpossPosition) );
    
    % add another round of rand values to x pos order
    xpositionOrder = [xpositionOrder xpossPosition( currRandomOrder ) ]; % without replacements
end

% build actual positionFunction
xpositionFunction = [];
ypositionFunction = [];

% last position of the final array in this pattern
BLANK_DIM_X = (numOfPanelsIncludingFictive * LEDdotsPerPanel) - 1;% subtract 1 b/c controller add this to starting position which is default to 1.

for j = 1: length( xpositionOrder )
    barPeriod_X = xpositionOrder(j)* ones(1, FLASH_DURATION * PANELS_FRAME_RATE );   
    
    blankPeriod_X = BLANK_DIM_X * ones(1, BETWEEN_FLASH_DURATION * PANELS_FRAME_RATE )   ; % 
    
    xpositionFunction = [xpositionFunction barPeriod_X blankPeriod_X];
    
    barPeriod_Y = zeros(1, FLASH_DURATION * PANELS_FRAME_RATE );
    blankPeriod_Y = ones(1, BETWEEN_FLASH_DURATION * PANELS_FRAME_RATE );
    
    ypositionFunction = [ ypositionFunction barPeriod_Y blankPeriod_Y];
end 

func_x = xpositionFunction;
func_y = ypositionFunction;

%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
func = func_x;
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_016_barRandLoc_Xpos_noFictivePanels']; 
 save(str_x, 'func'); % variable must be named 'func'
 
%% SAVE position function place to be put on the SD card:
func = func_y;
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_017_barRandLoc_Ypos_noFictivePanels']; 
 save(str_x, 'func'); % variable must be named 'func'

%% Position function 18, x  postion values for barRandLoc stimulus
% build position function for the bar at random position stimulus
% build xpos 
PANELS_FRAME_RATE = 50; %Hz
FLASH_DURATION = 2; % seconds
BETWEEN_FLASH_DURATION = 2; % seconds

numOfPanelsIncludingFictive = 12;

numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up
LEDdotsVertically = numOfPanelsVertically * LEDdotsPerPanel;% 16 for yvette's current set up

xposMin = 1;
xposMax = LEDdotsAcross - 2; % subtract 1 + 1 b/c controller add this to starting position which is default to 1 and so not to sample blank dim

% build 2 arrays that together would sample every other location in a 16X56 matrix
xpossPosition = xposMin : 2 : xposMax; 

xpositionOrder = [];

NUM_REPs = 5; % number of times this will cycle thru different random order of dot locations
for i = 1: NUM_REPs 
    
    currRandomOrder = randperm( numel(xpossPosition) );
    
    % add another round of rand values to x pos order
    xpositionOrder = [xpositionOrder xpossPosition( currRandomOrder ) ]; % without replacements
end

% build actual positionFunction
xpositionFunction = [];

% last position of the final array in this pattern
BLANK_DIM_X = (numOfPanelsIncludingFictive * LEDdotsPerPanel) - 1;% subtract 1 b/c controller add this to starting position which is default to 1.

for j = 1: length( xpositionOrder )
    barPeriod_X = xpositionOrder(j)* ones(1, FLASH_DURATION * PANELS_FRAME_RATE );   
    
    blankPeriod_X = BLANK_DIM_X * ones(1, BETWEEN_FLASH_DURATION * PANELS_FRAME_RATE ); % 
    
    xpositionFunction = [xpositionFunction barPeriod_X blankPeriod_X];
end 

func = xpositionFunction;

%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_018_barRandLoc_2sec_Xpos']; 
 save(str_x, 'func'); % variable must be named 'func'


 %% Position function 19, x  postion values FAST 250 ms barRandLoc stimulus NO BREAK!
% build position function for the bar at random position stimulus
% build xpos 
PANELS_FRAME_RATE = 50; %Hz
FLASH_DURATION = 0.250; % approximately **** 250 mseconds
BETWEEN_FLASH_DURATION = 0; % seconds

numOfPanelsIncludingFictive = 12;

numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up
LEDdotsVertically = numOfPanelsVertically * LEDdotsPerPanel;% 16 for yvette's current set up

xposMin = 1;
xposMax = LEDdotsAcross - 2; % subtract 1 + 1 b/c controller add this to starting position which is default to 1 and so not to sample blank dim

% build 2 arrays that together would sample every other location in a 16X56 matrix
xpossPosition = xposMin : 2 : xposMax; 

xpositionOrder = [];

NUM_REPs = 5; % number of times this will cycle thru different random order of dot locations
for i = 1: NUM_REPs 
    
    currRandomOrder = randperm( numel(xpossPosition) );
    
    % add another round of rand values to x pos order
    xpositionOrder = [xpositionOrder xpossPosition( currRandomOrder ) ]; % without replacements
end

% build actual positionFunction
xpositionFunction = [];

% last position of the final array in this pattern
BLANK_DIM_X = (numOfPanelsIncludingFictive * LEDdotsPerPanel) - 1;% subtract 1 b/c controller add this to starting position which is default to 1.

for j = 1: length( xpositionOrder )
    barPeriod_X = xpositionOrder(j)* ones(1, round( FLASH_DURATION * PANELS_FRAME_RATE ) );   
    
    % blankPeriod_X = BLANK_DIM_X * ones(1, BETWEEN_FLASH_DURATION * PANELS_FRAME_RATE ); % 
    
    xpositionFunction = [xpositionFunction barPeriod_X ];
end 

func = xpositionFunction;

%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_019_barRandLoc_250ms_Xpos']; 
 save(str_x, 'func'); % variable must be named 'func'
 
%% ~50 Deg/s RIGHTWARD Motion either Gratting or bar:
PANELS_FRAME_RATE = 50; %Hz
POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels
numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up

PATTERN_SPEED_DEG_PER_SEC = 50;% deg/s  
DEGREES_PRE_PIXEL = 3; % deg %CHECK!  THIS IS APPROXIMATE!!

% Warning zero indexing for the position funciton!!
XDimMin = 0;% 
XDimMax = LEDdotsAcross;% 

positionArray = [];
switchingCounter = true;

pixelPerSecond = PATTERN_SPEED_DEG_PER_SEC / DEGREES_PRE_PIXEL; % corresponding LED pixel per second
%how many frames should be spent at each function position.
framesDwellPerPixel =  PANELS_FRAME_RATE / pixelPerSecond; % frames/pixel=( (frames/s) / (pixel/s) )

currFrameCounter = XDimMin;
while (length (positionArray) < POSITION_FUNCTION_LENGTH) && (currFrameCounter <= XDimMax)
    
    addToArray = currFrameCounter * ones( 1,  framesDwellPerPixel );

    positionArray = [positionArray addToArray ];
    
    currFrameCounter = currFrameCounter + 1;     
end

func = positionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_020_movingRightPattern_50degS']; 
 save(str_x, 'func'); % variable must be named 'func'
 
 %% ~150 Deg/s RIGHTWARD Motion either Gratting or bar:
PANELS_FRAME_RATE = 50; %Hz
POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels
numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up

PATTERN_SPEED_DEG_PER_SEC = 150;% deg/s  
DEGREES_PRE_PIXEL = 3; % deg %CHECK!  THIS IS APPROXIMATE!!

% Warning zero indexing for the position funciton!!
XDimMin = 0;% 
XDimMax = LEDdotsAcross;% 

positionArray = [];
switchingCounter = true;

pixelPerSecond = PATTERN_SPEED_DEG_PER_SEC / DEGREES_PRE_PIXEL; % corresponding LED pixel per second
%how many frames should be spent at each function position.
framesDwellPerPixel =  PANELS_FRAME_RATE / pixelPerSecond; % frames/pixel=( (frames/s) / (pixel/s) )

currFrameCounter = XDimMin;
while (length (positionArray) < POSITION_FUNCTION_LENGTH) && (currFrameCounter <= XDimMax)
    
    addToArray = currFrameCounter * ones( 1,  framesDwellPerPixel );

    positionArray = [positionArray addToArray ];
    
    currFrameCounter = currFrameCounter + 1;     
end

func = positionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_021_movingRightPattern_150degS']; 
 save(str_x, 'func'); % variable must be named 'func'
 
%% ~300 Deg/s RIGHTWARD Motion either Gratting or bar:
PANELS_FRAME_RATE = 200; %Hz
POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels
numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up

PATTERN_SPEED_DEG_PER_SEC = 300;% deg/s  
DEGREES_PRE_PIXEL = 3; % deg %CHECK!  THIS IS APPROXIMATE!!

% Warning zero indexing for the position funciton!!
XDimMin = 0;% 
XDimMax = LEDdotsAcross;% 

positionArray = [];
switchingCounter = true;

pixelPerSecond = PATTERN_SPEED_DEG_PER_SEC / DEGREES_PRE_PIXEL; % corresponding LED pixel per second
%how many frames should be spent at each function position.
framesDwellPerPixel =  PANELS_FRAME_RATE / pixelPerSecond; % frames/pixel=( (frames/s) / (pixel/s) )


secondsToPassThruAllXPositions = LEDdotsAcross / pixelPerSecond;
framesToPassThruAllXPositions = secondsToPassThruAllXPositions * PANELS_FRAME_RATE;

% build position Array that passes from 0 to max LED position
positionArray = 0:  ( LEDdotsAcross / (framesToPassThruAllXPositions-1))  : LEDdotsAcross;

% round so position Array is intergers
func = round( positionArray );
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_022_movingRightPattern_300degS_200Hz']; 
 save(str_x, 'func'); % variable must be named 'func'
 %% ~450 Deg/s RIGHTWARD Motion either Gratting or bar:
PANELS_FRAME_RATE = 200; %Hz
POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels
numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up

PATTERN_SPEED_DEG_PER_SEC = 450;% deg/s  
DEGREES_PRE_PIXEL = 3; % deg %CHECK!  THIS IS APPROXIMATE!!

% Warning zero indexing for the position funciton!!
XDimMin = 0;% 
XDimMax = LEDdotsAcross;% 

positionArray = [];
switchingCounter = true;

pixelPerSecond = PATTERN_SPEED_DEG_PER_SEC / DEGREES_PRE_PIXEL; % corresponding LED pixel per second
%how many frames should be spent at each function position.
framesDwellPerPixel =  PANELS_FRAME_RATE / pixelPerSecond; % frames/pixel=( (frames/s) / (pixel/s) )


secondsToPassThruAllXPositions = LEDdotsAcross / pixelPerSecond;
framesToPassThruAllXPositions = secondsToPassThruAllXPositions * PANELS_FRAME_RATE;

% build position Array that passes from 0 to max LED position
positionArray = 0:  ( LEDdotsAcross / (framesToPassThruAllXPositions-1))  : LEDdotsAcross;

% round so position Array is intergers
func = round( positionArray );
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_023_movingRightPattern_450degS_200Hz']; 
 save(str_x, 'func'); % variable must be named 'func'
 
%% ~600 Deg/s RIGHTWARD Motion either Gratting or bar:
PANELS_FRAME_RATE = 200; %Hz
POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels
numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up

PATTERN_SPEED_DEG_PER_SEC = 600;% deg/s  
DEGREES_PRE_PIXEL = 3; % deg %CHECK!  THIS IS APPROXIMATE!!

% Warning zero indexing for the position funciton!!
XDimMin = 0;% 
XDimMax = LEDdotsAcross;% 

positionArray = [];
switchingCounter = true;

pixelPerSecond = PATTERN_SPEED_DEG_PER_SEC / DEGREES_PRE_PIXEL; % corresponding LED pixel per second
%how many frames should be spent at each function position.
framesDwellPerPixel =  PANELS_FRAME_RATE / pixelPerSecond; % frames/pixel=( (frames/s) / (pixel/s) )


secondsToPassThruAllXPositions = LEDdotsAcross / pixelPerSecond;
framesToPassThruAllXPositions = secondsToPassThruAllXPositions * PANELS_FRAME_RATE;

% build position Array that passes from 0 to max LED position
positionArray = 0:  ( LEDdotsAcross / (framesToPassThruAllXPositions-1))  : LEDdotsAcross;

% round so position Array is intergers
func = round( positionArray );
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_024_movingRightPattern_600degS_200Hz']; 
 save(str_x, 'func'); % variable must be named 'func'
 

 
 %% Position function 25, pattern ON and OFF alternation/ intervleave
PATTERN_FLASH_DURATION = 0.5; % seconds
INTER_FLASH_DURATION = 4.5; % seconds
POSITION_FUNCTION_LENGTH = 10000; % this how many frames long these normally are... set by panels
PANELS_FRAME_RATE = 50; %Hz

% Warning zero indexing for the positino funciton!!
YDim1 = 0;% displays full pattern on the screen (dim = 1) if this is zero indexing now... which i think it should be for position functions
YDim2 = 1;% displays full dark screen (dim = 2), if this is zero indexing now... which i think it should be for position functions

positionArray = [];
switchingCounter = true;
while (length (positionArray) < POSITION_FUNCTION_LENGTH)

    if(switchingCounter)
        % build interflash period and add it to the position array
        currFlashSegment = YDim2 * ones(1, INTER_FLASH_DURATION * PANELS_FRAME_RATE);
        positionArray = [ positionArray,  currFlashSegment ];
        switchingCounter = false;
        
    else
        % build flash period and add it to the position array
        currFlashSegment = YDim1 * ones(1, PATTERN_FLASH_DURATION * PANELS_FRAME_RATE);
        positionArray = [ positionArray,   currFlashSegment ];
        switchingCounter = true;
    end
      
end

func = positionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_025_4500msOFF_500msON']; 
 save(str_x, 'func'); % variable must be named 'func'
 

 %% Position function 26, pattern ON and OFF alternation/ intervleave
PATTERN_FLASH_DURATION = 4; % seconds, 100ms
INTER_FLASH_DURATION = 4; % seconds
POSITION_FUNCTION_LENGTH = 10000; % this how many frames long these normally are... set by panels
PANELS_FRAME_RATE = 50; %Hz

% Warning zero indexing for the positino funciton!!
XDim1 = 0;% display current xpos function
XDim2 = 16;% displays xpos function 16 positions away from initial (~60deg) for typical bar pattern (3)

positionArray = [];
switchingCounter = true;
while (length (positionArray) < POSITION_FUNCTION_LENGTH)

    if(switchingCounter)
        % build interflash period and add it to the position array
        currFlashSegment = XDim2 * ones(1, INTER_FLASH_DURATION * PANELS_FRAME_RATE);
        positionArray = [ positionArray,  currFlashSegment ];
        
        switchingCounter = false;
        
    else
        
        % build flash period and add it to the position array
        currFlashSegment = XDim1 * ones(1, PATTERN_FLASH_DURATION * PANELS_FRAME_RATE);
        positionArray = [ positionArray,   currFlashSegment ];
        
        switchingCounter = true;
    end
end

func = positionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_026_4sxPos16_4sInitialX']; 
 save(str_x, 'func'); % variable must be named 'func'
 
  %% Position function 27, pattern ON and OFF alternation/ intervleave
PATTERN_FLASH_DURATION = 0.5; % seconds
INTER_FLASH_DURATION = 3.5; % seconds
POSITION_FUNCTION_LENGTH = 10000; % this how many frames long these normally are... set by panels
PANELS_FRAME_RATE = 50; %Hz

% Warning zero indexing for the position funciton!!
YDim1 = 0;% displays full pattern on the screen (dim = 1) if this is zero indexing now... which i think it should be for position functions
YDim2 = 1;% displays full dark screen (dim = 2), if this is zero indexing now... which i think it should be for position functions

positionArray = [];
switchingCounter = true;
while (length (positionArray) < POSITION_FUNCTION_LENGTH)

    if(switchingCounter)
        % build interflash period and add it to the position array
        currFlashSegment = YDim2 * ones(1, INTER_FLASH_DURATION * PANELS_FRAME_RATE);
        positionArray = [ positionArray,  currFlashSegment ];
        switchingCounter = false;
        
    else
        % build flash period and add it to the position array
        currFlashSegment = YDim1 * ones(1, PATTERN_FLASH_DURATION * PANELS_FRAME_RATE);
        positionArray = [ positionArray,   currFlashSegment ];
        switchingCounter = true;
    end
      
end

func = positionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_027_3500msOFF_500msON']; 
 save(str_x, 'func'); % variable must be named 'func
 
 %% Position function 28, x  postion values for barRandLoc stimulus
% build position function for the bar at random position stimulus
% build xpos 
PANELS_FRAME_RATE = 50; %Hz
FLASH_DURATION = 0.5; % seconds
BETWEEN_FLASH_DURATION = 0.5; % seconds

numOfPanelsIncludingFictive = 12;

numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up
LEDdotsVertically = numOfPanelsVertically * LEDdotsPerPanel;% 16 for yvette's current set up

xposMin = 9;%~33 deg from left edge of screen
xposMax = LEDdotsAcross - 2; % subtract 1 + 1 b/c controller add this to starting position which is default to 1 and so not to sample blank dim

NUM_POSITIONS_BETWEEN_BAR_LOCS = 8;
% build 2 arrays that together would sample every other location in a 16X56 matrix
xpossPosition = xposMin : NUM_POSITIONS_BETWEEN_BAR_LOCS : xposMax; 

xpositionOrder = [];

NUM_REPs = 10; % number of times this will cycle thru different random order of dot locations
for i = 1: NUM_REPs 
    
    currRandomOrder = randperm( numel(xpossPosition) );
    
    % add another round of rand values to x pos order
    xpositionOrder = [xpositionOrder xpossPosition( currRandomOrder ) ]; % without replacements
end

% build actual positionFunction
xpositionFunction = [];

% last position of the final array in this pattern
BLANK_DIM_X = (numOfPanelsIncludingFictive * LEDdotsPerPanel) - 1;% subtract 1 b/c controller add this to starting position which is default to 1.

for j = 1: length( xpositionOrder )
    barPeriod_X = xpositionOrder(j)* ones(1, FLASH_DURATION * PANELS_FRAME_RATE );   
    
    blankPeriod_X = BLANK_DIM_X * ones(1, BETWEEN_FLASH_DURATION * PANELS_FRAME_RATE )   ; % 
    
    xpositionFunction = [xpositionFunction barPeriod_X blankPeriod_X];
end 

func = xpositionFunction;

%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_028_8barRandLoc_Xpos']; 
 save(str_x, 'func'); % variable must be named 'func'
 
 
  %% Position function 29, pattern ON and OFF alternation/ intervleave
PATTERN_FLASH_DURATION = 0.30; % seconds
INTER_FLASH_DURATION = 0.30; % seconds
POSITION_FUNCTION_LENGTH = 10000; % this how many frames long these normally are... set by panels
PANELS_FRAME_RATE = 50; %Hz

% Warning zero indexing for the positino funciton!!
YDim1 = 0;% displays full pattern on the screen (dim = 1) if this is zero indexing now... which i think it should be for position functions
YDim2 = 1;% displays full dark screen (dim = 2), if this is zero indexing now... which i think it should be for position functions

positionArray = [];
switchingCounter = true;
while (length (positionArray) < POSITION_FUNCTION_LENGTH)

    if(switchingCounter)
        % build interflash period and add it to the position array
        currFlashSegment = YDim2 * ones(1, INTER_FLASH_DURATION * PANELS_FRAME_RATE);
        positionArray = [ positionArray,  currFlashSegment ];
        switchingCounter = false;
        
    else
        % build flash period and add it to the position array
        currFlashSegment = YDim1 * ones(1, PATTERN_FLASH_DURATION * PANELS_FRAME_RATE);
        positionArray = [ positionArray,   currFlashSegment ];
        switchingCounter = true;
    end
      
end

func = positionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_029_300msOFF_300msON']; 
 save(str_x, 'func'); % variable must be named 'func'
 
 %% Position function 30, Static array for when you don't want the other channel to move

PANELS_FRAME_RATE = 50; %Hz

POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels


positionArray = ones(1, POSITION_FUNCTION_LENGTH);

func = positionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_030_Static1']; 
 save(str_x, 'func'); % variable must be named 'func'
 
 
%% Position function 31, pattern ON (0- 61 secs) then OFF(61-250s) then ON again (250-480) 
% to be used with pattern 3
PANELS_FRAME_RATE = 5; %Hz
OFF_start_sec = 61; % seconds
OFF_start_frame = PANELS_FRAME_RATE*OFF_start_sec;
OFF_end_sec = 250; % seconds
OFF_end_frame = PANELS_FRAME_RATE*OFF_end_sec;


duration = 480; %seconds
POSITION_FUNCTION_LENGTH = duration*PANELS_FRAME_RATE; % this how many frames long these normally are... set by panels

% Warning zero indexing for the position funciton!!
YDim1 = 0;% displays full pattern on the screen (dim = 1) if this is zero indexing now... which i think it should be for position functions
YDim2 = 1;% displays full dark screen (dim = 2), if this is zero indexing now... which i think it should be for position functions

positionArray = zeros(1, POSITION_FUNCTION_LENGTH);
% add the segment where the panels should be "OFF" using pattern 3
positionArray(1, OFF_start_frame:OFF_end_frame) = 1;

func = positionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_031_61sON_189sOFF_230sON']; 
 save(str_x, 'func'); % variable must be named 'func' 
 
 %% Position function 32, pattern OFF(0-240s) then ON again (240-480) 
% to be used with pattern 3
PANELS_FRAME_RATE = 5; %Hz
ON_start_sec = 240; % seconds
ON_start_frame = PANELS_FRAME_RATE*ON_start_sec;

duration = 480; %seconds
POSITION_FUNCTION_LENGTH = duration*PANELS_FRAME_RATE; % this how many frames long these normally are... set by panels

% Warning zero indexing for the position funciton!!
%0 displays full pattern on the screen (dim = 1) if this is zero indexing now... which i think it should be for position functions
%1 displays full dark screen (dim = 2), if this is zero indexing now... which i think it should be for position functions

positionArray = ones(1, POSITION_FUNCTION_LENGTH);
% add the segment where the panels should be "ON" using pattern 3
positionArray(1, ON_start_frame:end) = 0;

func = positionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_032_240sOFF_240sON']; 
 save(str_x, 'func'); % variable must be named 'func' 
 
 
%% Dot top to middle alternation ~15Deg/s RIGHTWARD Motion either Gratting or bar:
PANELS_FRAME_RATE = 50; %Hz
POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels
numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up

PATTERN_SPEED_DEG_PER_SEC = 15;% deg/s  
DEGREES_PRE_PIXEL = 3; % deg %CHECK!  THIS IS APPROXIMATE!!

% Warning zero indexing for the position funciton!!
XDimMin = 0;% 
XDimMax = LEDdotsAcross;% 

positionArray = [];
switchingCounter = true;

pixelPerSecond = PATTERN_SPEED_DEG_PER_SEC / DEGREES_PRE_PIXEL; % corresponding LED pixel per second
%how many frames should be spent at each function position.
framesDwellPerPixel =  PANELS_FRAME_RATE / pixelPerSecond; % frames/pixel=( (frames/s) / (pixel/s) )

currFrameCounter = XDimMin;
while (length (positionArray) < POSITION_FUNCTION_LENGTH) && (currFrameCounter <= XDimMax)
    
    addToArray = currFrameCounter * ones( 1,  framesDwellPerPixel );

    positionArray = [positionArray addToArray ];

    currFrameCounter = currFrameCounter + 1;     
end

YDimTop = 0;
YDimBottom = 8;

YPositionArray = [ YDimTop*ones( 1, length(positionArray))  YDimBottom*ones( 1, length(positionArray)) ];
func = YPositionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_033_topToMiddleElevationOnBarSwing_15degS']; 
 save(str_x, 'func'); % variable must be named 'func'
 
%% Dot top to bottom alternation ~15Deg/s RIGHTWARD Motion either Gratting or bar:
PANELS_FRAME_RATE = 50; %Hz
POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels
numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up

PATTERN_SPEED_DEG_PER_SEC = 15;% deg/s  
DEGREES_PRE_PIXEL = 3; % deg %CHECK!  THIS IS APPROXIMATE!!

% Warning zero indexing for the position funciton!!
XDimMin = 0;% 
XDimMax = LEDdotsAcross;% 

positionArray = [];
switchingCounter = true;

pixelPerSecond = PATTERN_SPEED_DEG_PER_SEC / DEGREES_PRE_PIXEL; % corresponding LED pixel per second
%how many frames should be spent at each function position.
framesDwellPerPixel =  PANELS_FRAME_RATE / pixelPerSecond; % frames/pixel=( (frames/s) / (pixel/s) )

currFrameCounter = XDimMin;
while (length (positionArray) < POSITION_FUNCTION_LENGTH) && (currFrameCounter <= XDimMax)
    
    addToArray = currFrameCounter * ones( 1,  framesDwellPerPixel );

    positionArray = [positionArray addToArray ];

    currFrameCounter = currFrameCounter + 1;     
end

YDimTop = 0;
YDimBottom = 14;

YPositionArray = [ YDimTop*ones( 1, length(positionArray))  YDimBottom*ones( 1, length(positionArray)) ];
func = YPositionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_034_topToBottomElevationOnBarSwing_15degS']; 
 save(str_x, 'func'); % variable must be named 'func'
 
%%  Interleaved moving bar stimulus 15 DEg/s   2 swings rightward then 2 swings leftward
PANELS_FRAME_RATE = 50; %Hz
POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels
numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 96 for yvette's set up including fictive panels

PATTERN_SPEED_DEG_PER_SEC = 15;% deg/s  
DEGREES_PRE_PIXEL = 3; % deg THIS IS APPROXIMATE!!

% Warning zero indexing for the position funciton!!
XDimMin = 0;% 
XDimMax = LEDdotsAcross;% 

rightwardPositionArray = [];
leftwardPositionArray = [];

pixelPerSecond = PATTERN_SPEED_DEG_PER_SEC / DEGREES_PRE_PIXEL; % corresponding LED pixel per second
%how many frames should be spent at each function position.
framesDwellPerPixel =  PANELS_FRAME_RATE / pixelPerSecond; % frames/pixel=( (frames/s) / (pixel/s) )

%Build Rightward segement of array:
currFrameCounter = XDimMin;
while (length (rightwardPositionArray) < POSITION_FUNCTION_LENGTH) && (currFrameCounter <= XDimMax)
    
    addToArray = currFrameCounter * ones( 1,  framesDwellPerPixel );

    rightwardPositionArray = [rightwardPositionArray addToArray ];
    
    currFrameCounter = currFrameCounter + 1;     
end

%Build leftward segement of array:
currFrameCounter = XDimMax;
while (length (leftwardPositionArray) < POSITION_FUNCTION_LENGTH) && (currFrameCounter >= XDimMin)
    
    addToArray = currFrameCounter * ones( 1,  framesDwellPerPixel );

    leftwardPositionArray = [leftwardPositionArray addToArray ];
    
    currFrameCounter = currFrameCounter - 1;  
end

NUM_TIMES_TO_REPEAT_GRATING_ROTAION = 2;
func = [ repmat( rightwardPositionArray , 1, NUM_TIMES_TO_REPEAT_GRATING_ROTAION)  repmat( leftwardPositionArray , 1, NUM_TIMES_TO_REPEAT_GRATING_ROTAION) ];

%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_035_moving2Right2Left_15degS']; 
 save(str_x, 'func'); % variable must be named 'func'
 
%% Dot top to bottom alternation every 2 bar swings... ~15Deg/s bar swings
PANELS_FRAME_RATE = 50; %Hz
POSITION_FUNCTION_LENGTH = 1000; % this how many frames long these normally are... set by panels
numOfPanelsAcross = 9;% 7 panels across
numOfPanelsVertically = 2;%
LEDdotsPerPanel = 8; % this shouldn't change!  LEDs are always 8 dots in x and y. 

LEDdotsAcross = numOfPanelsAcross * LEDdotsPerPanel; % 56 for yvette's set up

PATTERN_SPEED_DEG_PER_SEC = 15;% deg/s  
DEGREES_PRE_PIXEL = 3; % deg %CHECK!  THIS IS APPROXIMATE!!

% Warning zero indexing for the position funciton!!
XDimMin = 0;% 
XDimMax = LEDdotsAcross;% 

positionArray = [];
switchingCounter = true;

pixelPerSecond = PATTERN_SPEED_DEG_PER_SEC / DEGREES_PRE_PIXEL; % corresponding LED pixel per second
%how many frames should be spent at each function position.
framesDwellPerPixel =  PANELS_FRAME_RATE / pixelPerSecond; % frames/pixel=( (frames/s) / (pixel/s) )

currFrameCounter = XDimMin;
while (length (positionArray) < POSITION_FUNCTION_LENGTH) && (currFrameCounter <= XDimMax)
    
    addToArray = currFrameCounter * ones( 1,  framesDwellPerPixel );

    positionArray = [positionArray addToArray ];

    currFrameCounter = currFrameCounter + 1;     
end

YDimTop = 0;
YDimBottom = 14;

YPositionArray = [ YDimTop*ones( 1, length(positionArray)) YDimTop*ones( 1, length(positionArray))...
    YDimBottom*ones( 1, length(positionArray)) YDimBottom*ones( 1, length(positionArray)) ];
func = YPositionArray;
%% SAVE position function place to be put on the SD card:
% place to save patterns to be put on the SD card:
 directory_name = 'C:\Users\Wilson\Documents\GitHub\panels-patternsAndFunctions_YEF\functions\';
 str_x = [directory_name '\position_function_036_topToBottom2BarSwings_15degS']; 
 save(str_x, 'func'); % variable must be named 'func'