-module(rebar3_jupyter_prv).

-behaviour(provider).

-export(
   [
    init/1,
    do/1,
    format_error/1
   ]).

-define(PROVIDER, jupyter).
-define(DEPS, [compile]).

-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    Provider = providers:create(
                 [
                  {name, ?PROVIDER},
                  {module, ?MODULE},
                  {bare, true},
                  {deps, ?DEPS},
                  {example, "rebar3 jupyter"},
                  {opts, []},
                  {short_desc, "Run Jupyter kernel like a shell"},
                  {desc, "Jupyter plugin to start notebooks or console shells"}
                 ]),

    State1 = rebar_state:add_provider(State, Provider),
    {ok, State1}.

-spec do(rebar_state:t()) -> {ok, rebar_state:t()} | {error, string()}.
do(State) ->
    code:add_pathsa(rebar_state:code_paths(State, all_deps)),

    ierl_exec:exec(jupyter, JArgs),
    {ok, State}.

-spec format_error(any()) ->  iolist().
format_error(Reason) ->
    io_lib:format("~p", [Reason]).
