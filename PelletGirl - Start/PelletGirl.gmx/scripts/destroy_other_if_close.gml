var close = is_close(other);

if (close) {
    with (other) {
        instance_destroy();
    }
}

return close;