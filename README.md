# rebar3_jupyter

Rebar plugin to start Jupyter notebooks/consoles directly like `rebar3 shell`
would.

## Build

    $ rebar3 compile

## Use

Add the plugin to your rebar config:

    {plugins, [rebar3_jupyter]}.

Then just call your plugin directly in an existing application:


    $ rebar3 jupyter
    ===> Fetching rebar3_jupyter
    ===> Compiling rebar3_jupyter
    <Plugin Output>
