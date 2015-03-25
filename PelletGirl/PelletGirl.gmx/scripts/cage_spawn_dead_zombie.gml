//Spawns the correct zombie based on which zombies are currently in play.  If any 
//zombies remain in the cage an alarm is set to call this method after a short duration.

if (!(livingZombies & RED_ZOMBIE)) {
    cage_spawn_zombie(obj_red_zombie);
    livingZombies |= RED_ZOMBIE;
} else if (!(livingZombies & BLUE_ZOMBIE)) {
    cage_spawn_zombie(obj_blue_zombie);
    livingZombies |= BLUE_ZOMBIE;
} else if (!(livingZombies & ORANGE_ZOMBIE)) {
    cage_spawn_zombie(obj_orange_zombie);
    livingZombies |= ORANGE_ZOMBIE;
} else if (!(livingZombies & GREEN_ZOMBIE)) {
    cage_spawn_zombie(obj_zombie);
    livingZombies |= GREEN_ZOMBIE;
}

if (!(livingZombies & RED_ZOMBIE) || !(livingZombies & ORANGE_ZOMBIE) ||
    !(livingZombies & BLUE_ZOMBIE) || !(livingZombies & GREEN_ZOMBIE)) {
    alarm[0] = 120;
}