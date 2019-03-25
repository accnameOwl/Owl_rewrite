#define BOOST_PRIVATE_CLEAR_PRESENT_EVENT_INFO(event)\
	event.axis_x = 0;\
	event.axis_y = 0;

#define BOOST_PRIVATE_START_EVENT_STATE(event)\
	event.started = TRUE;\
	event.ended = FALSE;\
	event.continuing = TRUE;\
	event.successful = FALSE;\
	event.runtime = 0;\
	event.prev_axis_x = 0;\
	event.prev_axis_y = 0;\
	event.group._running_events += event;

#define BOOST_PRIVATE_END_EVENT_STATE(event)\
	event.started = FALSE;\
	event.ended = TRUE;\
	event.continuing = FALSE;\
	event.group._running_events -= event;

#define BOOST_PRIVATE_CONTINUE_EVENT_STATE(event)\
	event.started = FALSE;\
	event.ended = FALSE;\
	event.continuing = TRUE;

#define BOOST_PRIVATE_DISCONTINUE_EVENT_STATE(event)\
	event.started = FALSE;\
	event.ended = FALSE;\
	event.continuing = FALSE;

#define BOOST_PRIVATE_START_EVENT_ATTEMPT(event)\
	if(!event.started && !event.continuing) {BOOST_PRIVATE_START_EVENT_STATE(event);}\
	else if(event.started && event.continuing) {BOOST_PRIVATE_CONTINUE_EVENT_STATE(event);}

#define BOOST_PRIVATE_END_EVENT_ATTEMPT(event)\
	if(!event.ended) {BOOST_PRIVATE_END_EVENT_STATE(event);}\
	else {BOOST_PRIVATE_DISCONTINUE_EVENT_STATE(event);}

Event

	var/tmp
		client/client
		id
		EventGroup/group

		started = FALSE
		ended = FALSE
		continuing = FALSE
		successful = FALSE

		runtime = 0
		max_runtime = 1.#INF

		prev_axis_x = 0
		prev_axis_y = 0

		axis_x = 0
		axis_y = 0

	New(client, id, EventGroup/group)
		src.client = client
		src.id = id
		src.group = group
		. = ..()