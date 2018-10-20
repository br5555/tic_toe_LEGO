function []=postavi(row, col)
%     poc_x = 36;
%     poc_y = 0;

    % racunaj poziciju polja
%     red = row - 2;
%     stu = stu - 2;
% 
%     sredina_x = poc_x - 6;
%     sredina_y = poc_y;
% 
%     %ako smo dole *u smjeru kamere
%     polje_x = sredina_x - red * 4;
%     polje_y = sredina_Y - stu * 4;
    
    %%%%%%% RACUNAMO POZICIJU POLJA KADA SMO DOLE 
    
    if (row == 1) && (col == 1) 
        polje_x = 34.5;
        polje_y = 3.8;
    elseif(row == 1) && (col == 2) 
        polje_x = 34;
        polje_y = 0;
    elseif(row == 1) && (col == 3) 
        polje_x = 34;
        polje_y = -3.8;
    elseif(row == 2) && (col == 1) 
        polje_x = 31;
        polje_y = 3.8;
    elseif(row == 2) && (col == 2) 
        polje_x = 30.4;
        polje_y = 0;
    elseif(row == 2) && (col == 3) 
        polje_x = 30.4;
        polje_y = -3.8;
    elseif(row == 3) && (col == 1) 
        polje_x = 27;
        polje_y = 3.8;
    elseif(row == 3) && (col == 2) 
        polje_x = 27;
        polje_y = 0;
    elseif(row == 3) && (col == 3) 
        polje_x = 27;
        polje_y = -3.8;
    end
    
    %ako smo gore
%     polje_x = sredina_x + red * 4;
%     polje_y = sredina_Y + stu * 4;
%     

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%PRVO DOHVACAMO OBJEKAT ONDA GA MEÆEMO
    
    %%%dohvacamo objekt i krecemo prema cilju
    [fi1, fi2] = inverzna (25, 17);  %17 18.7
    set_param('lego2/rotacija1', 'Value', mat2str(fi1));
    set_param('lego2/rotacija2', 'Value', mat2str(fi2));
    pause(10);
    set_param('lego2/translacija', 'Value', mat2str(0));
    pause(10);
    set_param('lego2/translacija', 'Value', mat2str(2));
    [fi1, fi2] = inverzna (polje_x, polje_y);
    set_param('lego2/rotacija1', 'Value', mat2str(fi1))
    set_param('lego2/rotacija2', 'Value', mat2str(fi2))
    pause (10);
    set_param('lego2/translacija', 'Value', mat2str(0))
    pause(10);
    set_param('lego2/translacija', 'Value', mat2str(2)) %???? GDJE TREBA
    pause(2);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% VRACAMO SE NAZAD U NEUTRALNU POZICIJU
    
    %[fi1, fi2] = inverzna (15,-26);
   
    [fi1, fi2] = inverzna (21,26);
    set_param('lego2/rotacija1', 'Value', mat2str(fi1))
    set_param('lego2/rotacija2', 'Value', mat2str(fi2))%ako mijenjam
    %%%strane i ovo TREBA PROMIJENITI
    %%%set_param('lego2/rotacija1', 'String', mat2str(-70)) 
    
    set_param('lego2/translacija', 'Value', mat2str(2))
    
    
end
