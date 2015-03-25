//TODO: break this up into multiple methods

var baseSpeed = 1;

//Slow down zombies during superMode
if (global.superMode) {
    baseSpeed = 0.5;
}


//Loop until a decision is made, allows for fall throughs from the decision logic due
//to bad RNG (random numbers)
var decisionMade = false;
while(!decisionMade) {
    //If the zombie is smart, or superMode is active use the tracking logic
    if (smart || global.superMode) {
        var pelletGirl = instance_find(obj_pellet_girl, 0);

        //Everything starts off with very low chances
        var leftChance = 5;
        var rightChance = 5;
        var upChance = 5;
        var downChance = 5;

        //The primary and secondary movement choices start off with the same chance
        var primaryChance = 75;
        var secondaryChance = 75;

        //Figure out y parts of vector, magnitude, and direction to Pellet Girl
        var yVector = pelletGirl.y - y;
        var yMagnitude = abs(yVector);
        var yDirection = sign(yVector);

        //Figure out x parts of vector, magnitude, and direction to Pellet Girl
        var xVector = pelletGirl.x - x;
        var xMagnitude = abs(xVector);
        var xDirection = sign(xVector);

        //Determine the ratio of the xMagnitude to the yMagnitude both ways.
        //This will be used to determine whether we need to go more in the x or y
        //direction to reach Pellet Girl.
        var ratioYDivX = yMagnitude / (xMagnitude + 1);
        var ratioXDivY = xMagnitude / (yMagnitude + 1);
                
        //Invert the x and y directions, effectively causing the ghost to follow a
        //Pellet Girl on the opposite side of the screen :D
        if (global.superMode) {
            yDirection *= -1;
            xDirection *= -1;
        }

        //If we need to go more in the y direction than x        
        if (yMagnitude > xMagnitude) {
            //Weight the primary and secondary chances based on the ratios of the x and y
            //magnitudes
            primaryChance *= ratioYDivX;
            secondaryChance *= ratioXDivY;

            //If Pellet Girl is up from the zombie, give the primaryChance to the 
            //up direction, otherwise give it to down
            if (yDirection < 0) {
                upChance = primaryChance;
            } else {
                downChance = primaryChance;        
            }

            //If Pellet Girl is left of the zombie give the primaryChance to 
            //the left direction, otherwise give it to right
            if (xDirection < 0) {
                leftChance = secondaryChance;
            } else {
                rightChance = secondaryChance;        
            }
        } else { //Same as before, except we need to go in the x direction more than y
            primaryChance *= ratioXDivY;
            secondaryChance *= ratioYDivX;

            if (xDirection < 0) {
                leftChance = primaryChance;
            } else {
                rightChance = primaryChance;        
            }

            if (yDirection < 0) {
                upChance = secondaryChance;
            } else {
                downChance = secondaryChance;        
            }
        }

        //Use the move mask as well as a lottery to determine which direction to move
        //this may fall through which will result in this logic being called again due
        //to the massive loop above.  I'm insane and this project was done on a very
        //tight schedule.  Please forgive the zombies insane logic.
        if (random(100) < rightChance && (moveMask & MOVE_R)) {
          hspeed = baseSpeed;
          vspeed = 0;
          decisionMade = true;
        } else if (random(100) < leftChance && (moveMask & MOVE_L)) {
          hspeed = -baseSpeed;
          vspeed = 0;
          decisionMade = true;
        } else if (random(100) < downChance && (moveMask & MOVE_D)) {
          hspeed = 0;
          vspeed = baseSpeed;
          decisionMade = true;
        } else if (random(100) < upChance && (moveMask & MOVE_U)) {
          hspeed = 0;
          vspeed = -baseSpeed;
          decisionMade = true;
        }
    } else {
        //Dumb zombies?  Just do whatever.
        var randomNumber = random(100);
        if (randomNumber < 25 && (moveMask & MOVE_R)) {
          hspeed = baseSpeed;
          vspeed = 0;
          decisionMade = true;
        } else if (randomNumber < 50 && (moveMask & MOVE_L)) {
          hspeed = -baseSpeed;
          vspeed = 0;
          decisionMade = true;
        } else if (randomNumber < 75 && (moveMask & MOVE_D)) {
          hspeed = 0;
          vspeed = baseSpeed;
          decisionMade = true;
        } else if ((moveMask & MOVE_U)) {
          hspeed = 0;
          vspeed = -baseSpeed;
          decisionMade = true;
        }
    }
}

//Do this all over again in 200/30 seconds... why 6.666 repeating seconds?  Mwahahahaha
alarm[0] = random(200);