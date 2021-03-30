-module(rebind).

-compile(export_all).

do_decode(<<"rebind">>, <<"t:rebind">>, {xmlel, <<"rebind">>, Attrs, _els}, _Opts) ->
  {JID, SID} = decode_rebind_attrs(Attrs, undefined, undefined),
  {rebind, JID, SID};

do_decode(Name, <<>>, _, _) ->
  erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
  erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

decode_rebind_attrs([{<<"jid">>, _val} | _attrs], _JID, _SID) ->
  decode_rebind_attrs(_attrs, _val, _SID);
decode_rebind_attrs([{<<"sid">>, _val} | _attrs], JID, _SID) ->
  decode_rebind_attrs(_attrs, JID, _val);
decode_rebind_attrs([_ | _attrs], _JID, _SID) ->
  decode_rebind_attrs(_attrs, _JID, _SID);
decode_rebind_attrs([], JID, SID) ->
  A_JID = decode_rebind_attr_jid(JID),
  A_SID = decode_rebind_attr_sid(SID),
  {A_JID, A_SID}.


decode_rebind_attr_jid(undefined) ->
  erlang:error({xmpp_codec, {missing_attr, <<"jid">>, <<"rebind">>, <<"t:rebind">>}});
decode_rebind_attr_jid(_val) ->
  case jid:from_string(_val) of
    {jid, _, _, _, _, _, _} = JID ->
      JID;
    _ ->
      erlang:error({xmpp_codec, {bad_attr_value, <<"jid">>, <<"rebind">>, <<"t:rebind">>}})
  end.

decode_rebind_attr_sid(undefined) ->
  erlang:error({xmpp_codec, {missing_attr, <<"sid">>, <<"rebind">>, <<"t:rebind">>}});
decode_rebind_attr_sid(_val) ->
  try binary_to_term(base64:decode(_val), [safe]) of
    Term -> Term
  catch _:_ ->
    erlang:error({xmpp_codec, {bad_attr_value, <<"sid">>, <<"rebind">>, <<"t:rebind">>}})
  end.

parse_sid([C | R], Res) ->
  try binary_to_integer(C) of
    Int ->
      parse_sid(R, [Int | Res])
  catch _:_ ->
    erlang:error({xmpp_codec, {bad_attr_value, <<"sid">>, <<"rebind">>, <<"t:rebind">>}})
  end;
parse_sid([], Res) ->
  lists:reverse(Res).

tags() ->
  [{<<"rebind">>, <<"t:rebind">>}].

do_encode({rebind, _JID, SID}, _TopXMLNS) ->
  SidBin = encode_rebind_attr_sid(SID),
  {xmlel, <<"rebind">>, [{<<"sid">>, SidBin}], []}.

encode_rebind_attr_sid(<<>>) ->
  erlang:error({xmpp_codec, {missing_attr, <<"sid">>, <<"rebind">>, <<"t:rebind">>}});
encode_rebind_attr_sid({_,_} = SID) ->
  base64:encode(term_to_binary(SID));
encode_rebind_attr_sid(_) ->
  erlang:error({xmpp_codec, {bad_attr_value, <<"sid">>, <<"rebind">>, <<"t:rebind">>}}).

parse_sid_encode([C | R], Res) ->
  try integer_to_binary(C) of
    Int ->
      parse_sid_encode(R, [Int | Res])
  catch _:_ ->
    erlang:error({xmpp_codec, {bad_attr_value, <<"sid">>, <<"rebind">>, <<"t:rebind">>}})
  end;
parse_sid_encode([], Res) ->
  lists:reverse(Res).