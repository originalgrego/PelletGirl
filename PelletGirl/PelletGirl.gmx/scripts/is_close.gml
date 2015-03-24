//Method which can be called to determine if an object is "close" to the current object.
//"close" is considered within a 3 pixel radius

var otherObject = argument0;

var distance =  sqrt(sqr(otherObject.x - x) + sqr(otherObject.y - y));

return distance < 3;
