event_inherited();

if (suite_index < array_length(suites)) {
    
    var start_time = get_timer();
    while (get_timer() - start_time < 1000000 / 60) {
        var suite = suites[@ suite_index];
        if (test_index < array_length(suite.tests)) {
            var test = suite.tests[@ test_index];
            var result = test.run();
            if (result.state == TEST_RESULT_STATE.Error) {
                var str = "TEST FAILED\n" + string(test.name) + "\n\n" + result.error_message + "\n\n";
                for (var i = 0; i < array_length(result.error_callstack); ++i) {
                    str += string(result.error_callstack[@ i]) + "\n";
                }
                show_message(str);
            }
            if (suite_states[@ suite_index] == undefined) {
                suite_states[@ suite_index] = result.state;
            }
            else {
                suite_states[@ suite_index] = min(suite_states[@ suite_index], result.state);
            }
            results[@ suite_index][@ test_index] = result;
            ++test_index;
        }
        else {
            ++suite_index;
            test_index = 0;
            if (suite_index >= array_length(suites)) {
                break;
            }
        }
    }
}
