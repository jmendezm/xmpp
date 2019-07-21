-module(todus_codec).
-author("jesu").

-include("xmpp.hrl").

%% API
-export([decode/1,encode/1]).

mapa_decode(<<"m">>) -> <<"message">>;
mapa_decode(<<"si">>) -> <<"stanza-id">>;
mapa_decode(<<"p">>) -> <<"presence">>;
mapa_decode(<<"k">>) -> <<"markable">>;
mapa_decode(<<"rd">>) -> <<"received">>;
mapa_decode(<<"dd">>) -> <<"displayed">>;
mapa_decode(<<"ak">>) -> <<"acknowledged">>;
mapa_decode(<<"en">>) -> <<"enable">>;
mapa_decode(<<"ed">>) -> <<"enabled">>;
mapa_decode(<<"u">>) -> <<"resume">>;
mapa_decode(<<"ud">>) -> <<"resumed">>;
mapa_decode(<<"re">>) -> <<"resource">>;
mapa_decode(<<"ok">>) -> <<"success">>;
mapa_decode(<<"s">>) -> <<"starttls">>;
mapa_decode(<<"s1">>) -> <<"session">>;
mapa_decode(<<"ah">>) -> <<"auth">>;
mapa_decode(<<"x1">>) -> <<"http://etherx.jabber.org/streams">>;
mapa_decode(<<"x2">>) -> <<"urn:ietf:params:xml:ns:xmpp-sasl">>;
mapa_decode(<<"x3">>) -> <<"urn:ietf:params:xml:ns:xmpp-tls">>;
mapa_decode(<<"x4">>) -> <<"urn:ietf:params:xml:ns:xmpp-bind">>;
mapa_decode(<<"x5">>) -> <<"urn:ietf:params:xml:ns:xmpp-session">>;
mapa_decode(<<"x6">>) -> <<"urn:xmpp:sm:2">>;
mapa_decode(<<"x7">>) -> <<"urn:xmpp:sm:3">>;
mapa_decode(<<"x8">>) -> <<"urn:xmpp:chat-markers:0">>;
mapa_decode(<<"x9">>) -> <<"urn:xmpp:sid:0">>;
mapa_decode(<<"jc">>) -> <<"jabber:client">>;
mapa_decode(<<"es">>) -> <<"mechanisms">>;
mapa_decode(<<"e">>) -> <<"mechanism">>;
mapa_decode(<<"v">>) -> <<"version">>;
mapa_decode(<<"b">>) -> <<"body">>;
mapa_decode(<<"b1">>) -> <<"bind">>;
mapa_decode(<<"f">>) -> <<"from">>;
mapa_decode(<<"t">>) -> <<"type">>;
mapa_decode(<<"hl">>) -> <<"headline">>;
mapa_decode(<<"gc">>) -> <<"groupchat">>;
mapa_decode(<<"c">>) -> <<"chat">>;
mapa_decode(<<"n">>) -> <<"normal">>;
mapa_decode(<<"o">>) -> <<"to">>;
mapa_decode(<<"or">>) -> <<"optional">>;
mapa_decode(<<"i">>) -> <<"id">>;

mapa_decode(<<"x10">>) -> <<"todus:muclight:configuration">>;
mapa_decode(<<"x11">>) -> <<"todus:muclight:affiliations">>;
mapa_decode(<<"x12">>) -> <<"todus:muclight:join">>;
mapa_decode(<<"x13">>) -> <<"todus:muclight:leave">>;
mapa_decode(<<"x14">>) -> <<"todus:muclight:shareid">>;
mapa_decode(<<"x15">>) -> <<"todus:muclight:info">>;
mapa_decode(<<"x16">>) -> <<"todus:muclight:create">>;
mapa_decode(<<"x17">>) -> <<"todus:muclight:destroy">>;

mapa_decode(<<"x18">>) -> <<"todus:last">>;

mapa_decode(<<"g1">>) -> <<"display_lines">>;
mapa_decode(<<"g2">>) -> <<"pinned_msg">>;
mapa_decode(<<"g3">>) -> <<"picture">>;
mapa_decode(<<"g4">>) -> <<"roomname">>;

mapa_decode(M) -> M.


