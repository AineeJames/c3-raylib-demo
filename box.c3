module box;

import rl;
import constants;
import std::io;

struct Box
{
    Color color;
    Vector2 position;
    Vector2 size;
    Vector2 velocity;
}

fn void Box.print(Box* box) {
    io::printfn("Box(color=%s, position=%s, size=%s, velocity=%s)", box.color, box.position, box.size, box.velocity);
}

fn void Box.draw(Box* box) {
    rl::draw_rectangle((int)box.position.x, (int)box.position.y, (int)box.size.x, (int)box.size.y, box.color);
}

fn Box Box.randomize(Box* box) {
    box.size = {
        rl::get_random_value(constants::MIN_BOX_SIZE, constants::MAX_BOX_SIZE),
        rl::get_random_value(constants::MIN_BOX_SIZE, constants::MAX_BOX_SIZE)
    };
    box.color = rl::color_from_hsv(rl::get_random_value(0, 360), 0.5, 0.75);
    box.position = {
        rl::get_random_value(0, constants::WIN_W - (int)box.size.x),
        rl::get_random_value(0, constants::WIN_H - (int)box.size.y)
    };
    box.velocity = {
        rl::get_random_value(constants::MIN_VEL, constants::MAX_VEL),
        rl::get_random_value(constants::MIN_VEL, constants::MAX_VEL)
    };
    return *box;
}

fn bool Box.is_on_floor(Box* box) {
    return (box.position.y + box.size.y) >= (constants::WIN_H - constants::EPSILON);
}

fn void Box.update(Box* box, float dt) {
    box.velocity.y += constants::GRAVITY;
    Vector2 new_pos = box.position + (box.velocity * dt);
    if (new_pos.y >= constants::WIN_H - box.size.y || new_pos.y <= 0) {
        box.velocity.y *= -constants::BOUNCE_FACTOR;
    } else {
        box.position.y = new_pos.y;
    }
    if (new_pos.x >= constants::WIN_W - box.size.x || new_pos.x <= 0) {
        box.velocity.x *= -constants::BOUNCE_FACTOR;
    } else {
        box.position.x = new_pos.x;
    }

    if (box.is_on_floor()) {
        box.velocity.x *= constants::FRICTION;
    }
}
