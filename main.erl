-module(main).

-export([start/0]).

start() ->
    Srv = spawn(server, start, []),
    Srv ! {log, "hello, ~p!~n", ["world"]},
    Srv ! {},
    Srv ! {self(), stop}.
