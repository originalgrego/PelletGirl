//Method that can be called during a collision event to destroy the other object if they 
//are "close" to the collision event initiator


var close = is_close(other);

if (close) {
    with (other) {
        instance_destroy();
    }
}

return close;
