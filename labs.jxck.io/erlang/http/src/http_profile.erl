-module(http_profile).

-export([run/0]).

run() ->
    eprof:start_profiling(processes()),
    http_sup:start_link(),

    timer:sleep(10 * 1000),

    eprof:stop_profiling(),
    eprof:analyze(total).
