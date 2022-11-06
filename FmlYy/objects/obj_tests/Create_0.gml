event_inherited();

suites = [  /// @is {TestSuite[]}
    make_test_suite_Misc(),
    make_test_suite_FmodSystem(),
    make_test_suite_FmodEventDescription(),
    make_test_suite_FmodEventInstance(),
    make_test_suite_FmodStudioSystem(),
    make_test_suite_FmodBus(),
    make_test_suite_FmodBank(),
    make_test_suite_FmodVca(),
    make_test_suite_Structs(),
];

suite_states = array_create(array_length(suites), undefined);   /// @is {TEST_RESULT_STATE[]}

results = [];   /// @is {TestResult[][]}
for (var i = 0; i < array_length(suites); ++i) {
    var suite = suites[@ i];
    results[@ i] = array_create(array_length(suite.tests), undefined);
}

suite_index = 0;    /// @is {int}
test_index = 0;     /// @is {int}

green   = make_color_rgb(65, 255, 65);      /// @is {int}
yellow  = make_color_rgb(255, 255, 65);     /// @is {int}
red     = make_color_rgb(255, 65, 65);      /// @is {int}
white   = make_color_rgb(221, 221, 221);    /// @is {int}
gray    = make_color_rgb(150, 150, 150);    /// @is {int}

/// @param {TEST_RESULT_STATE} state
/// @returns {int}
function test_result_state_color(state)
{
    if (state == undefined) {
        return gray;
    }
    switch (state) {
        case TEST_RESULT_STATE.Success:         return green;
        case TEST_RESULT_STATE.Error:           return red;
        case TEST_RESULT_STATE.Todo:            return yellow;
        case TEST_RESULT_STATE.NotImplemented:  return white;
    }
}