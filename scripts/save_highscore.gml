/*
**  Usage:
**      save_highscore(ini name,current score)
**
**  Arguments:
**      ini name     Name of your ini file 
**      current score   The variable holding your current in game score
**
**  Returns: Nothing
**
**  ngm.destronmedia.com
**  support@destronmedia.com
*/


ini_name = argument0;
current_score = argument1;

ini_open(ini_name);
comp = ini_read_real('score','highscore',0);

if (current_score > comp)
    {
    ini_write_real('score','highscore',current_score);
    }
ini_close();
