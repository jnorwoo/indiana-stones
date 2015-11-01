/*
**  Usage:
**      load_highscore(ini name)
**
**  Arguments:
**      ini name     Name of your ini file 
**
**  Returns: Last saved high score if it exits, 0 if it doesn't
**
**  ngm.destronmedia.com
**  support@destronmedia.com
*/
ini_name = argument0;

if (file_exists(ini_name))
    {
    ini_open(ini_name);
    return ini_read_real('score','highscore',0);
    ini_close();
    }
else
    {
    return 0;    
    }
