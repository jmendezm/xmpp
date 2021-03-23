%%%-------------------------------------------------------------------
%%% @author jesu
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. mar. 2021 22:30
%%%-------------------------------------------------------------------
-module(todus_bind).
-author("jesu").

%% API
-compile(export_all).

do_encode({bind, _, _} = Bind, _TopXMLNS) ->
  encode_tbind(Bind, <<"urn:ietf:params:xml:ns:xmpp-bind">>).

encode_tbind({bind, Jid, Resource}, __TopXMLNS) ->
  _els = encode_tbind_jid( Jid, __TopXMLNS, encode_tbind_resource(Resource, __TopXMLNS, []) ),
  _attrs = [__TopXMLNS],
  {xmlel, <<"bind">>, _attrs, _els}.

encode_tbind_jid(undefined, __TopXMLNS, _acc) -> _acc;
encode_tbind_jid(Jid, __TopXMLNS, _acc) ->
  [encode_tbind_jid(Jid, __TopXMLNS) | _acc].

encode_tbind_resource(<<>>, __TopXMLNS, _acc) -> _acc;
encode_tbind_resource(Resource, __TopXMLNS, _acc) ->
  [encode_tbind_resource(Resource, __TopXMLNS) | _acc].

encode_tbind_jid(Cdata, __TopXMLNS) ->
  _els = encode_tbind_jid_cdata(Cdata, []),
  {xmlel, <<"jid">>, [], _els}.

encode_tbind_jid_cdata(undefined, _acc) -> _acc;
encode_tbind_jid_cdata(_val, _acc) ->
  [{xmlcdata, jid:encode(_val)} | _acc].

encode_tbind_resource(Cdata, __TopXMLNS) ->
  _els = encode_tbind_resource_cdata(Cdata, []),
  {xmlel, <<"resource">>, [__TopXMLNS], _els}.

encode_tbind_resource_cdata(<<>>, _acc) -> _acc;
encode_tbind_resource_cdata(_val, _acc) ->
  [{xmlcdata, check_resource(_val)} | _acc].

check_resource(R) ->
  case jid:resourceprep(R) of
    error -> erlang:error(badarg);
    _ -> R
  end.
