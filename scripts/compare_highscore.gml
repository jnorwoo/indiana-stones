/*
**  Usage:
**      compare_highscore(ini name, current score)
**
**  Arguments:
**      ini name     Name of your ini file
**      current score   The variable holding your current in game score
**
**  Returns: 1 if you had a new high score, 0 if you didnt.
**
**  ngm.destronmedia.com
**  support@destronmedia.com
*/
ini_name = argument0;
currentscore = argument1;

scorecheck = load_highscore(ini_name);

if (currentscore > scorecheck) 
    {
    return 1;
    }
else
    {
    return 0;
    }
