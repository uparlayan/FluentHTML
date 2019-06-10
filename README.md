# FluentHTML

Pascal'da HTML taglarını doğrudan kullanabilmek için geliştirilmiş bir kütüphanedir. HTML5 Tagları esas alınmıştır. 

```pascal
procedure TWebModule.PageProducer1HTMLTag( Sender          : TObject
                                         ; Tag             : TTag
                                         ; const TagString : string
                                         ; TagParams       : TStrings
                                         ; var ReplaceText : string
                                         );
var
  aHTML: THTMLTag;
begin
  if  SameText(TagString, 'userprofile') then begin
      aHTML:= table([
                      thead([
                              tr( [ th('Kullanıcı Profili').colspan('2')              ])
                            , tr( [ th('Alan')          , th('Değer')                 ])
                            ])
                    , tbody([
                              tr( [ td('ID')            , td(Oturum.User.ID.ToString) ])
                            , tr( [ td('Kullanıcı Adı') , td(Oturum.User.UserName)    ])
                            , tr( [ td('Şifre')         , td(Oturum.User.Password)    ])
                            , tr( [ td('Ad Soyad')      , td(Oturum.User.AdSoyad)     ])
                            , tr( [ td('Eposta')        , td(Oturum.User.Eposta)      ])
                            , tr( [ td('Dil')           , td(Oturum.User.Dil)         ])
                            , tr( [ td('Durum')         , td(Oturum.User.Durum)       ])
                            ])
                    ]).class_('vg');

      ReplaceText := aHTML.ToString;
      FreeAndNil(aHTML);
  end else
  if  SameText(TagString, 'userprofileform') then begin
      aHTML:= form(
              [ fieldset('Kullanıcı Profilinizi Düzenleyin')
              , label_( 'Kullanıcı Adı'   , [ br, input.placeholder('Lütfen bir kullanıcı adı belirtin'     ).id('username_id').name('username').value('').type_('text').autocomplete('off') ])
              , br
              , label_( 'Şifreniz'        , [ br, input.placeholder('Lütfen 8 basamaklı bir şifre yazınız'  ).id('password_id').name('password').value('').type_('password').autocomplete('off') ])
              , br
              , label_( 'Ad ve Soyadınız' , [ br, input.placeholder('Lütfen tam adınızı yazınız'            ).id('username_id').name('username').value('').type_('text').autocomplete('off') ])
              , br
              , label_( 'Eposta Adresiniz', [ br, input.placeholder('Size ait Eposta adresinizi yazınız'    ).id('username_id').name('username').value('').type_('text').autocomplete('off') ])
              , br
              , label_( 'Arabirim Dili'   , [ br, input.placeholder('Bu siteyi hangi dilde kullanacaksınız?').id('username_id').name('username').value('').type_('text').autocomplete('off') ])
              ]).action('/profileedit').method('post');
      aHTML:= table([
                      thead([
                              tr( [ th('Kullanıcı Profili').colspan('2')               ])
                            , tr( [ th('Alan')          , th('Değer')                 ])
                            ])
                    , tbody([
                              tr( [ td('ID')            , td(Oturum.User.ID.ToString) ])
                            , tr( [ td('Kullanıcı Adı') , td(Oturum.User.UserName)    ])
                            , tr( [ td('Şifre')         , td(Oturum.User.Password)    ])
                            , tr( [ td('Ad Soyad')      , td(Oturum.User.AdSoyad)     ])
                            , tr( [ td('Eposta')        , td(Oturum.User.Eposta)      ])
                            , tr( [ td('Dil')           , td(Oturum.User.Dil)         ])
                            , tr( [ td('Durum')         , td(Oturum.User.Durum)       ])
                            ])
                    ]).class_('vg');

      ReplaceText := aHTML.ToString;
      FreeAndNil(aHTML);
  end else
  begin
    { Standart else sonu }
  end;
end;
```
