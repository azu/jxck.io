%%%-------------------------------------------------------------------
%% @doc http worker supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(http_worker_sup).

-include("logger.hrl").

%% API
-export([start_link/0, start_child/1]).

%% Supervisor callbacks
-export([init/1]).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    ?Log(supervisor:start_link({local, ?MODULE}, ?MODULE, [])).

start_child(Socket) ->
    ?Log(supervisor:start_child(?MODULE, [Socket])).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
    Children = [
                {
                 http_worker,
                 {http_worker, start_link, []},
                 temporary, 5, worker, []}
               ],
    {ok, {{simple_one_for_one, 0, 1}, Children}}.
