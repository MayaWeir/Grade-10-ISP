%Maya Weir
%May 19, 2018
%Mr. Rosen
%This program will allow the user to play the game Who Wants To Be A Millionaire

%set screen up
import GUI
setscreen ("nocursor")
setscreen ("noecho")

%Forwarding Procedures
forward procedure playGame
forward procedure instructions
forward procedure goodbye
forward procedure mainMenu

%Variable Declarations
var mainWin := Window.Open ("position:550;400, graphics: 800;500") %sets up the window
var mainFont := Font.New ("Copperplate Gothic:12:bold") %font for questions
var key : string (1)
var playButton : int := GUI.CreateButton (365, 300, 0, "Play", playGame)
var instructionsButton : int := GUI.CreateButton (350, 250, 0, "Instructions", instructions)
var exitButton : int := GUI.CreateButton (365, 200, 0, "Exit", goodbye)

%adding music
process music 
Music.PlayFile ("commercial break.mp3")
end music
%Making the Game
procedure title
    var titleFont := Font.New ("Sarif:23")
    cls
    drawfillbox (0, 0, 800, 500, 104)
    Font.Draw ("Who Wants To Be A MILLIONAIRE", 160, 470, titleFont, white) %displays the words "Who Wants To Be A MILLIONAIRE across the top of the screen
end title

procedure pauseProgram
    Font.Draw ("Press any key to continue...", 300, 50, mainFont, white) %allows user to continue without a button
    getch (key)
end pauseProgram

%This explains how to play
body procedure instructions
    var mainMenuButton : int := GUI.CreateButton (590, 50, 0, "Main Menu", mainMenu)
    title
    colorback (104)
    color (white)
    locate (4,1)
    put "How To Play"..
    locate (6,1)
    put "This game will show 15 questions, increasing in difficulty each time. Each question is worth a"
    put "different amount of money, each one more than the previous, with the 15th question being worth"
    put "$1 million. If you get a question wrong you are automatically eliminated and lose all of the"
    put "money with the exception of 2 benchmarks at question 5 and 10. After passing those questions"
    put "you atomatically get at least that amount of money. If decide that you are happy with your prize"
    put "money and do not wish to keep playing, then press the 'Stand Down' button to leave. If you are"
    put "of an answer you may choose to use any of 3 help options. Each option may only be used once."
    put " "
    put "50/50"
    put "This option will eliminate 2 wrong answers"
    put " "
    put "Ask the audience"
    put "This option will tell you what percentage of the audience thinks each answer is correct"
    put "This is the box with 2 people in it"
    put " "
    put "Ask a friend"
    put "This option will tell you what your 'friend' thinks the answer is"
    put "This is the box with a phone in it"
    put " "
    put "*Note: You do not win any real money from playing this game*"
    GUI.Show (mainMenuButton)
end instructions

%This draws the main background for the game
procedure background
    var helpFont := Font.New ("Glegoo:26:bold") %font for the help boxes
    var prizeFont := Font.New ("Questrial:11:bold") %font used for money amounts
    title
    %Question / Answer Boxes
    Draw.ThickLine (0, 50, 800, 50, 3, 43) % horizontal line between answers
    Draw.ThickLine (400, 0, 400, 100, 3, 43) %vertical line between answers
    Draw.ThickLine (0, 100, 800, 100, 3, 43) %line over top of answers
    Draw.ThickLine (0, 140, 200, 140, 3, 43) %question box left
    Draw.ThickLine (600, 140, 800, 140, 3, 43) %question box right
    Draw.ThickLine (250, 180, 550, 180, 3, 43) %question box top
    Draw.ThickLine (200, 140, 250, 180, 3, 43) %question box left top diagonal
    Draw.ThickLine (200, 140, 250, 100, 3, 43) %question box left bottom diagonal
    Draw.ThickLine (550, 180, 600, 140, 3, 43) %question box right top diagonal
    Draw.ThickLine (550, 100, 600, 140, 3, 43) %question box right bottom diagonal
    %Help Options
    drawfillbox (690, 400, 750, 460, 43) %Ask a friend box
    drawfillarc (725, 430, 15, 25, 270, 90, white)
    drawfillbox (715, 440, 725, 455, white)
    drawfillbox (715, 405, 725, 420, white)
    drawfillbox (600, 400, 660, 460, 43) %Ask the audience box
    drawfillarc (615, 400, 15, 30, 0, 180, white)
    drawfilloval (615, 438, 12, 12, white)
    drawfillarc (645, 400, 15, 30, 0, 180, white)
    drawfilloval (645, 438, 12, 12, white)
    drawfillbox (510, 400, 570, 460, 43) %50/50 box
    Font.Draw ("50/", 515, 435, helpFont, white)
    Font.Draw ("50", 515, 405, helpFont, white)
    drawfillbox (530, 310, 730, 370, 43) %stand down box
    Font.Draw ("Stand Down", 530, 330, helpFont, white)
    %Prize Amounts
    Font.Draw ("15 -  $1 MILLION", 15, 480, prizeFont, white)
    Font.Draw ("14 -  $500,000", 15, 460, prizeFont, 43)
    Font.Draw ("13 -  $250,000", 15, 440, prizeFont, 43)
    Font.Draw ("12 -  $100,000", 15, 420, prizeFont, 43)
    Font.Draw ("11 -  $75,000", 15, 400, prizeFont, 43)
    Font.Draw ("10 -  $50,000", 15, 380, prizeFont, white)
    Font.Draw ("  9 -  $25,000", 15, 360, prizeFont, 43)
    Font.Draw ("  8 -  $15,000", 15, 340, prizeFont, 43)
    Font.Draw ("  7 -  $10,000", 15, 320, prizeFont, 43)
    Font.Draw ("  6 -  $7,500", 15, 300, prizeFont, 43)
    Font.Draw ("  5 -  $5,000", 15, 280, prizeFont, white)
    Font.Draw ("  4 -  $2,000", 15, 260, prizeFont, 43)
    Font.Draw ("  3 -  $1,000", 15, 240, prizeFont, 43)
    Font.Draw ("  2 -  $500", 15, 220, prizeFont, 43)
    Font.Draw ("  1 -  $100", 15, 200, prizeFont, 43)
    %answers letters
    Font.Draw ("A", 10, 65, helpFont, 43) %a
    Font.Draw ("B", 410, 65, helpFont, 43) %b
    Font.Draw ("C", 10, 15, helpFont, 43) %c
    Font.Draw ("D", 410, 15, helpFont, 43) %d
end background

%This will display a message if the user guesses incorrect
procedure failMessage
    title
    Font.Draw ("Sorry you didn't get it. Thanks for playing!", 270, 250, mainFont, white)
    pauseProgram
end failMessage

%This will display a message if the user wins
procedure congratsMessage
    title
    var congratsFont := Font.New ("Arial:30:bold")
    var mainMenuButton := GUI.CreateButton (365, 50, 0, "Main Menu", mainMenu)
    Font.Draw ("CONGRATULATIONS!!!", 180, 350, congratsFont, yellow)
    Font.Draw ("You won the game! Thanks for playing!", 50, 190, congratsFont, white)
    GUI.Show (mainMenuButton)
end congratsMessage
congratsMessage

%This will display a message if the user presses stand put
procedure standDown
    title
    var quitFont := Font.New ("family:20")
    Font.Draw ("Thanks for playing!", 300, 300, quitFont, white)
    pauseProgram
    mainMenu
end standDown


