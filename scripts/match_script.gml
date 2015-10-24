#define match_script
match = ds_list_create();
notmatch = ds_list_create();
worklist = ds_stack_create();
current_inst = instance_position(x , y, object_tile);
ds_list_add(match, current_inst);
 
find_nodes(worklist,match,notmatch,current_inst);
//show_debug_message( ds_list_size(match));
find_matches(match);

#define find_nodes
worklist = argument0;
match = argument1;
notmatch = argument2;
current_inst = argument3;

left_inst = instance_position(current_inst.x  - 32, current_inst.y, object_tile);
top_inst = instance_position(current_inst.x , current_inst.y - 32, object_tile);
right_inst = instance_position(current_inst.x + 32 , current_inst.y, object_tile);
bottom_inst = instance_position(current_inst.x , current_inst.y + 32, object_tile);
//ds_stack_push(match, current_inst);

if (left_inst != noone)
{
    if (ds_list_find_index(match, left_inst) == -1)
    {
        if (ds_list_find_index(notmatch, left_inst) == -1)
        {
            ds_stack_push(worklist, left_inst);
        }
    }

}
if (top_inst != noone)
{
    if (ds_list_find_index(match, top_inst) == -1)
    {
        if (ds_list_find_index(notmatch, top_inst) == -1)
        {
            ds_stack_push(worklist, top_inst);
        }
    }

}
if (right_inst != noone)
{
    if (ds_list_find_index(match, right_inst) == -1)
    {
        if (ds_list_find_index(notmatch, right_inst) == -1)
        {
            ds_stack_push(worklist, right_inst);
        }
    }

}
if (bottom_inst != noone)
{
    if (ds_list_find_index(match, bottom_inst) == -1)
    {
        if (ds_list_find_index(notmatch, bottom_inst) == -1)
        {
            ds_stack_push(worklist, bottom_inst);
        }
    }

}

while (!ds_stack_empty(worklist))
{
    testinst = ds_stack_pop(worklist);
    
    if (testinst.object_index == object_index)
    {
        ds_list_add(match, testinst);
        find_nodes(worklist,match,notmatch,testinst);
        //show_debug_message( ds_stack_size(worklist));
    }
    else
    {
        ds_list_add(notmatch, testinst);
    
    }
}

#define find_matches
match = argument0
var matchesDelete;
matchesDelete[0] = 0;
for (var i = 0 ; i <  ds_list_size(match); i++;)
{
   with (match[|i])
   {
     hor = hor_check();
     ver = ver_check();
     
     if ( is_array(hor))
     {
        matchesDelete = array_merge( hor,matchesDelete);
        
     }
     if ( is_array(ver))
     {
        matchesDelete = array_merge(ver, matchesDelete);
     }
   } 
}
matchesDelete = rmdup(matchesDelete);
//show_debug_message(matchesDelete);
destroyMatches(matchesDelete);

#define hor_check

var onlyMatchesFound_hor = 1;
var xoffset_hor = 0; // 
var matches_hor = 1; // amount of matches
var deleteMatches_hor = 0; //  flag to if you found atleast 3 matches
var matchesToDelete_hor;



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

if (matches_hor >= 3)
            {
                //show_debug_message(array_length_1d(matchesToDelete_hor));
                matchesToDelete_hor[array_length_1d(matchesToDelete_hor)] = id;
                return matchesToDelete_hor;
            }
    




#define ver_check
var onlyMatchesFound_ver = 1;
var xoffset_ver = 0; // 
var matches_ver = 1; // amount of matches
var deleteMatches_ver = 0; //  flag to if you found atleast 3 matches
var matchesToDelete_ver;

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

if (matches_ver >= 3)
            {
                //show_debug_message(array_length_1d(matchesToDelete_ver));
                matchesToDelete_ver[array_length_1d(matchesToDelete_ver)] = id;
                return matchesToDelete_ver;
            }

#define array_merge
// array_merge(array, array)
var arr = argument[0],
    add = argument[1],
    i = array_length_1d(arr),
    n = 0;
repeat (array_length_1d(add)) {
    arr[i] = add[n];
    n++;
    i++;
}
return arr;

#define destroyMatches

// goes through each matches in the list of matches to delete
//and destroys them


matchesToDelete_hor = argument0;
for (var i = 0 ; i < array_length_1d(matchesToDelete_hor) -1; i++;)
    {  
        if (instance_exists(matchesToDelete_hor[i]))
        {
           with (matchesToDelete_hor[i])
           {

           
            instance_destroy();
            
            //add 50 to score for each block
            score += 50;
           }
       }  
       
    }


#define rmdup
array = argument0;
var temp;
duplicate = 0;
k = 0;
for (var i = 0 ; i < array_length_1d(array); i++;)
{
    current = array[i];
    duplicate = 0;
    for (var j = i + 1 ; j < array_length_1d(array); j++;)
    {
        if (current == array[j])
            duplicate = 1;
    }
    if (!duplicate)
    {
        temp[k] = current;
        k += 1;
    }
}
return temp;