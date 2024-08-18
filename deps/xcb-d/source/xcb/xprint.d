/*
 * This file generated automatically from xprint.xml by d_client.py.
 * Edit at your peril.
 */

/**
 * @defgroup XCB_XPrint_API XCB XPrint API
 * @brief XPrint XCB Protocol Implementation.
 * @{
 **/

module xcb.xprint;

import xcb.xcb;
import xcb.xproto;

extern (C):

enum int XCB_XPRINT_MAJOR_VERSION = 1;
enum int XCB_XPRINT_MINOR_VERSION = 0;

extern (C) __gshared extern xcb_extension_t xcb_x_print_id;

alias xcb_x_print_string8_t = char;

/**
 * @brief xcb_x_print_string8_iterator_t
 **/
struct xcb_x_print_string8_iterator_t {
	xcb_x_print_string8_t* data; /**<  */
	int rem; /**<  */
	int index; /**<  */
}

/**
 * @brief xcb_x_print_printer_t
 **/
struct xcb_x_print_printer_t {
	uint nameLen; /**<  */
	uint descLen; /**<  */
}

/**
 * @brief xcb_x_print_printer_iterator_t
 **/
struct xcb_x_print_printer_iterator_t {
	xcb_x_print_printer_t* data; /**<  */
	int rem; /**<  */
	int index; /**<  */
}

alias xcb_x_print_pcontext_t = uint;

/**
 * @brief xcb_x_print_pcontext_iterator_t
 **/
struct xcb_x_print_pcontext_iterator_t {
	xcb_x_print_pcontext_t* data; /**<  */
	int rem; /**<  */
	int index; /**<  */
}

enum xcb_x_print_get_doc_t {
	XCB_X_PRINT_GET_DOC_FINISHED = 0,
	XCB_X_PRINT_GET_DOC_SECOND_CONSUMER = 1
}

alias XCB_X_PRINT_GET_DOC_FINISHED = xcb_x_print_get_doc_t.XCB_X_PRINT_GET_DOC_FINISHED;
alias XCB_X_PRINT_GET_DOC_SECOND_CONSUMER = xcb_x_print_get_doc_t.XCB_X_PRINT_GET_DOC_SECOND_CONSUMER;

enum xcb_x_print_ev_mask_t {
	XCB_X_PRINT_EV_MASK_NO_EVENT_MASK = 0,
	XCB_X_PRINT_EV_MASK_PRINT_MASK = 1,
	XCB_X_PRINT_EV_MASK_ATTRIBUTE_MASK = 2
}

alias XCB_X_PRINT_EV_MASK_NO_EVENT_MASK = xcb_x_print_ev_mask_t.XCB_X_PRINT_EV_MASK_NO_EVENT_MASK;
alias XCB_X_PRINT_EV_MASK_PRINT_MASK = xcb_x_print_ev_mask_t.XCB_X_PRINT_EV_MASK_PRINT_MASK;
alias XCB_X_PRINT_EV_MASK_ATTRIBUTE_MASK = xcb_x_print_ev_mask_t.XCB_X_PRINT_EV_MASK_ATTRIBUTE_MASK;

enum xcb_x_print_detail_t {
	XCB_X_PRINT_DETAIL_START_JOB_NOTIFY = 1,
	XCB_X_PRINT_DETAIL_END_JOB_NOTIFY = 2,
	XCB_X_PRINT_DETAIL_START_DOC_NOTIFY = 3,
	XCB_X_PRINT_DETAIL_END_DOC_NOTIFY = 4,
	XCB_X_PRINT_DETAIL_START_PAGE_NOTIFY = 5,
	XCB_X_PRINT_DETAIL_END_PAGE_NOTIFY = 6
}

alias XCB_X_PRINT_DETAIL_START_JOB_NOTIFY = xcb_x_print_detail_t.XCB_X_PRINT_DETAIL_START_JOB_NOTIFY;
alias XCB_X_PRINT_DETAIL_END_JOB_NOTIFY = xcb_x_print_detail_t.XCB_X_PRINT_DETAIL_END_JOB_NOTIFY;
alias XCB_X_PRINT_DETAIL_START_DOC_NOTIFY = xcb_x_print_detail_t.XCB_X_PRINT_DETAIL_START_DOC_NOTIFY;
alias XCB_X_PRINT_DETAIL_END_DOC_NOTIFY = xcb_x_print_detail_t.XCB_X_PRINT_DETAIL_END_DOC_NOTIFY;
alias XCB_X_PRINT_DETAIL_START_PAGE_NOTIFY = xcb_x_print_detail_t.XCB_X_PRINT_DETAIL_START_PAGE_NOTIFY;
alias XCB_X_PRINT_DETAIL_END_PAGE_NOTIFY = xcb_x_print_detail_t.XCB_X_PRINT_DETAIL_END_PAGE_NOTIFY;

enum xcb_x_print_attr_t {
	XCB_X_PRINT_ATTR_JOB_ATTR = 1,
	XCB_X_PRINT_ATTR_DOC_ATTR = 2,
	XCB_X_PRINT_ATTR_PAGE_ATTR = 3,
	XCB_X_PRINT_ATTR_PRINTER_ATTR = 4,
	XCB_X_PRINT_ATTR_SERVER_ATTR = 5,
	XCB_X_PRINT_ATTR_MEDIUM_ATTR = 6,
	XCB_X_PRINT_ATTR_SPOOLER_ATTR = 7
}

