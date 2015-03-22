var baseSpeed = 1;
if (global.superMode) {
    baseSpeed = 0.5;
}

var decisionMade = false;
while(!decisionMade) {
    if (smart || global.superMode) {
        var pelletGirl = instance_find(obj_pellet_girl, 0);

        var leftChance = 5;
        var rightChance = 5;
        var upChance = 5;
        var downChance = 5;
        var primaryChance = 75;
        var secondaryChance = 75;

        var yVector = pelletGirl.y - y;
        var yMagnitude = abs(yVector);
        var yDirection = sign(yVector);

        var xVector = pelletGirl.x - x;
        var xMagnitude = abs(xVector);
        var xDirection = sign(xVector);

        var ratioYDivX = yMagnitude / (xMagnitude + 1);
        var ratioXDivY = xMagnitude / (yMagnitude + 1);
                
        if (global.superMode) {
            yDirection *= -1;
            xDirection *= -1;
        }
        
        if (yMagnitude > xMagnitude) {
            primaryChance *= ratioYDivX;
            secondaryChance *= ratioXDivY;

            if (yDirection < 0) {
                upChance = primaryChance;
            } else {
                downChance = primaryChance;        
            }

            if (xDirection < 0) {
                leftChance = secondaryChance;
            } else {
                rightChance = secondaryChance;        
            }
        } else {
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

alarm[0] = random(200);