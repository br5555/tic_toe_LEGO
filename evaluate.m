function score = evaluate(state, player, depth)
	global b;
	global x;
	winner = gameStat(state);
	if (winner == b)
		score = 0;
	elseif (winner == x)
		score = 10+depth;
	else
		score = -10-depth;
	end
end
