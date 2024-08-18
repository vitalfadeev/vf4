module globals;

import app : App;
static App app;

static
this () {
    app._init ();
}