alias XCB_X_PRINT_ATTR_JOB_ATTR = xcb_x_print_attr_t.XCB_X_PRINT_ATTR_JOB_ATTR;
alias XCB_X_PRINT_ATTR_DOC_ATTR = xcb_x_print_attr_t.XCB_X_PRINT_ATTR_DOC_ATTR;
alias XCB_X_PRINT_ATTR_PAGE_ATTR = xcb_x_print_attr_t.XCB_X_PRINT_ATTR_PAGE_ATTR;
alias XCB_X_PRINT_ATTR_PRINTER_ATTR = xcb_x_print_attr_t.XCB_X_PRINT_ATTR_PRINTER_ATTR;
alias XCB_X_PRINT_ATTR_SERVER_ATTR = xcb_x_print_attr_t.XCB_X_PRINT_ATTR_SERVER_ATTR;
alias XCB_X_PRINT_ATTR_MEDIUM_ATTR = xcb_x_print_attr_t.XCB_X_PRINT_ATTR_MEDIUM_ATTR;
alias XCB_X_PRINT_ATTR_SPOOLER_ATTR = xcb_x_print_attr_t.XCB_X_PRINT_ATTR_SPOOLER_ATTR;

/**
 * @brief xcb_x_print_print_query_version_cookie_t
 **/
struct xcb_x_print_print_query_version_cookie_t {
	uint sequence; /**<  */
}

/** Opcode for xcb_x_print_print_query_version. */
enum XCB_X_PRINT_PRINT_QUERY_VERSION = 0;

/**
 * @brief xcb_x_print_print_query_version_request_t
 **/
struct xcb_x_print_print_query_version_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
}

/**
 * @brief xcb_x_print_print_query_version_reply_t
 **/
struct xcb_x_print_print_query_version_reply_t {
	ubyte response_type; /**<  */
	ubyte pad0; /**<  */
	ushort sequence; /**<  */
	uint length; /**<  */
	ushort major_version; /**<  */
	ushort minor_version; /**<  */
}

/**
 * @brief xcb_x_print_print_get_printer_list_cookie_t
 **/
struct xcb_x_print_print_get_printer_list_cookie_t {
	uint sequence; /**<  */
}

/** Opcode for xcb_x_print_print_get_printer_list. */
enum XCB_X_PRINT_PRINT_GET_PRINTER_LIST = 1;

/**
 * @brief xcb_x_print_print_get_printer_list_request_t
 **/
struct xcb_x_print_print_get_printer_list_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	uint printerNameLen; /**<  */
	uint localeLen; /**<  */
}

/**
 * @brief xcb_x_print_print_get_printer_list_reply_t
 **/
struct xcb_x_print_print_get_printer_list_reply_t {
	ubyte response_type; /**<  */
	ubyte pad0; /**<  */
	ushort sequence; /**<  */
	uint length; /**<  */
	uint listCount; /**<  */
	ubyte[20] pad1; /**<  */
}

/** Opcode for xcb_x_print_print_rehash_printer_list. */
enum XCB_X_PRINT_PRINT_REHASH_PRINTER_LIST = 20;

/**
 * @brief xcb_x_print_print_rehash_printer_list_request_t
 **/
struct xcb_x_print_print_rehash_printer_list_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
}

/** Opcode for xcb_x_print_create_context. */
enum XCB_X_PRINT_CREATE_CONTEXT = 2;

/**
 * @brief xcb_x_print_create_context_request_t
 **/
struct xcb_x_print_create_context_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	uint context_id; /**<  */
	uint printerNameLen; /**<  */
	uint localeLen; /**<  */
}

/** Opcode for xcb_x_print_print_set_context. */
enum XCB_X_PRINT_PRINT_SET_CONTEXT = 3;

/**
 * @brief xcb_x_print_print_set_context_request_t
 **/
struct xcb_x_print_print_set_context_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	uint context; /**<  */
}

/**
 * @brief xcb_x_print_print_get_context_cookie_t
 **/
struct xcb_x_print_print_get_context_cookie_t {
	uint sequence; /**<  */
}

/** Opcode for xcb_x_print_print_get_context. */
enum XCB_X_PRINT_PRINT_GET_CONTEXT = 4;

/**
 * @brief xcb_x_print_print_get_context_request_t
 **/
struct xcb_x_print_print_get_context_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
}

/**
 * @brief xcb_x_print_print_get_context_reply_t
 **/
struct xcb_x_print_print_get_context_reply_t {
	ubyte response_type; /**<  */
	ubyte pad0; /**<  */
	ushort sequence; /**<  */
	uint length; /**<  */
	uint context; /**<  */
}

/** Opcode for xcb_x_print_print_destroy_context. */
enum XCB_X_PRINT_PRINT_DESTROY_CONTEXT = 5;

/**
 * @brief xcb_x_print_print_destroy_context_request_t
 **/
struct xcb_x_print_print_destroy_context_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	uint context; /**<  */
}

/**
 * @brief xcb_x_print_print_get_screen_of_context_cookie_t
 **/
struct xcb_x_print_print_get_screen_of_context_cookie_t {
	uint sequence; /**<  */
}

/** Opcode for xcb_x_print_print_get_screen_of_context. */
enum XCB_X_PRINT_PRINT_GET_SCREEN_OF_CONTEXT = 6;

