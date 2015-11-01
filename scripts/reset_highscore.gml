/*
**  Usage:
**      reset_highscore(ini name)
**
**  Arguments:
**      ini name     Name of your ini file 
**
**  Returns: Nothing
**
**  ngm.destronmedia.com
**  support@destronmedia.com
*/

ini_name = argument0;

ini_open(ini_name);
ini_write_real('score','highscore',0);
ini_close();
