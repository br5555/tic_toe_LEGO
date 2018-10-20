function childrenBoard = getChildern(state, player)
	global b;
	maxRow = 3;
	maxCol = 3;
	rowCur = 1;
	childrenBoard =[];
	while rowCur <= maxRow
		colCur  = 1;
		while colCur <= maxCol			
			if (state(rowCur,colCur) == b)
				dummyBoard = state;
				dummyBoard(rowCur,colCur) = player;
				childrenBoard = [childrenBoard,dummyBoard];
			end
			colCur = colCur + 1;
		end
		rowCur = rowCur + 1;
	end 
end
