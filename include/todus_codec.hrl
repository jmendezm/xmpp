
-record(rpc, {id = <<>> :: binary(),
              name = <<>> :: binary(),
              from :: undefined | jid:jid(),
              to :: undefined | jid:jid(),
              params = [] :: [xmpp_element() | fxml:xmlel()]
}).
-type rpc() :: #rpc{}.

-type message_type() :: chat | error | group | normal.

-record(message, {id = <<>> :: binary(),
                  type = normal :: message_type(),
                  from :: undefined | jid:jid(),
                  to :: undefined | jid:jid(),
                  body = [] :: [binary()],
                  sub_els = [] :: [xmpp_element() | fxml:xmlel()]
		  }).
-type message() :: #message{}.

-type presence_type() :: online | offline.

-record(presence, {id = <<>> :: binary(),
                   type = online :: presence_type(),
                   from :: undefined | jid:jid(),
                   to :: undefined | jid:jid()
		   }).
-type presence() :: #presence{}.


-record(chatstate, {type :: active | composing | gone | inactive | paused}).
-type chatstate() :: #chatstate{}.


-type xmpp_host() :: binary() | inet:ip_address() | {binary() | inet:ip_address(), inet:port_number()}.

-record(sasl_success, {text = <<>> :: binary()}).
-type sasl_success() :: #sasl_success{}.

-record(auth_response, {text = <<>> :: binary()}).
-type sasl_response() :: #auth_response{}.

-record(auth_request, {type = <<>> :: binary(), text = <<>> :: binary()}).
-type sasl_auth() :: #auth_request{}.

-record(sm_resume, {h :: non_neg_integer(),
                    previd = <<>> :: binary(),
                    xmlns = <<>> :: binary()}).
-type sm_resume() :: #sm_resume{}.

-record(ping, {}).
-type ping() :: #ping{}.

-record('see-other-host', {host :: binary() | inet:ip_address() | {binary() | inet:ip_address(),inet:port_number()}}).
-type 'see-other-host'() :: #'see-other-host'{}.

-record(delay, {stamp :: erlang:timestamp(),
                from :: undefined | jid:jid(),
                desc = <<>> :: binary()}).
-type delay() :: #delay{}.

-record(thumbnail, {uri = <<>> :: binary(),
                    'media-type' = <<>> :: binary(),
                    width :: 'undefined' | non_neg_integer(),
                    height :: 'undefined' | non_neg_integer()}).
-type thumbnail() :: #thumbnail{}.

-record(sm_a, {h :: non_neg_integer(),
               xmlns = <<>> :: binary()}).
-type sm_a() :: #sm_a{}.

-record(sm_resumed, {h :: non_neg_integer(),
                     previd = <<>> :: binary(),
                     xmlns = <<>> :: binary()}).
-type sm_resumed() :: #sm_resumed{}.

-record(stream_start, {from :: undefined | jid:jid(),
                       to :: undefined | jid:jid(),
                       id = <<>> :: binary()
                      }).
-type stream_start() :: #stream_start{}.

-record(stanza_id, {by :: jid:jid(),
                    id = <<>> :: binary()}).
-type stanza_id() :: #stanza_id{}.

