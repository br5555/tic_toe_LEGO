function gameOver = isGameOver(state)
	global b;
	winner = gameStat(state);
	if  (ismember(b,state) && winner == b)
		gameOver = false;
	else
		gameOver =  true; 
end
