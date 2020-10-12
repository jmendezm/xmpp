
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

-record(mam_result, {xmlns = <<>> :: binary(),
                     queryid = <<>> :: binary(),
                     id = <<>> :: binary(),
                     sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type mam_result() :: #mam_result{}.

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

-record(sasl_abort, {}).
-type sasl_abort() :: #sasl_abort{}.

-record(receipt_request, {}).
-type receipt_request() :: #receipt_request{}.


-record(sasl_failure, {reason :: 'aborted' | 'account-disabled' | 'bad-protocol' | 'credentials-expired' | 'encryption-required' | 'incorrect-encoding' | 'invalid-authzid' | 'invalid-mechanism' | 'malformed-request' | 'mechanism-too-weak' | 'not-authorized' | 'temporary-auth-failure' | 'undefined',
                       text = [] :: [#text{}]}).
-type sasl_failure() :: #sasl_failure{}.

-record(xevent, {offline = false :: boolean(),
                 delivered = false :: boolean(),
                 displayed = false :: boolean(),
                 composing = false :: boolean(),
                 id :: 'undefined' | binary()}).
-type xevent() :: #xevent{}.

-record(mam_archived, {by :: jid:jid(),
                       id = <<>> :: binary()}).
-type mam_archived() :: #mam_archived{}.

-record(origin_id, {id = <<>> :: binary()}).
-type origin_id() :: #origin_id{}.

-record(block_list, {items = [] :: [#block_item{}]}).
-type block_list() :: #block_list{}.

-record(version, {name :: 'undefined' | binary(),
                  ver :: 'undefined' | binary(),
                  os :: 'undefined' | binary()}).
-type version() :: #version{}.

-record(legacy_auth_feature, {}).
-type legacy_auth_feature() :: #legacy_auth_feature{}.

-record(bind, {jid :: undefined | jid:jid(),
               resource = <<>> :: binary()}).
-type bind() :: #bind{}.

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


-record(sasl_mechanisms, {list = [] :: [binary()]}).
-type sasl_mechanisms() :: #sasl_mechanisms{}.

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

-record(stream_error, {reason :: atom() | #'see-other-host'{},
                       text = <<>> :: binary()}).
-type stream_error() :: #stream_error{}.

-record(time, {tzo :: 'undefined' | {integer(),integer()},
               utc :: undefined | erlang:timestamp()}).
-type time() :: #time{}.

-type xmpp_element() :: mix_join() |
                        muc_actor() |
                        roster_query() |
                        jingle_s5b_candidate() |
                        jingle_ft_file() |
                        hash() |
                        ps_subscribe() |
                        ps_options() |
                        disco_item() |
                        avatar_meta() |
                        delegation() |
                        bob_data() |
                        mix_client_join() |
                        vcard_email() |
                        oob_x() |
                        gone() |
                        vcard_temp() |
                        vcard_adr() |
                        sm_failed() |
                        carbons_private() |
                        muc_unsubscribe() |
                        rsm_first() |
                        carbons_sent() |
                        vcard_org() |
                        sm_resumed() |
                        register() |
                        jingle_error() |
                        delay() |
                        upload_file_too_large() |
                        mix_setnick() |
                        jingle_reason() |
                        pubsub() |
                        muc_user() |
                        thumbnail() |
                        iq() |
                        muc_subscribe() |
                        sasl_response() |
                        db_result() |
                        identity() |
                        mam_result() |
                        mix_destroy() |
                        'see-other-host'() |
                        sm_r() |
                        stream_start() |
                        ps_affiliation() |
                        disco_info() |
                        vcard_tel() |
                        mix_participant() |
                        presence() |
                        nick() |
                        jingle_content() |
                        shim() |
                        delegation_query() |
                        x509_register() |
                        starttls() |
                        xdata_option() |
                        credentials() |
                        sasl_failure() |
                        sasl_abort() |
                        muc_subscription() |
                        x509_challenge() |
                        streamhost() |
                        compress() |
                        muc_decline() |
                        rsm_set() |
                        mam_fin() |
                        push_enable() |
                        sasl_success() |
                        ping() |
                        vcard_logo() |
                        time() |
                        stat() |
                        muc_destroy() |
                        block_list() |
                        stat_error() |
                        last() |
                        x509_cert_chain() |
                        origin_id() |
                        adhoc_actions() |
                        upload_retry() |
                        feature_sm() |
                        text() |
                        muc_invite() |
                        ps_items() |
                        feature_register() |
                        xevent() |
                        upload_request() |
                        block() |
                        mix_client_leave() |
                        ps_retract() |
                        stats() |
                        message() |
                        delegated() |
                        avatar_info() |
                        carbons_enable() |
                        db_feature() |
                        carbons_disable() |
                        hint() |
                        jidprep() |
                        mix() |
                        vcard_key() |
                        privilege_perm() |
                        media() |
                        ibb_data() |
                        compressed() |
                        ps_unsubscribe() |
                        unblock() |
                        ibb_close() |
                        adhoc_note() |
                        muc_item() |
                        muc_subscriptions() |
                        vcard_xupdate() |
                        csi() |
                        address() |
                        privilege() |
                        ps_subscription() |
                        idle() |
                        ibb_open() |
                        roster_item() |
                        mix_leave() |
                        starttls_proceed() |
                        mix_create() |
                        db_verify() |
                        jingle_ft_range() |
                        jingle_ft_description() |
                        legacy_auth() |
                        push_notification() |
                        sm_a() |
                        privacy_query() |
                        mam_archived() |
                        carbons_received() |
                        x509_csr() |
                        x509_revoke() |
                        xdata_field() |
                        avatar_data() |
                        x509_request() |
                        service() |
                        rosterver_feature() |
                        stanza_id() |
                        jingle_s5b_transport() |
                        muc_unique() |
                        addresses() |
                        bookmark_url() |
                        compression() |
                        sm_enabled() |
                        jingle_ibb_transport() |
                        muc_owner() |
                        upload_slot_0() |
                        legacy_auth_feature() |
                        stream_features() |
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
                        private() |
                        jingle_ft_error() |
                        sm_resume() |
                        push_disable() |
                        disco_items() |
                        upload_slot() |
                        ps_event() |
                        search() |
                        caps() |
                        expire() |
                        vcard_label() |
                        receipt_response() |
                        version() |
                        bind() |
                        sm_enable() |
                        upload_request_0() |
                        bookmark_conference() |
                        x_conference() |
                        forwarded() |
                        report() |
                        xmpp_session() |
                        sasl_mechanisms() |
                        offline_item() |
                        avatar_pointer() |
                        adhoc_command() |
                        chatstate() |
                        vcard_geo() |
                        services() |
                        compress_failure() |
                        sic() |
                        starttls_failure() |
                        muc_admin() |
                        ps_error() |
                        ps_item() |
                        mam_query() |
                        pubsub_owner() |
                        x509_ca_list() |
                        vcard_sound() |
                        ps_publish() |
                        jingle_ft_received() |
                        mam_prefs() |
                        vcard_photo() |
                        hash_used() |
                        stream_error() |
                        jingle_ft_checksum() |
                        sasl_challenge() |
                        block_item() |
                        receipt_request() |
                        muc() |
                        privacy_item() |
                        redirect() |
                        handshake() |
                        stanza_error() |
                        x509_challenge_failed() |
                        xcaptcha() |
                        bytestreams() |
                        media_uri().