mapa_encode(<<"message">>) -> <<"m">>;
mapa_encode(<<"stanza-id">>) -> <<"si">>;
mapa_encode(<<"presence">>) -> <<"p">>;
mapa_encode(<<"markable">>) -> <<"k">>;
mapa_encode(<<"acknowledged">>) -> <<"ak">>;
mapa_encode(<<"received">>) -> <<"rd">>;
mapa_encode(<<"displayed">>) -> <<"dd">>;
mapa_encode(<<"enabled">>) -> <<"ed">>;
mapa_encode(<<"enable">>) -> <<"en">>;
mapa_encode(<<"resource">>) -> <<"re">>;
mapa_encode(<<"success">>) -> <<"ok">>;
mapa_encode(<<"resume">>) -> <<"u">>;
mapa_encode(<<"resumed">>) -> <<"ud">>;
mapa_encode(<<"auth">>) -> <<"ah">>;
mapa_encode(<<"starttls">>) -> <<"s">>;
mapa_encode(<<"session">>) -> <<"s1">>;
mapa_encode(<<"http://etherx.jabber.org/streams">>) -> <<"x1">>;
mapa_encode(<<"urn:ietf:params:xml:ns:xmpp-sasl">>) -> <<"x2">>;
mapa_encode(<<"urn:ietf:params:xml:ns:xmpp-tls">>) -> <<"x3">>;
mapa_encode(<<"urn:ietf:params:xml:ns:xmpp-bind">>) -> <<"x4">>;
mapa_encode(<<"urn:ietf:params:xml:ns:xmpp-session">>) -> <<"x5">>;
mapa_encode(<<"urn:xmpp:sm:2">>) -> <<"x6">>;
mapa_encode(<<"urn:xmpp:sm:3">>) -> <<"x7">>;
mapa_encode(<<"urn:xmpp:chat-markers:0">>) -> <<"x8">>;
mapa_encode(<<"urn:xmpp:sid:0">>) -> <<"x9">>;
mapa_encode(<<"jabber:client">>) -> <<"jc">>;
mapa_encode(<<"mechanisms">>) -> <<"es">>;
mapa_encode(<<"mechanism">>) -> <<"e">>;
mapa_encode(<<"version">>) -> <<"v">>;
mapa_encode(<<"body">>) -> <<"b">>;
mapa_encode(<<"bind">>) -> <<"b1">>;
mapa_encode(<<"from">>) -> <<"f">>;
mapa_encode(<<"type">>) -> <<"t">>;
mapa_encode(<<"normal">>) -> <<"n">>;
mapa_encode(<<"chat">>) -> <<"c">>;
mapa_encode(<<"groupchat">>) -> <<"gc">>;
mapa_encode(<<"headline">>) -> <<"hl">>;
mapa_encode(<<"to">>) -> <<"o">>;
mapa_encode(<<"optional">>) -> <<"or">>;
mapa_encode(<<"id">>) -> <<"i">>;

mapa_encode(<<"todus:muclight:configuration">>) -> <<"x10">>;
mapa_encode(<<"todus:muclight:affiliations">>) -> <<"x11">>;
mapa_encode(<<"todus:muclight:join">>) -> <<"x12">>;
mapa_encode(<<"todus:muclight:leave">>) -> <<"x13">>;
mapa_encode(<<"todus:muclight:shareid">>) -> <<"x14">>;
mapa_encode(<<"todus:muclight:info">>) -> <<"x15">>;
mapa_encode(<<"todus:muclight:create">>) -> <<"x16">>;
mapa_encode(<<"todus:muclight:destroy">>) -> <<"x17">>;

mapa_encode(<<"todus:last">>) -> <<"x18">>;

mapa_encode(<<"display_lines">>) -> <<"g1">>;
mapa_encode(<<"pinned_msg">>) -> <<"g2">>;
mapa_encode(<<"picture">>) -> <<"g3">>;
mapa_encode(<<"roomname">>) -> <<"g4">>;

mapa_encode(M) -> M.

decode(#xmlel{name = Name, attrs = Attrs, children = Children}) ->
  #xmlel{ name = mapa_decode(Name), attrs = decode_attrs(Attrs), children = decode_children(Children)};
decode({xmlcdata,_} = CD) ->
  CD.

decode_attrs([]) ->
  [];
decode_attrs([ {A,V} | RA]) ->
  [{mapa_decode(A),mapa_decode(V)} | decode_attrs(RA)].

decode_children([]) ->
  [];
decode_children([ CH | RCH]) ->
  [ decode(CH) | decode_children(RCH)].


encode(#xmlel{name = Name, attrs = Attrs, children = Children}) ->
  #xmlel{ name = mapa_encode(Name), attrs = encode_attrs(Attrs), children = encode_children(Children)};
encode({xmlcdata,_} = CD) ->
  CD.

encode_attrs([]) ->
  [];
encode_attrs([ {A,V} | RA]) ->
  [{mapa_encode(A),mapa_encode(V)} | encode_attrs(RA)].

encode_children([]) ->
  [];
encode_children([ CH | RCH]) ->
  [ encode(CH) | encode_children(RCH)].