/**
 * @brief xcb_x_print_print_get_screen_of_context_request_t
 **/
struct xcb_x_print_print_get_screen_of_context_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
}

/**
 * @brief xcb_x_print_print_get_screen_of_context_reply_t
 **/
struct xcb_x_print_print_get_screen_of_context_reply_t {
	ubyte response_type; /**<  */
	ubyte pad0; /**<  */
	ushort sequence; /**<  */
	uint length; /**<  */
	xcb_window_t root; /**<  */
}

/** Opcode for xcb_x_print_print_start_job. */
enum XCB_X_PRINT_PRINT_START_JOB = 7;

/**
 * @brief xcb_x_print_print_start_job_request_t
 **/
struct xcb_x_print_print_start_job_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	ubyte output_mode; /**<  */
}

/** Opcode for xcb_x_print_print_end_job. */
enum XCB_X_PRINT_PRINT_END_JOB = 8;

/**
 * @brief xcb_x_print_print_end_job_request_t
 **/
struct xcb_x_print_print_end_job_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	ubyte cancel; /**<  */
}

/** Opcode for xcb_x_print_print_start_doc. */
enum XCB_X_PRINT_PRINT_START_DOC = 9;

/**
 * @brief xcb_x_print_print_start_doc_request_t
 **/
struct xcb_x_print_print_start_doc_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	ubyte driver_mode; /**<  */
}

/** Opcode for xcb_x_print_print_end_doc. */
enum XCB_X_PRINT_PRINT_END_DOC = 10;

/**
 * @brief xcb_x_print_print_end_doc_request_t
 **/
struct xcb_x_print_print_end_doc_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	ubyte cancel; /**<  */
}

/** Opcode for xcb_x_print_print_put_document_data. */
enum XCB_X_PRINT_PRINT_PUT_DOCUMENT_DATA = 11;

/**
 * @brief xcb_x_print_print_put_document_data_request_t
 **/
struct xcb_x_print_print_put_document_data_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	xcb_drawable_t drawable; /**<  */
	uint len_data; /**<  */
	ushort len_fmt; /**<  */
	ushort len_options; /**<  */
}

/**
 * @brief xcb_x_print_print_get_document_data_cookie_t
 **/
struct xcb_x_print_print_get_document_data_cookie_t {
	uint sequence; /**<  */
}

/** Opcode for xcb_x_print_print_get_document_data. */
enum XCB_X_PRINT_PRINT_GET_DOCUMENT_DATA = 12;

/**
 * @brief xcb_x_print_print_get_document_data_request_t
 **/
struct xcb_x_print_print_get_document_data_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	xcb_x_print_pcontext_t context; /**<  */
	uint max_bytes; /**<  */
}

/**
 * @brief xcb_x_print_print_get_document_data_reply_t
 **/
struct xcb_x_print_print_get_document_data_reply_t {
	ubyte response_type; /**<  */
	ubyte pad0; /**<  */
	ushort sequence; /**<  */
	uint length; /**<  */
	uint status_code; /**<  */
	uint finished_flag; /**<  */
	uint dataLen; /**<  */
	ubyte[12] pad1; /**<  */
}

/** Opcode for xcb_x_print_print_start_page. */
enum XCB_X_PRINT_PRINT_START_PAGE = 13;

/**
 * @brief xcb_x_print_print_start_page_request_t
 **/
struct xcb_x_print_print_start_page_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	xcb_window_t window; /**<  */
}

/** Opcode for xcb_x_print_print_end_page. */
enum XCB_X_PRINT_PRINT_END_PAGE = 14;

/**
 * @brief xcb_x_print_print_end_page_request_t
 **/
struct xcb_x_print_print_end_page_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	ubyte cancel; /**<  */
	ubyte[3] pad0; /**<  */
}

/** Opcode for xcb_x_print_print_select_input. */
enum XCB_X_PRINT_PRINT_SELECT_INPUT = 15;

/**
 * @brief xcb_x_print_print_select_input_request_t
 **/
struct xcb_x_print_print_select_input_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	xcb_x_print_pcontext_t context; /**<  */
	uint event_mask; /**<  */
}

/**
 * @brief xcb_x_print_print_input_selected_cookie_t
 **/
struct xcb_x_print_print_input_selected_cookie_t {
	uint sequence; /**<  */
}

/** Opcode for xcb_x_print_print_input_selected. */
enum XCB_X_PRINT_PRINT_INPUT_SELECTED = 16;

/**
 * @brief xcb_x_print_print_input_selected_request_t
 **/
struct xcb_x_print_print_input_selected_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	xcb_x_print_pcontext_t context; /**<  */
}

/**
 * @brief xcb_x_print_print_input_selected_reply_t
 **/
struct xcb_x_print_print_input_selected_reply_t {
	ubyte response_type; /**<  */
	ubyte pad0; /**<  */
	ushort sequence; /**<  */
	uint length; /**<  */
	uint event_mask; /**<  */
	uint all_events_mask; /**<  */
}

/**
 * @brief xcb_x_print_print_get_attributes_cookie_t
 **/
struct xcb_x_print_print_get_attributes_cookie_t {
	uint sequence; /**<  */
}

/** Opcode for xcb_x_print_print_get_attributes. */
enum XCB_X_PRINT_PRINT_GET_ATTRIBUTES = 17;

/**
 * @brief xcb_x_print_print_get_attributes_request_t
 **/
