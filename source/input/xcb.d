module input.xcb;

import xcb.xcb;
import types;
import globals.xcb;


struct
Input {
    _Input_Event _input_event;
    bool         _readed;

    ref _Input_Event 
    front () {
        return _input_event;
    }
    
    bool 
    empty () {
        if (_readed)
            return false;
        else {
            // check
            xcb_generic_event_t* e = xcb_poll_for_event (c);
            if (e !is null) {
                xcb_event_to_input_event (e,_input_event);
                import core.stdc.stdlib : free;
                free (e);
                _readed = true;
                return false;
            }
            else {
                return true;
            }            
        }
    }

    void 
    popFront () {
        _readed = false;
    }

    bool
    wait_for_event () {
        xcb_generic_event_t* e = xcb_wait_for_event (c);
        if (e !is null) {
            xcb_event_to_input_event (e,_input_event);
            import core.stdc.stdlib : free;
            free (e);
            _readed = true;
            return true;
        }
        else {
            return false;
        }
    }
}

void
_wait_for_event (xcb_connection_t* con) {
    xcb_generic_event_t* event;

    import select.select : Select, FD;

    struct
    Event_file {
        FD fd;

        void
        on_select () {
            import std.stdio : writeln;
            alias log = writeln;
            log ("  on_select");
            log ("    fd: ",fd);
        }    
    }

    auto event_file = Event_file (xcb_get_file_descriptor (con));

    Select (event_file);
}

