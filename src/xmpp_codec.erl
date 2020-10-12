%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xmpp_codec).

-compile(export_all).

decode(El) -> decode(El, []).

decode({xmlel, Name, _Attrs, _ } = El, Opts) ->
  todus_rfc6120:do_decode(Name, El, Opts).

encode(El) -> encode(El, <<>>).

encode({xmlel, _, _, _} = El, _) ->
  todus_codec:encode(El);
encode({xmlcdata, _} = CData, _) -> CData;
encode(El, TopXMLNS) ->
  Aux = todus:do_encode(El, TopXMLNS),
  todus_codec:encode(Aux).

get_name(El) -> todus:do_get_name(El).

get_ns(El) -> todus:do_get_ns(El).

tags() -> [].

format_error({bad_attr_value, Attr, Tag}) ->
    <<"Bad value of attribute '", Attr/binary, "' in tag <",
      Tag/binary, "/>">>;
format_error({bad_cdata_value, <<>>, Tag}) ->
    <<"Bad value of cdata in tag <", Tag/binary,"/>">>;
format_error({missing_tag, Tag}) ->
    <<"Missing tag <", Tag/binary,"/> ">>;
format_error({missing_attr, Attr, Tag}) ->
    <<"Missing attribute '", Attr/binary, "' in tag <", Tag/binary, "/>">>;
format_error({missing_cdata, <<>>, Tag}) ->
    <<"Missing cdata in tag <", Tag/binary,"/>">>;
format_error({unknown_tag, Tag}) ->
    <<"Unknown tag <", Tag/binary,"/>">>;
format_error({missing_tag_xmlns, Tag}) ->
    <<"Missing namespace for tag <", Tag/binary, "/>">>.

io_format_error({bad_attr_value, Attr, Tag}) ->
    {<<"Bad value of attribute '~s' in tag <~s/> "
       "qualified by namespace '~s'">>,
     [Attr, Tag]};
io_format_error({bad_cdata_value, <<>>, Tag, XMLNS}) ->
    {<<"Bad value of cdata in tag <~s/> qualified "
       "by namespace '~s'">>,
     [Tag, XMLNS]};
io_format_error({missing_tag, Tag, XMLNS}) ->
    {<<"Missing tag <~s/> qualified by namespace "
       "'~s'">>,
     [Tag, XMLNS]};
io_format_error({missing_attr, Attr, Tag, XMLNS}) ->
    {<<"Missing attribute '~s' in tag <~s/> "
       "qualified by namespace '~s'">>,
     [Attr, Tag, XMLNS]};
io_format_error({missing_cdata, <<>>, Tag, XMLNS}) ->
    {<<"Missing cdata in tag <~s/> qualified "
       "by namespace '~s'">>,
     [Tag, XMLNS]};
io_format_error({unknown_tag, Tag, XMLNS}) ->
    {<<"Unknown tag <~s/> qualified by namespace "
       "'~s'">>,
     [Tag, XMLNS]};
io_format_error({missing_tag_xmlns, Tag}) ->
    {<<"Missing namespace for tag <~s/>">>, [Tag]}.

get_attr(Attr, Attrs, Default) ->
    case lists:keyfind(Attr, 1, Attrs) of
      {_, Val} -> Val;
      false -> Default
    end.

enc_xmlns_attrs(XMLNS, XMLNS) -> [];
enc_xmlns_attrs(XMLNS, _) -> [{<<"xmlns">>, XMLNS}].

choose_top_xmlns(<<>>, NSList, TopXMLNS) ->
    case lists:member(TopXMLNS, NSList) of
      true -> TopXMLNS;
      false -> hd(NSList)
    end;
choose_top_xmlns(XMLNS, _, _) -> XMLNS.

records() -> [].
