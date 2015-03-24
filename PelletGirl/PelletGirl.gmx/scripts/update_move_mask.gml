//Updates the move mask for a zombie, does so by checking each direction for a wall and setting bits in our move mask.

if (!place_meeting(x + 1, y, obj_wall_base)) {
  moveMask |= MOVE_R;
} else {
  moveMask &= ~MOVE_R;
}

if (!place_meeting(x - 1, y, obj_wall_base)) {
  moveMask |= MOVE_L;
} else {
  moveMask &= ~MOVE_L;
}

if (!place_meeting(x, y + 1, obj_wall_base)) {
  moveMask |= MOVE_D;
} else {
  moveMask &= ~MOVE_D;
}


if (!place_meeting(x, y - 1, obj_wall_base)) {
  moveMask |= MOVE_U;
} else {
  moveMask &= ~MOVE_U;
}