void
xcb_event_to_input_event (xcb_generic_event_t* e, ref _Input_Event _input_event) {
    switch (e.response_type & ~0x80) {
        case XCB_KEY_PRESS: {
            auto _e = cast (xcb_key_press_event_t*) e;
            _input_event.time  = typeof(_Input_Event.time) (_e.time/1000,_e.time%1000); // millisec
            _input_event.input_event.type  = Input_Event.Type.KEY;
            _input_event.input_event.code  = _e.detail;
            _input_event.input_event.value = 1;
            break;
        }
        case XCB_KEY_RELEASE: {
            auto _e = cast (xcb_key_release_event_t*) e;
            _input_event.time  = typeof(_Input_Event.time) (_e.time/1000,_e.time%1000); // millisec
            _input_event.input_event.type  = Input_Event.Type.KEY;
            _input_event.input_event.code  = _e.detail;
            _input_event.input_event.value = 0;
            break;
        }
        case XCB_BUTTON_PRESS: {
            import input.event.codes;
            auto _e = cast (xcb_button_press_event_t*) e;
            _input_event.time  = typeof(_Input_Event.time) (_e.time/1000,_e.time%1000); // millisec
            _input_event.input_event.type  = Input_Event.Type.KEY;
            _input_event.input_event.code  = 
                (_e.detail == 1) ? BTN_LEFT :
                (_e.detail == 2) ? BTN_RIGHT :
                (_e.detail == 3) ? BTN_MIDDLE :
                (_e.detail == 4) ? BTN_GEAR_UP   /* WHEEL UP   */ :
                (_e.detail == 5) ? BTN_GEAR_DOWN /* WHEEL DOWN */ : 
                0;
            _input_event.input_event.value = 1;
            break;
        }
        case XCB_BUTTON_RELEASE: {
            import input.event.codes;
            auto _e = cast (xcb_button_release_event_t*) e;
            _input_event.time  = typeof(_Input_Event.time) (_e.time/1000,_e.time%1000); // millisec
            _input_event.input_event.type  = Input_Event.Type.KEY;
            _input_event.input_event.code  = 
                (_e.detail == 1) ? BTN_LEFT :
                (_e.detail == 2) ? BTN_RIGHT :
                (_e.detail == 3) ? BTN_MIDDLE :
                (_e.detail == 4) ? BTN_GEAR_UP   /* WHEEL UP   */ :
                (_e.detail == 5) ? BTN_GEAR_DOWN /* WHEEL DOWN */ : 
                0;
            _input_event.input_event.value = 0;
            break;
        }
        case XCB_MOTION_NOTIFY: {
            auto _e = cast (xcb_motion_notify_event_t*) e;
            _input_event.time  = typeof(_Input_Event.time) (_e.time/1000,_e.time%1000); // millisec
            _input_event.input_event.type  = Input_Event.Type.REL;
            break;
        }
        case XCB_ENTER_NOTIFY: {
            auto _e = cast (xcb_enter_notify_event_t*) e;
            _input_event.time  = typeof(_Input_Event.time) (_e.time/1000,_e.time%1000); // millisec
            break;
        }
        case XCB_LEAVE_NOTIFY: {
            auto _e = cast (xcb_leave_notify_event_t*) e;
            break;
        }
        case XCB_FOCUS_IN: {
            auto _e = cast (xcb_focus_in_event_t*) e;
            break;
        }
        case XCB_FOCUS_OUT: {
            auto _e = cast (xcb_focus_out_event_t*) e;
            break;
        }
        case XCB_KEYMAP_NOTIFY: {
            auto _e = cast (xcb_keymap_notify_event_t*) e;
            break;
        }
        case XCB_EXPOSE: {
            auto expose_e = cast (xcb_expose_event_t*) e;
            break;
        }
        case XCB_GRAPHICS_EXPOSURE: {
            auto _e = cast (xcb_graphics_exposure_event_t*) e;
            break;
        }
        case XCB_NO_EXPOSURE: {
            auto _e = cast (xcb_no_exposure_event_t*) e;
            break;
        }
        case XCB_VISIBILITY_NOTIFY: {
            auto _e = cast (xcb_visibility_notify_event_t*) e;
            break;
        }
        case XCB_CREATE_NOTIFY: {
            auto _e = cast (xcb_create_notify_event_t*) e;
            break;
        }
        case XCB_DESTROY_NOTIFY: {
            auto _e = cast (xcb_destroy_notify_event_t*) e;
            break;
        }
        case XCB_UNMAP_NOTIFY: {
            auto _e = cast (xcb_unmap_notify_event_t*) e;
            break;
        }
        case XCB_MAP_NOTIFY: {
            auto _e = cast (xcb_map_notify_event_t*) e;
            break;
        }
        case XCB_MAP_REQUEST: {
            auto _e = cast (xcb_map_request_event_t*) e;
            break;
        }
        case XCB_REPARENT_NOTIFY: {
            auto _e = cast (xcb_reparent_notify_event_t*) e;
            break;
        }
        case XCB_CONFIGURE_NOTIFY: {
            auto _e = cast (xcb_configure_notify_event_t*) e;
            break;
        }
        case XCB_CONFIGURE_REQUEST: {
            auto _e = cast (xcb_configure_request_event_t*) e;
            break;
        }
        case XCB_GRAVITY_NOTIFY: {
            auto _e = cast (xcb_gravity_notify_event_t*) e;
            break;
        }
        case XCB_RESIZE_REQUEST: {
            auto _e = cast (xcb_resize_request_event_t*) e;
            break;
        }
        case XCB_CIRCULATE_NOTIFY: {
            auto _e = cast (xcb_circulate_notify_event_t*) e;
            break;
        }
        case XCB_CIRCULATE_REQUEST: {
            auto _e = cast (xcb_circulate_request_event_t*) e;
            break;
        }
        case XCB_PROPERTY_NOTIFY: {
            auto _e = cast (xcb_property_notify_event_t*) e;
            _input_event.time  = typeof(_Input_Event.time) (_e.time/1000,_e.time%1000); // millisec
            break;
        }
        case XCB_SELECTION_CLEAR: {
            auto _e = cast (xcb_selection_clear_event_t*) e;
            _input_event.time  = typeof(_Input_Event.time) (_e.time/1000,_e.time%1000); // millisec
            break;
        }
        case XCB_SELECTION_REQUEST: {
            auto _e = cast (xcb_selection_request_event_t*) e;
            _input_event.time  = typeof(_Input_Event.time) (_e.time/1000,_e.time%1000); // millisec
            break;
        }
        case XCB_SELECTION_NOTIFY: {
            auto _e = cast (xcb_selection_notify_event_t*) e;
            _input_event.time  = typeof(_Input_Event.time) (_e.time/1000,_e.time%1000); // millisec
            break;
        }
        case XCB_COLORMAP_NOTIFY: {
            auto _e = cast (xcb_colormap_notify_event_t*) e;
            break;
        }
        case XCB_CLIENT_MESSAGE: {
            auto _e = cast (xcb_client_message_event_t*) e;
            break;
        }
        case XCB_MAPPING_NOTIFY: {
            auto _e = cast (xcb_mapping_notify_event_t*) e;
            break;
        }
        case XCB_GE_GENERIC: {
            auto _e = cast (xcb_ge_generic_event_t*) e;
            break;
        }
        default:
    }    
}