struct xcb_x_print_print_get_attributes_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	xcb_x_print_pcontext_t context; /**<  */
	ubyte pool; /**<  */
	ubyte[3] pad0; /**<  */
}

/**
 * @brief xcb_x_print_print_get_attributes_reply_t
 **/
struct xcb_x_print_print_get_attributes_reply_t {
	ubyte response_type; /**<  */
	ubyte pad0; /**<  */
	ushort sequence; /**<  */
	uint length; /**<  */
	uint stringLen; /**<  */
	ubyte[20] pad1; /**<  */
}

/**
 * @brief xcb_x_print_print_get_one_attributes_cookie_t
 **/
struct xcb_x_print_print_get_one_attributes_cookie_t {
	uint sequence; /**<  */
}

/** Opcode for xcb_x_print_print_get_one_attributes. */
enum XCB_X_PRINT_PRINT_GET_ONE_ATTRIBUTES = 19;

/**
 * @brief xcb_x_print_print_get_one_attributes_request_t
 **/
struct xcb_x_print_print_get_one_attributes_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	xcb_x_print_pcontext_t context; /**<  */
	uint nameLen; /**<  */
	ubyte pool; /**<  */
	ubyte[3] pad0; /**<  */
}

/**
 * @brief xcb_x_print_print_get_one_attributes_reply_t
 **/
struct xcb_x_print_print_get_one_attributes_reply_t {
	ubyte response_type; /**<  */
	ubyte pad0; /**<  */
	ushort sequence; /**<  */
	uint length; /**<  */
	uint valueLen; /**<  */
	ubyte[20] pad1; /**<  */
}

/** Opcode for xcb_x_print_print_set_attributes. */
enum XCB_X_PRINT_PRINT_SET_ATTRIBUTES = 18;

/**
 * @brief xcb_x_print_print_set_attributes_request_t
 **/
struct xcb_x_print_print_set_attributes_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	xcb_x_print_pcontext_t context; /**<  */
	uint stringLen; /**<  */
	ubyte pool; /**<  */
	ubyte rule; /**<  */
	ubyte[2] pad0; /**<  */
}

/**
 * @brief xcb_x_print_print_get_page_dimensions_cookie_t
 **/
struct xcb_x_print_print_get_page_dimensions_cookie_t {
	uint sequence; /**<  */
}

/** Opcode for xcb_x_print_print_get_page_dimensions. */
enum XCB_X_PRINT_PRINT_GET_PAGE_DIMENSIONS = 21;

/**
 * @brief xcb_x_print_print_get_page_dimensions_request_t
 **/
struct xcb_x_print_print_get_page_dimensions_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	xcb_x_print_pcontext_t context; /**<  */
}

/**
 * @brief xcb_x_print_print_get_page_dimensions_reply_t
 **/
struct xcb_x_print_print_get_page_dimensions_reply_t {
	ubyte response_type; /**<  */
	ubyte pad0; /**<  */
	ushort sequence; /**<  */
	uint length; /**<  */
	ushort width; /**<  */
	ushort height; /**<  */
	ushort offset_x; /**<  */
	ushort offset_y; /**<  */
	ushort reproducible_width; /**<  */
	ushort reproducible_height; /**<  */
}

/**
 * @brief xcb_x_print_print_query_screens_cookie_t
 **/
struct xcb_x_print_print_query_screens_cookie_t {
	uint sequence; /**<  */
}

/** Opcode for xcb_x_print_print_query_screens. */
enum XCB_X_PRINT_PRINT_QUERY_SCREENS = 22;

/**
 * @brief xcb_x_print_print_query_screens_request_t
 **/
struct xcb_x_print_print_query_screens_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
}

/**
 * @brief xcb_x_print_print_query_screens_reply_t
 **/
struct xcb_x_print_print_query_screens_reply_t {
	ubyte response_type; /**<  */
	ubyte pad0; /**<  */
	ushort sequence; /**<  */
	uint length; /**<  */
	uint listCount; /**<  */
	ubyte[20] pad1; /**<  */
}

/**
 * @brief xcb_x_print_print_set_image_resolution_cookie_t
 **/
struct xcb_x_print_print_set_image_resolution_cookie_t {
	uint sequence; /**<  */
}

/** Opcode for xcb_x_print_print_set_image_resolution. */
enum XCB_X_PRINT_PRINT_SET_IMAGE_RESOLUTION = 23;

/**
 * @brief xcb_x_print_print_set_image_resolution_request_t
 **/
struct xcb_x_print_print_set_image_resolution_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	xcb_x_print_pcontext_t context; /**<  */
	ushort image_resolution; /**<  */
}

/**
 * @brief xcb_x_print_print_set_image_resolution_reply_t
 **/
struct xcb_x_print_print_set_image_resolution_reply_t {
	ubyte response_type; /**<  */
	ubyte status; /**<  */
	ushort sequence; /**<  */
	uint length; /**<  */
	ushort previous_resolutions; /**<  */
}

/**
 * @brief xcb_x_print_print_get_image_resolution_cookie_t
 **/
struct xcb_x_print_print_get_image_resolution_cookie_t {
	uint sequence; /**<  */
}

/** Opcode for xcb_x_print_print_get_image_resolution. */
enum XCB_X_PRINT_PRINT_GET_IMAGE_RESOLUTION = 24;

