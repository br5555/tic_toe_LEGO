%% Tic Tac Toe game implementation

% To start the game run at the octave command prompt
% > tictactoe()
%=====================================================

% define the valid state of the spaces in Tic Tac Toe grid

function [] = tictactoe(myShape)

%if myShape = 1 then i'm x -> starting second
%if myShape = 0 then i'm o -> starting first

	% declare global variables
	global gBoardInit;
	gBoardInit = 0;
	global x;
	x = 1;  % X For OnePlayerPay it is the computer
     global o ;
	o = 0;   % O For onePlayerPlay, it is player
     global b;
	b = -1; % blank

    
    
	% Initial board state as all empty
	fprintf('starting TicTacToe');

% 	if (myShape) 
%         currentPlayer = o;
%     else
%         currentPlayer = x;
%     end
%     
    
    state = ones(3,3) * b; % initialise 3*3 grid with all b 	    
	currentPlayer = myShape;
	%drawBoard(currentPlayer, state,'','' );

	winner = b;

	% continue playing until board is not all full and there is no winner
	while (winner == b && ismember(b,state))	
	
		% two player playing
		%[state, currentPlayer] = play(currentPlayer ,state);
		%winner = gameStat(state);
				
		% one player play with computer
        
		[state, win] = onePlayerPlay(currentPlayer ,state, b); 
		 %drawBoard(currentPlayer , state, '','');
         
                
		 winner = gameStat(state);
	end

	if winner == o % O won
        disp('O Won the Game');
     elseif winner == x % X won
        disp('X won the Game');
     else % tie
        disp('The game is Tie');
    end

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Two players play
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [state, currentPlayer] = play(currentPlayer, state)
% 	global b;
% 	global x;
% 	global o;
% 	[xcord,ycord] = ginput(1);
% 	[row, col] = getGridPosition(xcord,ycord);
% 	if the board position is already non blank, do not allow the move
% 	get the click only within grid area
% 	if ( 1<=row && row <=3 && 1<=col && col <=3 )
% 
% 		if (state(row,col) == b)	
% 			state(row,col) = currentPlayer;
% 			drawBoard(currentPlayer, '',row,col );
% 			switch the player
% 			if (currentPlayer == x)
% 				currentPlayer = o;
% 			else
% 				currentPlayer = x;
% 			end
% 		end
% 	end
% end




