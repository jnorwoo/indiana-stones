/*
==============================================================================================
Thank you for purchasing the Pause Extension asset!
It would help other users a lot if you took a minute to rate and review it on the marketplace!
https://marketplace.yoyogames.com/assets/631/pause-extension

If you have any problems, questions or suggestions, use the "Contact Publisher" link on the marketplace.

Please continue reading this script for instructions how to properly import and use this extension.

==============================================================================================


IMPORT INSTRUCTIONS:
There is an example project included in this pause system (PE_example_project.gmz) that you can 
use to test the Pause Extension or if you want more code examples. (see official documentation how to open .gmz files)

Please delete the included file after importing the Pause Extension to your own project,
because you do not need it for pausing to work.

- You will find the example project in the "Included Files" folder in the resource tree.



USAGE INSTRUCTIONS:

This pause extension is quite easy to use. Place obj_pause in your room and you're good to go.
- If your game uses physics, set the "pause_physics" variable to true in the create event of obj_pause.
- If your game is in 3D mode, use obj_pause_3d instead.

- You can avoid pausing certain instances (useful for GUI elements and menus).
  To avoid pausing an object, set it's parent to "parent_dont_pause".

  
For more information, read the comments in the code of the objects.
For 3D pausing to work you may need to alter some code in obj_pause_3d.




*/