/**
 * @brief xcb_x_print_print_get_image_resolution_request_t
 **/
struct xcb_x_print_print_get_image_resolution_request_t {
	ubyte major_opcode; /**<  */
	ubyte minor_opcode; /**<  */
	ushort length; /**<  */
	xcb_x_print_pcontext_t context; /**<  */
}

/**
 * @brief xcb_x_print_print_get_image_resolution_reply_t
 **/
struct xcb_x_print_print_get_image_resolution_reply_t {
	ubyte response_type; /**<  */
	ubyte pad0; /**<  */
	ushort sequence; /**<  */
	uint length; /**<  */
	ushort image_resolution; /**<  */
}

/** Opcode for xcb_x_print_notify. */
enum XCB_X_PRINT_NOTIFY = 0;

/**
 * @brief xcb_x_print_notify_event_t
 **/
struct xcb_x_print_notify_event_t {
	ubyte response_type; /**<  */
	ubyte detail; /**<  */
	ushort sequence; /**<  */
	xcb_x_print_pcontext_t context; /**<  */
	ubyte cancel; /**<  */
}

/** Opcode for xcb_x_print_attribut_notify. */
enum XCB_X_PRINT_ATTRIBUT_NOTIFY = 1;

/**
 * @brief xcb_x_print_attribut_notify_event_t
 **/
struct xcb_x_print_attribut_notify_event_t {
	ubyte response_type; /**<  */
	ubyte detail; /**<  */
	ushort sequence; /**<  */
	xcb_x_print_pcontext_t context; /**<  */
}

/** Opcode for xcb_x_print_bad_context. */
enum XCB_X_PRINT_BAD_CONTEXT = 0;

/**
 * @brief xcb_x_print_bad_context_error_t
 **/
struct xcb_x_print_bad_context_error_t {
	ubyte response_type; /**<  */
	ubyte error_code; /**<  */
	ushort sequence; /**<  */
}

/** Opcode for xcb_x_print_bad_sequence. */
enum XCB_X_PRINT_BAD_SEQUENCE = 1;

/**
 * @brief xcb_x_print_bad_sequence_error_t
 **/
struct xcb_x_print_bad_sequence_error_t {
	ubyte response_type; /**<  */
	ubyte error_code; /**<  */
	ushort sequence; /**<  */
}

/**
 * Get the next element of the iterator
 * @param i Pointer to a xcb_x_print_string8_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_x_print_string8_t)
 */
void xcb_x_print_string8_next(xcb_x_print_string8_iterator_t* i /**< */ );

/**
 * Return the iterator pointing to the last element
 * @param i An xcb_x_print_string8_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
 */
xcb_generic_iterator_t xcb_x_print_string8_end(xcb_x_print_string8_iterator_t i /**< */ );

int xcb_x_print_printer_serialize(void** _buffer /**< */ , const xcb_x_print_printer_t* _aux /**< */ , const xcb_x_print_string8_t* name /**< */ ,
	const xcb_x_print_string8_t* description /**< */ );

int xcb_x_print_printer_unserialize(const void* _buffer /**< */ , xcb_x_print_printer_t** _aux /**< */ );

int xcb_x_print_printer_sizeof(const void* _buffer /**< */ );

xcb_x_print_string8_t* xcb_x_print_printer_name(const xcb_x_print_printer_t* R /**< */ );

int xcb_x_print_printer_name_length(const xcb_x_print_printer_t* R /**< */ );

xcb_generic_iterator_t xcb_x_print_printer_name_end(const xcb_x_print_printer_t* R /**< */ );

xcb_x_print_string8_t* xcb_x_print_printer_description(const xcb_x_print_printer_t* R /**< */ );

int xcb_x_print_printer_description_length(const xcb_x_print_printer_t* R /**< */ );

xcb_generic_iterator_t xcb_x_print_printer_description_end(const xcb_x_print_printer_t* R /**< */ );

/**
 * Get the next element of the iterator
 * @param i Pointer to a xcb_x_print_printer_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_x_print_printer_t)
 */
void xcb_x_print_printer_next(xcb_x_print_printer_iterator_t* i /**< */ );

/**
 * Return the iterator pointing to the last element
 * @param i An xcb_x_print_printer_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
 */
xcb_generic_iterator_t xcb_x_print_printer_end(xcb_x_print_printer_iterator_t i /**< */ );

/**
 * Get the next element of the iterator
 * @param i Pointer to a xcb_x_print_pcontext_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_x_print_pcontext_t)
 */
void xcb_x_print_pcontext_next(xcb_x_print_pcontext_iterator_t* i /**< */ );

/**
 * Return the iterator pointing to the last element
 * @param i An xcb_x_print_pcontext_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
 */
