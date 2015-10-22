
pos_string = string(x /32 + 1) + " + " + string(y / 32 + 1);
//show_debug_message(pos_string);
var onlyMatchesFound_hor = 1;
var xoffset_hor = 0; // 
var matches_hor = 1; // amount of matches
var deleteMatches_hor = 0; //  flag to if you found atleast 3 matches
var matchesToDelete_hor;

var onlyMatchesFound_ver = 1;
var xoffset_ver = 0; // 
var matches_ver = 1; // amount of matches
var deleteMatches_ver = 0; //  flag to if you found atleast 3 matches
var matchesToDelete_ver;

beg_inst = instance_position(x + 32, y, object_tile);

if (beg_inst != noone)
{
    if (beg_inst.object_index == object_index)
    {
        onlyMatchesFound_hor = 0;
    }
    
}

while (onlyMatchesFound_hor)
{
    xoffset_hor +=1;
    last_inst = instance_position(x - xoffset_hor * 32, y, object_tile);

    if (last_inst != noone)
    {
        if (last_inst.object_index == object_index)
        {
            matchesToDelete_hor[xoffset_hor - 1] = last_inst;
            matches_hor += 1;
            if (matches_hor >= 3)
            {
                deleteMatches_hor = 1;
            }
        }
        else {
            onlyMatchesFound_hor = 0; // not a match 
        }
    }
    else
    {
        onlyMatchesFound_hor = 0;
    }
}

beg_inst = instance_position(x , y + 32, object_tile);

if (beg_inst != noone)
{
    if (beg_inst.object_index == object_index)
    {
        onlyMatchesFound_ver = 0;
    }
    
}

while (onlyMatchesFound_ver)
{
    xoffset_ver +=1;
    last_inst = instance_position(x , y - xoffset_ver * 32, object_tile);

    if (last_inst != noone)
    {
        if (last_inst.object_index == object_index)
        {
            matchesToDelete_ver[xoffset_ver - 1] = last_inst;
            matches_ver += 1;
            if (matches_ver >= 3)
            {
                deleteMatches_ver = 1;
            }
        }
        else {
            onlyMatchesFound_ver = 0; // not a match 
        }
    }
    else
    {
        onlyMatchesFound_ver = 0;
    }
}

/*
if (matches_ver >= 3)
{
    for (var i = 0 ; i < array_length_1d(matchesToDelete_ver); i++;)
    {
       with (matchesToDelete_ver[i])
       {
        //instance_create(x,y,obj_rooom.room_tile_set[random(4)]);
        instance_destroy();
       } 
    }
    //instance_create(x,y,obj_rooom.room_tile_set[random(4)]);
    instance_destroy();
}

if (matches_hor >= 3)
{
    for (var i = 0 ; i < array_length_1d(matchesToDelete_hor); i++;)
    {
       with (matchesToDelete_hor[i])
       {
        //instance_create(x,y,obj_rooom.room_tile_set[random(4)]);
        instance_destroy();
       } 
    }
    //instance_create(x,y,obj_rooom.room_tile_set[random(4)]);
    instance_destroy();
} 
*/