%Playing the game
body procedure playGame
    %Variables
    var mousex, mousey : int %mouse coordinates
    var button : int
    var question : int := 1 %question number
    var correctFont := Font.New ("Helvetica:20") %font for correct answer
    var answers : array 1 .. 4 of string := init ("A", "B", "C", "D") %4 answers
    var pointr : int := 4
    var toSwitch : int
    var correctAnswers : string %correct answer
    var correctAnswerLocation : int
    var askFriendRand : int     % randomizes ask a friend
    var askFriendButton : int := 0
    var audA, audB, audC, audD : int %audience guesses
    var audienceHelpButton : int := 0
    background
    %Question 1 - Level 1
    if question = 1 then
	answers (1) := "British Columbia"
	answers (2) := "Prince Edward Island"
	answers (3) := "Manitoba"
	answers (4) := "Newfoundland and Labrador"
	correctAnswers := "Newfoundland and Labrador"
	randint (askFriendRand, 1, 6) %randomizing the ask a friend
	randint (audA, 40, 90)
	randint (audB, 0, 100 - audA)
	randint (audC, 0, (100 - audA) - audB)
	randint (audD, 0, ((100 - audA) - audB) - audC)
	for i : 1 .. 4
	    var stringToSwitch : string := ""
	    randint (toSwitch, 1, pointr)
	    stringToSwitch := answers (toSwitch)
	    answers (toSwitch) := answers (pointr)
	    answers (pointr) := stringToSwitch
	    pointr := pointr - 1
	end for
	for i : 1 .. 4
	    if answers (i) = correctAnswers then
		correctAnswerLocation := i
	    end if
	end for
	colourback (104)
	colour (white)
	locatexy (250, 150)
	put "Which Canadian province has its own" .. %writes question
	locatexy (350, 120)
	put "time zone?" .. %writes question
	locatexy (50, 70)
	put answers (1) ..
	locatexy (450, 70)
	put answers (2) ..
	locatexy (50, 20)
	put answers (3) ..
	locatexy (450, 20)
	put answers (4) ..
    end if
    loop
	mousewhere (mousex, mousey, button)
	%         if (mousex > 510 and mousex < 570) and (mousey > 400 and mousey < 460) and button = 1 then %50/50
	%
	% end if
	if (mousex > 600 and mousex < 660) and (mousey > 400 and mousey < 460) and button = 1 then %ask audience
	    locatexy (230, 400)
	    put audA, "% says ", answers (1) ..
	    locatexy (230, 380)
	    put audB, "% says ", answers (2) ..
	    locatexy (230, 370)
	    put audC, "% says ", answers (3) ..
	    locatexy (230, 350)
	    put audD, "% says ", answers (4) ..
	    delay (1000)
	    Draw.ThickLine (600, 400, 660, 460, 3, red)
	    Draw.ThickLine (600, 460, 660, 400, 3, red)
	    audienceHelpButton := 1
	end if
	if (mousex > 690 and mousex < 750) and (mousey > 400 and mousey < 460) and button = 1 then     %ask a friend
	    Font.Draw ("Your friend says:", 400, 250, mainFont, white)
	    delay (1000)
	    if askFriendRand = 4 then %wrong
		locatexy (580, 250)
		put answers (1) ..
	    elsif askFriendRand = 5 then %wrong
		locatexy (580, 250)
		put answers (2) ..
	    elsif askFriendRand = 6 then %wrong
		locatexy (580, 250)
		put answers (3) ..
	    else %random 1,2,3 are right
		locatexy (580, 250)
		put correctAnswers ..
	    end if
	    delay (1000)
	    Draw.ThickLine (690, 400, 750, 460, 3, red)
	    Draw.ThickLine (690, 460, 750, 400, 3, red)
	    askFriendButton := 1
	end if
	if (mousex > 530 and mousex < 730) and (mousey > 310 and mousey < 370) and button = 1 then %stand down
	    standDown
	elsif (mousex > 0 and mousex < 400) and (mousey > 50 and mousey < 100) and button = 1 then     %answer a
	    if correctAnswerLocation = 1 then     % if answer a is right
		delay (1000)
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 200, 20, 215, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer a is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 50 and mousey < 100) and button = 1 then     %answer b
	    if correctAnswerLocation = 2 then     %if answer b is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 200, 20, 215, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer b is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 0 and mousex < 400) and (mousey > 0 and mousey < 50) and button = 1 then     %answer c
	    if correctAnswerLocation = 3 then     %if answer c is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 200, 20, 215, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer c is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 0 and mousey < 50) and button = 1 then     %answer d
	    if correctAnswerLocation = 4 then     %if answer d is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 200, 20, 215, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer d is wrong
		failMessage
		mainMenu
	    end if
	end if
    end loop
    delay (500)

    %Question 2 - Level 1-----------------------------------------------------
    if question = 2 then
	answers (1) := "B"
	answers (2) := "C"
	answers (3) := "D"
	answers (4) := "A"
	correctAnswers := "A"
	pointr := 4     %redeclare pointr
	drawfillbox (250, 102, 550, 178, 104)     %erases prev question
	drawfillbox (43, 52, 395, 98, 104)     %erases prev answer a
	drawfillbox (443, 52, 800, 98, 104)     %erases prev answer b
	drawfillbox (43, 0, 395, 48, 104)     %erases prev answer c
	drawfillbox (443, 0, 800, 48, 104)     %erases prev answer d
	drawfillbox (200, 200, 800, 270, 104) %erases correct
	drawfillbox (390, 220, 800, 300, 104) %erases ask a friend
	drawfillbox (200, 300, 500, 400, 104) %erases ask the audience
	var stringToSwitch : string := ""
	randint (toSwitch, 1, pointr)
	randint (audA, 40, 90)
	randint (audB, 0, 100 - audA)
	randint (audC, 0, (100 - audA) - audB)
	randint (audD, 0, ((100 - audA) - audB) - audC)
	if answers (toSwitch) = correctAnswers then
	    correctAnswerLocation := toSwitch
	end if
	stringToSwitch := answers (toSwitch)
	answers (toSwitch) := answers (pointr)
	answers (pointr) := stringToSwitch
	pointr := pointr - 1
	for i : 1 .. 4
	    if answers (i) = correctAnswers then
		correctAnswerLocation := i
	    end if
	end for
	colourback (104)
	colour (white)
	locatexy (270, 150)
	put "On a standard piano, what is the" .. %writes question
	locatexy (370, 120)
	put "lowest note?" .. %writes question
	locatexy (50, 70)
	put answers (1) ..
	locatexy (450, 70)
	put answers (2) ..
	locatexy (50, 20)
	put answers (3) ..
	locatexy (450, 20)
	put answers (4) ..
    end if
    loop
	mousewhere (mousex, mousey, button)
	if (mousex > 600 and mousex < 660) and (mousey > 400 and mousey < 460) and button = 1 and audienceHelpButton = 0 then %ask audience
	    locatexy (230, 400)
	    put audA, "% says ", answers (1) ..
	    locatexy (230, 380)
	    put audB, "% says ", answers (2) ..
	    locatexy (230, 370)
	    put audC, "% says ", answers (3) ..
	    locatexy (230, 350)
	    put audD, "% says ", answers (4) ..
	    delay (1000)
	    Draw.ThickLine (600, 400, 660, 460, 3, red)
	    Draw.ThickLine (600, 460, 660, 400, 3, red)
	    audienceHelpButton := 1
	end if
	if (mousex > 690 and mousex < 750) and (mousey > 400 and mousey < 460) and button = 1 and askFriendButton = 0 then             %ask a friend
	    Font.Draw ("Your friend says:", 400, 250, mainFont, white)
	    delay (1000)
	    if askFriendRand = 4 then %wrong
		locatexy (580, 250)
		put answers (1) ..
	    elsif askFriendRand = 5 then %wrong
		locatexy (580, 250)
		put answers (2) ..
	    elsif askFriendRand = 6 then %wrong
		locatexy (580, 250)
		put answers (3) ..
	    else %random 1,2,3 are right
		locatexy (580, 250)
		put correctAnswers ..
	    end if
	    delay (1000)
	    Draw.ThickLine (690, 400, 750, 460, 3, red)
	    Draw.ThickLine (690, 460, 750, 400, 3, red)
	    askFriendButton := 1
	end if
	if (mousex > 530 and mousex < 730) and (mousey > 310 and mousey < 370) and button = 1 then %stand down
	    standDown
	elsif (mousex > 0 and mousex < 400) and (mousey > 50 and mousey < 100) and button = 1 then     %answer a
	    if correctAnswerLocation = 1 then     % if answer a is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 220, 20, 235, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer a is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 50 and mousey < 100) and button = 1 then     %answer b
	    if correctAnswerLocation = 2 then     %if answer b is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 220, 20, 235, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer b is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 0 and mousex < 400) and (mousey > 0 and mousey < 50) and button = 1 then     %answer c
	    if correctAnswerLocation = 3 then     %if answer c is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 220, 20, 235, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer c is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 0 and mousey < 50) and button = 1 then     %answer d
	    if correctAnswerLocation = 4 then     %if answer d is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 220, 20, 235, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer d is wrong
		failMessage
		mainMenu
	    end if
	end if
    end loop
    delay (500)

    %Question 3 - Level 1--------------------------------------------------
    if question = 3 then
	answers (1) := "Cancer"
	answers (2) := "Aries"
	answers (3) := "Virgo"
	answers (4) := "Libra"
	correctAnswers := "Libra"
	pointr := 4     %redeclare pointr
	drawfillbox (250, 102, 550, 178, 104)     %erases prev question
	drawfillbox (43, 52, 395, 98, 104)     %erases prev answer a
	drawfillbox (443, 52, 800, 98, 104)     %erases prev answer b
	drawfillbox (43, 0, 395, 48, 104)     %erases prev answer c
	drawfillbox (443, 0, 800, 48, 104)     %erases prev answer d
	drawfillbox (200, 200, 800, 270, 104)    %erases correct
	drawfillbox (390, 220, 800, 300, 104) %erases ask a friend
	drawfillbox (200, 300, 500, 400, 104)  %erases ask the audience
	var stringToSwitch : string := ""
	randint (toSwitch, 1, pointr)
	randint (audA, 40, 90)
	randint (audB, 0, 100 - audA)
	randint (audC, 0, (100 - audA) - audB)
	randint (audD, 0, ((100 - audA) - audB) - audC)
	if answers (toSwitch) = correctAnswers then
	    correctAnswerLocation := toSwitch
	end if
	stringToSwitch := answers (toSwitch)
	answers (toSwitch) := answers (pointr)
	answers (pointr) := stringToSwitch
	pointr := pointr - 1
	for i : 1 .. 4
	    if answers (i) = correctAnswers then
		correctAnswerLocation := i
	    end if
	end for
	colourback (104)
	colour (white)
	locatexy (250, 150)
	put "What sign of the zodiac is represented" .. %writes question
	locatexy (380, 120)
	put "by a scale?" .. %writes question
	locatexy (50, 70)
	put answers (1) ..
	locatexy (450, 70)
	put answers (2) ..
	locatexy (50, 20)
	put answers (3) ..
	locatexy (450, 20)
	put answers (4) ..
    end if
    loop
	mousewhere (mousex, mousey, button)
	if (mousex > 600 and mousex < 660) and (mousey > 400 and mousey < 460) and button = 1 and audienceHelpButton = 0 then  %ask audience
	    locatexy (230, 400)
	    put audA, "% says ", answers (1) ..
	    locatexy (230, 380)
	    put audB, "% says ", answers (2) ..
	    locatexy (230, 370)
	    put audC, "% says ", answers (3) ..
	    locatexy (230, 350)
	    put audD, "% says ", answers (4) ..
	    delay (1000)
	    Draw.ThickLine (600, 400, 660, 460, 3, red)
	    Draw.ThickLine (600, 460, 660, 400, 3, red)
	    audienceHelpButton := 1
	end if
	if (mousex > 690 and mousex < 750) and (mousey > 400 and mousey < 460) and button = 1 and askFriendButton = 0 then              %ask a friend
	    Font.Draw ("Your friend says:", 400, 250, mainFont, white)
	    delay (1000)
	    if askFriendRand = 4 then %wrong
		locatexy (580, 250)
		put answers (1) ..
	    elsif askFriendRand = 5 then %wrong
		locatexy (580, 250)
		put answers (2) ..
	    elsif askFriendRand = 6 then %wrong
		locatexy (580, 250)
		put answers (3) ..
	    else %random 1,2,3 are right
		locatexy (580, 250)
		put correctAnswers ..
	    end if
	    delay (1000)
	    Draw.ThickLine (690, 400, 750, 460, 3, red)
	    Draw.ThickLine (690, 460, 750, 400, 3, red)
	    askFriendButton := 1
	end if
	if (mousex > 530 and mousex < 730) and (mousey > 310 and mousey < 370) and button = 1 then %stand down
	    standDown
	elsif (mousex > 0 and mousex < 400) and (mousey > 50 and mousey < 100) and button = 1 then     %answer a
	    if correctAnswerLocation = 1 then     % if answer a is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 240, 20, 255, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer a is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 50 and mousey < 100) and button = 1 then     %answer b
	    if correctAnswerLocation = 2 then     %if answer b is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 240, 20, 255, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer b is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 0 and mousex < 400) and (mousey > 0 and mousey < 50) and button = 1 then     %answer c
	    if correctAnswerLocation = 3 then     %if answer c is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 240, 20, 255, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer c is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 0 and mousey < 50) and button = 1 then     %answer d
	    if correctAnswerLocation = 4 then     %if answer d is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 240, 20, 255, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer d is wrong
		failMessage
		mainMenu
	    end if
	end if
    end loop
    delay (500)

    %Question 4 - Level 1-------------------------------------------------------
    if question = 4 then
	answers (1) := "Swan"
	answers (2) := "Stork"
	answers (3) := "Condor"
	answers (4) := "Albatross"
	correctAnswers := "Albatross"
	pointr := 4     %redeclare pointr
	drawfillbox (250, 102, 550, 178, 104)     %erases prev question
	drawfillbox (43, 52, 395, 98, 104)     %erases prev answer a
	drawfillbox (443, 52, 800, 98, 104)     %erases prev answer b
	drawfillbox (43, 0, 395, 48, 104)     %erases prev answer c
	drawfillbox (443, 0, 800, 48, 104)     %erases prev answer d
	drawfillbox (200, 200, 800, 270, 104)    %erases correct
	drawfillbox (390, 220, 800, 300, 104) %erases ask a friend
	drawfillbox (200, 300, 500, 400, 104)  %erases ask the audience
	var stringToSwitch : string := ""
	randint (toSwitch, 1, pointr)
	randint (audA, 40, 90)
	randint (audB, 0, 100 - audA)
	randint (audC, 0, (100 - audA) - audB)
	randint (audD, 0, ((100 - audA) - audB) - audC)
	if answers (toSwitch) = correctAnswers then
	    correctAnswerLocation := toSwitch
	end if
	stringToSwitch := answers (toSwitch)
	answers (toSwitch) := answers (pointr)
	answers (pointr) := stringToSwitch
	pointr := pointr - 1
	for i : 1 .. 4
	    if answers (i) = correctAnswers then
		correctAnswerLocation := i
	    end if
	end for
	colourback (104)
	colour (white)
	locatexy (250, 150)
	put "What existing bird has the largest" .. %writes question
	locatexy (380, 120)
	put "wingspan?" .. %writes question
	locatexy (50, 70)
	put answers (1) ..
	locatexy (450, 70)
	put answers (2) ..
	locatexy (50, 20)
	put answers (3) ..
	locatexy (450, 20)
	put answers (4) ..
    end if
    loop
	mousewhere (mousex, mousey, button)
	if (mousex > 600 and mousex < 660) and (mousey > 400 and mousey < 460) and button = 1 and audienceHelpButton = 0 then  %ask audience
	    locatexy (230, 400)
	    put audA, "% says ", answers (1) ..
	    locatexy (230, 380)
	    put audB, "% says ", answers (2) ..
	    locatexy (230, 370)
	    put audC, "% says ", answers (3) ..
	    locatexy (230, 350)
	    put audD, "% says ", answers (4) ..
	    delay (1000)
	    Draw.ThickLine (600, 400, 660, 460, 3, red)
	    Draw.ThickLine (600, 460, 660, 400, 3, red)
	    audienceHelpButton := 1
	end if
	if (mousex > 690 and mousex < 750) and (mousey > 400 and mousey < 460) and button = 1 and askFriendButton = 0 then              %ask a friend
	    Font.Draw ("Your friend says:", 400, 250, mainFont, white)
	    delay (1000)
	    if askFriendRand = 4 then %wrong
		locatexy (580, 250)
		put answers (1) ..
	    elsif askFriendRand = 5 then %wrong
		locatexy (580, 250)
		put answers (2) ..
	    elsif askFriendRand = 6 then %wrong
		locatexy (580, 250)
		put answers (3) ..
	    else %random 1,2,3 are right
		locatexy (580, 250)
		put correctAnswers ..
	    end if
	    delay (1000)
	    Draw.ThickLine (690, 400, 750, 460, 3, red)
	    Draw.ThickLine (690, 460, 750, 400, 3, red)
	    askFriendButton := 1
	end if
	if (mousex > 530 and mousex < 730) and (mousey > 310 and mousey < 370) and button = 1 then %stand down
	    standDown
	elsif (mousex > 0 and mousex < 400) and (mousey > 50 and mousey < 100) and button = 1 then     %answer a
	    if correctAnswerLocation = 1 then     % if answer a is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 260, 20, 275, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer a is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 50 and mousey < 100) and button = 1 then     %answer b
	    if correctAnswerLocation = 2 then     %if answer b is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 260, 20, 275, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer b is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 0 and mousex < 400) and (mousey > 0 and mousey < 50) and button = 1 then     %answer c
	    if correctAnswerLocation = 3 then     %if answer c is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 260, 20, 275, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer c is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 0 and mousey < 50) and button = 1 then     %answer d
	    if correctAnswerLocation = 4 then     %if answer d is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 260, 20, 275, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer d is wrong
		failMessage
		mainMenu
	    end if
	end if
    end loop
    delay (500)

    %Question 5 - Level 1---------------------------------------------------
    if question = 5 then
	answers (1) := "Dr. Seuss"
	answers (2) := "William Shakespeare"
	answers (3) := "J.R.R. Tolkien"
	answers (4) := "J.K. Rowling"
	correctAnswers := "J.K. Rowling"
	pointr := 4     %redeclare pointr
	drawfillbox (250, 102, 550, 178, 104)     %erases prev question
	drawfillbox (43, 52, 395, 98, 104)     %erases prev answer a
	drawfillbox (443, 52, 800, 98, 104)     %erases prev answer b
	drawfillbox (43, 0, 395, 48, 104)     %erases prev answer c
	drawfillbox (443, 0, 800, 48, 104)     %erases prev answer d
	drawfillbox (200, 200, 800, 270, 104)    %erases correct
	drawfillbox (390, 220, 800, 300, 104) %erases ask a friend
	drawfillbox (200, 300, 500, 400, 104)  %erases ask the audience
	var stringToSwitch : string := ""
	randint (toSwitch, 1, pointr)
	randint (audA, 40, 90)
	randint (audB, 0, 100 - audA)
	randint (audC, 0, (100 - audA) - audB)
	randint (audD, 0, ((100 - audA) - audB) - audC)
	if answers (toSwitch) = correctAnswers then
	    correctAnswerLocation := toSwitch
	end if
	stringToSwitch := answers (toSwitch)
	answers (toSwitch) := answers (pointr)
	answers (pointr) := stringToSwitch
	pointr := pointr - 1
	for i : 1 .. 4
	    if answers (i) = correctAnswers then
		correctAnswerLocation := i
	    end if
	end for
	colourback (104)
	colour (white)
	locatexy (250, 150)
	put "Who is the first person to become a" .. %writes question
	locatexy (260, 120)
	put "billionaire from writing books?" .. %writes question
	locatexy (50, 70)
	put answers (1) ..
	locatexy (450, 70)
	put answers (2) ..
	locatexy (50, 20)
	put answers (3) ..
	locatexy (450, 20)
	put answers (4) ..
    end if
    loop
	mousewhere (mousex, mousey, button)
	if (mousex > 600 and mousex < 660) and (mousey > 400 and mousey < 460) and button = 1 and audienceHelpButton = 0 then  %ask audience
	    locatexy (230, 400)
	    put audA, "% says ", answers (1) ..
	    locatexy (230, 380)
	    put audB, "% says ", answers (2) ..
	    locatexy (230, 370)
	    put audC, "% says ", answers (3) ..
	    locatexy (230, 350)
	    put audD, "% says ", answers (4) ..
	    delay (1000)
	    Draw.ThickLine (600, 400, 660, 460, 3, red)
	    Draw.ThickLine (600, 460, 660, 400, 3, red)
	    audienceHelpButton := 1
	end if
	if (mousex > 690 and mousex < 750) and (mousey > 400 and mousey < 460) and button = 1 and askFriendButton = 0 then              %ask a friend
	    Font.Draw ("Your friend says:", 400, 250, mainFont, white)
	    delay (1000)
	    if askFriendRand = 4 then %wrong
		locatexy (580, 250)
		put answers (1) ..
	    elsif askFriendRand = 5 then %wrong
		locatexy (580, 250)
		put answers (2) ..
	    elsif askFriendRand = 6 then %wrong
		locatexy (580, 250)
		put answers (3) ..
	    else %random 1,2,3 are right
		locatexy (580, 250)
		put correctAnswers ..
	    end if
	    delay (1000)
	    Draw.ThickLine (690, 400, 750, 460, 3, red)
	    Draw.ThickLine (690, 460, 750, 400, 3, red)
	    askFriendButton := 1
	end if
	if (mousex > 530 and mousex < 730) and (mousey > 310 and mousey < 370) and button = 1 then     %stand down
	    standDown
	elsif (mousex > 0 and mousex < 400) and (mousey > 50 and mousey < 100) and button = 1 then     %answer a
	    if correctAnswerLocation = 1 then     % if answer a is right
		Font.Draw ("CORRECT. You have reached the first benchmark!", 210, 210, correctFont, 43)
		Draw.FillStar (5, 280, 20, 295, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer a is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 50 and mousey < 100) and button = 1 then     %answer b
	    if correctAnswerLocation = 2 then     %if answer b is right
		Font.Draw ("CORRECT. You have reached the first benchmark!", 210, 210, correctFont, 43)
		Draw.FillStar (5, 280, 20, 295, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer b is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 0 and mousex < 400) and (mousey > 0 and mousey < 50) and button = 1 then     %answer c
	    if correctAnswerLocation = 3 then     %if answer c is right
		Font.Draw ("CORRECT. You have reached the first benchmark!", 210, 210, correctFont, 43)
		Draw.FillStar (5, 280, 20, 295, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer c is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 0 and mousey < 50) and button = 1 then     %answer d
	    if correctAnswerLocation = 4 then     %if answer d is right
		Font.Draw ("CORRECT. You have reached the first benchmark!", 210, 210, correctFont, 43)
		Draw.FillStar (5, 280, 20, 295, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer d is wrong
		failMessage
		mainMenu
	    end if
	end if
    end loop
    delay (500)

    %Question 6 - Level 1-----------------------------------------------------
    if question = 6 then
	answers (1) := "Monongahela River"
	answers (2) := "Ohio River"
	answers (3) := "Allegheny River"
	answers (4) := "Mississippi River"
	correctAnswers := "Mississippi River"
	pointr := 4     %redeclare pointr
	drawfillbox (250, 102, 550, 178, 104)     %erases prev question
	drawfillbox (43, 52, 395, 98, 104)     %erases prev answer a
	drawfillbox (443, 52, 800, 98, 104)     %erases prev answer b
	drawfillbox (43, 0, 395, 48, 104)     %erases prev answer c
	drawfillbox (443, 0, 800, 48, 104)     %erases prev answer d
	drawfillbox (200, 200, 800, 270, 104)    %erases correct
	drawfillbox (390, 220, 800, 300, 104) %erases ask a friend
	drawfillbox (200, 300, 500, 400, 104)  %erases ask the audience
	var stringToSwitch : string := ""
	randint (toSwitch, 1, pointr)
	randint (audA, 40, 90)
	randint (audB, 0, 100 - audA)
	randint (audC, 0, (100 - audA) - audB)
	randint (audD, 0, ((100 - audA) - audB) - audC)
	if answers (toSwitch) = correctAnswers then
	    correctAnswerLocation := toSwitch
	end if
	stringToSwitch := answers (toSwitch)
	answers (toSwitch) := answers (pointr)
	answers (pointr) := stringToSwitch
	pointr := pointr - 1
	for i : 1 .. 4
	    if answers (i) = correctAnswers then
		correctAnswerLocation := i
	    end if
	end for
	colourback (104)
	colour (white)
	locatexy (300, 150)
	put "Pittsburgh is famously at the " .. %writes question
	locatexy (250, 140)
	put "intersection of 3 rivers. Which of the" .. %writes question
	locatexy (300, 120)
	put "following is not included?" .. %writes question
	locatexy (50, 70)
	put answers (1) ..
	locatexy (450, 70)
	put answers (2) ..
	locatexy (50, 20)
	put answers (3) ..
	locatexy (450, 20)
	put answers (4) ..
    end if
    loop
	mousewhere (mousex, mousey, button)
	if (mousex > 600 and mousex < 660) and (mousey > 400 and mousey < 460) and button = 1 and audienceHelpButton = 0 then  %ask audience
	    locatexy (230, 400)
	    put audA, "% says ", answers (1) ..
	    locatexy (230, 380)
	    put audB, "% says ", answers (2) ..
	    locatexy (230, 370)
	    put audC, "% says ", answers (3) ..
	    locatexy (230, 350)
	    put audD, "% says ", answers (4) ..
	    delay (1000)
	    Draw.ThickLine (600, 400, 660, 460, 3, red)
	    Draw.ThickLine (600, 460, 660, 400, 3, red)
	    audienceHelpButton := 1
	end if
	if (mousex > 690 and mousex < 750) and (mousey > 400 and mousey < 460) and button = 1 and askFriendButton = 0 then              %ask a friend
	    Font.Draw ("Your friend says:", 400, 250, mainFont, white)
	    delay (1000)
	    if askFriendRand = 4 then %wrong
		locatexy (580, 250)
		put answers (1) ..
	    elsif askFriendRand = 5 then %wrong
		locatexy (580, 250)
		put answers (2) ..
	    elsif askFriendRand = 6 then %wrong
		locatexy (580, 250)
		put answers (3) ..
	    else %random 1,2,3 are right
		locatexy (580, 250)
		put correctAnswers ..
	    end if
	    delay (1000)
	    Draw.ThickLine (690, 400, 750, 460, 3, red)
	    Draw.ThickLine (690, 460, 750, 400, 3, red)
	    askFriendButton := 1
	end if
	if (mousex > 530 and mousex < 730) and (mousey > 310 and mousey < 370) and button = 1 then     %stand down
	    standDown
	elsif (mousex > 0 and mousex < 400) and (mousey > 50 and mousey < 100) and button = 1 then     %answer a
	    if correctAnswerLocation = 1 then     % if answer a is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 300, 20, 315, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer a is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 50 and mousey < 100) and button = 1 then     %answer b
	    if correctAnswerLocation = 2 then     %if answer b is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 300, 20, 315, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer b is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 0 and mousex < 400) and (mousey > 0 and mousey < 50) and button = 1 then     %answer c
	    if correctAnswerLocation = 3 then     %if answer c is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 300, 20, 315, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer c is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 0 and mousey < 50) and button = 1 then     %answer d
	    if correctAnswerLocation = 4 then     %if answer d is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 300, 20, 315, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer d is wrong
		failMessage
		mainMenu
	    end if
	end if
    end loop
    delay (500)

    %Question 7 - Level 1--------------------------------------------------
    if question = 7 then
	answers (1) := "Zebra"
	answers (2) := "Zero"
	answers (3) := "Zipper"
	answers (4) := "Zulu"
	correctAnswers := "Zulu"
	pointr := 4     %redeclare pointr
	drawfillbox (250, 102, 550, 178, 104)     %erases prev question
	drawfillbox (43, 52, 395, 98, 104)     %erases prev answer a
	drawfillbox (443, 52, 800, 98, 104)     %erases prev answer b
	drawfillbox (43, 0, 395, 48, 104)     %erases prev answer c
	drawfillbox (443, 0, 800, 48, 104)     %erases prev answer d
	drawfillbox (200, 200, 800, 270, 104)    %erases correct
	drawfillbox (390, 220, 800, 300, 104) %erases ask a friend
	drawfillbox (200, 300, 500, 400, 104)  %erases ask the audience
	var stringToSwitch : string := ""
	randint (toSwitch, 1, pointr)
	randint (audA, 40, 90)
	randint (audB, 0, 100 - audA)
	randint (audC, 0, (100 - audA) - audB)
	randint (audD, 0, ((100 - audA) - audB) - audC)
	if answers (toSwitch) = correctAnswers then
	    correctAnswerLocation := toSwitch
	end if
	stringToSwitch := answers (toSwitch)
	answers (toSwitch) := answers (pointr)
	answers (pointr) := stringToSwitch
	pointr := pointr - 1
	for i : 1 .. 4
	    if answers (i) = correctAnswers then
		correctAnswerLocation := i
	    end if
	end for
	colourback (104)
	colour (white)
	locatexy (250, 150)
	put "In the NATO Phonetic Alphabet, which" .. %writes question
	locatexy (295, 120)
	put "word represents the letter Z?" .. %writes question
	locatexy (50, 70)
	put answers (1) ..
	locatexy (450, 70)
	put answers (2) ..
	locatexy (50, 20)
	put answers (3) ..
	locatexy (450, 20)
	put answers (4) ..
    end if
    loop
	mousewhere (mousex, mousey, button)
	if (mousex > 600 and mousex < 660) and (mousey > 400 and mousey < 460) and button = 1 and audienceHelpButton = 0 then  %ask audience
	    locatexy (230, 400)
	    put audA, "% says ", answers (1) ..
	    locatexy (230, 380)
	    put audB, "% says ", answers (2) ..
	    locatexy (230, 370)
	    put audC, "% says ", answers (3) ..
	    locatexy (230, 350)
	    put audD, "% says ", answers (4) ..
	    delay (1000)
	    Draw.ThickLine (600, 400, 660, 460, 3, red)
	    Draw.ThickLine (600, 460, 660, 400, 3, red)
	    audienceHelpButton := 1
	end if
	if (mousex > 690 and mousex < 750) and (mousey > 400 and mousey < 460) and button = 1 and askFriendButton = 0 then              %ask a friend
	    Font.Draw ("Your friend says:", 400, 250, mainFont, white)
	    delay (1000)
	    if askFriendRand = 4 then %wrong
		locatexy (580, 250)
		put answers (1) ..
	    elsif askFriendRand = 5 then %wrong
		locatexy (580, 250)
		put answers (2) ..
	    elsif askFriendRand = 6 then %wrong
		locatexy (580, 250)
		put answers (3) ..
	    else %random 1,2,3 are right
		locatexy (580, 250)
		put correctAnswers ..
	    end if
	    delay (1000)
	    Draw.ThickLine (690, 400, 750, 460, 3, red)
	    Draw.ThickLine (690, 460, 750, 400, 3, red)
	    askFriendButton := 1
	end if
	if (mousex > 530 and mousex < 730) and (mousey > 310 and mousey < 370) and button = 1 then     %stand down
	    standDown
	elsif (mousex > 0 and mousex < 400) and (mousey > 50 and mousey < 100) and button = 1 then     %answer a
	    if correctAnswerLocation = 1 then     % if answer a is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 320, 20, 335, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer a is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 50 and mousey < 100) and button = 1 then     %answer b
	    if correctAnswerLocation = 2 then     %if answer b is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 320, 20, 335, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer b is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 0 and mousex < 400) and (mousey > 0 and mousey < 50) and button = 1 then     %answer c
	    if correctAnswerLocation = 3 then     %if answer c is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 320, 20, 335, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer c is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 0 and mousey < 50) and button = 1 then     %answer d
	    if correctAnswerLocation = 4 then     %if answer d is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 320, 20, 335, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer d is wrong
		failMessage
		mainMenu
	    end if
	end if
    end loop
    delay (500)

    %Question 8 - Level 1------------------------------------------
    if question = 8 then
	answers (1) := "Poodle"
	answers (2) := "Labrador Retriever"
	answers (3) := "German Shepherd"
	answers (4) := "Cocker Spaniel"
	correctAnswers := "Cocker Spaniel"
	pointr := 4     %redeclare pointr
	drawfillbox (250, 102, 550, 178, 104)     %erases prev question
	drawfillbox (43, 52, 395, 98, 104)     %erases prev answer a
	drawfillbox (443, 52, 800, 98, 104)     %erases prev answer b
	drawfillbox (43, 0, 395, 48, 104)     %erases prev answer c
	drawfillbox (443, 0, 800, 48, 104)     %erases prev answer d
	drawfillbox (200, 200, 800, 270, 104)    %erases correct
	drawfillbox (390, 220, 800, 300, 104) %erases ask a friend
	drawfillbox (200, 300, 500, 400, 104)  %erases ask the audience
	var stringToSwitch : string := ""
	randint (toSwitch, 1, pointr)
	randint (audA, 40, 90)
	randint (audB, 0, 100 - audA)
	randint (audC, 0, (100 - audA) - audB)
	randint (audD, 0, ((100 - audA) - audB) - audC)
	if answers (toSwitch) = correctAnswers then
	    correctAnswerLocation := toSwitch
	end if
	stringToSwitch := answers (toSwitch)
	answers (toSwitch) := answers (pointr)
	answers (pointr) := stringToSwitch
	pointr := pointr - 1
	for i : 1 .. 4
	    if answers (i) = correctAnswers then
		correctAnswerLocation := i
	    end if
	end for
	colourback (104)
	colour (white)
	locatexy (250, 150)
	put "During the 1980s for 6 consecutive" .. %writes question
	locatexy (250, 140)
	put "years what was the most popular breed" .. %writes question
	locatexy (340, 130)
	put "of dog in the U.S.?" .. %writes question
	locatexy (50, 70)
	put answers (1) ..
	locatexy (450, 70)
	put answers (2) ..
	locatexy (50, 20)
	put answers (3) ..
	locatexy (450, 20)
	put answers (4) ..
    end if
    loop
	mousewhere (mousex, mousey, button)
	if (mousex > 600 and mousex < 660) and (mousey > 400 and mousey < 460) and button = 1 and audienceHelpButton = 0 then  %ask audience
	    locatexy (230, 400)
	    put audA, "% says ", answers (1) ..
	    locatexy (230, 380)
	    put audB, "% says ", answers (2) ..
	    locatexy (230, 370)
	    put audC, "% says ", answers (3) ..
	    locatexy (230, 350)
	    put audD, "% says ", answers (4) ..
	    delay (1000)
	    Draw.ThickLine (600, 400, 660, 460, 3, red)
	    Draw.ThickLine (600, 460, 660, 400, 3, red)
	    audienceHelpButton := 1
	end if
	if (mousex > 690 and mousex < 750) and (mousey > 400 and mousey < 460) and button = 1 and askFriendButton = 0 then              %ask a friend
	    Font.Draw ("Your friend says:", 400, 250, mainFont, white)
	    delay (1000)
	    if askFriendRand = 4 then %wrong
		locatexy (580, 250)
		put answers (1) ..
	    elsif askFriendRand = 5 then %wrong
		locatexy (580, 250)
		put answers (2) ..
	    elsif askFriendRand = 6 then %wrong
		locatexy (580, 250)
		put answers (3) ..
	    else %random 1,2,3 are right
		locatexy (580, 250)
		put correctAnswers ..
	    end if
	    delay (1000)
	    Draw.ThickLine (690, 400, 750, 460, 3, red)
	    Draw.ThickLine (690, 460, 750, 400, 3, red)
	    askFriendButton := 1
	end if
	if (mousex > 530 and mousex < 730) and (mousey > 310 and mousey < 370) and button = 1 then     %stand down
	    standDown
	elsif (mousex > 0 and mousex < 400) and (mousey > 50 and mousey < 100) and button = 1 then     %answer a
	    if correctAnswerLocation = 1 then     % if answer a is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 340, 20, 355, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer a is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 50 and mousey < 100) and button = 1 then     %answer b
	    if correctAnswerLocation = 2 then     %if answer b is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 340, 20, 355, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer b is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 0 and mousex < 400) and (mousey > 0 and mousey < 50) and button = 1 then     %answer c
	    if correctAnswerLocation = 3 then     %if answer c is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 340, 20, 355, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer c is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 0 and mousey < 50) and button = 1 then     %answer d
	    if correctAnswerLocation = 4 then     %if answer d is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 340, 20, 355, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer d is wrong
		failMessage
		mainMenu
	    end if
	end if
    end loop
    delay (500)

    %Question 9 - Level 1------------------------------------------------------
    if question = 9 then
	answers (1) := "1.5 million pounds"
	answers (2) := "100 000 pounds"
	answers (3) := "600 000 pounds"
	answers (4) := "1.1 million pounds"
	correctAnswers := "1.1 million pounds"
	pointr := 4     %redeclare pointr
	drawfillbox (250, 102, 550, 178, 104)     %erases prev question
	drawfillbox (43, 52, 395, 98, 104)     %erases prev answer a
	drawfillbox (443, 52, 800, 98, 104)     %erases prev answer b
	drawfillbox (43, 0, 395, 48, 104)     %erases prev answer c
	drawfillbox (443, 0, 800, 48, 104)     %erases prev answer d
	drawfillbox (200, 200, 800, 270, 104)    %erases correct
	drawfillbox (390, 220, 800, 300, 104) %erases ask a friend
	drawfillbox (200, 300, 500, 400, 104)  %erases ask the audience
	var stringToSwitch : string := ""
	randint (toSwitch, 1, pointr)
	randint (audA, 40, 90)
	randint (audB, 0, 100 - audA)
	randint (audC, 0, (100 - audA) - audB)
	randint (audD, 0, ((100 - audA) - audB) - audC)
	if answers (toSwitch) = correctAnswers then
	    correctAnswerLocation := toSwitch
	end if
	stringToSwitch := answers (toSwitch)
	answers (toSwitch) := answers (pointr)
	answers (pointr) := stringToSwitch
	pointr := pointr - 1
	for i : 1 .. 4
	    if answers (i) = correctAnswers then
		correctAnswerLocation := i
	    end if
	end for
	colourback (104)
	colour (white)
	locatexy (280, 140)
	put "How heavy is a typical cloud?" .. %writes question
	locatexy (50, 70)
	put answers (1) ..
	locatexy (450, 70)
	put answers (2) ..
	locatexy (50, 20)
	put answers (3) ..
	locatexy (450, 20)
	put answers (4) ..
    end if
    loop
	mousewhere (mousex, mousey, button)
	if (mousex > 600 and mousex < 660) and (mousey > 400 and mousey < 460) and button = 1 and audienceHelpButton = 0 then  %ask audience
	    locatexy (230, 400)
	    put audA, "% says ", answers (1) ..
	    locatexy (230, 380)
	    put audB, "% says ", answers (2) ..
	    locatexy (230, 370)
	    put audC, "% says ", answers (3) ..
	    locatexy (230, 350)
	    put audD, "% says ", answers (4) ..
	    delay (1000)
	    Draw.ThickLine (600, 400, 660, 460, 3, red)
	    Draw.ThickLine (600, 460, 660, 400, 3, red)
	    audienceHelpButton := 1
	end if
	if (mousex > 690 and mousex < 750) and (mousey > 400 and mousey < 460) and button = 1 and askFriendButton = 0 then              %ask a friend
	    Font.Draw ("Your friend says:", 400, 250, mainFont, white)
	    delay (1000)
	    if askFriendRand = 4 then %wrong
		locatexy (580, 250)
		put answers (1) ..
	    elsif askFriendRand = 5 then %wrong
		locatexy (580, 250)
		put answers (2) ..
	    elsif askFriendRand = 6 then %wrong
		locatexy (580, 250)
		put answers (3) ..
	    else %random 1,2,3 are right
		locatexy (580, 250)
		put correctAnswers ..
	    end if
	    delay (1000)
	    Draw.ThickLine (690, 400, 750, 460, 3, red)
	    Draw.ThickLine (690, 460, 750, 400, 3, red)
	    askFriendButton := 1
	end if
	if (mousex > 530 and mousex < 730) and (mousey > 310 and mousey < 370) and button = 1 then     %stand down
	    standDown
	elsif (mousex > 0 and mousex < 400) and (mousey > 50 and mousey < 100) and button = 1 then     %answer a
	    if correctAnswerLocation = 1 then     % if answer a is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 360, 20, 375, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer a is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 50 and mousey < 100) and button = 1 then     %answer b
	    if correctAnswerLocation = 2 then     %if answer b is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 360, 20, 375, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer b is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 0 and mousex < 400) and (mousey > 0 and mousey < 50) and button = 1 then     %answer c
	    if correctAnswerLocation = 3 then     %if answer c is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 360, 20, 375, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer c is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 0 and mousey < 50) and button = 1 then     %answer d
	    if correctAnswerLocation = 4 then     %if answer d is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (5, 360, 20, 375, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer d is wrong
		failMessage
		mainMenu
	    end if
	end if
    end loop
    delay (500)

    %Question 10 - Level 1----------------------------------------------------------
    if question = 10 then
	answers (1) := "Chlorine"
	answers (2) := "Calcium"
	answers (3) := "Salt"
	answers (4) := "Fluoride"
	correctAnswers := "Fluoride"
	pointr := 4     %redeclare pointr
	drawfillbox (250, 102, 550, 178, 104)     %erases prev question
	drawfillbox (43, 52, 395, 98, 104)     %erases prev answer a
	drawfillbox (443, 52, 800, 98, 104)     %erases prev answer b
	drawfillbox (43, 0, 395, 48, 104)     %erases prev answer c
	drawfillbox (443, 0, 800, 48, 104)     %erases prev answer d
	drawfillbox (200, 200, 800, 270, 104)    %erases correct
	drawfillbox (390, 220, 800, 300, 104) %erases ask a friend
	drawfillbox (200, 300, 500, 400, 104)  %erases ask the audience
	var stringToSwitch : string := ""
	randint (toSwitch, 1, pointr)
	randint (audA, 40, 90)
	randint (audB, 0, 100 - audA)
	randint (audC, 0, (100 - audA) - audB)
	randint (audD, 0, ((100 - audA) - audB) - audC)
	if answers (toSwitch) = correctAnswers then
	    correctAnswerLocation := toSwitch
	end if
	stringToSwitch := answers (toSwitch)
	answers (toSwitch) := answers (pointr)
	answers (pointr) := stringToSwitch
	pointr := pointr - 1
	for i : 1 .. 4
	    if answers (i) = correctAnswers then
		correctAnswerLocation := i
	    end if
	end for
	colourback (104)
	colour (white)
	locatexy (250, 150)
	put "Since the 1940s, what has been added" .. %writes question
	locatexy (250, 140)
	put "to Canada's tap water for health" .. %writes question
	locatexy (385, 130)
	put "benefits?" .. %writes question
	locatexy (50, 70)
	put answers (1) ..
	locatexy (450, 70)
	put answers (2) ..
	locatexy (50, 20)
	put answers (3) ..
	locatexy (450, 20)
	put answers (4) ..
    end if
    loop
	mousewhere (mousex, mousey, button)
	if (mousex > 600 and mousex < 660) and (mousey > 400 and mousey < 460) and button = 1 and audienceHelpButton = 0 then  %ask audience
	    locatexy (230, 400)
	    put audA, "% says ", answers (1) ..
	    locatexy (230, 380)
	    put audB, "% says ", answers (2) ..
	    locatexy (230, 370)
	    put audC, "% says ", answers (3) ..
	    locatexy (230, 350)
	    put audD, "% says ", answers (4) ..
	    delay (1000)
	    Draw.ThickLine (600, 400, 660, 460, 3, red)
	    Draw.ThickLine (600, 460, 660, 400, 3, red)
	    audienceHelpButton := 1
	end if
	if (mousex > 690 and mousex < 750) and (mousey > 400 and mousey < 460) and button = 1 and askFriendButton = 0 then              %ask a friend
	    Font.Draw ("Your friend says:", 400, 250, mainFont, white)
	    delay (1000)
	    if askFriendRand = 4 then %wrong
		locatexy (580, 250)
		put answers (1) ..
	    elsif askFriendRand = 5 then %wrong
		locatexy (580, 250)
		put answers (2) ..
	    elsif askFriendRand = 6 then %wrong
		locatexy (580, 250)
		put answers (3) ..
	    else %random 1,2,3 are right
		locatexy (580, 250)
		put correctAnswers ..
	    end if
	    delay (1000)
	    Draw.ThickLine (690, 400, 750, 460, 3, red)
	    Draw.ThickLine (690, 460, 750, 400, 3, red)
	    askFriendButton := 1
	end if
	if (mousex > 530 and mousex < 730) and (mousey > 310 and mousey < 370) and button = 1 then     %stand down
	    standDown
	elsif (mousex > 0 and mousex < 400) and (mousey > 50 and mousey < 100) and button = 1 then     %answer a
	    if correctAnswerLocation = 1 then     % if answer a is right
		Font.Draw ("CORRECT. You have reached the second benchmark!", 210, 210, correctFont, 43)
		Draw.FillStar (2, 380, 17, 395, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer a is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 50 and mousey < 100) and button = 1 then     %answer b
	    if correctAnswerLocation = 2 then     %if answer b is right
		Font.Draw ("CORRECT. You have reached the second benchmark!", 210, 210, correctFont, 43)
		Draw.FillStar (2, 380, 17, 395, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer b is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 0 and mousex < 400) and (mousey > 0 and mousey < 50) and button = 1 then     %answer c
	    if correctAnswerLocation = 3 then     %if answer c is right
		Font.Draw ("CORRECT. You have reached the second benchmark!", 210, 210, correctFont, 43)
		Draw.FillStar (2, 380, 17, 395, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer c is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 0 and mousey < 50) and button = 1 then     %answer d
	    if correctAnswerLocation = 4 then     %if answer d is right
		Font.Draw ("CORRECT. You have reached the second benchmark!", 210, 210, correctFont, 43)
		Draw.FillStar (2, 380, 17, 395, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer d is wrong
		failMessage
		mainMenu
	    end if
	end if
    end loop
    delay (500)

    %Question 11 - Level 1---------------------------------------------------
    if question = 11 then
	answers (1) := "London, England"
	answers (2) := "London, Ontario"
	answers (3) := "Cambridge, England"
	answers (4) := "Lake Havasu, Arizona"
	correctAnswers := "Lake Havasu, Arizona"
	pointr := 4     %redeclare pointr
	drawfillbox (250, 102, 550, 178, 104)     %erases prev question
	drawfillbox (43, 52, 395, 98, 104)     %erases prev answer a
	drawfillbox (443, 52, 800, 98, 104)     %erases prev answer b
	drawfillbox (43, 0, 395, 48, 104)     %erases prev answer c
	drawfillbox (443, 0, 800, 48, 104)     %erases prev answer d
	drawfillbox (200, 200, 800, 270, 104)    %erases correct
	drawfillbox (390, 220, 800, 300, 104) %erases ask a friend
	drawfillbox (200, 300, 500, 400, 104)  %erases ask the audience
	var stringToSwitch : string := ""
	randint (toSwitch, 1, pointr)
	randint (audA, 40, 90)
	randint (audB, 0, 100 - audA)
	randint (audC, 0, (100 - audA) - audB)
	randint (audD, 0, ((100 - audA) - audB) - audC)
	if answers (toSwitch) = correctAnswers then
	    correctAnswerLocation := toSwitch
	end if
	stringToSwitch := answers (toSwitch)
	answers (toSwitch) := answers (pointr)
	answers (pointr) := stringToSwitch
	pointr := pointr - 1
	for i : 1 .. 4
	    if answers (i) = correctAnswers then
		correctAnswerLocation := i
	    end if
	end for
	colourback (104)
	colour (white)
	locatexy (275, 150)
	put "In what city is London Bridge?" .. %writes question
	locatexy (50, 70)
	put answers (1) ..
	locatexy (450, 70)
	put answers (2) ..
	locatexy (50, 20)
	put answers (3) ..
	locatexy (450, 20)
	put answers (4) ..
    end if
    loop
	mousewhere (mousex, mousey, button)
	if (mousex > 600 and mousex < 660) and (mousey > 400 and mousey < 460) and button = 1 and audienceHelpButton = 0 then  %ask audience
	    locatexy (230, 400)
	    put audA, "% says ", answers (1) ..
	    locatexy (230, 380)
	    put audB, "% says ", answers (2) ..
	    locatexy (230, 370)
	    put audC, "% says ", answers (3) ..
	    locatexy (230, 350)
	    put audD, "% says ", answers (4) ..
	    delay (1000)
	    Draw.ThickLine (600, 400, 660, 460, 3, red)
	    Draw.ThickLine (600, 460, 660, 400, 3, red)
	    audienceHelpButton := 1
	end if
	if (mousex > 690 and mousex < 750) and (mousey > 400 and mousey < 460) and button = 1 and askFriendButton = 0 then              %ask a friend
	    Font.Draw ("Your friend says:", 400, 250, mainFont, white)
	    delay (1000)
	    if askFriendRand = 4 then %wrong
		locatexy (580, 250)
		put answers (1) ..
	    elsif askFriendRand = 5 then %wrong
		locatexy (580, 250)
		put answers (2) ..
	    elsif askFriendRand = 6 then %wrong
		locatexy (580, 250)
		put answers (3) ..
	    else %random 1,2,3 are right
		locatexy (580, 250)
		put correctAnswers ..
	    end if
	    delay (1000)
	    Draw.ThickLine (690, 400, 750, 460, 3, red)
	    Draw.ThickLine (690, 460, 750, 400, 3, red)
	    askFriendButton := 1
	end if
	if (mousex > 530 and mousex < 730) and (mousey > 310 and mousey < 370) and button = 1 then     %stand down
	    standDown
	elsif (mousex > 0 and mousex < 400) and (mousey > 50 and mousey < 100) and button = 1 then     %answer a
	    if correctAnswerLocation = 1 then     % if answer a is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (2, 400, 17, 415, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer a is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 50 and mousey < 100) and button = 1 then     %answer b
	    if correctAnswerLocation = 2 then     %if answer b is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (2, 400, 17, 415, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer b is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 0 and mousex < 400) and (mousey > 0 and mousey < 50) and button = 1 then     %answer c
	    if correctAnswerLocation = 3 then     %if answer c is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (2, 400, 17, 415, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer c is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 0 and mousey < 50) and button = 1 then     %answer d
	    if correctAnswerLocation = 4 then     %if answer d is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (2, 400, 17, 415, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer d is wrong
		failMessage
		mainMenu
	    end if
	end if
    end loop
    delay (500)

    %Question 12 - Level 1----------------------------------------------------
    if question = 12 then
	answers (1) := "George and Anne"
	answers (2) := "William and Elizabeth"
	answers (3) := "Joseph and Catherine"
	answers (4) := "John and Mary"
	correctAnswers := "John and Mary"
	pointr := 4     %redeclare pointr
	drawfillbox (250, 102, 550, 178, 104)     %erases prev question
	drawfillbox (43, 52, 395, 98, 104)     %erases prev answer a
	drawfillbox (443, 52, 800, 98, 104)     %erases prev answer b
	drawfillbox (43, 0, 395, 48, 104)     %erases prev answer c
	drawfillbox (443, 0, 800, 48, 104)     %erases prev answer d
	drawfillbox (200, 200, 800, 270, 104)    %erases correct
	drawfillbox (390, 220, 800, 300, 104) %erases ask a friend
	drawfillbox (200, 300, 500, 400, 104)  %erases ask the audience
	var stringToSwitch : string := ""
	randint (toSwitch, 1, pointr)
	randint (audA, 40, 90)
	randint (audB, 0, 100 - audA)
	randint (audC, 0, (100 - audA) - audB)
	randint (audD, 0, ((100 - audA) - audB) - audC)
	if answers (toSwitch) = correctAnswers then
	    correctAnswerLocation := toSwitch
	end if
	stringToSwitch := answers (toSwitch)
	answers (toSwitch) := answers (pointr)
	answers (pointr) := stringToSwitch
	pointr := pointr - 1
	for i : 1 .. 4
	    if answers (i) = correctAnswers then
		correctAnswerLocation := i
	    end if
	end for
	colourback (104)
	colour (white)
	locatexy (250, 150)
	put "In the year 1900 in the U.S., what " .. %writes question
	locatexy (250, 140)
	put "were the most popular first names" .. %writes question
	locatexy (260, 130)
	put "given to boy and girl babies?" .. %writes question
	locatexy (50, 70)
	put answers (1) ..
	locatexy (450, 70)
	put answers (2) ..
	locatexy (50, 20)
	put answers (3) ..
	locatexy (450, 20)
	put answers (4) ..
    end if
    loop
	mousewhere (mousex, mousey, button)
	if (mousex > 690 and mousex < 750) and (mousey > 400 and mousey < 460) and button = 1 and askFriendButton = 0 then              %ask a friend
	    Font.Draw ("Your friend says:", 400, 250, mainFont, white)
	    delay (1000)
	    if askFriendRand = 4 then %wrong
		locatexy (580, 250)
		put answers (1) ..
	    elsif askFriendRand = 5 then %wrong
		locatexy (580, 250)
		put answers (2) ..
	    elsif askFriendRand = 6 then %wrong
		locatexy (580, 250)
		put answers (3) ..
	    else %random 1,2,3 are right
		locatexy (580, 250)
		put correctAnswers ..
	    end if
	    delay (1000)
	    Draw.ThickLine (690, 400, 750, 460, 3, red)
	    Draw.ThickLine (690, 460, 750, 400, 3, red)
	    askFriendButton := 1
	end if
	if (mousex > 530 and mousex < 730) and (mousey > 310 and mousey < 370) and button = 1 then     %stand down
	    standDown
	elsif (mousex > 0 and mousex < 400) and (mousey > 50 and mousey < 100) and button = 1 then     %answer a
	    if correctAnswerLocation = 1 then     % if answer a is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (2, 420, 17, 435, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer a is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 50 and mousey < 100) and button = 1 then     %answer b
	    if correctAnswerLocation = 2 then     %if answer b is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (2, 420, 17, 435, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer b is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 0 and mousex < 400) and (mousey > 0 and mousey < 50) and button = 1 then     %answer c
	    if correctAnswerLocation = 3 then     %if answer c is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (2, 420, 17, 435, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer c is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 0 and mousey < 50) and button = 1 then     %answer d
	    if correctAnswerLocation = 4 then     %if answer d is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (2, 420, 17, 435, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer d is wrong
		failMessage
		mainMenu
	    end if
	end if
    end loop
    delay (500)

    %Question 13 - Level 1---------------------------------------------
    if question = 13 then
	answers (1) := "Chocolate"
	answers (2) := "Euros"
	answers (3) := "Gold"
	answers (4) := "Beer"
	correctAnswers := "Beer"
	pointr := 4     %redeclare pointr
	drawfillbox (250, 102, 550, 178, 104)     %erases prev question
	drawfillbox (43, 52, 395, 98, 104)     %erases prev answer a
	drawfillbox (443, 52, 800, 98, 104)     %erases prev answer b
	drawfillbox (43, 0, 395, 48, 104)     %erases prev answer c
	drawfillbox (443, 0, 800, 48, 104)     %erases prev answer d
	drawfillbox (200, 200, 800, 270, 104)    %erases correct
	drawfillbox (390, 220, 800, 300, 104) %erases ask a friend
	drawfillbox (200, 300, 500, 400, 104)  %erases ask the audience
	var stringToSwitch : string := ""
	randint (toSwitch, 1, pointr)
	randint (audA, 40, 90)
	randint (audB, 0, 100 - audA)
	randint (audC, 0, (100 - audA) - audB)
	randint (audD, 0, ((100 - audA) - audB) - audC)
	if answers (toSwitch) = correctAnswers then
	    correctAnswerLocation := toSwitch
	end if
	stringToSwitch := answers (toSwitch)
	answers (toSwitch) := answers (pointr)
	answers (pointr) := stringToSwitch
	pointr := pointr - 1
	for i : 1 .. 4
	    if answers (i) = correctAnswers then
		correctAnswerLocation := i
	    end if
	end for
	colourback (104)
	colour (white)
	locatexy (250, 150)
	put "At the wife carrying world championships" .. %writes question
	locatexy (250, 140)
	put "in Finland, first prize was the wife's" .. %writes question
	locatexy (350, 130)
	put "weight in what?" .. %writes question
	locatexy (50, 70)
	put answers (1) ..
	locatexy (450, 70)
	put answers (2) ..
	locatexy (50, 20)
	put answers (3) ..
	locatexy (450, 20)
	put answers (4) ..
    end if
    loop
	mousewhere (mousex, mousey, button)
	if (mousex > 600 and mousex < 660) and (mousey > 400 and mousey < 460) and button = 1 and audienceHelpButton = 0 then  %ask audience
	    locatexy (230, 400)
	    put audA, "% says ", answers (1) ..
	    locatexy (230, 380)
	    put audB, "% says ", answers (2) ..
	    locatexy (230, 370)
	    put audC, "% says ", answers (3) ..
	    locatexy (230, 350)
	    put audD, "% says ", answers (4) ..
	    delay (1000)
	    Draw.ThickLine (600, 400, 660, 460, 3, red)
	    Draw.ThickLine (600, 460, 660, 400, 3, red)
	    audienceHelpButton := 1
	end if
	if (mousex > 690 and mousex < 750) and (mousey > 400 and mousey < 460) and button = 1 and askFriendButton = 0 then              %ask a friend
	    Font.Draw ("Your friend says:", 400, 250, mainFont, white)
	    delay (1000)
	    if askFriendRand = 4 then %wrong
		locatexy (580, 250)
		put answers (1) ..
	    elsif askFriendRand = 5 then %wrong
		locatexy (580, 250)
		put answers (2) ..
	    elsif askFriendRand = 6 then %wrong
		locatexy (580, 250)
		put answers (3) ..
	    else %random 1,2,3 are right
		locatexy (580, 250)
		put correctAnswers ..
	    end if
	    delay (1000)
	    Draw.ThickLine (690, 400, 750, 460, 3, red)
	    Draw.ThickLine (690, 460, 750, 400, 3, red)
	    askFriendButton := 1
	end if
	if (mousex > 530 and mousex < 730) and (mousey > 310 and mousey < 370) and button = 1 then     %Stand down
	    standDown
	elsif (mousex > 0 and mousex < 400) and (mousey > 50 and mousey < 100) and button = 1 then     %answer a
	    if correctAnswerLocation = 1 then     % if answer a is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (2, 440, 17, 455, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer a is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 50 and mousey < 100) and button = 1 then     %answer b
	    if correctAnswerLocation = 2 then     %if answer b is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (2, 440, 17, 455, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer b is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 0 and mousex < 400) and (mousey > 0 and mousey < 50) and button = 1 then     %answer c
	    if correctAnswerLocation = 3 then     %if answer c is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (2, 440, 17, 455, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer c is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 0 and mousey < 50) and button = 1 then     %answer d
	    if correctAnswerLocation = 4 then     %if answer d is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (2, 440, 17, 455, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer d is wrong
		failMessage
		mainMenu
	    end if
	end if
    end loop
    delay (500)

    %Question 14 - Level 1---------------------------------------
    if question = 14 then
	answers (1) := "Harvard University"
	answers (2) := "Duke University"
	answers (3) := "University of Toronto"
	answers (4) := "Oxford University"
	correctAnswers := "Oxford University"
	pointr := 4     %redeclare pointr
	drawfillbox (250, 102, 550, 178, 104)     %erases prev question
	drawfillbox (43, 52, 395, 98, 104)     %erases prev answer a
	drawfillbox (443, 52, 800, 98, 104)     %erases prev answer b
	drawfillbox (43, 0, 395, 48, 104)     %erases prev answer c
	drawfillbox (443, 0, 800, 48, 104)     %erases prev answer d
	drawfillbox (200, 200, 800, 270, 104)    %erases correct
	drawfillbox (390, 220, 800, 300, 104) %erases ask a friend
	drawfillbox (200, 300, 500, 400, 104)  %erases ask the audience
	var stringToSwitch : string := ""
	randint (toSwitch, 1, pointr)
	randint (audA, 40, 90)
	randint (audB, 0, 100 - audA)
	randint (audC, 0, (100 - audA) - audB)
	randint (audD, 0, ((100 - audA) - audB) - audC)
	if answers (toSwitch) = correctAnswers then
	    correctAnswerLocation := toSwitch
	end if
	stringToSwitch := answers (toSwitch)
	answers (toSwitch) := answers (pointr)
	answers (pointr) := stringToSwitch
	pointr := pointr - 1
	for i : 1 .. 4
	    if answers (i) = correctAnswers then
		correctAnswerLocation := i
	    end if
	end for
	colourback (104)
	colour (white)
	locatexy (250, 150)
	put "Which university is older than the" .. %writes question
	locatexy (380, 120)
	put "Aztec Empire?" .. %writes question
	locatexy (50, 70)
	put answers (1) ..
	locatexy (450, 70)
	put answers (2) ..
	locatexy (50, 20)
	put answers (3) ..
	locatexy (450, 20)
	put answers (4) ..
    end if
    loop
	mousewhere (mousex, mousey, button)
	if (mousex > 600 and mousex < 660) and (mousey > 400 and mousey < 460) and button = 1 and audienceHelpButton = 0 then  %ask audience
	    locatexy (230, 400)
	    put audA, "% says ", answers (1) ..
	    locatexy (230, 380)
	    put audB, "% says ", answers (2) ..
	    locatexy (230, 370)
	    put audC, "% says ", answers (3) ..
	    locatexy (230, 350)
	    put audD, "% says ", answers (4) ..
	    delay (1000)
	    Draw.ThickLine (600, 400, 660, 460, 3, red)
	    Draw.ThickLine (600, 460, 660, 400, 3, red)
	    audienceHelpButton := 1
	end if
	if (mousex > 690 and mousex < 750) and (mousey > 400 and mousey < 460) and button = 1 and askFriendButton = 0 then              %ask a friend
	    Font.Draw ("Your friend says:", 400, 250, mainFont, white)
	    delay (1000)
	    if askFriendRand = 4 then %wrong
		locatexy (580, 250)
		put answers (1) ..
	    elsif askFriendRand = 5 then %wrong
		locatexy (580, 250)
		put answers (2) ..
	    elsif askFriendRand = 6 then %wrong
		locatexy (580, 250)
		put answers (3) ..
	    else %random 1,2,3 are right
		locatexy (580, 250)
		put correctAnswers ..
	    end if
	    delay (1000)
	    Draw.ThickLine (690, 400, 750, 460, 3, red)
	    Draw.ThickLine (690, 460, 750, 400, 3, red)
	    askFriendButton := 1
	end if
	if (mousex > 530 and mousex < 730) and (mousey > 310 and mousey < 370) and button = 1 then     %stand down
	    standDown
	elsif (mousex > 0 and mousex < 400) and (mousey > 50 and mousey < 100) and button = 1 then     %answer a
	    if correctAnswerLocation = 1 then     % if answer a is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (2, 460, 17, 475, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer a is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 50 and mousey < 100) and button = 1 then     %answer b
	    if correctAnswerLocation = 2 then     %if answer b is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (2, 460, 17, 475, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer b is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 0 and mousex < 400) and (mousey > 0 and mousey < 50) and button = 1 then     %answer c
	    if correctAnswerLocation = 3 then     %if answer c is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (2, 460, 17, 475, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer c is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 0 and mousey < 50) and button = 1 then     %answer d
	    if correctAnswerLocation = 4 then     %if answer d is right
		Font.Draw ("CORRECT", 320, 210, correctFont, 43)
		Draw.FillStar (2, 460, 17, 475, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer d is wrong
		failMessage
		mainMenu
	    end if
	end if
    end loop
    delay (500)

    %Question 15 - Level 1-------------------------------------------
    if question = 15 then
	answers (1) := "Sleeping with your eyes open"
	answers (2) := "Breaking glass with your voice"
	answers (3) := "Swimming in freezing water"
	answers (4) := "Finding shapes in clouds"
	correctAnswers := "Finding shapes in clouds"
	pointr := 4     %redeclare pointr
	drawfillbox (250, 102, 550, 178, 104)     %erases prev question
	drawfillbox (43, 52, 395, 98, 104)     %erases prev answer a
	drawfillbox (443, 52, 800, 98, 104)     %erases prev answer b
	drawfillbox (43, 0, 395, 48, 104)     %erases prev answer c
	drawfillbox (443, 0, 800, 48, 104)     %erases prev answer d
	drawfillbox (200, 200, 800, 270, 104)    %erases correct
	drawfillbox (390, 220, 800, 300, 104) %erases ask a friend
	drawfillbox (200, 300, 500, 400, 104)  %erases ask the audience
	var stringToSwitch : string := ""
	randint (toSwitch, 1, pointr)
	randint (audA, 40, 90)
	randint (audB, 0, 100 - audA)
	randint (audC, 0, (100 - audA) - audB)
	randint (audD, 0, ((100 - audA) - audB) - audC)
	if answers (toSwitch) = correctAnswers then
	    correctAnswerLocation := toSwitch
	end if
	stringToSwitch := answers (toSwitch)
	answers (toSwitch) := answers (pointr)
	answers (pointr) := stringToSwitch
	pointr := pointr - 1
	for i : 1 .. 4
	    if answers (i) = correctAnswers then
		correctAnswerLocation := i
	    end if
	end for
	colourback (104)
	colour (white)
	locatexy (250, 150)
	put "'Nephelococcygia' is the practice of" .. %writes question
	locatexy (250, 120)
	put "doing what?" .. %writes question
	locatexy (50, 70)
	put answers (1) ..
	locatexy (450, 70)
	put answers (2) ..
	locatexy (50, 20)
	put answers (3) ..
	locatexy (450, 20)
	put answers (4) ..
    end if
    loop
	mousewhere (mousex, mousey, button)
	if (mousex > 600 and mousex < 660) and (mousey > 400 and mousey < 460) and button = 1 and audienceHelpButton = 0 then  %ask audience
	    locatexy (230, 400)
	    put audA, "% says ", answers (1) ..
	    locatexy (230, 380)
	    put audB, "% says ", answers (2) ..
	    locatexy (230, 370)
	    put audC, "% says ", answers (3) ..
	    locatexy (230, 350)
	    put audD, "% says ", answers (4) ..
	    delay (1000)
	    Draw.ThickLine (600, 400, 660, 460, 3, red)
	    Draw.ThickLine (600, 460, 660, 400, 3, red)
	    audienceHelpButton := 1
	end if
	if (mousex > 690 and mousex < 750) and (mousey > 400 and mousey < 460) and button = 1 and askFriendButton = 0 then              %ask a friend
	    Font.Draw ("Your friend says:", 400, 250, mainFont, white)
	    delay (1000)
	    if askFriendRand = 4 then %wrong
		locatexy (580, 250)
		put answers (1) ..
	    elsif askFriendRand = 5 then %wrong
		locatexy (580, 250)
		put answers (2) ..
	    elsif askFriendRand = 6 then %wrong
		locatexy (580, 250)
		put answers (3) ..
	    else %random 1,2,3 are right
		locatexy (580, 250)
		put correctAnswers ..
	    end if
	    delay (1000)
	    Draw.ThickLine (690, 400, 750, 460, 3, red)
	    Draw.ThickLine (690, 460, 750, 400, 3, red)
	    askFriendButton := 1
	end if
	if (mousex > 530 and mousex < 730) and (mousey > 310 and mousey < 370) and button = 1 then     %stand down
	    standDown
	elsif (mousex > 0 and mousex < 400) and (mousey > 50 and mousey < 100) and button = 1 then     %answer a
	    if correctAnswerLocation = 1 then     % if answer a is right
		Draw.FillStar (2, 480, 17, 495, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer a is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 50 and mousey < 100) and button = 1 then     %answer b
	    if correctAnswerLocation = 2 then     %if answer b is right
		Draw.FillStar (2, 480, 17, 495, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer b is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 0 and mousex < 400) and (mousey > 0 and mousey < 50) and button = 1 then     %answer c
	    if correctAnswerLocation = 3 then     %if answer c is right
		Draw.FillStar (2, 480, 17, 495, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer c is wrong
		failMessage
		mainMenu
	    end if
	elsif (mousex > 400 and mousex < 800) and (mousey > 0 and mousey < 50) and button = 1 then     %answer d
	    if correctAnswerLocation = 4 then     %if answer d is right
		Draw.FillStar (2, 480, 17, 495, yellow)
		correctAnswerLocation := toSwitch
		question := question + 1
		exit
	    else     %if answer d is wrong
		failMessage
		mainMenu
	    end if
	end if
    end loop
    delay (500)
end playGame

%This displays the logo going across the screen
procedure intro
    var logo : int := Pic.FileNew ("WWTBAM Logo.jpg")                 %imports the logo
    fork music
    drawfillbox (0, 0, 800, 500, 104)
    for x : 0 .. 540
	drawfilloval (-151 + x, 325, 140, 140, 104)                 %erase
	drawfilloval (-150 + x, 325, 140, 140, white)                 % craws white circle around the logo
	Pic.Draw (logo, -275 + x, 200, picMerge)                 % draws the logo
	delay (10)
    end for
    pauseProgram
end intro

%This will exit the program
body procedure goodbye
    title
    Font.Draw ("Thanks for playing Who Wants To Be A Millionaire!", 230, 300, mainFont, white)
    Font.Draw ("This version of the game was made by Maya Weir", 230, 200, mainFont, white)
    delay (5000)
    Window.Close (mainWin)                 %closes the window
end goodbye

%This will display the options Play, Instructions  or Exit
body procedure mainMenu
    title

    GUI.Show (playButton)
    GUI.Show (instructionsButton)
    GUI.Show (exitButton)
end mainMenu

%main program
%intro
mainMenu
loop
    exit when GUI.ProcessEvent
end loop
playGame
