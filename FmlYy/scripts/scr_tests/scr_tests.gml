
/// @param {string} message = undefined
function AssertionFailedException(_message = undefined) constructor
{
    message = _message ?? "Assertion failed.";  /// @is {string}
    longMessage = message;                      /// @is {string}
    script = "";                                /// @is {string}
    line = 0;                                   /// @is {number}
    stacktrace = debug_get_callstack();         /// @is {string[]}
}

/// @param {string}     name
/// @param {function}   func
/// @param {TestSuite}  suite
function Test(_name, _func, _suite) constructor
{
    name = _name;   /// @is {string}
    func = _func;   /// @is {function}
    suite = _suite; /// @is {TestSuite}
    
    /// @returns {TestResult}
    static run = function()
    {
        try {
            var ret = func();
            
            var state = TEST_RESULT_STATE.Success;
            var is_implemented = suite.is_implemented_func(name);
            if (is_implemented != undefined && !is_implemented) {
                state = TEST_RESULT_STATE.NotImplemented;
            }
            else if (ret == "TODO") {
                state = TEST_RESULT_STATE.Todo;
            }
            
            return new TestResult(self, state, undefined, undefined);
        }
        catch (e) {
            return new TestResult(self, TEST_RESULT_STATE.Error, e.message, e.stacktrace);
        }
    }
}

/// @param {string} name
function TestSuite(_name) constructor
{
    name = _name;   /// @is {string}
    tests = [];     /// @is {Test[]}
    is_implemented_func = function(test_name) { /// @is {function<string, bool?>}
        return undefined;
    }
    
    /// @param {string} name
    /// @param {function} test_func
    static add_test = function(name, test_func)
    {
        array_push(tests, new Test(name, test_func, self));
    }
}

/// @param {Test}               test
/// @param {TEST_RESULT_STATE}  state
/// @param {string?}            error_message
/// @param {string[]?}          error_callstack
function TestResult(_test, _state, _error_message, _error_callstack) constructor
{
    test = _test;                       /// @is {Test}
    state = _state;                     /// @is {TEST_RESULT_STATE}
    error_message = _error_message;     /// @is {string?}
    error_callstack = _error_callstack; /// @is {string[]?}
}

enum TEST_RESULT_STATE
{
    // The order of these variants matters.
    // The smaller the value, the more dominant it is when considering the
    // total composite state of a test suite.
    Error = 0,
    NotImplemented,
    Success,
    Todo,
}
