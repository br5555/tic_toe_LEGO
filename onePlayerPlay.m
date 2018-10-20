function [state, winner] = onePlayerPlay(player,state, winner)
	global b;
	global x;
	
    if ( (not(player)) && (winner == -1) && ismember(b,state))
    
            %if (state(row,col) == b)	
               % state(row,col) = player;
                %drawBoard(player, '',row,col );
                disp ('Cekam dok protivnik ne stavi kruzic na polje neko (45s)');
                disp('press enter');
                pause;
                disp ('Slikam');
                [state] = say_cheese(player);
                pause(10);
                winner = gameStat(state);
                
                disp ('blabla');
                if(winner == b)
                    iplayer = not(player);
                    [bestScore,bestChild]  = minimax(state,iplayer,6)

                    if (size(bestChild,1) >0)
                        for i = 1:3
                            for j=1:3
                                if bestChild(i,j) ~= state(i,j)
                                    row=i;
                                    col=j;
                                end
                            end
                        end
                        state = bestChild
                        disp ('postavi za robota !');
                        postavi(row, col);
                        %tu ima puno pauza
                        winner = gameStat(bestChild);
                    end

                end
            
    
        
    elseif ( (player) && (winner == -1) && ismember(b,state) )
        
         iplayer = (player);
        [bestScore,bestChild] = minimax(state,iplayer,6);
        
        
              
          if (size(bestChild,1) >0)
             
              for i = 1:3
                            for j=1:3
                                if bestChild(i,j) ~= state(i,j)
                                    row=i;
                                    col=j;
                                end
                            end
              end
              state = bestChild
              disp ('POstavljam za robota');
              postavi(row, col);
              winner = gameStat(state);
          end
         
          if not(ismember (b,state))
            return;
          end
         if(winner == b)
           
              
                disp ('Cekam protivnika da stavi, ima 45s enter');
                pause;
                [state] = say_cheese(player);
                pause(10);
                winner = gameStat(state);
        
            
         end
    end

