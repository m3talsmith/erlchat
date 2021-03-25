-module(server).

-export([start/0]).

start() -> start_host(localhost, 4000).

start_host(Host, Port) ->
    log("~p:~p~n", [Host, Port]),
    loop().

loop() ->
    receive
        {log, Msg, Args} ->
            log(Msg, Args),
            loop();
        {Who, stop} -> log("~p stopped the server!~n", [Who]);
        {} ->
            log("Bad message~n", []),
            loop()
    end.

log(Msg, Args) -> io:format(Msg, Args).
