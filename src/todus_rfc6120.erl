-module(todus_rfc6120).

-compile(export_all).

-include("todus_codec.hrl").

do_decode(<<"s:s">>, El, Opts) ->
    decode_stream_start(Opts, El);

do_decode(<<"s:e">>, El, Opts) ->
    decode_stream_error(Opts, El);

do_decode(<<"m">>, El, Opts) ->
  decode_message(Opts, El);

do_decode(<<"p">>, El, Opts) ->
  decode_presence(Opts, El);

do_decode(<<"a">>, El, Opts) ->
  decode_sasl_auth(Opts, El);

do_decode(<<"unsupported-version">>, El, Opts) ->
    decode_stream_error_unsupported_version(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					    Opts, El);
do_decode(<<"unsupported-stanza-type">>, El, Opts) ->
    decode_stream_error_unsupported_stanza_type(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
						Opts, El);
do_decode(<<"unsupported-feature">>, El, Opts) ->
    decode_stream_error_unsupported_feature(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					    Opts, El);
do_decode(<<"unsupported-encoding">>, El, Opts) ->
    decode_stream_error_unsupported_encoding(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					     Opts, El);
do_decode(<<"undefined-condition">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_undefined_condition(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					    Opts, El);
do_decode(<<"system-shutdown">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_system_shutdown(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					Opts, El);
do_decode(<<"see-other-host">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_see_other_host(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				       Opts, El);
do_decode(<<"restricted-xml">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_restricted_xml(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				       Opts, El);
do_decode(<<"resource-constraint">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_resource_constraint(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					    Opts, El);
do_decode(<<"reset">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_reset(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
			      Opts, El);
do_decode(<<"remote-connection-failed">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_remote_connection_failed(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
						 Opts, El);
do_decode(<<"policy-violation">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_policy_violation(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					 Opts, El);
do_decode(<<"not-well-formed">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_not_well_formed(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					Opts, El);
do_decode(<<"not-authorized">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_not_authorized(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				       Opts, El);
do_decode(<<"invalid-xml">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_invalid_xml(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    Opts, El);
do_decode(<<"invalid-namespace">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_invalid_namespace(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					  Opts, El);
do_decode(<<"invalid-id">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_invalid_id(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				   Opts, El);
do_decode(<<"invalid-from">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_invalid_from(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				     Opts, El);
do_decode(<<"internal-server-error">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_internal_server_error(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					      Opts, El);
do_decode(<<"improper-addressing">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_improper_addressing(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					    Opts, El);
do_decode(<<"host-unknown">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_host_unknown(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				     Opts, El);
do_decode(<<"host-gone">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_host_gone(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				  Opts, El);
do_decode(<<"connection-timeout">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_connection_timeout(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					   Opts, El);
do_decode(<<"conflict">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_conflict(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				 Opts, El);
do_decode(<<"bad-namespace-prefix">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_bad_namespace_prefix(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					     Opts, El);
do_decode(<<"bad-format">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_bad_format(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				   Opts, El);


do_decode(<<"error">>, El, Opts) ->
    decode_error(Opts, El);

do_decode(<<"text">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_text(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
		      Opts, El);
do_decode(<<"unexpected-request">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_unexpected_request(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    Opts, El);
do_decode(<<"undefined-condition">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_undefined_condition(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				     Opts, El);
do_decode(<<"subscription-required">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_subscription_required(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				       Opts, El);
do_decode(<<"service-unavailable">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_service_unavailable(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				     Opts, El);
do_decode(<<"resource-constraint">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_resource_constraint(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				     Opts, El);
do_decode(<<"remote-server-timeout">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_remote_server_timeout(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				       Opts, El);
do_decode(<<"remote-server-not-found">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_remote_server_not_found(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
					 Opts, El);
do_decode(<<"registration-required">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_registration_required(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				       Opts, El);
do_decode(<<"redirect">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_redirect(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
			  Opts, El);
do_decode(<<"recipient-unavailable">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_recipient_unavailable(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				       Opts, El);
do_decode(<<"policy-violation">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_policy_violation(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				  Opts, El);
do_decode(<<"not-authorized">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_not_authorized(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				Opts, El);
do_decode(<<"not-allowed">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_not_allowed(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
			     Opts, El);
do_decode(<<"not-acceptable">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_not_acceptable(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				Opts, El);
do_decode(<<"jid-malformed">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_jid_malformed(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
			       Opts, El);
do_decode(<<"item-not-found">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_item_not_found(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				Opts, El);
do_decode(<<"internal-server-error">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_internal_server_error(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				       Opts, El);
do_decode(<<"gone">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_gone(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
		      Opts, El);
do_decode(<<"forbidden">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_forbidden(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
			   Opts, El);
do_decode(<<"feature-not-implemented">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_feature_not_implemented(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
					 Opts, El);
do_decode(<<"conflict">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_conflict(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
			  Opts, El);
do_decode(<<"bad-request">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_bad_request(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
			     Opts, El);

do_decode(<<"priority">>, <<"jabber:client">>, El,
	  Opts) ->
    decode_presence_priority(<<"jabber:client">>, Opts, El);
do_decode(<<"priority">>, <<"jabber:server">>, El,
	  Opts) ->
    decode_presence_priority(<<"jabber:server">>, Opts, El);
do_decode(<<"priority">>, <<"jabber:component:accept">>,
	  El, Opts) ->
    decode_presence_priority(<<"jabber:component:accept">>,
			     Opts, El);
do_decode(<<"status">>, <<"jabber:client">>, El,
	  Opts) ->
    decode_presence_status(<<"jabber:client">>, Opts, El);
do_decode(<<"status">>, <<"jabber:server">>, El,
	  Opts) ->
    decode_presence_status(<<"jabber:server">>, Opts, El);
do_decode(<<"status">>, <<"jabber:component:accept">>,
	  El, Opts) ->
    decode_presence_status(<<"jabber:component:accept">>,
			   Opts, El);
do_decode(<<"show">>, <<"jabber:client">>, El, Opts) ->
    decode_presence_show(<<"jabber:client">>, Opts, El);
do_decode(<<"show">>, <<"jabber:server">>, El, Opts) ->
    decode_presence_show(<<"jabber:server">>, Opts, El);
do_decode(<<"show">>, <<"jabber:component:accept">>, El,
	  Opts) ->
    decode_presence_show(<<"jabber:component:accept">>,
			 Opts, El);


do_decode(<<"thread">>, <<"jabber:client">>, El,
	  Opts) ->
    decode_message_thread(<<"jabber:client">>, Opts, El);
do_decode(<<"thread">>, <<"jabber:server">>, El,
	  Opts) ->
    decode_message_thread(<<"jabber:server">>, Opts, El);
do_decode(<<"thread">>, <<"jabber:component:accept">>,
	  El, Opts) ->
    decode_message_thread(<<"jabber:component:accept">>,
			  Opts, El);
do_decode(<<"body">>, <<"jabber:client">>, El, Opts) ->
    decode_message_body(<<"jabber:client">>, Opts, El);
do_decode(<<"body">>, <<"jabber:server">>, El, Opts) ->
    decode_message_body(<<"jabber:server">>, Opts, El);
do_decode(<<"body">>, <<"jabber:component:accept">>, El,
	  Opts) ->
    decode_message_body(<<"jabber:component:accept">>, Opts,
			El);
do_decode(<<"subject">>, <<"jabber:client">>, El,
	  Opts) ->
    decode_message_subject(<<"jabber:client">>, Opts, El);
do_decode(<<"subject">>, <<"jabber:server">>, El,
	  Opts) ->
    decode_message_subject(<<"jabber:server">>, Opts, El);
do_decode(<<"subject">>, <<"jabber:component:accept">>,
	  El, Opts) ->
    decode_message_subject(<<"jabber:component:accept">>,
			   Opts, El);
do_decode(<<"iq">>, <<"jabber:client">>, El, Opts) ->
    decode_iq(<<"jabber:client">>, Opts, El);
do_decode(<<"iq">>, <<"jabber:server">>, El, Opts) ->
    decode_iq(<<"jabber:server">>, Opts, El);
do_decode(<<"iq">>, <<"jabber:component:accept">>, El,
	  Opts) ->
    decode_iq(<<"jabber:component:accept">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [<<"s:s">>,
     <<"s:e">>,
     {<<"unsupported-version">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"unsupported-stanza-type">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"unsupported-feature">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"unsupported-encoding">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"undefined-condition">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"system-shutdown">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"see-other-host">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"restricted-xml">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"resource-constraint">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"reset">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"remote-connection-failed">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"policy-violation">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"not-well-formed">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"not-authorized">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"invalid-xml">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"invalid-namespace">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"invalid-id">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"invalid-from">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"internal-server-error">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"improper-addressing">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"host-unknown">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"host-gone">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"connection-timeout">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"conflict">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"bad-namespace-prefix">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"bad-format">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"text">>, <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"stream:features">>, <<"jabber:client">>},
     {<<"stream:features">>, <<"jabber:server">>},
     {<<"failure">>, <<"urn:ietf:params:xml:ns:xmpp-tls">>},
     {<<"proceed">>, <<"urn:ietf:params:xml:ns:xmpp-tls">>},
     {<<"starttls">>, <<"urn:ietf:params:xml:ns:xmpp-tls">>},
     {<<"required">>, <<"urn:ietf:params:xml:ns:xmpp-tls">>},
     {<<"mechanisms">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"mechanism">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"failure">>, <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"temporary-auth-failure">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"bad-protocol">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"not-authorized">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"mechanism-too-weak">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"malformed-request">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"invalid-mechanism">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"invalid-authzid">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"incorrect-encoding">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"encryption-required">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"credentials-expired">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"account-disabled">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"aborted">>, <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"text">>, <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"success">>, <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"response">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"challenge">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"abort">>, <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"auth">>, <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"bind">>, <<"urn:ietf:params:xml:ns:xmpp-bind">>},
     {<<"resource">>,
      <<"urn:ietf:params:xml:ns:xmpp-bind">>},
     {<<"jid">>, <<"urn:ietf:params:xml:ns:xmpp-bind">>},
     {<<"error">>, <<"jabber:client">>},
     {<<"error">>, <<"jabber:server">>},
     {<<"error">>, <<"jabber:component:accept">>},
     {<<"text">>, <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"unexpected-request">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"undefined-condition">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"subscription-required">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"service-unavailable">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"resource-constraint">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"remote-server-timeout">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"remote-server-not-found">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"registration-required">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"redirect">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"recipient-unavailable">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"policy-violation">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"payment-required">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"not-authorized">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"not-allowed">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"not-acceptable">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"jid-malformed">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"item-not-found">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"internal-server-error">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"gone">>, <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"forbidden">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"feature-not-implemented">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"conflict">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"bad-request">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"presence">>, <<"jabber:client">>},
     {<<"presence">>, <<"jabber:server">>},
     {<<"presence">>, <<"jabber:component:accept">>},
     {<<"priority">>, <<"jabber:client">>},
     {<<"priority">>, <<"jabber:server">>},
     {<<"priority">>, <<"jabber:component:accept">>},
     {<<"status">>, <<"jabber:client">>},
     {<<"status">>, <<"jabber:server">>},
     {<<"status">>, <<"jabber:component:accept">>},
     {<<"show">>, <<"jabber:client">>},
     {<<"show">>, <<"jabber:server">>},
     {<<"show">>, <<"jabber:component:accept">>},
     {<<"message">>, <<"jabber:client">>},
     {<<"message">>, <<"jabber:server">>},
     {<<"message">>, <<"jabber:component:accept">>},
     {<<"thread">>, <<"jabber:client">>},
     {<<"thread">>, <<"jabber:server">>},
     {<<"thread">>, <<"jabber:component:accept">>},
     <<"b">>,
     {<<"subject">>, <<"jabber:client">>},
     {<<"subject">>, <<"jabber:server">>},
     {<<"subject">>, <<"jabber:component:accept">>},
     <<"iq">>].

do_encode({iq, _, _, _, _, _, _, _} = Iq, TopXMLNS) ->
    encode_iq(Iq, TopXMLNS);
do_encode({message, _, _, _, _, _, _, _, _, _, _} =
	      Message,
	  TopXMLNS) ->
    encode_message(Message, TopXMLNS);
do_encode({presence, _, _, _, _, _, _, _, _, _, _} =
	      Presence,
	  TopXMLNS) ->
    encode_presence(Presence, TopXMLNS);
do_encode({gone, _} = Gone, TopXMLNS) ->
    encode_error_gone(Gone, TopXMLNS);
do_encode({redirect, _} = Redirect, TopXMLNS) ->
    encode_error_redirect(Redirect, TopXMLNS);
do_encode({stanza_error, _, _, _, _, _, _} = Error,
	  TopXMLNS) ->
    encode_error(Error, TopXMLNS);

do_encode({stream_features, _} = Stream_features,
	  TopXMLNS) ->
    encode_stream_features(Stream_features, TopXMLNS);
do_encode({text, _, _} = Text, TopXMLNS) ->
    encode_stream_error_text(Text, TopXMLNS);
do_encode({'see-other-host', _} = See_other_host,
	  TopXMLNS) ->
    encode_stream_error_see_other_host(See_other_host,
				       TopXMLNS);
do_encode({stream_error, _, _} = Stream_error,
	  TopXMLNS) ->
    encode_stream_error(Stream_error, TopXMLNS);
do_encode({stream_start, _, _, _, _, _, _, _, _} =
	      Stream_stream,
	  TopXMLNS) ->
    encode_stream_start(Stream_stream, TopXMLNS).

do_get_name({bind, _, _}) -> <<"bind">>;
do_get_name({gone, _}) -> <<"gone">>;
do_get_name({iq, _, _, _, _, _, _, _}) -> <<"iq">>;
do_get_name({message, _, _, _, _, _, _, _, _, _, _}) ->
    <<"message">>;
do_get_name({message_thread, _, _}) -> <<"thread">>;
do_get_name({presence, _, _, _, _, _, _, _, _, _, _}) ->
    <<"presence">>;
do_get_name({redirect, _}) -> <<"redirect">>;
do_get_name({sasl_abort}) -> <<"abort">>;
do_get_name({sasl_auth, _, _}) -> <<"auth">>;
do_get_name({sasl_challenge, _}) -> <<"challenge">>;
do_get_name({sasl_failure, _, _}) -> <<"failure">>;
do_get_name({sasl_mechanisms, _}) -> <<"mechanisms">>;
do_get_name({sasl_response, _}) -> <<"response">>;
do_get_name({sasl_success, _}) -> <<"success">>;
do_get_name({'see-other-host', _}) ->
    <<"see-other-host">>;
do_get_name({stanza_error, _, _, _, _, _, _}) ->
    <<"error">>;
do_get_name({starttls, _}) -> <<"starttls">>;
do_get_name({starttls_failure}) -> <<"failure">>;
do_get_name({starttls_proceed}) -> <<"proceed">>;
do_get_name({stream_error, _, _}) -> <<"stream:error">>;
do_get_name({stream_features, _}) ->
    <<"stream:features">>;
do_get_name({stream_start, _, _, _, _, _, _, _, _}) ->
    <<"stream:stream">>;
do_get_name({text, _, _}) -> <<"text">>.

do_get_ns({bind, _, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-bind">>;
do_get_ns({gone, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-stanzas">>;
do_get_ns({iq, _, _, _, _, _, _, _}) ->
    <<"jabber:client">>;
do_get_ns({message, _, _, _, _, _, _, _, _, _, _}) ->
    <<"jabber:client">>;
do_get_ns({message_thread, _, _}) ->
    <<"jabber:client">>;
do_get_ns({presence, _, _, _, _, _, _, _, _, _, _}) ->
    <<"jabber:client">>;
do_get_ns({redirect, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-stanzas">>;
do_get_ns({sasl_abort}) ->
    <<"urn:ietf:params:xml:ns:xmpp-sasl">>;
do_get_ns({sasl_auth, _, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-sasl">>;
do_get_ns({sasl_challenge, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-sasl">>;
do_get_ns({sasl_failure, _, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-sasl">>;
do_get_ns({sasl_mechanisms, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-sasl">>;
do_get_ns({sasl_response, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-sasl">>;
do_get_ns({sasl_success, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-sasl">>;
do_get_ns({'see-other-host', _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-streams">>;
do_get_ns({stanza_error, _, _, _, _, _, _}) ->
    <<"jabber:client">>;
do_get_ns({starttls, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-tls">>;
do_get_ns({starttls_failure}) ->
    <<"urn:ietf:params:xml:ns:xmpp-tls">>;
do_get_ns({starttls_proceed}) ->
    <<"urn:ietf:params:xml:ns:xmpp-tls">>;
do_get_ns({stream_error, _, _}) -> <<"jabber:client">>;
do_get_ns({stream_features, _}) -> <<"jabber:client">>;
do_get_ns({stream_start, _, _, _, _, Xmlns, _, _, _}) ->
    Xmlns.

get_els({iq, _id, _type, _lang, _from, _to, _sub_els,
	 _meta}) ->
    _sub_els;
get_els({message, _id, _type, _lang, _from, _to,
	 _subject, _body, _thread, _sub_els, _meta}) ->
    _sub_els;
get_els({presence, _id, _type, _lang, _from, _to, _show,
	 _status, _priority, _sub_els, _meta}) ->
    _sub_els;
get_els({stanza_error, _type, _code, _by, _reason,
	 _text, _sub_els}) ->
    _sub_els;
get_els({stream_features, _sub_els}) -> _sub_els.

set_els({iq, _id, _type, _lang, _from, _to, _, _meta},
	_sub_els) ->
    {iq, _id, _type, _lang, _from, _to, _sub_els, _meta};
set_els({message, _id, _type, _lang, _from, _to,
	 _subject, _body, _thread, _, _meta},
	_sub_els) ->
    {message, _id, _type, _lang, _from, _to, _subject,
     _body, _thread, _sub_els, _meta};
set_els({presence, _id, _type, _lang, _from, _to, _show,
	 _status, _priority, _, _meta},
	_sub_els) ->
    {presence, _id, _type, _lang, _from, _to, _show,
     _status, _priority, _sub_els, _meta};
set_els({stanza_error, _type, _code, _by, _reason,
	 _text, _},
	_sub_els) ->
    {stanza_error, _type, _code, _by, _reason, _text,
     _sub_els};
set_els({stream_features, _}, _sub_els) ->
    {stream_features, _sub_els}.

pp(iq, 7) -> [id, type, lang, from, to, sub_els, meta];
pp(message_thread, 2) -> [parent, data];
pp(message, 10) ->
    [id, type, lang, from, to, subject, body, thread,
     sub_els, meta];
pp(presence, 10) ->
    [id, type, lang, from, to, show, status, priority,
     sub_els, meta];
pp(gone, 1) -> [uri];
pp(redirect, 1) -> [uri];
pp(stanza_error, 6) ->
    [type, code, by, reason, text, sub_els];
pp(bind, 2) -> [jid, resource];
pp(sasl_auth, 2) -> [mechanism, text];
pp(sasl_abort, 0) -> [];
pp(sasl_challenge, 1) -> [text];
pp(sasl_response, 1) -> [text];
pp(sasl_success, 1) -> [text];
pp(sasl_failure, 2) -> [reason, text];
pp(sasl_mechanisms, 1) -> [list];
pp(starttls, 1) -> [required];
pp(starttls_proceed, 0) -> [];
pp(starttls_failure, 0) -> [];
pp(stream_features, 1) -> [sub_els];
pp(text, 2) -> [lang, data];
pp('see-other-host', 1) -> [host];
pp(stream_error, 2) -> [reason, text];
pp(stream_start, 8) ->
    [from, to, id, version, xmlns, stream_xmlns, db_xmlns,
     lang];
pp(_, _) -> no.

records() ->
    [{iq, 7}, {message_thread, 2}, {message, 10},
     {presence, 10}, {gone, 1}, {redirect, 1},
     {stanza_error, 6}, {bind, 2}, {sasl_auth, 2},
     {sasl_abort, 0}, {sasl_challenge, 1},
     {sasl_response, 1}, {sasl_success, 1},
     {sasl_failure, 2}, {sasl_mechanisms, 1}, {starttls, 1},
     {starttls_proceed, 0}, {starttls_failure, 0},
     {stream_features, 1}, {text, 2}, {'see-other-host', 1},
     {stream_error, 2}, {stream_start, 8}].

check_resource(R) ->
    case jid:resourceprep(R) of
      error -> erlang:error(badarg);
      _ -> R
    end.

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
      true -> AtomVal
    end.

dec_host(S) -> try dec_ip(S) catch _:_ -> S end.

dec_host_port(<<$[, T/binary>>) ->
    [IP, <<$:, Port/binary>>] = binary:split(T, <<$]>>),
    {dec_ip(IP), dec_int(Port, 0, 65535)};
dec_host_port(S) ->
    case binary:split(S, <<$:>>) of
      [S] -> dec_host(S);
      [S, P] -> {dec_host(S), dec_int(P, 0, 65535)}
    end.

dec_int(Val) -> dec_int(Val, infinity, infinity).

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

dec_ip(S) ->
    {ok, Addr} = inet_parse:address(binary_to_list(S)),
    Addr.

dec_message_type(<<"chat">>) -> chat;
dec_message_type(<<"group">>) -> group;
dec_message_type(<<"error">>) -> error;
dec_message_type(_) -> normal.

dec_version(S) ->
    [Major, Minor] = binary:split(S, <<$.>>),
    {binary_to_integer(Major), binary_to_integer(Minor)}.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

enc_host_port(Host) when is_binary(Host) -> Host;
enc_host_port({Addr, Port}) when is_tuple(Addr) ->
    enc_host_port({enc_host_port(Addr), Port});
enc_host_port({Host, Port}) ->
    <<Host/binary, $:, (integer_to_binary(Port))/binary>>;
enc_host_port({_, _, _, _} = IPv4) -> enc_ip(IPv4);
enc_host_port({0, 0, 0, 0, 0, 65535, _, _} = IP) ->
    enc_ip(IP);
enc_host_port({_, _, _, _, _, _, _, _} = IPv6) ->
    <<$[, (enc_ip(IPv6))/binary, $]>>.

enc_int(Int) -> erlang:integer_to_binary(Int).

enc_ip({0, 0, 0, 0, 0, 65535, A, B}) ->
    enc_ip({(A bsr 8) band 255, A band 255,
	    (B bsr 8) band 255, B band 255});
enc_ip(Addr) -> list_to_binary(inet_parse:ntoa(Addr)).

enc_version({Maj, Min}) ->
    <<(integer_to_binary(Maj))/binary, $.,
      (integer_to_binary(Min))/binary>>.

decode_stream_start(__Opts, {xmlel, <<"s:s">>, _attrs, _els}) ->
	{From, To, Id} = decode_stream_start_attrs(_attrs, undefined, undefined, undefined),
	#stream_start{from = From, to = To, id = Id}.

decode_stream_start_attrs([{<<"from">>, _val} | _attrs], _From, To, Id) ->
    decode_stream_start_attrs(_attrs, _val, To, Id);
decode_stream_start_attrs([{<<"to">>, _val} | _attrs], From, _To, Id) ->
    decode_stream_start_attrs(_attrs, From, _val, Id);
decode_stream_start_attrs([{<<"id">>, _val} | _attrs], From, To, _Id) ->
    decode_stream_start_attrs(_attrs, From, To, _val);
decode_stream_start_attrs([_ | _attrs], From, To, Id) ->
    decode_stream_start_attrs(_attrs, From, To, Id);
decode_stream_start_attrs([], From, To, Id) ->
    {decode_attr_from(From),
     decode_attr_to(To),
     decode_attr_id(Id)}.

encode_stream_start({stream_start, From, To, Id}) ->
  _els = [],
  Attrs = [encode_attr_from(From),
          encode_attr_to(To),
          encode_attr_id(Id)],
  _attrs = remove_undefined_attrs(Attrs, []),
  {xmlel, <<"s:s">>, _attrs, _els}.

remove_undefined_attrs([undefined | R], Res) ->
  remove_undefined_attrs(R, Res);
remove_undefined_attrs([ C | R], Res) ->
  remove_undefined_attrs(R, [C | Res]);
remove_undefined_attrs([], Res) ->
  Res.

decode_attr_from(undefined) ->
    undefined;
decode_attr_from(_val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec, {bad_attr_value, <<"f">>, <<"s:s">>}});
      _res -> _res
    end.

encode_attr_from(undefined) -> undefined;
encode_attr_from(_val) -> {<<"f">>, jid:encode(_val)}.

decode_attr_to(undefined) ->
    undefined;
decode_attr_to(_val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"to">>, <<"s:s">>}});
      _res -> _res
    end.

encode_attr_to(undefined) -> undefined;
encode_attr_to(_val) -> {<<"to">>, jid:encode(_val)}.

decode_attr_id(undefined) -> <<>>;
decode_attr_id(_val) -> _val.

encode_attr_id(<<>>) -> undefined;
encode_attr_id(_val) -> {<<"id">>, _val}.

decode_stream_error(__Opts, {xmlel, <<"s:e">>, _attrs, _els}) ->
  {Text, Reason} = decode_stream_error_els(__Opts, _els, [], undefined),
  #stream_error{reason = Reason, text = Text}.

decode_stream_error_els(__Opts, [], Text, Reason) ->
    {lists:reverse(Text), Reason};
decode_stream_error_els(__Opts,	[{xmlel, <<"text">>, _attrs, _} = _el | _els], Text, Reason) ->
  decode_stream_error_els(__Opts, _els, [decode_stream_error_text(<<"urn:ietf:params:xml:ns:xmpp-streams">>, __Opts, _el) | Text], Reason);
decode_stream_error_els(__Opts,	[{xmlel, <<"bad-format">>, _attrs, _} = _el | _els], Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_bad_format(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								 __Opts, _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"bad-namespace-prefix">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_bad_namespace_prefix(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									   __Opts,
									   _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"conflict">>, _attrs, _} = _el | _els], Text,
			Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_conflict(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
							       __Opts, _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"connection-timeout">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_connection_timeout(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									 __Opts,
									 _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"host-gone">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_host_gone(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								__Opts, _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"host-unknown">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_host_unknown(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								   __Opts,
								   _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"improper-addressing">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_improper_addressing(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									  __Opts,
									  _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"internal-server-error">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_internal_server_error(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									    __Opts,
									    _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"invalid-from">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_invalid_from(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								   __Opts,
								   _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"invalid-id">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_invalid_id(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								 __Opts, _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"invalid-namespace">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_invalid_namespace(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									__Opts,
									_el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"invalid-xml">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_invalid_xml(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								  __Opts, _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"not-authorized">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_not_authorized(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								     __Opts,
								     _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"not-well-formed">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_not_well_formed(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								      __Opts,
								      _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"policy-violation">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_policy_violation(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								       __Opts,
								       _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"remote-connection-failed">>, _attrs, _} =
			     _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_remote_connection_failed(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									       __Opts,
									       _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"reset">>, _attrs, _} = _el | _els], Text,
			Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_reset(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
							    __Opts, _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"resource-constraint">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_resource_constraint(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									  __Opts,
									  _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"restricted-xml">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_restricted_xml(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								     __Opts,
								     _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"see-other-host">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_see_other_host(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								     __Opts,
								     _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"system-shutdown">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_system_shutdown(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								      __Opts,
								      _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"undefined-condition">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_undefined_condition(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									  __Opts,
									  _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"unsupported-encoding">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_unsupported_encoding(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									   __Opts,
									   _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"unsupported-feature">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_unsupported_feature(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									  __Opts,
									  _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"unsupported-stanza-type">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_unsupported_stanza_type(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									      __Opts,
									      _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"unsupported-version">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_unsupported_version(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									  __Opts,
									  _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts, [_ | _els],
			Text, Reason) ->
    decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
			    Reason).

encode_stream_error({stream_error, Reason, Text},
		    __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = lists:reverse('encode_stream_error_$text'(Text,
						     __NewTopXMLNS,
						     'encode_stream_error_$reason'(Reason,
										   __NewTopXMLNS,
										   []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"stream:error">>, _attrs, _els}.

'encode_stream_error_$text'([], __TopXMLNS, _acc) ->
    _acc;
'encode_stream_error_$text'([Text | _els], __TopXMLNS,
			    _acc) ->
    'encode_stream_error_$text'(_els, __TopXMLNS,
				[encode_stream_error_text(Text, __TopXMLNS)
				 | _acc]).

'encode_stream_error_$reason'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_stream_error_$reason'('bad-format' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_bad_format(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('bad-namespace-prefix' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_bad_namespace_prefix(Reason,
					      __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'(conflict = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_conflict(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('connection-timeout' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_connection_timeout(Reason,
					    __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('host-gone' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_host_gone(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('host-unknown' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_host_unknown(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('improper-addressing' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_improper_addressing(Reason,
					     __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('internal-server-error' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_internal_server_error(Reason,
					       __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('invalid-from' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_invalid_from(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('invalid-id' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_invalid_id(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('invalid-namespace' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_invalid_namespace(Reason,
					   __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('invalid-xml' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_invalid_xml(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('not-authorized' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_not_authorized(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('not-well-formed' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_not_well_formed(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('policy-violation' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_policy_violation(Reason,
					  __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('remote-connection-failed' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_remote_connection_failed(Reason,
						  __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'(reset = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_reset(Reason, __TopXMLNS) | _acc];
'encode_stream_error_$reason'('resource-constraint' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_resource_constraint(Reason,
					     __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('restricted-xml' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_restricted_xml(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'({'see-other-host', _} =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_see_other_host(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('system-shutdown' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_system_shutdown(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('undefined-condition' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_undefined_condition(Reason,
					     __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('unsupported-encoding' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_unsupported_encoding(Reason,
					      __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('unsupported-feature' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_unsupported_feature(Reason,
					     __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('unsupported-stanza-type' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_unsupported_stanza_type(Reason,
						 __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('unsupported-version' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_unsupported_version(Reason,
					     __TopXMLNS)
     | _acc].

decode_stream_error_unsupported_version(__TopXMLNS,
					__Opts,
					{xmlel, <<"unsupported-version">>,
					 _attrs, _els}) ->
    'unsupported-version'.

encode_stream_error_unsupported_version('unsupported-version',
					__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"unsupported-version">>, _attrs, _els}.

decode_stream_error_unsupported_stanza_type(__TopXMLNS,
					    __Opts,
					    {xmlel,
					     <<"unsupported-stanza-type">>,
					     _attrs, _els}) ->
    'unsupported-stanza-type'.

encode_stream_error_unsupported_stanza_type('unsupported-stanza-type',
					    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"unsupported-stanza-type">>, _attrs, _els}.

decode_stream_error_unsupported_feature(__TopXMLNS,
					__Opts,
					{xmlel, <<"unsupported-feature">>,
					 _attrs, _els}) ->
    'unsupported-feature'.

encode_stream_error_unsupported_feature('unsupported-feature',
					__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"unsupported-feature">>, _attrs, _els}.

decode_stream_error_unsupported_encoding(__TopXMLNS,
					 __Opts,
					 {xmlel, <<"unsupported-encoding">>,
					  _attrs, _els}) ->
    'unsupported-encoding'.

encode_stream_error_unsupported_encoding('unsupported-encoding',
					 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"unsupported-encoding">>, _attrs, _els}.

decode_stream_error_undefined_condition(__TopXMLNS,
					__Opts,
					{xmlel, <<"undefined-condition">>,
					 _attrs, _els}) ->
    'undefined-condition'.

encode_stream_error_undefined_condition('undefined-condition',
					__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"undefined-condition">>, _attrs, _els}.

decode_stream_error_system_shutdown(__TopXMLNS, __Opts,
				    {xmlel, <<"system-shutdown">>, _attrs,
				     _els}) ->
    'system-shutdown'.

encode_stream_error_system_shutdown('system-shutdown',
				    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"system-shutdown">>, _attrs, _els}.

decode_stream_error_see_other_host(__TopXMLNS, __Opts,
				   {xmlel, <<"see-other-host">>, _attrs,
				    _els}) ->
    Host =
	decode_stream_error_see_other_host_els(__TopXMLNS,
					       __Opts, _els, <<>>),
    {'see-other-host', Host}.

decode_stream_error_see_other_host_els(__TopXMLNS,
				       __Opts, [], Host) ->
    decode_stream_error_see_other_host_cdata(__TopXMLNS,
					     Host);
decode_stream_error_see_other_host_els(__TopXMLNS,
				       __Opts, [{xmlcdata, _data} | _els],
				       Host) ->
    decode_stream_error_see_other_host_els(__TopXMLNS,
					   __Opts, _els,
					   <<Host/binary, _data/binary>>);
decode_stream_error_see_other_host_els(__TopXMLNS,
				       __Opts, [_ | _els], Host) ->
    decode_stream_error_see_other_host_els(__TopXMLNS,
					   __Opts, _els, Host).

encode_stream_error_see_other_host({'see-other-host',
				    Host},
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = encode_stream_error_see_other_host_cdata(Host,
						    []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"see-other-host">>, _attrs, _els}.

decode_stream_error_see_other_host_cdata(__TopXMLNS,
					 <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"see-other-host">>,
		   __TopXMLNS}});
decode_stream_error_see_other_host_cdata(__TopXMLNS,
					 _val) ->
    case catch dec_host_port(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"see-other-host">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_stream_error_see_other_host_cdata(_val, _acc) ->
    [{xmlcdata, enc_host_port(_val)} | _acc].

decode_stream_error_restricted_xml(__TopXMLNS, __Opts,
				   {xmlel, <<"restricted-xml">>, _attrs,
				    _els}) ->
    'restricted-xml'.

encode_stream_error_restricted_xml('restricted-xml',
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"restricted-xml">>, _attrs, _els}.

decode_stream_error_resource_constraint(__TopXMLNS,
					__Opts,
					{xmlel, <<"resource-constraint">>,
					 _attrs, _els}) ->
    'resource-constraint'.

encode_stream_error_resource_constraint('resource-constraint',
					__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"resource-constraint">>, _attrs, _els}.

decode_stream_error_reset(__TopXMLNS, __Opts,
			  {xmlel, <<"reset">>, _attrs, _els}) ->
    reset.

encode_stream_error_reset(reset, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"reset">>, _attrs, _els}.

decode_stream_error_remote_connection_failed(__TopXMLNS,
					     __Opts,
					     {xmlel,
					      <<"remote-connection-failed">>,
					      _attrs, _els}) ->
    'remote-connection-failed'.

encode_stream_error_remote_connection_failed('remote-connection-failed',
					     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"remote-connection-failed">>, _attrs, _els}.

decode_stream_error_policy_violation(__TopXMLNS, __Opts,
				     {xmlel, <<"policy-violation">>, _attrs,
				      _els}) ->
    'policy-violation'.

encode_stream_error_policy_violation('policy-violation',
				     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"policy-violation">>, _attrs, _els}.

decode_stream_error_not_well_formed(__TopXMLNS, __Opts,
				    {xmlel, <<"not-well-formed">>, _attrs,
				     _els}) ->
    'not-well-formed'.

encode_stream_error_not_well_formed('not-well-formed',
				    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"not-well-formed">>, _attrs, _els}.

decode_stream_error_not_authorized(__TopXMLNS, __Opts,
				   {xmlel, <<"not-authorized">>, _attrs,
				    _els}) ->
    'not-authorized'.

encode_stream_error_not_authorized('not-authorized',
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"not-authorized">>, _attrs, _els}.

decode_stream_error_invalid_xml(__TopXMLNS, __Opts,
				{xmlel, <<"invalid-xml">>, _attrs, _els}) ->
    'invalid-xml'.

encode_stream_error_invalid_xml('invalid-xml',
				__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"invalid-xml">>, _attrs, _els}.

decode_stream_error_invalid_namespace(__TopXMLNS,
				      __Opts,
				      {xmlel, <<"invalid-namespace">>, _attrs,
				       _els}) ->
    'invalid-namespace'.

encode_stream_error_invalid_namespace('invalid-namespace',
				      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"invalid-namespace">>, _attrs, _els}.

decode_stream_error_invalid_id(__TopXMLNS, __Opts,
			       {xmlel, <<"invalid-id">>, _attrs, _els}) ->
    'invalid-id'.

encode_stream_error_invalid_id('invalid-id',
			       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"invalid-id">>, _attrs, _els}.

decode_stream_error_invalid_from(__TopXMLNS, __Opts,
				 {xmlel, <<"invalid-from">>, _attrs, _els}) ->
    'invalid-from'.

encode_stream_error_invalid_from('invalid-from',
				 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"invalid-from">>, _attrs, _els}.

decode_stream_error_internal_server_error(__TopXMLNS,
					  __Opts,
					  {xmlel, <<"internal-server-error">>,
					   _attrs, _els}) ->
    'internal-server-error'.

encode_stream_error_internal_server_error('internal-server-error',
					  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"internal-server-error">>, _attrs, _els}.

decode_stream_error_improper_addressing(__TopXMLNS,
					__Opts,
					{xmlel, <<"improper-addressing">>,
					 _attrs, _els}) ->
    'improper-addressing'.

encode_stream_error_improper_addressing('improper-addressing',
					__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"improper-addressing">>, _attrs, _els}.

decode_stream_error_host_unknown(__TopXMLNS, __Opts,
				 {xmlel, <<"host-unknown">>, _attrs, _els}) ->
    'host-unknown'.

encode_stream_error_host_unknown('host-unknown',
				 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"host-unknown">>, _attrs, _els}.

decode_stream_error_host_gone(__TopXMLNS, __Opts,
			      {xmlel, <<"host-gone">>, _attrs, _els}) ->
    'host-gone'.

encode_stream_error_host_gone('host-gone',
			      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"host-gone">>, _attrs, _els}.

decode_stream_error_connection_timeout(__TopXMLNS,
				       __Opts,
				       {xmlel, <<"connection-timeout">>, _attrs,
					_els}) ->
    'connection-timeout'.

encode_stream_error_connection_timeout('connection-timeout',
				       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"connection-timeout">>, _attrs, _els}.

decode_stream_error_conflict(__TopXMLNS, __Opts,
			     {xmlel, <<"conflict">>, _attrs, _els}) ->
    conflict.

encode_stream_error_conflict(conflict, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"conflict">>, _attrs, _els}.

decode_stream_error_bad_namespace_prefix(__TopXMLNS,
					 __Opts,
					 {xmlel, <<"bad-namespace-prefix">>,
					  _attrs, _els}) ->
    'bad-namespace-prefix'.

encode_stream_error_bad_namespace_prefix('bad-namespace-prefix',
					 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"bad-namespace-prefix">>, _attrs, _els}.

decode_stream_error_bad_format(__TopXMLNS, __Opts,
			       {xmlel, <<"bad-format">>, _attrs, _els}) ->
    'bad-format'.

encode_stream_error_bad_format('bad-format',
			       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"bad-format">>, _attrs, _els}.

decode_stream_error_text(__TopXMLNS, __Opts,
			 {xmlel, <<"text">>, _attrs, _els}) ->
    Data = decode_stream_error_text_els(__TopXMLNS, __Opts,
					_els, <<>>),
    Lang = decode_stream_error_text_attrs(__TopXMLNS,
					  _attrs, undefined),
    {text, Lang, Data}.

decode_stream_error_text_els(__TopXMLNS, __Opts, [],
			     Data) ->
    decode_stream_error_text_cdata(__TopXMLNS, Data);
decode_stream_error_text_els(__TopXMLNS, __Opts,
			     [{xmlcdata, _data} | _els], Data) ->
    decode_stream_error_text_els(__TopXMLNS, __Opts, _els,
				 <<Data/binary, _data/binary>>);
decode_stream_error_text_els(__TopXMLNS, __Opts,
			     [_ | _els], Data) ->
    decode_stream_error_text_els(__TopXMLNS, __Opts, _els,
				 Data).

decode_stream_error_text_attrs(__TopXMLNS,
			       [{<<"xml:lang">>, _val} | _attrs], _Lang) ->
    decode_stream_error_text_attrs(__TopXMLNS, _attrs,
				   _val);
decode_stream_error_text_attrs(__TopXMLNS, [_ | _attrs],
			       Lang) ->
    decode_stream_error_text_attrs(__TopXMLNS, _attrs,
				   Lang);
decode_stream_error_text_attrs(__TopXMLNS, [], Lang) ->
    'decode_stream_error_text_attr_xml:lang'(__TopXMLNS,
					     Lang).

encode_stream_error_text({text, Lang, Data},
			 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = encode_stream_error_text_cdata(Data, []),
    _attrs = 'encode_stream_error_text_attr_xml:lang'(Lang,
						      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
										 __TopXMLNS)),
    {xmlel, <<"text">>, _attrs, _els}.

'decode_stream_error_text_attr_xml:lang'(__TopXMLNS,
					 undefined) ->
    <<>>;
'decode_stream_error_text_attr_xml:lang'(__TopXMLNS,
					 _val) ->
    case catch xmpp_lang:check(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"xml:lang">>, <<"text">>,
			 __TopXMLNS}});
      _res -> _res
    end.

'encode_stream_error_text_attr_xml:lang'(<<>>, _acc) ->
    _acc;
'encode_stream_error_text_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_stream_error_text_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_stream_error_text_cdata(__TopXMLNS, _val) ->
    _val.

encode_stream_error_text_cdata(<<>>, _acc) -> _acc;
encode_stream_error_text_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].



decode_error(__Opts, {xmlel, <<"error">>, _attrs, _els}) ->
    {Text, Reason, __Els} = decode_error_els(__TopXMLNS,
					     __Opts, _els, [], undefined, []),
    {Type, Code, By} = decode_error_attrs(__TopXMLNS,
					  _attrs, undefined, undefined,
					  undefined),
    {stanza_error, Type, Code, By, Reason, Text, __Els}.

decode_error_els(__TopXMLNS, __Opts, [], Text, Reason,
		 __Els) ->
    {lists:reverse(Text), Reason, lists:reverse(__Els)};
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"text">>, _attrs, _} = _el | _els], Text,
		 Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els,
			   [decode_error_text(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
					      __Opts, _el)
			    | Text],
			   Reason, __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"bad-request">>, _attrs, _} = _el | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_bad_request(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						    __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"conflict">>, _attrs, _} = _el | _els], Text,
		 Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_conflict(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						 __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"feature-not-implemented">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_feature_not_implemented(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
								__Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"forbidden">>, _attrs, _} = _el | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_forbidden(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						  __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"gone">>, _attrs, _} = _el | _els], Text,
		 Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_gone(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
					     __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"internal-server-error">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_internal_server_error(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							      __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"item-not-found">>, _attrs, _} = _el | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_item_not_found(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						       __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"jid-malformed">>, _attrs, _} = _el | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_jid_malformed(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						      __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"not-acceptable">>, _attrs, _} = _el | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_not_acceptable(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						       __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"not-allowed">>, _attrs, _} = _el | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_not_allowed(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						    __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"not-authorized">>, _attrs, _} = _el | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_not_authorized(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						       __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"payment-required">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_payment_required(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							 __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"policy-violation">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_policy_violation(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							 __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"recipient-unavailable">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_recipient_unavailable(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							      __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"redirect">>, _attrs, _} = _el | _els], Text,
		 Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_redirect(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						 __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"registration-required">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_registration_required(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							      __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"remote-server-not-found">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_remote_server_not_found(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
								__Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"remote-server-timeout">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_remote_server_timeout(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							      __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"resource-constraint">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_resource_constraint(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							    __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"service-unavailable">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_service_unavailable(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							    __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"subscription-required">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_subscription_required(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							      __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"undefined-condition">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_undefined_condition(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							    __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"unexpected-request">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_unexpected_request(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							   __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els])
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, _name, _attrs, _} = _el | _els], Text, Reason,
		 __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
      true ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els]);
      false ->
	  __XMLNS = xmpp_codec:get_attr(<<"xmlns">>, _attrs,
					__TopXMLNS),
	  case xmpp_codec:get_mod(_name, __XMLNS) of
	    undefined ->
		decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
				 [_el | __Els]);
	    Mod ->
		decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
				 [Mod:do_decode(_name, __XMLNS, _el, __Opts)
				  | __Els])
	  end
    end;
decode_error_els(__TopXMLNS, __Opts, [_ | _els], Text,
		 Reason, __Els) ->
    decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
		     __Els).

decode_error_attrs(__TopXMLNS,
		   [{<<"type">>, _val} | _attrs], _Type, Code, By) ->
    decode_error_attrs(__TopXMLNS, _attrs, _val, Code, By);
decode_error_attrs(__TopXMLNS,
		   [{<<"code">>, _val} | _attrs], Type, _Code, By) ->
    decode_error_attrs(__TopXMLNS, _attrs, Type, _val, By);
decode_error_attrs(__TopXMLNS,
		   [{<<"by">>, _val} | _attrs], Type, Code, _By) ->
    decode_error_attrs(__TopXMLNS, _attrs, Type, Code,
		       _val);
decode_error_attrs(__TopXMLNS, [_ | _attrs], Type, Code,
		   By) ->
    decode_error_attrs(__TopXMLNS, _attrs, Type, Code, By);
decode_error_attrs(__TopXMLNS, [], Type, Code, By) ->
    {decode_error_attr_type(__TopXMLNS, Type),
     decode_error_attr_code(__TopXMLNS, Code),
     decode_error_attr_by(__TopXMLNS, By)}.

encode_error({stanza_error, Type, Code, By, Reason,
	      Text, __Els},
	     __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
	    || _el <- __Els]
	     ++
	     lists:reverse('encode_error_$text'(Text, __NewTopXMLNS,
						'encode_error_$reason'(Reason,
								       __NewTopXMLNS,
								       []))),
    _attrs = encode_error_attr_by(By,
				  encode_error_attr_code(Code,
							 encode_error_attr_type(Type,
										xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
													   __TopXMLNS)))),
    {xmlel, <<"error">>, _attrs, _els}.

'encode_error_$text'([], __TopXMLNS, _acc) -> _acc;
'encode_error_$text'([Text | _els], __TopXMLNS, _acc) ->
    'encode_error_$text'(_els, __TopXMLNS,
			 [encode_error_text(Text, __TopXMLNS) | _acc]).

'encode_error_$reason'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_error_$reason'('bad-request' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_bad_request(Reason, __TopXMLNS) | _acc];
'encode_error_$reason'(conflict = Reason, __TopXMLNS,
		       _acc) ->
    [encode_error_conflict(Reason, __TopXMLNS) | _acc];
'encode_error_$reason'('feature-not-implemented' =
			   Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_feature_not_implemented(Reason,
					  __TopXMLNS)
     | _acc];
'encode_error_$reason'(forbidden = Reason, __TopXMLNS,
		       _acc) ->
    [encode_error_forbidden(Reason, __TopXMLNS) | _acc];
'encode_error_$reason'({gone, _} = Reason, __TopXMLNS,
		       _acc) ->
    [encode_error_gone(Reason, __TopXMLNS) | _acc];
'encode_error_$reason'('internal-server-error' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_internal_server_error(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('item-not-found' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_item_not_found(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('jid-malformed' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_jid_malformed(Reason, __TopXMLNS) | _acc];
'encode_error_$reason'('not-acceptable' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_not_acceptable(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('not-allowed' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_not_allowed(Reason, __TopXMLNS) | _acc];
'encode_error_$reason'('not-authorized' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_not_authorized(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('payment-required' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_payment_required(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('policy-violation' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_policy_violation(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('recipient-unavailable' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_recipient_unavailable(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'({redirect, _} = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_redirect(Reason, __TopXMLNS) | _acc];
'encode_error_$reason'('registration-required' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_registration_required(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('remote-server-not-found' =
			   Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_remote_server_not_found(Reason,
					  __TopXMLNS)
     | _acc];
'encode_error_$reason'('remote-server-timeout' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_remote_server_timeout(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('resource-constraint' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_resource_constraint(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('service-unavailable' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_service_unavailable(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('subscription-required' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_subscription_required(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('undefined-condition' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_undefined_condition(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('unexpected-request' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_unexpected_request(Reason, __TopXMLNS)
     | _acc].

decode_error_attr_type(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"type">>, <<"error">>, __TopXMLNS}});
decode_error_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
			[auth, cancel, continue, modify, wait])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"type">>, <<"error">>, __TopXMLNS}});
      _res -> _res
    end.

encode_error_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_error_attr_code(__TopXMLNS, undefined) ->
    undefined;
decode_error_attr_code(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"code">>, <<"error">>, __TopXMLNS}});
      _res -> _res
    end.

encode_error_attr_code(undefined, _acc) -> _acc;
encode_error_attr_code(_val, _acc) ->
    [{<<"code">>, enc_int(_val)} | _acc].

decode_error_attr_by(__TopXMLNS, undefined) ->
    undefined;
decode_error_attr_by(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"by">>, <<"error">>, __TopXMLNS}});
      _res -> _res
    end.

encode_error_attr_by(undefined, _acc) -> _acc;
encode_error_attr_by(_val, _acc) ->
    [{<<"by">>, jid:encode(_val)} | _acc].

decode_error_text(__TopXMLNS, __Opts,
		  {xmlel, <<"text">>, _attrs, _els}) ->
    Data = decode_error_text_els(__TopXMLNS, __Opts, _els,
				 <<>>),
    Lang = decode_error_text_attrs(__TopXMLNS, _attrs,
				   undefined),
    {text, Lang, Data}.

decode_error_text_els(__TopXMLNS, __Opts, [], Data) ->
    decode_error_text_cdata(__TopXMLNS, Data);
decode_error_text_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Data) ->
    decode_error_text_els(__TopXMLNS, __Opts, _els,
			  <<Data/binary, _data/binary>>);
decode_error_text_els(__TopXMLNS, __Opts, [_ | _els],
		      Data) ->
    decode_error_text_els(__TopXMLNS, __Opts, _els, Data).

decode_error_text_attrs(__TopXMLNS,
			[{<<"xml:lang">>, _val} | _attrs], _Lang) ->
    decode_error_text_attrs(__TopXMLNS, _attrs, _val);
decode_error_text_attrs(__TopXMLNS, [_ | _attrs],
			Lang) ->
    decode_error_text_attrs(__TopXMLNS, _attrs, Lang);
decode_error_text_attrs(__TopXMLNS, [], Lang) ->
    'decode_error_text_attr_xml:lang'(__TopXMLNS, Lang).

encode_error_text({text, Lang, Data}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = encode_error_text_cdata(Data, []),
    _attrs = 'encode_error_text_attr_xml:lang'(Lang,
					       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									  __TopXMLNS)),
    {xmlel, <<"text">>, _attrs, _els}.

'decode_error_text_attr_xml:lang'(__TopXMLNS,
				  undefined) ->
    <<>>;
'decode_error_text_attr_xml:lang'(__TopXMLNS, _val) ->
    case catch xmpp_lang:check(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"xml:lang">>, <<"text">>,
			 __TopXMLNS}});
      _res -> _res
    end.

'encode_error_text_attr_xml:lang'(<<>>, _acc) -> _acc;
'encode_error_text_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_error_text_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_error_text_cdata(__TopXMLNS, _val) -> _val.

encode_error_text_cdata(<<>>, _acc) -> _acc;
encode_error_text_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_error_unexpected_request(__TopXMLNS, __Opts,
				{xmlel, <<"unexpected-request">>, _attrs,
				 _els}) ->
    'unexpected-request'.

encode_error_unexpected_request('unexpected-request',
				__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"unexpected-request">>, _attrs, _els}.

decode_error_undefined_condition(__TopXMLNS, __Opts,
				 {xmlel, <<"undefined-condition">>, _attrs,
				  _els}) ->
    'undefined-condition'.

encode_error_undefined_condition('undefined-condition',
				 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"undefined-condition">>, _attrs, _els}.

decode_error_subscription_required(__TopXMLNS, __Opts,
				   {xmlel, <<"subscription-required">>, _attrs,
				    _els}) ->
    'subscription-required'.

encode_error_subscription_required('subscription-required',
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"subscription-required">>, _attrs, _els}.

decode_error_service_unavailable(__TopXMLNS, __Opts,
				 {xmlel, <<"service-unavailable">>, _attrs,
				  _els}) ->
    'service-unavailable'.

encode_error_service_unavailable('service-unavailable',
				 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"service-unavailable">>, _attrs, _els}.

decode_error_resource_constraint(__TopXMLNS, __Opts,
				 {xmlel, <<"resource-constraint">>, _attrs,
				  _els}) ->
    'resource-constraint'.

encode_error_resource_constraint('resource-constraint',
				 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"resource-constraint">>, _attrs, _els}.

decode_error_remote_server_timeout(__TopXMLNS, __Opts,
				   {xmlel, <<"remote-server-timeout">>, _attrs,
				    _els}) ->
    'remote-server-timeout'.

encode_error_remote_server_timeout('remote-server-timeout',
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"remote-server-timeout">>, _attrs, _els}.

decode_error_remote_server_not_found(__TopXMLNS, __Opts,
				     {xmlel, <<"remote-server-not-found">>,
				      _attrs, _els}) ->
    'remote-server-not-found'.

encode_error_remote_server_not_found('remote-server-not-found',
				     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"remote-server-not-found">>, _attrs, _els}.

decode_error_registration_required(__TopXMLNS, __Opts,
				   {xmlel, <<"registration-required">>, _attrs,
				    _els}) ->
    'registration-required'.

encode_error_registration_required('registration-required',
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"registration-required">>, _attrs, _els}.

decode_error_redirect(__TopXMLNS, __Opts,
		      {xmlel, <<"redirect">>, _attrs, _els}) ->
    Uri = decode_error_redirect_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    {redirect, Uri}.

decode_error_redirect_els(__TopXMLNS, __Opts, [],
			  Uri) ->
    decode_error_redirect_cdata(__TopXMLNS, Uri);
decode_error_redirect_els(__TopXMLNS, __Opts,
			  [{xmlcdata, _data} | _els], Uri) ->
    decode_error_redirect_els(__TopXMLNS, __Opts, _els,
			      <<Uri/binary, _data/binary>>);
decode_error_redirect_els(__TopXMLNS, __Opts,
			  [_ | _els], Uri) ->
    decode_error_redirect_els(__TopXMLNS, __Opts, _els,
			      Uri).

encode_error_redirect({redirect, Uri}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = encode_error_redirect_cdata(Uri, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"redirect">>, _attrs, _els}.

decode_error_redirect_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_error_redirect_cdata(__TopXMLNS, _val) -> _val.

encode_error_redirect_cdata(<<>>, _acc) -> _acc;
encode_error_redirect_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_error_recipient_unavailable(__TopXMLNS, __Opts,
				   {xmlel, <<"recipient-unavailable">>, _attrs,
				    _els}) ->
    'recipient-unavailable'.

encode_error_recipient_unavailable('recipient-unavailable',
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"recipient-unavailable">>, _attrs, _els}.

decode_error_policy_violation(__TopXMLNS, __Opts,
			      {xmlel, <<"policy-violation">>, _attrs, _els}) ->
    'policy-violation'.

encode_error_policy_violation('policy-violation',
			      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"policy-violation">>, _attrs, _els}.

decode_error_payment_required(__TopXMLNS, __Opts,
			      {xmlel, <<"payment-required">>, _attrs, _els}) ->
    'payment-required'.

encode_error_payment_required('payment-required',
			      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"payment-required">>, _attrs, _els}.

decode_error_not_authorized(__TopXMLNS, __Opts,
			    {xmlel, <<"not-authorized">>, _attrs, _els}) ->
    'not-authorized'.

encode_error_not_authorized('not-authorized',
			    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"not-authorized">>, _attrs, _els}.

decode_error_not_allowed(__TopXMLNS, __Opts,
			 {xmlel, <<"not-allowed">>, _attrs, _els}) ->
    'not-allowed'.

encode_error_not_allowed('not-allowed', __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"not-allowed">>, _attrs, _els}.

decode_error_not_acceptable(__TopXMLNS, __Opts,
			    {xmlel, <<"not-acceptable">>, _attrs, _els}) ->
    'not-acceptable'.

encode_error_not_acceptable('not-acceptable',
			    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"not-acceptable">>, _attrs, _els}.

decode_error_jid_malformed(__TopXMLNS, __Opts,
			   {xmlel, <<"jid-malformed">>, _attrs, _els}) ->
    'jid-malformed'.

encode_error_jid_malformed('jid-malformed',
			   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"jid-malformed">>, _attrs, _els}.

decode_error_item_not_found(__TopXMLNS, __Opts,
			    {xmlel, <<"item-not-found">>, _attrs, _els}) ->
    'item-not-found'.

encode_error_item_not_found('item-not-found',
			    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"item-not-found">>, _attrs, _els}.

decode_error_internal_server_error(__TopXMLNS, __Opts,
				   {xmlel, <<"internal-server-error">>, _attrs,
				    _els}) ->
    'internal-server-error'.

encode_error_internal_server_error('internal-server-error',
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"internal-server-error">>, _attrs, _els}.

decode_error_gone(__TopXMLNS, __Opts,
		  {xmlel, <<"gone">>, _attrs, _els}) ->
    Uri = decode_error_gone_els(__TopXMLNS, __Opts, _els,
				<<>>),
    {gone, Uri}.

decode_error_gone_els(__TopXMLNS, __Opts, [], Uri) ->
    decode_error_gone_cdata(__TopXMLNS, Uri);
decode_error_gone_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Uri) ->
    decode_error_gone_els(__TopXMLNS, __Opts, _els,
			  <<Uri/binary, _data/binary>>);
decode_error_gone_els(__TopXMLNS, __Opts, [_ | _els],
		      Uri) ->
    decode_error_gone_els(__TopXMLNS, __Opts, _els, Uri).

encode_error_gone({gone, Uri}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = encode_error_gone_cdata(Uri, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"gone">>, _attrs, _els}.

decode_error_gone_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_error_gone_cdata(__TopXMLNS, _val) -> _val.

encode_error_gone_cdata(<<>>, _acc) -> _acc;
encode_error_gone_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_error_forbidden(__TopXMLNS, __Opts,
		       {xmlel, <<"forbidden">>, _attrs, _els}) ->
    forbidden.

encode_error_forbidden(forbidden, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"forbidden">>, _attrs, _els}.

decode_error_feature_not_implemented(__TopXMLNS, __Opts,
				     {xmlel, <<"feature-not-implemented">>,
				      _attrs, _els}) ->
    'feature-not-implemented'.

encode_error_feature_not_implemented('feature-not-implemented',
				     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"feature-not-implemented">>, _attrs, _els}.

decode_error_conflict(__TopXMLNS, __Opts,
		      {xmlel, <<"conflict">>, _attrs, _els}) ->
    conflict.

encode_error_conflict(conflict, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"conflict">>, _attrs, _els}.

decode_error_bad_request(__TopXMLNS, __Opts,
			 {xmlel, <<"bad-request">>, _attrs, _els}) ->
    'bad-request'.

encode_error_bad_request('bad-request', __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"bad-request">>, _attrs, _els}.

decode_presence(__Opts,	{xmlel, <<"p">>, _attrs, _els}) ->
  {Id, Type, From, To} = decode_presence_attrs(_attrs, undefined, undefined, undefined, undefined),
  #presence{id = Id, from = From, type = Type, to = To}.

decode_presence_attrs([{<<"id">>, _val} | _attrs], _Id, Type, From, To) ->
  decode_presence_attrs(_attrs, _val, Type, From, To);
decode_presence_attrs([{<<"type">>, _val} | _attrs], Id, _Type, From, To) ->
  decode_presence_attrs(_attrs, Id, _val, From, To);
decode_presence_attrs([{<<"from">>, _val} | _attrs], Id, Type, _From, To) ->
  decode_presence_attrs(_attrs, Id, Type, _val, To);
decode_presence_attrs([{<<"to">>, _val} | _attrs], Id, Type, From, _To) ->
  decode_presence_attrs(_attrs, Id, Type, From, _val);
decode_presence_attrs([_ | _attrs], Id, Type, From, To) ->
  decode_presence_attrs(_attrs, Id, Type, From, To);
decode_presence_attrs([], Id, Type, From, To) ->
    {decode_attr_id(Id),
     decode_presence_attr_type(Type),
     decode_attr_from(From),
     decode_attr_to(To)}.

encode_presence({presence, Id, Type, From, To}) ->
  From = encode_attr_from(From),
  To = encode_attr_to(To),
  Type = encode_presence_attr_type(Type),
  Id = encode_attr_id(Id),
  Attrs = [From,To,Id,Type],
  {xmlel, <<"p">>, remove_undefined_attrs(Attrs, []), []}.


decode_presence_attr_type(undefined) -> online;
decode_presence_attr_type(<<"on">>) -> online;
decode_presence_attr_type(<<"off">>) -> offline;
decode_presence_attr_type(_) -> online.

encode_presence_attr_type(online) -> {<<"t">>, <<"on">>};
encode_presence_attr_type(offline) -> {<<"t">>, <<"off">>};
encode_presence_attr_type(_) -> {<<"t">>, <<"on">>}.

decode_message(__Opts, {xmlel, <<"m">>, _attrs, _els}) ->
  {Body, __Els} = decode_message_els(__Opts, _els, [], []),
  {Id, Type, From, To} = decode_message_attrs(_attrs, undefined, undefined, undefined, undefined),
  #message{from = From, to = To, id = Id, type = Type, body = Body, sub_els = __Els}.

decode_message_els(__Opts, [], Body, __Els) ->
    {lists:reverse(Body), lists:reverse(__Els)};
decode_message_els(__Opts, [{xmlel, <<"b">>, _attrs, _} = _el | _els], Body, __Els) ->
  decode_message_els(__Opts, _els, [decode_message_body(__Opts, _el) | Body], __Els);
decode_message_els(__Opts, [{xmlel, _name, _attrs, _} = _el | _els], Body, __Els) ->
  case proplists:get_bool(ignore_els, __Opts) of
    true ->
	    decode_message_els(__Opts, _els, Body, __Els);
    false ->
      decode_message_els(__Opts, _els, Body, [_el | __Els])
    end;
decode_message_els(__Opts, [_ | _els], Body, __Els) ->
    decode_message_els(__Opts, _els, Body, __Els).

decode_message_attrs([{<<"id">>, _val} | _attrs], _Id, Type, From, To) ->
    decode_message_attrs(_attrs, _val, Type, From, To);
decode_message_attrs([{<<"t">>, _val} | _attrs], Id, _Type, From, To) ->
    decode_message_attrs(_attrs, Id, _val, From, To);
decode_message_attrs([{<<"f">>, _val} | _attrs], Id, Type, _From, To) ->
    decode_message_attrs(_attrs, Id, Type, _val, To);
decode_message_attrs([{<<"to">>, _val} | _attrs], Id, Type, From, _To) ->
    decode_message_attrs(_attrs, Id, Type, From, _val);
decode_message_attrs([_ | _attrs], Id, Type, From, To) ->
    decode_message_attrs(_attrs, Id, Type, From, To);
decode_message_attrs([], Id, Type, From, To) ->
    {decode_attr_id(Id),
     decode_message_attr_type(Type),
     decode_attr_from(From),
     decode_attr_to(To)}.

encode_message({message, Id, Type, Lang, From, To,
		Subject, Body, Thread, __Els, _},
	       __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
	    || _el <- __Els]
	     ++
	     lists:reverse('encode_message_$thread'(Thread,
						    __NewTopXMLNS,
						    'encode_message_$subject'(Subject,
									      __NewTopXMLNS,
									      'encode_message_$body'(Body,
												     __NewTopXMLNS,
												     [])))),
    _attrs = 'encode_message_attr_xml:lang'(Lang,
					    encode_message_attr_to(To,
								   encode_message_attr_from(From,
											    encode_message_attr_type(Type,
														     encode_message_attr_id(Id,
																	    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																				       __TopXMLNS)))))),
    {xmlel, <<"message">>, _attrs, _els}.


'encode_message_$body'([], __TopXMLNS, _acc) -> _acc;
'encode_message_$body'([Body | _els], __TopXMLNS,
		       _acc) ->
    'encode_message_$body'(_els, __TopXMLNS,
			   [encode_message_body(Body, __TopXMLNS) | _acc]).

decode_message_attr_type(undefined) -> normal;
decode_message_attr_type(_val) ->
    case catch dec_message_type(_val) of
      {'EXIT', _} ->
	      erlang:error({xmpp_codec, {bad_attr_value, <<"type">>}});
      _res -> _res
    end.

encode_message_attr_type(normal, _acc) -> _acc;
encode_message_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_message_attr_from(__TopXMLNS, undefined) ->
    undefined;
decode_message_attr_from(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"from">>, <<"message">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_message_attr_from(undefined, _acc) -> _acc;
encode_message_attr_from(_val, _acc) ->
    [{<<"from">>, jid:encode(_val)} | _acc].

decode_message_attr_to(__TopXMLNS, undefined) ->
    undefined;
decode_message_attr_to(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"to">>, <<"message">>, __TopXMLNS}});
      _res -> _res
    end.

encode_message_attr_to(undefined, _acc) -> _acc;
encode_message_attr_to(_val, _acc) -> [{<<"to">>, jid:encode(_val)} | _acc].

decode_message_body(__Opts,  {xmlel, <<"b">>, _attrs, _els}) ->
    Data = decode_body_els(__Opts, _els, <<>>),
    Data.

decode_body_els(__Opts, [], Data) ->
    decode_body_cdata(Data);
decode_body_els(__Opts, [{xmlcdata, _data} | _els], Data) ->
    decode_body_els(__Opts, _els, <<Data/binary, _data/binary>>);
decode_body_els(__Opts, [_ | _els], Data) ->
    decode_body_els(__Opts, _els, Data).

encode_message_body(<<>>) ->
  {xmlel, <<"b">>, [], []};
encode_message_body(Data) ->
  {xmlel, <<"b">>, [], [{xmlcdata, Data}]}.

decode_body_cdata(<<>>) -> <<>>;
decode_body_cdata(_val) -> _val.



decode_iq(__TopXMLNS, __Opts,
	  {xmlel, <<"iq">>, _attrs, _els}) ->
    __Els = decode_iq_els(__TopXMLNS, __Opts, _els, []),
    {Id, Type, From, To, Lang} = decode_iq_attrs(__TopXMLNS,
						 _attrs, undefined, undefined,
						 undefined, undefined,
						 undefined),
    {iq, Id, Type, Lang, From, To, __Els, #{}}.

decode_iq_els(__TopXMLNS, __Opts, [], __Els) ->
    lists:reverse(__Els);
decode_iq_els(__TopXMLNS, __Opts,
	      [{xmlel, _name, _attrs, _} = _el | _els], __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
      true ->
	  decode_iq_els(__TopXMLNS, __Opts, _els, [_el | __Els]);
      false ->
	  __XMLNS = xmpp_codec:get_attr(<<"xmlns">>, _attrs,
					__TopXMLNS),
	  case xmpp_codec:get_mod(_name, __XMLNS) of
	    undefined ->
		decode_iq_els(__TopXMLNS, __Opts, _els, [_el | __Els]);
	    Mod ->
		decode_iq_els(__TopXMLNS, __Opts, _els,
			      [Mod:do_decode(_name, __XMLNS, _el, __Opts)
			       | __Els])
	  end
    end;
decode_iq_els(__TopXMLNS, __Opts, [_ | _els], __Els) ->
    decode_iq_els(__TopXMLNS, __Opts, _els, __Els).

decode_iq_attrs(__TopXMLNS, [{<<"id">>, _val} | _attrs],
		_Id, Type, From, To, Lang) ->
    decode_iq_attrs(__TopXMLNS, _attrs, _val, Type, From,
		    To, Lang);
decode_iq_attrs(__TopXMLNS,
		[{<<"type">>, _val} | _attrs], Id, _Type, From, To,
		Lang) ->
    decode_iq_attrs(__TopXMLNS, _attrs, Id, _val, From, To,
		    Lang);
decode_iq_attrs(__TopXMLNS,
		[{<<"from">>, _val} | _attrs], Id, Type, _From, To,
		Lang) ->
    decode_iq_attrs(__TopXMLNS, _attrs, Id, Type, _val, To,
		    Lang);
decode_iq_attrs(__TopXMLNS, [{<<"to">>, _val} | _attrs],
		Id, Type, From, _To, Lang) ->
    decode_iq_attrs(__TopXMLNS, _attrs, Id, Type, From,
		    _val, Lang);
decode_iq_attrs(__TopXMLNS,
		[{<<"xml:lang">>, _val} | _attrs], Id, Type, From, To,
		_Lang) ->
    decode_iq_attrs(__TopXMLNS, _attrs, Id, Type, From, To,
		    _val);
decode_iq_attrs(__TopXMLNS, [_ | _attrs], Id, Type,
		From, To, Lang) ->
    decode_iq_attrs(__TopXMLNS, _attrs, Id, Type, From, To,
		    Lang);
decode_iq_attrs(__TopXMLNS, [], Id, Type, From, To,
		Lang) ->
    {decode_iq_attr_id(__TopXMLNS, Id),
     decode_iq_attr_type(__TopXMLNS, Type),
     decode_iq_attr_from(__TopXMLNS, From),
     decode_iq_attr_to(__TopXMLNS, To),
     'decode_iq_attr_xml:lang'(__TopXMLNS, Lang)}.

encode_iq({iq, Id, Type, Lang, From, To, __Els, _},
	  __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
	    || _el <- __Els],
    _attrs = 'encode_iq_attr_xml:lang'(Lang,
				       encode_iq_attr_to(To,
							 encode_iq_attr_from(From,
									     encode_iq_attr_type(Type,
												 encode_iq_attr_id(Id,
														   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																	      __TopXMLNS)))))),
    {xmlel, <<"iq">>, _attrs, _els}.

decode_iq_attr_id(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"id">>, <<"iq">>, __TopXMLNS}});
decode_iq_attr_id(__TopXMLNS, _val) -> _val.

encode_iq_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_iq_attr_type(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"type">>, <<"iq">>, __TopXMLNS}});
decode_iq_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [get, set, result, error]) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"type">>, <<"iq">>, __TopXMLNS}});
      _res -> _res
    end.

encode_iq_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_iq_attr_from(__TopXMLNS, undefined) -> undefined;
decode_iq_attr_from(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"from">>, <<"iq">>, __TopXMLNS}});
      _res -> _res
    end.

encode_iq_attr_from(undefined, _acc) -> _acc;
encode_iq_attr_from(_val, _acc) ->
    [{<<"from">>, jid:encode(_val)} | _acc].

decode_iq_attr_to(__TopXMLNS, undefined) -> undefined;
decode_iq_attr_to(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"to">>, <<"iq">>, __TopXMLNS}});
      _res -> _res
    end.

encode_iq_attr_to(undefined, _acc) -> _acc;
encode_iq_attr_to(_val, _acc) ->
    [{<<"to">>, jid:encode(_val)} | _acc].

'decode_iq_attr_xml:lang'(__TopXMLNS, undefined) ->
    <<>>;
'decode_iq_attr_xml:lang'(__TopXMLNS, _val) ->
    case catch xmpp_lang:check(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"xml:lang">>, <<"iq">>,
			 __TopXMLNS}});
      _res -> _res
    end.

'encode_iq_attr_xml:lang'(<<>>, _acc) -> _acc;
'encode_iq_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].
