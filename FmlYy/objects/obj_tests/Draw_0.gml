event_inherited();

draw_set_alpha(1);
draw_set_font(fnt_courier_new);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var version_string = "FMOD version: " + fml_fmod_version_to_string(FMOD_VERSION);
draw_text_color(30, 30, version_string, c_white, c_white, c_white, c_white, 1);

var color = white;
var x_origin = 30;
var y_origin = 60;
var x_offset = 0;
var y_offset = 0;
for (var i = 0; i < array_length(suites); ++i) {
    var suite = suites[@ i];
    var max_width = 0;
    var suite_color = test_result_state_color(suite_states[@ i]);
    draw_text_color(round(x_origin + x_offset), round(y_origin + y_offset), suite.name, suite_color, suite_color, suite_color, suite_color, 1.0);
    y_offset += string_height(suite.name) * 1.5;
    for (var j = 0; j < array_length(suite.tests); ++j) {
        var test = suite.tests[@ j];
        var result = results[@ i][@ j];
        var text = test.name;
        
        var prev_color = color;
        if (result == undefined) {
            text = "... " + text;
        }
        color = test_result_state_color(result != undefined ? result.state : undefined);
        if (color != prev_color) {
            draw_set_color(color);
        }
        
        draw_text(round(x_origin + x_offset), round(y_origin + y_offset), text);
        y_offset += string_height(text);
        max_width = max(max_width, string_width(test.name));
    }
    x_offset += max_width + 20;
    y_offset = 0;
}
