%% Minimax algorithm for Tic Tac Toe game implementation

function [bestScore, bestChild] = minimax(state, maximizingPlayer, depth)
	bestChild = [];
	if ( isGameOver(state) || depth == 0 ) 
		bestScore = evaluate(state,maximizingPlayer, depth)

	else
		
		if (maximizingPlayer)
     			bestScore =  -inf;
     		else
     			bestScore = inf;
        end

		childrenBoard = getChildern(state,maximizingPlayer);
		i = 1;
		Size = size(childrenBoard ,2)/3;

 		while i <= Size
 				
			childBoard = childrenBoard(:,3*i-2:3*i);

			score = minimax(childBoard,1-maximizingPlayer, depth-1);
			if (maximizingPlayer)
				if (bestScore < score)
					bestScore = score;
					bestChild = childBoard ;
				end
 			else
				if (bestScore > score)
					bestScore = score;
					bestChild = childBoard;
				end
			end
			
			i = i + 1;
		end
end


end