xcb_generic_iterator_t xcb_x_print_pcontext_end(xcb_x_print_pcontext_iterator_t i /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_x_print_print_query_version_cookie_t xcb_x_print_print_query_version(xcb_connection_t* c /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_x_print_print_query_version_cookie_t xcb_x_print_print_query_version_unchecked(xcb_connection_t* c /**< */ );

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_x_print_print_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_x_print_print_query_version_reply_t* xcb_x_print_print_query_version_reply(xcb_connection_t* c /**< */ ,
	xcb_x_print_print_query_version_cookie_t cookie /**< */ , xcb_generic_error_t** e /**< */ );

int xcb_x_print_print_get_printer_list_sizeof(const void* _buffer /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_x_print_print_get_printer_list_cookie_t xcb_x_print_print_get_printer_list(xcb_connection_t* c /**< */ , uint printerNameLen /**< */ ,
	uint localeLen /**< */ , const xcb_x_print_string8_t* printer_name /**< */ , const xcb_x_print_string8_t* locale /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_x_print_print_get_printer_list_cookie_t xcb_x_print_print_get_printer_list_unchecked(xcb_connection_t* c /**< */ ,
	uint printerNameLen /**< */ , uint localeLen /**< */ , const xcb_x_print_string8_t* printer_name /**< */ ,
	const xcb_x_print_string8_t* locale /**< */ );

int xcb_x_print_print_get_printer_list_printers_length(const xcb_x_print_print_get_printer_list_reply_t* R /**< */ );

xcb_x_print_printer_iterator_t xcb_x_print_print_get_printer_list_printers_iterator(const xcb_x_print_print_get_printer_list_reply_t* R /**< */ );

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_x_print_print_get_printer_list_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_x_print_print_get_printer_list_reply_t* xcb_x_print_print_get_printer_list_reply(xcb_connection_t* c /**< */ ,
	xcb_x_print_print_get_printer_list_cookie_t cookie /**< */ , xcb_generic_error_t** e /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_x_print_print_rehash_printer_list_checked(xcb_connection_t* c /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_x_print_print_rehash_printer_list(xcb_connection_t* c /**< */ );

int xcb_x_print_create_context_sizeof(const void* _buffer /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_x_print_create_context_checked(xcb_connection_t* c /**< */ , uint context_id /**< */ , uint printerNameLen /**< */ ,
	uint localeLen /**< */ , const xcb_x_print_string8_t* printerName /**< */ , const xcb_x_print_string8_t* locale /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_x_print_create_context(xcb_connection_t* c /**< */ , uint context_id /**< */ , uint printerNameLen /**< */ , uint localeLen /**< */ ,
	const xcb_x_print_string8_t* printerName /**< */ , const xcb_x_print_string8_t* locale /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_x_print_print_set_context_checked(xcb_connection_t* c /**< */ , uint context /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_x_print_print_set_context(xcb_connection_t* c /**< */ , uint context /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_x_print_print_get_context_cookie_t xcb_x_print_print_get_context(xcb_connection_t* c /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_x_print_print_get_context_cookie_t xcb_x_print_print_get_context_unchecked(xcb_connection_t* c /**< */ );

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_x_print_print_get_context_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_x_print_print_get_context_reply_t* xcb_x_print_print_get_context_reply(xcb_connection_t* c /**< */ ,
	xcb_x_print_print_get_context_cookie_t cookie /**< */ , xcb_generic_error_t** e /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_x_print_print_destroy_context_checked(xcb_connection_t* c /**< */ , uint context /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_x_print_print_destroy_context(xcb_connection_t* c /**< */ , uint context /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_x_print_print_get_screen_of_context_cookie_t xcb_x_print_print_get_screen_of_context(xcb_connection_t* c /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_x_print_print_get_screen_of_context_cookie_t xcb_x_print_print_get_screen_of_context_unchecked(xcb_connection_t* c /**< */ );

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_x_print_print_get_screen_of_context_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_x_print_print_get_screen_of_context_reply_t* xcb_x_print_print_get_screen_of_context_reply(xcb_connection_t* c /**< */ ,
	xcb_x_print_print_get_screen_of_context_cookie_t cookie /**< */ , xcb_generic_error_t** e /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_x_print_print_start_job_checked(xcb_connection_t* c /**< */ , ubyte output_mode /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_x_print_print_start_job(xcb_connection_t* c /**< */ , ubyte output_mode /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_x_print_print_end_job_checked(xcb_connection_t* c /**< */ , ubyte cancel /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_x_print_print_end_job(xcb_connection_t* c /**< */ , ubyte cancel /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_x_print_print_start_doc_checked(xcb_connection_t* c /**< */ , ubyte driver_mode /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_x_print_print_start_doc(xcb_connection_t* c /**< */ , ubyte driver_mode /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_x_print_print_end_doc_checked(xcb_connection_t* c /**< */ , ubyte cancel /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_x_print_print_end_doc(xcb_connection_t* c /**< */ , ubyte cancel /**< */ );

int xcb_x_print_print_put_document_data_sizeof(const void* _buffer /**< */ , uint doc_format_len /**< */ , uint options_len /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_x_print_print_put_document_data_checked(xcb_connection_t* c /**< */ , xcb_drawable_t drawable /**< */ , uint len_data /**< */ ,
	ushort len_fmt /**< */ , ushort len_options /**< */ , const ubyte* data /**< */ , uint doc_format_len /**< */ ,
	const xcb_x_print_string8_t* doc_format /**< */ , uint options_len /**< */ , const xcb_x_print_string8_t* options /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_x_print_print_put_document_data(xcb_connection_t* c /**< */ , xcb_drawable_t drawable /**< */ , uint len_data /**< */ ,
	ushort len_fmt /**< */ , ushort len_options /**< */ , const ubyte* data /**< */ , uint doc_format_len /**< */ ,
	const xcb_x_print_string8_t* doc_format /**< */ , uint options_len /**< */ , const xcb_x_print_string8_t* options /**< */ );

int xcb_x_print_print_get_document_data_sizeof(const void* _buffer /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_x_print_print_get_document_data_cookie_t xcb_x_print_print_get_document_data(xcb_connection_t* c /**< */ ,
	xcb_x_print_pcontext_t context /**< */ , uint max_bytes /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_x_print_print_get_document_data_cookie_t xcb_x_print_print_get_document_data_unchecked(xcb_connection_t* c /**< */ ,
	xcb_x_print_pcontext_t context /**< */ , uint max_bytes /**< */ );

ubyte* xcb_x_print_print_get_document_data_data(const xcb_x_print_print_get_document_data_reply_t* R /**< */ );

int xcb_x_print_print_get_document_data_data_length(const xcb_x_print_print_get_document_data_reply_t* R /**< */ );

xcb_generic_iterator_t xcb_x_print_print_get_document_data_data_end(const xcb_x_print_print_get_document_data_reply_t* R /**< */ );

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_x_print_print_get_document_data_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_x_print_print_get_document_data_reply_t* xcb_x_print_print_get_document_data_reply(xcb_connection_t* c /**< */ ,
	xcb_x_print_print_get_document_data_cookie_t cookie /**< */ , xcb_generic_error_t** e /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_x_print_print_start_page_checked(xcb_connection_t* c /**< */ , xcb_window_t window /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_x_print_print_start_page(xcb_connection_t* c /**< */ , xcb_window_t window /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_x_print_print_end_page_checked(xcb_connection_t* c /**< */ , ubyte cancel /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_x_print_print_end_page(xcb_connection_t* c /**< */ , ubyte cancel /**< */ );

int xcb_x_print_print_select_input_sizeof(const void* _buffer /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_x_print_print_select_input_checked(xcb_connection_t* c /**< */ , xcb_x_print_pcontext_t context /**< */ ,
	uint event_mask /**< */ , const uint* event_list /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_x_print_print_select_input(xcb_connection_t* c /**< */ , xcb_x_print_pcontext_t context /**< */ ,
	uint event_mask /**< */ , const uint* event_list /**< */ );

int xcb_x_print_print_input_selected_serialize(void** _buffer /**< */ , const xcb_x_print_print_input_selected_reply_t* _aux /**< */ ,
	const uint* event_list /**< */ , const uint* all_events_list /**< */ );

int xcb_x_print_print_input_selected_unserialize(const void* _buffer /**< */ , xcb_x_print_print_input_selected_reply_t** _aux /**< */ );

int xcb_x_print_print_input_selected_sizeof(const void* _buffer /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_x_print_print_input_selected_cookie_t xcb_x_print_print_input_selected(xcb_connection_t* c /**< */ , xcb_x_print_pcontext_t context /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_x_print_print_input_selected_cookie_t xcb_x_print_print_input_selected_unchecked(xcb_connection_t* c /**< */ ,
	xcb_x_print_pcontext_t context /**< */ );

uint* xcb_x_print_print_input_selected_event_list(const xcb_x_print_print_input_selected_reply_t* R /**< */ );

int xcb_x_print_print_input_selected_event_list_length(const xcb_x_print_print_input_selected_reply_t* R /**< */ );

xcb_generic_iterator_t xcb_x_print_print_input_selected_event_list_end(const xcb_x_print_print_input_selected_reply_t* R /**< */ );

uint* xcb_x_print_print_input_selected_all_events_list(const xcb_x_print_print_input_selected_reply_t* R /**< */ );

int xcb_x_print_print_input_selected_all_events_list_length(const xcb_x_print_print_input_selected_reply_t* R /**< */ );

xcb_generic_iterator_t xcb_x_print_print_input_selected_all_events_list_end(const xcb_x_print_print_input_selected_reply_t* R /**< */ );

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_x_print_print_input_selected_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_x_print_print_input_selected_reply_t* xcb_x_print_print_input_selected_reply(xcb_connection_t* c /**< */ ,
	xcb_x_print_print_input_selected_cookie_t cookie /**< */ , xcb_generic_error_t** e /**< */ );

int xcb_x_print_print_get_attributes_sizeof(const void* _buffer /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_x_print_print_get_attributes_cookie_t xcb_x_print_print_get_attributes(xcb_connection_t* c /**< */ ,
	xcb_x_print_pcontext_t context /**< */ , ubyte pool /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_x_print_print_get_attributes_cookie_t xcb_x_print_print_get_attributes_unchecked(xcb_connection_t* c /**< */ ,
	xcb_x_print_pcontext_t context /**< */ , ubyte pool /**< */ );

xcb_x_print_string8_t* xcb_x_print_print_get_attributes_attributes(const xcb_x_print_print_get_attributes_reply_t* R /**< */ );

int xcb_x_print_print_get_attributes_attributes_length(const xcb_x_print_print_get_attributes_reply_t* R /**< */ );

xcb_generic_iterator_t xcb_x_print_print_get_attributes_attributes_end(const xcb_x_print_print_get_attributes_reply_t* R /**< */ );

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_x_print_print_get_attributes_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_x_print_print_get_attributes_reply_t* xcb_x_print_print_get_attributes_reply(xcb_connection_t* c /**< */ ,
	xcb_x_print_print_get_attributes_cookie_t cookie /**< */ , xcb_generic_error_t** e /**< */ );

int xcb_x_print_print_get_one_attributes_sizeof(const void* _buffer /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_x_print_print_get_one_attributes_cookie_t xcb_x_print_print_get_one_attributes(xcb_connection_t* c /**< */ ,
	xcb_x_print_pcontext_t context /**< */ , uint nameLen /**< */ , ubyte pool /**< */ , const xcb_x_print_string8_t* name /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_x_print_print_get_one_attributes_cookie_t xcb_x_print_print_get_one_attributes_unchecked(xcb_connection_t* c /**< */ ,
	xcb_x_print_pcontext_t context /**< */ , uint nameLen /**< */ , ubyte pool /**< */ , const xcb_x_print_string8_t* name /**< */ );

xcb_x_print_string8_t* xcb_x_print_print_get_one_attributes_value(const xcb_x_print_print_get_one_attributes_reply_t* R /**< */ );

int xcb_x_print_print_get_one_attributes_value_length(const xcb_x_print_print_get_one_attributes_reply_t* R /**< */ );

xcb_generic_iterator_t xcb_x_print_print_get_one_attributes_value_end(const xcb_x_print_print_get_one_attributes_reply_t* R /**< */ );

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_x_print_print_get_one_attributes_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_x_print_print_get_one_attributes_reply_t* xcb_x_print_print_get_one_attributes_reply(xcb_connection_t* c /**< */ ,
	xcb_x_print_print_get_one_attributes_cookie_t cookie /**< */ , xcb_generic_error_t** e /**< */ );

int xcb_x_print_print_set_attributes_sizeof(const void* _buffer /**< */ , uint attributes_len /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_x_print_print_set_attributes_checked(xcb_connection_t* c /**< */ , xcb_x_print_pcontext_t context /**< */ ,
	uint stringLen /**< */ , ubyte pool /**< */ , ubyte rule /**< */ , uint attributes_len /**< */ , const xcb_x_print_string8_t* attributes /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_x_print_print_set_attributes(xcb_connection_t* c /**< */ , xcb_x_print_pcontext_t context /**< */ , uint stringLen /**< */ ,
	ubyte pool /**< */ , ubyte rule /**< */ , uint attributes_len /**< */ , const xcb_x_print_string8_t* attributes /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_x_print_print_get_page_dimensions_cookie_t xcb_x_print_print_get_page_dimensions(xcb_connection_t* c /**< */ ,
	xcb_x_print_pcontext_t context /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_x_print_print_get_page_dimensions_cookie_t xcb_x_print_print_get_page_dimensions_unchecked(xcb_connection_t* c /**< */ ,
	xcb_x_print_pcontext_t context /**< */ );

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_x_print_print_get_page_dimensions_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_x_print_print_get_page_dimensions_reply_t* xcb_x_print_print_get_page_dimensions_reply(xcb_connection_t* c /**< */ ,
	xcb_x_print_print_get_page_dimensions_cookie_t cookie /**< */ , xcb_generic_error_t** e /**< */ );

int xcb_x_print_print_query_screens_sizeof(const void* _buffer /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_x_print_print_query_screens_cookie_t xcb_x_print_print_query_screens(xcb_connection_t* c /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_x_print_print_query_screens_cookie_t xcb_x_print_print_query_screens_unchecked(xcb_connection_t* c /**< */ );

xcb_window_t* xcb_x_print_print_query_screens_roots(const xcb_x_print_print_query_screens_reply_t* R /**< */ );

int xcb_x_print_print_query_screens_roots_length(const xcb_x_print_print_query_screens_reply_t* R /**< */ );

xcb_generic_iterator_t xcb_x_print_print_query_screens_roots_end(const xcb_x_print_print_query_screens_reply_t* R /**< */ );

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_x_print_print_query_screens_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_x_print_print_query_screens_reply_t* xcb_x_print_print_query_screens_reply(xcb_connection_t* c /**< */ ,
	xcb_x_print_print_query_screens_cookie_t cookie /**< */ , xcb_generic_error_t** e /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_x_print_print_set_image_resolution_cookie_t xcb_x_print_print_set_image_resolution(xcb_connection_t* c /**< */ ,
	xcb_x_print_pcontext_t context /**< */ , ushort image_resolution /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_x_print_print_set_image_resolution_cookie_t xcb_x_print_print_set_image_resolution_unchecked(xcb_connection_t* c /**< */ ,
	xcb_x_print_pcontext_t context /**< */ , ushort image_resolution /**< */ );

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_x_print_print_set_image_resolution_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_x_print_print_set_image_resolution_reply_t* xcb_x_print_print_set_image_resolution_reply(xcb_connection_t* c /**< */ ,
	xcb_x_print_print_set_image_resolution_cookie_t cookie /**< */ , xcb_generic_error_t** e /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_x_print_print_get_image_resolution_cookie_t xcb_x_print_print_get_image_resolution(xcb_connection_t* c /**< */ ,
	xcb_x_print_pcontext_t context /**< */ );

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_x_print_print_get_image_resolution_cookie_t xcb_x_print_print_get_image_resolution_unchecked(xcb_connection_t* c /**< */ ,
	xcb_x_print_pcontext_t context /**< */ );

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_x_print_print_get_image_resolution_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_x_print_print_get_image_resolution_reply_t* xcb_x_print_print_get_image_resolution_reply(xcb_connection_t* c /**< */ ,
	xcb_x_print_print_get_image_resolution_cookie_t cookie /**< */ , xcb_generic_error_t** e /**< */ );

/**
 * @}
 */