-record(forwarded, {delay :: 'undefined' | #delay{},
                    sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type forwarded() :: #forwarded{}.

-record(handshake, {data = <<>> :: binary()}).
-type handshake() :: #handshake{}.

-record(private, {sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type private() :: #private{}.

-record(sm_enable, {max :: 'undefined' | non_neg_integer(),
                    resume = false :: boolean(),
                    xmlns = <<>> :: binary()}).
-type sm_enable() :: #sm_enable{}.

-record(hash, {algo = <<>> :: binary(),
               data = <<>> :: binary()}).
-type hash() :: #hash{}.

-record(gone, {uri = <<>> :: binary()}).
-type gone() :: #gone{}.

-record(nick, {name = <<>> :: binary()}).
-type nick() :: #nick{}.

-record(roster_item, {jid :: jid:jid(),
                      name = <<>> :: binary(),
                      groups = [] :: [binary()],
                      subscription = none :: 'both' | 'from' | 'none' | 'remove' | 'to',
                      ask :: 'subscribe' | 'undefined'}).
-type roster_item() :: #roster_item{}.

-record(roster_query, {items = [] :: [#roster_item{}],
                       ver :: 'undefined' | binary()}).
-type roster_query() :: #roster_query{}.

-record(sm_r, {xmlns = <<>> :: binary()}).
-type sm_r() :: #sm_r{}.

-record(last, {seconds :: 'undefined' | non_neg_integer(),
               status = <<>> :: binary()}).
-type last() :: #last{}.

-record(redirect, {uri = <<>> :: binary()}).
-type redirect() :: #redirect{}.

-record(sm_enabled, {id = <<>> :: binary(),
                     location = <<>> :: binary(),
                     max :: 'undefined' | non_neg_integer(),
                     resume = false :: boolean(),
                     xmlns = <<>> :: binary()}).
-type sm_enabled() :: #sm_enabled{}.

-record(legacy_auth, {username :: 'undefined' | binary(),
                      password :: 'undefined' | binary(),
                      digest :: 'undefined' | binary(),
                      resource :: 'undefined' | binary()}).
-type legacy_auth() :: #legacy_auth{}.

-record(idle, {since :: erlang:timestamp()}).
-type idle() :: #idle{}.



-record(report, {reason :: 'abuse' | 'spam' | 'undefined', text = [] :: [binary()]}).
-type report() :: #report{}.

-record(block_item, {jid :: jid:jid(), spam_report :: 'undefined' | #report{}}).
-type block_item() :: #block_item{}.

-record(unblock, {items = [] :: [#block_item{}]}).
-type unblock() :: #unblock{}.

-record(block, {items = [] :: [#block_item{}]}).
-type block() :: #block{}.

-record(receipt_request, {}).
-type receipt_request() :: #receipt_request{}.

-record(xevent, {offline = false :: boolean(),
                 delivered = false :: boolean(),
                 displayed = false :: boolean(),
                 composing = false :: boolean(),
                 id :: 'undefined' | binary()}).
-type xevent() :: #xevent{}.

-record(mam_archived, {by :: jid:jid(),
                       id = <<>> :: binary()}).
-type mam_archived() :: #mam_archived{}.

-record(block_list, {items = [] :: [#block_item{}]}).
-type block_list() :: #block_list{}.

-record(version, {name :: 'undefined' | binary(),
                  ver :: 'undefined' | binary(),
                  os :: 'undefined' | binary()}).
-type version() :: #version{}.

-record(media_uri, {type = <<>> :: binary(),
                    uri = <<>> :: binary()}).
-type media_uri() :: #media_uri{}.

-record(media, {height :: 'undefined' | non_neg_integer(),
                width :: 'undefined' | non_neg_integer(),
                uri = [] :: [#media_uri{}]}).
-type media() :: #media{}.


-record(xmpp_session, {optional = false :: boolean()}).
-type xmpp_session() :: #xmpp_session{}.

-record(mam_query, {xmlns = <<>> :: binary(),
                    id = <<>> :: binary(),
                    start :: undefined | erlang:timestamp(),
                    'end' :: undefined | erlang:timestamp(),
                    with :: undefined | jid:jid(),
                    withtext :: 'undefined' | binary()
}).
-type mam_query() :: #mam_query{}.

-record(offline_item, {node = <<>> :: binary(),
                       action :: 'remove' | 'undefined' | 'view'}).
-type offline_item() :: #offline_item{}.

-record(offline, {items = [] :: [#offline_item{}],
                  purge = false :: boolean(),
                  fetch = false :: boolean()}).
-type offline() :: #offline{}.

-record(privacy_item, {order :: non_neg_integer(),
                       action :: 'allow' | 'deny',
                       type :: 'group' | 'jid' | 'subscription' | 'undefined',
                       value = <<>> :: binary(),
                       message = false :: boolean(),
                       iq = false :: boolean(),
                       presence_in = false :: boolean(),
                       presence_out = false :: boolean()}).
-type privacy_item() :: #privacy_item{}.

-record(privacy_list, {name = <<>> :: binary(),
                       items = [] :: [#privacy_item{}]}).
-type privacy_list() :: #privacy_list{}.

-record(privacy_query, {lists = [] :: [#privacy_list{}],
                        default :: 'none' | 'undefined' | binary(),
                        active :: 'none' | 'undefined' | binary()}).
-type privacy_query() :: #privacy_query{}.

-record(sm_failed, {reason :: atom() | #gone{} | #redirect{},
                    text = [] :: [#text{}],
                    h :: 'undefined' | non_neg_integer(),
                    xmlns = <<>> :: binary()}).
-type sm_failed() :: #sm_failed{}.

-record(stanza_error, {type :: 'auth' | 'cancel' | 'continue' | 'modify' | 'wait',
                       code :: 'undefined' | non_neg_integer(),
                       by :: undefined | jid:jid(),
                       reason :: atom() | #gone{} | #redirect{},
                       text = [] :: [#text{}],
                       sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type stanza_error() :: #stanza_error{}.

-record(stream_error, {reason :: atom() | #'see-other-host'{}, text = <<>> :: binary()}).
-type stream_error() :: #stream_error{}.

-record(time, {tzo :: 'undefined' | {integer(),integer()},
               utc :: undefined | erlang:timestamp()}).
-type time() :: #time{}.

-type xmpp_element() :: presence() |
                        nick() |
                        jingle_content() |
                        shim() |
                        delegation_query() |
                        credentials() |
                        sasl_failure() |
                        sasl_abort() |
                        muc_subscription() |
                        x509_challenge() |
                        streamhost() |
                        compress() |
                        muc_decline() |
                        rsm_set() |
                        ps_retract() |
                        stats() |
                        message() |
                        delegated() |
                        avatar_info() |
                        mix_create() |
                        db_verify() |
                        jingle_ft_range() |
                        bookmark_storage() |
                        privacy_list() |
                        feature_csi() |
                        jingle() |
                        muc_history() |
                        xdata() |
                        vcard_name() |
                        search_item() |
                        offline() |
                        sasl_auth() |
                        receipt_request() |
                        muc().
