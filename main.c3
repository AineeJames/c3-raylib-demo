module main;

import std::io;
import rl;
import std::collections::list;
import std::math::random;
import constants;
import box;

fn void main(String[] args) {
    rl::init_window(constants::WIN_W, constants::WIN_H, "Hello from c3");
    defer rl::close_window();
    rl::set_target_fps(120);

    List(<box::Box>) boxes;
    boxes.new_init();
    defer boxes.free();

    for (usz i = 0; i < constants::BOXES_COUNT; i++) {
        box::Box box;
        boxes.push(box.randomize());
    }

    while (!rl::window_should_close()) {
        float dt = rl::get_frame_time();
        rl::begin_drawing();
            rl::clear_background({18, 18, 18, 255});
            foreach (&box : boxes) {
                box.draw();
                box.update(dt);
            }
        rl::end_drawing();
    }
}
