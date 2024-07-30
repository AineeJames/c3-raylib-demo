module rl;

def Color = char[<4>];
def Vector2 = float[<2>];
def Vector3 = float[<3>];

extern fn void init_window(int width, int height, char* title) @extern("InitWindow");
extern fn bool window_should_close() @extern("WindowShouldClose");
extern fn void close_window() @extern("CloseWindow");
extern fn void begin_drawing() @extern("BeginDrawing");
extern fn void end_drawing() @extern("EndDrawing");
extern fn void clear_background(Color color) @extern("ClearBackground");
extern fn int get_random_value(int min, int max) @extern("GetRandomValue");
extern fn Color color_from_hsv(float hue, float saturation, float value) @extern("ColorFromHSV");

extern fn void draw_rectangle(int pos_x, int pos_y, int width, int height, Color color) @extern("DrawRectangle");
extern fn void set_target_fps(int fps) @extern("SetTargetFPS");
extern fn float get_frame_time() @extern("GetFrameTime");
