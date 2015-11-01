
    obj_room.room_disrupt[array_length_1d(obj_room.room_disrupt)] = argument1; 
    show_message(argument0);
    randbrick =  obj_room.room_tile_set[random(4)]
    rand_tile = instance_nearest( random(192), random(192), randbrick);
    with (rand_tile)
    {
        destroy_kind = ef_ring;
        //change tile to a disruption tile
        instance_change(argument1, true);
    }

