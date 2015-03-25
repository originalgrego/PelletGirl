//Spawns a zombie just above the cage

var zombieType = argument0;

var zombieSprite = object_get_sprite(zombieType);
var spriteHeight = sprite_get_height(zombieSprite);
var zombie = instance_create(x + (sprite_width / 2), y - (spriteHeight / 2), zombieType); 