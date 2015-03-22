if (!(livingZombies & RED_ZOMBIE)) {
    cage_spawn_zombie(obj_red_zombie);
    livingZombies |= RED_ZOMBIE;
} else if (!(livingZombies & BLUE_ZOMBIE)) {
    cage_spawn_zombie(obj_blue_zombie);
    livingZombies |= BLUE_ZOMBIE;
} else if (!(livingZombies & ORANGE_ZOMBIE)) {
    cage_spawn_zombie(obj_orange_zombie);
    livingZombies |= ORANGE_ZOMBIE;
} else if (!(livingZombies & PINK_ZOMBIE)) {
    cage_spawn_zombie(obj_zombie);
    livingZombies |= PINK_ZOMBIE;
}

if (!(livingZombies & RED_ZOMBIE) || !(livingZombies & ORANGE_ZOMBIE) ||
    !(livingZombies & BLUE_ZOMBIE) || !(livingZombies & PINK_ZOMBIE)) {
    alarm[0] = 120;
}
