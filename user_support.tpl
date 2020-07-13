{if $jax == 'ajaxframe'}
{if $okay == 'vse'}
8524<!>tickets.css<!>0<!>2432<!>0<!>support<!> 
{literal}
      <div id="header_wrap2">
        <div id="header_wrap1">
          <div id="header" style="display: none">
            <h1 id="title"></h1>
          </div>
        </div>
      </div>
      <div id="wrap_between"></div>
      <div id="wrap3"><div id="wrap2">
  <div id="wrap1">
    <div id="content"><div class="tickets_tabs t_bar clear_fix">
  <a id="new_link"
  class="fl_r"
  href="support?act=new"
  onclick="return Tickets.switchTab('new', event);"
  style="">
  Новый вопрос
</a>
  <ul id="tickets_tabs" class="t0">
    <li id="list_tab" class="active_link" style=""><a href="support" onclick="return Tickets.switchTab('list', event);">
  <b class="tl1"><b></b></b><b class="tl2"></b>
  <b class="tab_word">Мои вопросы</b>
</a></li><li id="new_tab" class="active_link" style="display: none;"><a href="support?act=new" onclick="return Tickets.switchTab('new', event);">
  <b class="tl1"><b></b></b><b class="tl2"></b>
  <b class="tab_word">Новый вопрос</b>
</a></li><li id="show_tab" class="" style="display: none;"><a class="tickets_inactive_tab">
    <b class="tl1"><b></b></b><b class="tl2"></b>
    <b class="tab_word">Просмотр вопроса</b>
  </a>
</li>
  </ul>
  <div id="tickets_progress" class="fl_r">
    <img src="/images/upload.gif"/>
  </div>
</div>
<div id="tickets_content">
  <div id="summary" class="clear_fix">
  <span class="tickets_summary fl_l">
    Вы задали {/literal}{$total_supports}{if $total_supports == '0'}<script type="text/javascript">window.location.href='support?act=new';</script>{/if}{literal} вопросов
  </span>
  <span class="tickets_summary_actions">
  </span>
  <span class="tickets_summary_extra fl_r">
    <div id="tickets_pages" class="fl_r">
      
    </div>
    <div id="pages_loading_top" class="tickets_pages_loading fl_r">
      <img src="/images/upload.gif"/>
    </div>
  </span>
</div>
<div id="tickets_list">

{/literal}
  {section name=support_loop loop=$supports}

    <table cellpadding='0' cellspacing='0' width='100%'>

   <div class="tu_row clear_fix">
{if $supports[support_loop].support_status == '1' }
  <a class="fl_r tu_last" href="support?act=show&id={$supports[support_loop].support_id}" onclick="return Tickets.gotoTicket({$supports[support_loop].support_id}, this, event);">
    <div class="fl_l tu_thumb"><img class="tu_img" src="/images/support_1.png" /></div>
    <div class="fl_l tu_mem">Агент поддержки</div>
    <div class="fl_l tu_date">ответил {$datetime->cdate("`$setting.setting_dateformat`", $datetime->timezone($supports[support_loop].support_date, $global_timezone))}</div>
  </a>{else}  <a class="fl_r tu_last" href="support?act=show&id={$supports[support_loop].support_id}" onclick="return Tickets.gotoTicket({$supports[support_loop].support_id}, this, event);">
    <div class="fl_l tu_thumb"><img class="tu_img" src="{if $user->user_info.user_photo == '' }/images/camera.gif{else}{$user->user_info.user_photo}{/if}" /></div>
    <div class="fl_l tu_mem">{$user->user_info.user_fio} {$user->user_info.user_fios}</div>
    <div class="fl_l tu_date">ответил {$datetime->cdate("`$setting.setting_dateformat`", $datetime->timezone($supports[support_loop].support_date, $global_timezone))}</div>
  </a>

{/if}
  <div class="tu_info">

    <div class="tu_row_title"><a href="support?act=show&id={$supports[support_loop].support_id}" onclick="return Tickets.gotoTicket({$supports[support_loop].support_id}, this, event);" >{$supports[support_loop].support_title}</a></div>
    <div class="tu_row_comment">{if $supports[support_loop].support_status == '1' }Есть ответ.{else}Вопрос ожидает обработки.{/if}</div>

  </div>
</div>
  {/section}
{literal}






</div>

</div></div>
  </div>
</div></div>
    </div>

</div></div></div>
  <div class="progress" id="global_prg"></div>

<!>box.hide();
window.document.title = 'ВСети | Помощь';
    if (parent && parent != window && (browser.msie || browser.opera || browser.mozilla || browser.chrome || browser.safari || browser.iphone)) {
      document.getElementsByTagName('body')[0].innerHTML = '';
    } else {
      domReady();
      updateMoney(0);
gSearch.init();
if (window.qArr && qArr[5]) qArr[5] = [5, "по товарам", "", "goods", 0x00000100];
if (browser.iphone || browser.ipad || browser.ipod) {
  setStyle(bodyNode, {webkitTextSizeAdjust: 'none'});
}
if (0) {
  hide('support_link_td');
}
var ts_input = ge('ts_input'), oldFF = browser.mozilla && parseInt(browser.version) < 8;
if (browser.mozilla && !oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
placeholderSetup(ts_input, {back: false, reload: true});
if (browser.opera || browser.msie || oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
if (browser.chrome) {
  setStyle(ts_input, {padding: (vk.rtl ? '4px 23px 3px 2px' : '4px 3px 3px 23px')});
}
TopSearch.init();
if (browser.msie8 || browser.msie7) {
  var st = {border: '1px solid #a6b6c6'};
  if (hasClass(ge('ts_wrap'), 'vk')) {
    if (vk.rtl) st.left = '1px';
    else st.right = '0px';
  } else {
    if (vk.rtl) st.right = '146px';
    else st.left = '146px';
  }
  setStyle(ge('ts_cont_wrap'), st);
}
window.tsHintsEnabled = 1;
handlePageParams({"id":{/literal}{$user->user_info.user_id}{literal},"leftblocks":"","leftads":"","loc":"support","wrap_page":1,"width":791,"width_dec":160,"width_dec_footer":130,"no_ads":1});addEvent(document, 'click', onDocumentClick);;stManager.add(["tickets.js","notifier.js"], function () {extend(cur, {"section":"list"});  ;(function () {
    var cb = function () {Notifier.init({"queue_id":"events_queue{/literal}{$user->user_info.user_id}{literal}","timestamp":"1374818738","key":"dnpx53gr8WbSGY66M_YIwEo788RL_RmMwlNBHEuPLZLxUHZMX1oGPR2h","uid":{/literal}{$user->user_info.user_id}{literal},"version":9,"flash_url":"\/swf\/queue_transport.swf","debug":false,"instance_id":"NjAzNzEw","server_url":"http:\/\/q84.queue.vk.com\/im618","frame_path":"http:\/\/q84.queue.vk.com\/q_frame.php?6","frame_url":"im618","refresh_url":"http:\/\/vk.com\/notifier.php","fc":{"version":23,"state":{"clist":{"min":true,"x":false,"y":false,"onlines":true},"tabs":[],"version":23}}})}
    if (vk.loaded) cb(); else addEvent(window, 'load', cb);
  })();});;if (browser.msie) stManager.add('pinbar.js', function() {window.initPinBar('/anton_o_o', '/im');});
    }
{/literal}

{elseif $okay == 'show'}
8524<!>tickets.css<!>0<!>2432<!>0<!>support?act=show&id={$support}<!> 
<div id="header_wrap2">
        <div id="header_wrap1">
          <div id="header" style="display: none">
            <h1 id="title"></h1>
          </div>
        </div>
      </div>
      <div id="wrap_between"></div>
      <div id="wrap3"><div id="wrap2">
  <div id="wrap1">
    <div id="content"><div class="tickets_tabs t_bar clear_fix">
  <a id="new_link"
  class="fl_r"
  href="support?act=new"
  onclick="return Tickets.switchTab('new', event);"
  style="">
  Новый вопрос
</a>
  <ul id="tickets_tabs" class="t0">
    <li id="list_tab" class="" style=""><a href="support" onclick="return Tickets.switchTab('list', event);">
  <b class="tl1"><b></b></b><b class="tl2"></b>
  <b class="tab_word">Мои вопросы</b>
</a></li><li id="new_tab" class="active_link" style="display: none;"><a href="support?act=new" onclick="return Tickets.switchTab('new', event);">
  <b class="tl1"><b></b></b><b class="tl2"></b>
  <b class="tab_word">Новый вопрос</b>
</a></li><li id="show_tab" class="active_link" style=""><a class="tickets_inactive_tab">
    <b class="tl1"><b></b></b><b class="tl2"></b>
    <b class="tab_word">Просмотр вопроса</b>
  </a>
</li>
  </ul>
  <div id="tickets_progress" class="fl_r">
    <img src="/images/upload.gif"/>
  </div>
</div>
<div id="tickets_content">
  <div id="tickets_name">
  <div class="title">
    {$support_title}
    <span id="tickets_browser" class="tickets_browser">
      
    </span>
  </div>
  
  <div class="info clear_fix">
    <div class="fl_l" id="tickets_info_title">
      {if $user->user_info.user_id == '1' ||  $user->user_info.user_id == '2' }вопрос от id{$support_user_id}{else}{if $support_status == '1' }Есть ответ.{else}Вопрос ожидает обработки.{/if}{/if}
<input id="support_user_id" type="hidden" class="text" value="{$support_user_id}" />
<input id="support_id" type="hidden" class="text" value="{$support}" />
    </div>
    <div class="fl_r" id="tickets_info_links">
      
    </div>
  </div>
</div>
<div id="tickets_reply_rows">
  <div id="reply{$support}"><div class="tickets_reply_row clear_fix first">
    <div class="tickets_image fl_l">
      <a href="id{$user->user_info.user_id}" onclick="return nav.go(this, event);"   ><img  height="50" width="50" src="{if $user->user_info.user_photo == '' }/images/camera.gif{else}{$user->user_info.user_photo}{/if}" /></a>
      
    </div>
    <div class="tickets_reply_content fl_l">
      <div class="tickets_reply_title">
        <span class="tickets_author"><a class="mem_link" href="/id{$user->user_info.user_id}">{$user->user_info.user_fio} {$user->user_info.user_fios}</a></span>
      </div>
      <div class="tickets_reply_text">
        {$support_body}
      </div>
      
      <div class="tickets_reply_actions">
        {$datetime->cdate("`$setting.setting_dateformat`", $datetime->timezone($support_date, $global_timezone))} {$support28} {$datetime->cdate("`$setting.setting_timeformat`", $datetime->timezone($support_date, $global_timezone))}
<span id="reply_actions{$support}"></span><span class="divider">|</span><a href="#" onclick="return Tickets.deleteTicket({$support}, 'd4aa8196f0572eed84')">Удалить вопрос</a>
      </div>
    </div>
  </div>  </div>




{section name=comment_loop loop=$comments}

{if $comments[comment_loop].comment_author->user_info.user_id == '1' ||  $comments[comment_loop].comment_author->user_info.user_id == '2' }
<div id="reply{$comments[comment_loop].comment_id}"><div class="tickets_reply_row clear_fix first">
    <div class="tickets_image fl_l">
      <a onclick="return nav.go(this, event);" ><img height="50" src="{if $comments[comment_loop].comment_author->user_info.user_id == '2' }/images/baddaaa_support.png {else}/images/support_2.png{/if}" width="50" /></a>
      
    </div>
    <div class="tickets_reply_content fl_l">
      <div class="tickets_reply_title">
        <span class="tickets_author"><a class="mem_link" >
{if $comments[comment_loop].comment_author->user_info.user_id == '2' }Сотрудник поддержки #2{else}Агент поддержки{/if}
</a></span>
      </div>
      <div class="tickets_reply_text">
        {$comments[comment_loop].comment_body}
      </div>
      
      <div class="tickets_reply_actions">
{$datetime->cdate("`$setting.setting_timeformat` `$profile_comments2` `$setting.setting_dateformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}      </div>
    </div>
  </div>
{else}
     <div id="reply{$comments[comment_loop].comment_id}"><div class="tickets_reply_row clear_fix first">
    <div class="tickets_image fl_l">
      <a onclick="return nav.go(this, event);" ><img height="50" src="{if $comments[comment_loop].comment_author->user_info.user_photo == '' }/images/nophoto.gif{else}{$comments[comment_loop].comment_author->user_info.user_photo}{/if}" width="50" /></a>
      
    </div>
    <div class="tickets_reply_content fl_l">
      <div class="tickets_reply_title">
        <span class="tickets_author"><a class="mem_link" >{$comments[comment_loop].comment_author->user_info.user_fio} {$comments[comment_loop].comment_author->user_info.user_fios}
</a></span>
      </div>
      <div class="tickets_reply_text">
        {$comments[comment_loop].comment_body}
      </div>
      
      <div class="tickets_reply_actions">
        {$datetime->cdate("`$setting.setting_timeformat` `$profile_comments2` `$setting.setting_dateformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}
<span id="reply_actions{$comments[comment_loop].comment_id}"></span>
      </div>
    </div>
  </div>{/if}
</div>
  {/section}

</div>
</div>

<div id="tickets_post_field_wrap"><div id="tickets_post_field" class="clear_fix">
  <div class="tickets_image fl_l">
    <a href="anton_o_o" onclick="return nav.go(this, event);"><img height="50" width="50"  src="{if $user->user_info.user_photo == '' }/images/camera.gif{else}{$user->user_info.user_photo}{/if}" /></a>
  </div>
  <div id="tickets_post_form" class="fl_l">
    <textarea
      id="tickets_reply"
      placeholder="Комментировать.."
      onkeypress="onCtrlEnter(event, Tickets.addTicketReply.pbind('4a9c629011c29c5610'))"
      onkeyup="Tickets.checkTextLength(this, 4096, 'tickets_reply_warn')"></textarea>
    <div id="tickets_reply_warn"></div>
    <div id="tis_preview" class="clear_fix"></div>
    <div id="tis_prg_preview"></div>
    <div class="tickets_envelope_controls clear_fix">
      <div class="button_blue fl_l"><button id="tickets_send" onclick="Tickets.addTicketReply('4a9c629011c29c5610');">Отправить</button></div>
<!--       -->
<a onclick="smileadd('tickets_reply', ':smile:');"><img src="/images/sm/smile.gif"></a> <a onclick="smileadd('tickets_reply', ':angel:');"><img src="/images/sm/angel.gif"></a> <a onclick="smileadd('tickets_reply', ':bad:');"><img src="/images/sm/bad.gif"></a> <a onclick="smileadd('tickets_reply', ':biggrin:');"><img src="/images/sm/biggrin.gif"></a> <a onclick="smileadd('tickets_reply', ':blum:');"><img src="/images/sm/blum.gif"></a> <a onclick="smileadd('tickets_reply', ':cray:');"><img src="/images/sm/cray.gif"></a> <a onclick="smileadd('tickets_reply', ':crazy:');"><img src="/images/sm/crazy.gif"></a> <a onclick="smileadd('tickets_reply', ':dance:');"><img src="/images/sm/dance.gif"></a> <a onclick="smileadd('tickets_reply', ':diablo:');"><img src="/images/sm/diablo.gif"></a> <a onclick="smileadd('tickets_reply', ':dirol:');"><img src="/images/sm/dirol.gif"></a> <a onclick="smileadd('tickets_reply', ':good:');"><img src="/images/sm/good.gif"></a> <a onclick="smileadd('tickets_reply', ':in_love:');"><img src="/images/sm/in_love.gif"></a> <a onclick="smileadd('tickets_reply', ':music:');"><img src="/images/sm/music.gif"></a> <a onclick="smileadd('tickets_reply', ':nea:');"><img src="/images/sm/nea.gif"></a> <a onclick="smileadd('tickets_reply', ':pardon:');"><img src="/images/sm/pardon.gif"></a> <a onclick="smileadd('tickets_reply', ':rolleyes:');"><img src="/images/sm/rolleyes.gif"></a> <a onclick="smileadd('tickets_reply', ':scratch:');"><img src="/images/sm/scratch.gif"></a> <a onclick="smileadd('tickets_reply', ':shok:');"><img src="/images/sm/shok.gif"></a> <a onclick="smileadd('tickets_reply', ':shout:');"><img src="/images/sm/shout.gif"></a> <a onclick="smileadd('tickets_reply', ':unknw:');"><img src="/images/sm/unknw.gif"></a> <a onclick="smileadd('tickets_reply', ':wink:');"><img src="/images/sm/wink.gif"></a> <a onclick="smileadd('tickets_reply', ':yahoo:');"><img src="/images/sm/yahoo.gif"></a> <a onclick="smileadd('tickets_reply', ':laugh:');"><img src="/images/sm/laugh.gif"></a> <a onclick="smileadd('tickets_reply', ':wall:');"><img src="/images/sm/wall.gif"></a>
    </div>
    
    
  </div>
</div></div>{literal}<div id="audio_checking" style="display: none"><div class="audio" id="audio166465618_143709187">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr>
      <td>
        <a onclick="playAudioNew('166465618_143709187')"><div class="play_new" id="play166465618_143709187"></div></a>
        <input type="hidden" id="audio_info166465618_143709187" value="http://cs5582.userapi.com/u17724828/audio/c9705caca464.mp3,325" />
        
      </td>
      <td class="info">
        <div class="duration fl_r" onmousedown="if (window.audioPlayer) audioPlayer.switchTimeFormat('166465618_143709187', event);">5:25</div>
        <div class="audio_title_wrap"><b><a href="http://vkontakte.ru">Owsey &amp; CoMa</a></b> &ndash; <span id="title166465618_143709187">Stay With Me</span></div>
      </td>
      
    </tr>
  </table>
  <div class="player_wrap">
    <div id="line166465618_143709187" class="playline"><div></div></div>
    <div id="player166465618_143709187" class="player" ondragstart="return false;" onselectstart="return false;">
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr valign="top" id="audio_tr166465618_143709187">
          <td style="width:100%;padding:0px;position:relative;">
            <div id="audio_white_line166465618_143709187" class="audio_white_line" onmousedown="audioPlayer.prClick(event);"></div>
            <div id="audio_load_line166465618_143709187" class="audio_load_line" onmousedown="audioPlayer.prClick(event);"><!-- --></div>
            <div id="audio_progress_line166465618_143709187" class="audio_progress_line" onmousedown="audioPlayer.prClick(event);">
              <div id="audio_pr_slider166465618_143709187" class="audio_pr_slider"><!-- --></div>
            </div>
          </td>
          <td id="audio_vol166465618_143709187" style="position: relative;"></td>
        </tr>
      </table>
    </div>
  </div>
</div></div>
</div></div>
  </div>
</div></div>
    </div>

</div></div></div><!>
function smileadd(name, smile) {
var txt = ge(name).value;
ge(name).value = txt + ' ' + smile;
box.hide();
}
box.hide();
window.document.title = 'ВСети | Помощь';
if (parent && parent != window && (browser.msie || browser.opera || browser.mozilla || browser.chrome || browser.safari || browser.iphone)) {
      document.getElementsByTagName('body')[0].innerHTML = '';
    } else {
      domReady();
      updateMoney(0);
gSearch.init();
if (window.qArr && qArr[5]) qArr[5] = [5, "по товарам", "", "goods", 0x00000100];
if (browser.iphone || browser.ipad || browser.ipod) {
  setStyle(bodyNode, {webkitTextSizeAdjust: 'none'});
}
if (0) {
  hide('support_link_td');
}
var ts_input = ge('ts_input'), oldFF = browser.mozilla && parseInt(browser.version) < 8;
if (browser.mozilla && !oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
placeholderSetup(ts_input, {back: false, reload: true});
if (browser.opera || browser.msie || oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
if (browser.chrome) {
  setStyle(ts_input, {padding: (vk.rtl ? '4px 23px 3px 2px' : '4px 3px 3px 23px')});
}
TopSearch.init();
if (browser.msie8 || browser.msie7) {
  var st = {border: '1px solid #a6b6c6'};
  if (hasClass(ge('ts_wrap'), 'vk')) {
    if (vk.rtl) st.left = '1px';
    else st.right = '0px';
  } else {
    if (vk.rtl) st.right = '146px';
    else st.left = '146px';
  }
  setStyle(ge('ts_cont_wrap'), st);
}
window.tsHintsEnabled = 1;
zNav([], {});
handlePageParams({"id":{/literal}{$user->user_info.user_id}{literal},"leftblocks":"","leftads":"","loc":"support?act=show&id=1400247","wrap_page":1,"width":791,"width_dec":160,"width_dec_footer":130,"no_ads":1});addEvent(document, 'click', onDocumentClick);;stManager.add(["tickets.js","privacy.js","notifier.js"], function () {extend(cur, {"section":"show","ticket_id":1400247,"lang":{"delete_title":"Удаление вопроса","delete_confirm":"Вы действительно хотите удалить вопрос? Это действие нельзя будет отменить.","delete":"Удалить"}});autosizeSetup(ge('tickets_reply'), {minHeight: 42, maxHeight: 500});
placeholderSetup('tickets_reply', {back: false});
cur.uploadData = {"url":"http:\/\/cs11431.vk.com\/upload.php","vars":{"act":"do_add","aid":-13,"gid":0,"mid":{/literal}{$user->user_info.user_id}{literal},"hash":"09005a3228e5fd38e24f832ada097e17","rhash":"7ad95197e9b7ba7b8945bc34392b08fc","from_host":"vk.com"},"options":{"server":"11431","default_error":1,"error_hash":"66f3969a89f678af18820714f25c1cf9","lang":{"max_files_warning":"Вы можете загрузить до 5 изображений с расширением JPG, PNG или GIF.","button_browse":"Выбрать файл"}},"lang":{"support_adding_screen":"Прикрепление снимка экрана","support_screen_you_can":"Вы можете загрузить до 5 изображений с расширением JPG, PNG или GIF.","support_screen_warn":"Файлы размером более 5 MB не загрузятся. В случае возникновения проблем попробуйте загрузить фотографию меньшего размера.","drop_files_here":"Перетащите файлы сюда","dont_attach":"Не прикреплять","support_add_screen":"Прикрепить изображение"}};
cur.lang = extend(cur.lang || {}, cur.uploadData.lang);
cur.pvNoLikes = true;
cur.destroy.push(function() { cur.pvNoLikes = false; });cur.samples = cur.samples || {}; cur.samples.audio = '<div class="z9q2m" id="z9q2m{/literal}{$user->user_info.user_id}{literal}_143709187">\
  <table cellspacing="0" cellpadding="0" width="100%">\
    <tr>\
      <td>\
        <a onclick="playAudioNew(\'{/literal}{$user->user_info.user_id}{literal}_143709187\')"><div class="play_new" id="play{/literal}{$user->user_info.user_id}{literal}_143709187"></div></a>\
        <input type="hidden" id="z9q2m_info{/literal}{$user->user_info.user_id}{literal}_143709187" value="http://cs5582.userapi.com/u17724828/z9q2m/c9705caca464.mp3,325" />\
        \
      </td>\
      <td class="info">\
        <div class="duration fl_r" onmousedown="if (window.z9q2mPlayer) z9q2mPlayer.switchTimeFormat(\'{/literal}{$user->user_info.user_id}{literal}_143709187\', event);">5:25</div>\
        <div class="z9q2m_title_wrap"><b><a href="http://vkontakte.ru">Owsey &amp; CoMa</a></b> &ndash; <span id="title{/literal}{$user->user_info.user_id}{literal}_143709187">Stay With Me</span></div>\
      </td>\
      \
    </tr>\
  </table>\
  <div class="player_wrap">\
    <div id="line{/literal}{$user->user_info.user_id}{literal}_143709187" class="playline"><div></div></div>\
    <div id="player{/literal}{$user->user_info.user_id}{literal}_143709187" class="player" ondragstart="return false;" onselectstart="return false;">\
      <table width="100%" border="0" cellpadding="0" cellspacing="0">\
        <tr valign="top" id="z9q2m_tr{/literal}{$user->user_info.user_id}{literal}_143709187">\
          <td style="width:100%;padding:0px;position:relative;">\
            <div id="z9q2m_white_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="z9q2m_white_line" onmousedown="z9q2mPlayer.prClick(event);"></div>\
            <div id="z9q2m_load_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="z9q2m_load_line" onmousedown="z9q2mPlayer.prClick(event);"><!-- --></div>\
            <div id="z9q2m_progress_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="z9q2m_progress_line" onmousedown="z9q2mPlayer.prClick(event);">\
              <div id="z9q2m_pr_slider{/literal}{$user->user_info.user_id}{literal}_143709187" class="z9q2m_pr_slider"><!-- --></div>\
            </div>\
          </td>\
          <td id="z9q2m_vol{/literal}{$user->user_info.user_id}{literal}_143709187" style="position: relative;"></td>\
        </tr>\
      </table>\
    </div>\
  </div>\
</div>';  ;(function () {
    var cb = function () {Notifier.init({"queue_id":"events_queue{/literal}{$user->user_info.user_id}{literal}","timestamp":"1104667390","key":"y8GuiLt2ZXwgkBa7bnPkFnFrZ_pp8fPmVhS0JrI9kRc40PYBcswbFbqh","uid":{/literal}{$user->user_info.user_id}{literal},"version":9,"flash_url":"\/swf\/queue_transport.swf","debug":false,"instance_id":"NTU4NzI=","server_url":"http:\/\/q66.queue.vk.com\/im618","frame_path":"http:\/\/q66.queue.vk.com\/q_frame.php?6","frame_url":"im618","refresh_url":"http:\/\/vk.com\/notifier.php","fc":{"version":23,"state":{"clist":{"min":true,"x":false,"y":false,"onlines":true},"tabs":[],"version":23}}})}
    if (vk.loaded) cb(); else addEvent(window, 'load', cb);
  })();});;if (browser.msie) stManager.add('pinbar.js', function() {window.initPinBar('/{/literal}id{$user->user_info.user_id}{literal}', '/im');});
    }{/literal}
{elseif $okay == 'browse'}
8524<!>tickets.css<!>0<!>2432<!>0<!>support?act=browse<!> 
{literal}<div id="header_wrap2">
        <div id="header_wrap1">
          <div id="header" style="display: none">
            <h1 id="title"></h1>
          </div>
        </div>
      </div>
      <div id="wrap_between"></div>
      <div id="wrap3"><div id="wrap2">
  <div id="wrap1">
    <div id="content"><div class="tickets_tabs t_bar clear_fix">
  <a id="new_link"
  class="fl_r"
  href="support?act=new"
  onclick="return Tickets.switchTab('new', event);"
  style="">
  Новый вопрос
</a>
  <ul id="tickets_tabs" class="t0">
    <li id="list_tab" class="active_link" style=""><a href="support" onclick="return Tickets.switchTab('list', event);">
  <b class="tl1"><b></b></b><b class="tl2"></b>
  <b class="tab_word">Вопросы пользователей</b>
</a></li><li id="new_tab" class="active_link" style="display: none;"><a href="support?act=new" onclick="return Tickets.switchTab('new', event);">
  <b class="tl1"><b></b></b><b class="tl2"></b>
  <b class="tab_word">Новый вопрос</b>
</a></li><li id="show_tab" class="" style="display: none;"><a class="tickets_inactive_tab">
    <b class="tl1"><b></b></b><b class="tl2"></b>
    <b class="tab_word">Просмотр вопроса</b>
  </a>
</li>
  </ul>
  <div id="tickets_progress" class="fl_r">
    <img src="/images/upload.gif"/>
  </div>
</div>
<div id="tickets_content">
  <div id="summary" class="clear_fix">
  <span class="tickets_summary fl_l">
    Пользователи задали {/literal}{$total_supports}{literal} вопросов
  </span>
  <span class="tickets_summary_actions">
  </span>
  <span class="tickets_summary_extra fl_r">
    <div id="tickets_pages" class="fl_r">
      
    </div>
    <div id="pages_loading_top" class="tickets_pages_loading fl_r">
      <img src="/images/upload.gif"/>
    </div>
  </span>
</div>
<div id="tickets_list">

{/literal}
  {section name=support_loop loop=$supports}

    <table cellpadding='0' cellspacing='0' width='100%'>

   <div class="tu_row clear_fix">
{if $supports[support_loop].support_status == '1' ||  $supports[support_loop].support_status == '2' }
  <a class="fl_r tu_last" href="support?act=show&id={$supports[support_loop].support_id}" onclick="return Tickets.gotoTicket({$supports[support_loop].support_id}, this, event);">
    <div class="fl_l tu_thumb"><img class="tu_img" src="/images/support_1.png" /></div>
    <div class="fl_l tu_mem">Агент поддержки</div>
    <div class="fl_l tu_date">ответил {$datetime->cdate("`$setting.setting_dateformat`", $datetime->timezone($supports[support_loop].support_date, $global_timezone))}</div>
  </a>{else}  <a class="fl_r tu_last" href="support?act=show&id={$supports[support_loop].support_id}" onclick="return Tickets.gotoTicket({$supports[support_loop].support_id}, this, event);">
    <div class="fl_l tu_thumb"><img class="tu_img" src="{if $user->user_info.user_photo == '' }/images/camera.gif{else}{$user->user_info.user_photo}{/if}" /></div>
    <div class="fl_l tu_mem">{$user->user_info.user_fio} {$user->user_info.user_fios}</div>
    <div class="fl_l tu_date">ответил {$datetime->cdate("`$setting.setting_dateformat`", $datetime->timezone($supports[support_loop].support_date, $global_timezone))}</div>
  </a>

{/if}
  <div class="tu_info">

    <div class="tu_row_title"><a href="support?act=show&id={$supports[support_loop].support_id}" onclick="return Tickets.gotoTicket({$supports[support_loop].support_id}, this, event);">{$supports[support_loop].support_title}</a></div>
    <div class="tu_row_comment">{if $supports[support_loop].support_status == '1' }Есть ответ.{else}Вопрос ожидает обработки.{/if}</div>

  </div>
</div>
  {/section}
{literal}






</div>

</div></div>
  </div>
</div></div>
    </div>

</div></div></div>
  <div class="progress" id="global_prg"></div>{/literal}<!>{literal}
box.hide();
window.document.title = 'ВСети | Помощь';
if (parent && parent != window && (browser.msie || browser.opera || browser.mozilla || browser.chrome || browser.safari || browser.iphone)) {
      document.getElementsByTagName('body')[0].innerHTML = '';
    } else {
      domReady();
      updateMoney(0);
gSearch.init();
if (window.qArr && qArr[5]) qArr[5] = [5, "по товарам", "", "goods", 0x00000100];
if (browser.iphone || browser.ipad || browser.ipod) {
  setStyle(bodyNode, {webkitTextSizeAdjust: 'none'});
}
if (0) {
  hide('support_link_td');
}
var ts_input = ge('ts_input'), oldFF = browser.mozilla && parseInt(browser.version) < 8;
if (browser.mozilla && !oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
placeholderSetup(ts_input, {back: false, reload: true});
if (browser.opera || browser.msie || oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
if (browser.chrome) {
  setStyle(ts_input, {padding: (vk.rtl ? '4px 23px 3px 2px' : '4px 3px 3px 23px')});
}
TopSearch.init();
if (browser.msie8 || browser.msie7) {
  var st = {border: '1px solid #a6b6c6'};
  if (hasClass(ge('ts_wrap'), 'vk')) {
    if (vk.rtl) st.left = '1px';
    else st.right = '0px';
  } else {
    if (vk.rtl) st.right = '146px';
    else st.left = '146px';
  }
  setStyle(ge('ts_cont_wrap'), st);
}
window.tsHintsEnabled = 1;
handlePageParams({"id":{/literal}{$user->user_info.user_id}{literal},"leftblocks":"","leftads":"","loc":"support","wrap_page":1,"width":791,"width_dec":160,"width_dec_footer":130,"no_ads":1});addEvent(document, 'click', onDocumentClick);;stManager.add(["tickets.js","notifier.js"], function () {extend(cur, {"section":"list"});  ;(function () {
    var cb = function () {Notifier.init({"queue_id":"events_queue{/literal}{$user->user_info.user_id}{literal}","timestamp":"1374818738","key":"dnpx53gr8WbSGY66M_YIwEo788RL_RmMwlNBHEuPLZLxUHZMX1oGPR2h","uid":{/literal}{$user->user_info.user_id}{literal},"version":9,"flash_url":"\/swf\/queue_transport.swf","debug":false,"instance_id":"NjAzNzEw","server_url":"http:\/\/q84.queue.vk.com\/im618","frame_path":"http:\/\/q84.queue.vk.com\/q_frame.php?6","frame_url":"im618","refresh_url":"http:\/\/vk.com\/notifier.php","fc":{"version":23,"state":{"clist":{"min":true,"x":false,"y":false,"onlines":true},"tabs":[],"version":23}}})}
    if (vk.loaded) cb(); else addEvent(window, 'load', cb);
  })();});;if (browser.msie) stManager.add('pinbar.js', function() {window.initPinBar('/anton_o_o', '/im');});
    }{/literal}
{elseif $okay == 'new'}
8524<!>tickets.css<!>0<!>2432<!>0<!>support?act=new<!> 

  {literal}
      <div id="header_wrap2">
        <div id="header_wrap1">
          <div id="header" style="display: none">
            <h1 id="title"></h1>
          </div>
        </div>
      </div>
      <div id="wrap_between"></div>
      <div id="wrap3"><div id="wrap2">
  <div id="wrap1">
    <div id="content"><div class="tickets_tabs t_bar clear_fix">
  <a id="new_link"
  class="fl_r"
  href="support?act=new"
  onclick="return Tickets.switchTab('new', event);"
  style="display: none">
  Новый вопрос
</a>
  <ul id="tickets_tabs" class="t0">
    <li id="list_tab" class="" style=""><a href="support" onclick="return Tickets.switchTab('list', event);">
  <b class="tl1"><b></b></b><b class="tl2"></b>
  <b class="tab_word">Мои вопросы</b>
</a></li><li id="new_tab" class="active_link" style=""><a href="support?act=new" onclick="return Tickets.switchTab('new', event);">
  <b class="tl1"><b></b></b><b class="tl2"></b>
  <b class="tab_word">Новый вопрос</b>
</a></li><li id="show_tab" class="" style="display: none;"><a class="tickets_inactive_tab">
    <b class="tl1"><b></b></b><b class="tl2"></b>
    <b class="tab_word">Просмотр вопроса</b>
  </a>
</li>
  </ul>
  <div id="tickets_progress" class="fl_r">
    <img src="/images/upload.gif"/>
  </div>
</div>
<div id="tickets_content">
  <div id="new_ticket">
  <div class="tickets_new_wrap">
    <div class="tickets_new_title">
      <div class="tickets_title_label">
        Здесь Вы можете сообщить нам о любой проблеме, связанной с <b>сайтом</b>.
      </div>
      <div id="tickets_search" class="clear_fix" onclick="ge('tickets_title').focus();">
        <div class="fl_l">
          <input
            id="tickets_title"
            class="text"
            type="text"
            value=""
            maxlength="100"
            placeholder="Пожалуйста, опишите Вашу проблему в двух словах.."
            onkeypress="onCtrlEnter(event, function() {ge('tickets_text').focus();})"
            onkeyup="Tickets.updateFAQ(event, this);" />
        </div>
        <div class="tickets_search_progress fl_l"></div>
        <div id="tickets_search_reset" class="fl_l" onmouseover="if (isVisible(this)) animate(this, {opacity: 1}, 100)" onmouseout="if (isVisible(this)) animate(this, {opacity: .6}, 100)" onclick="Tickets.clearSearch(this, event)"></div>
      </div>
    </div>
    <div id="tickets_detailed_form" style="">
      <textarea
        id="tickets_text"
        onkeypress="onCtrlEnter(event, Tickets.saveTicket.pbind('0eef219869a562911e'))"
        onkeyup="Tickets.checkTextLength(this, 4096, 'tickets_text_warn')"
        placeholder="Пожалуйста, расскажите о Вашей проблеме чуть подробнее.."></textarea>
      <div id="tickets_text_warn"></div>
      <div id="tis_preview" class="clear_fix"></div>
      <div id="tis_prg_preview"></div>
      <div class="tickets_new_controls clear_fix">
        <div class="button_blue fl_l"><button id="tickets_send" onclick="Tickets.saveTicket('0eef219869a562911e');">Отправить</button></div>
        <a id="tis_cancel_lnk" class="fl_l" onclick="Tickets.toggleDetailedForm()" style="">Отмена</a>
      </div>
    </div>
  </div>
</div>
<div id="tickets_advice">
  
</div><div id="tickets_faq_list">
  <div class="tickets_faq_row first clear_fix" onmouseover="addClass(this, 'over');" onmouseout="removeClass(this, 'over');" onclick="return Tickets.toggleFAQRow(11, '1b745bf920b1f67e8d', this, event);">
  <div class="tickets_faq_img fl_l">
    <img src="/images/support_2.png" />
  </div>
  <div class="tickets_faq_content fl_l">
    <div class="tickets_faq_title">
      Кто администратор сайта? Почему он скрывается?
    </div>
    <div class="tickets_faq_text">
      <span id="tickets_faq_short_text11">
        Создатель сайта сидит по ту сторону..
      </span>
      <span class="tickets_faq_full_text" id="tickets_faq_full_text11">
        Создатель сайта сидит по ту сторону монитора и дорабатывает сайт. Он не скрывается, просто не хочет показывать свою личность. Любая информация о нем не доступна. Но он часто бивает в тех поддержке и отвечает на вопросы.
<br><br>Но если вам очень нужно с ним связаться пишите сюда же и сам администратор ответит вам.
        
        <div class="tickets_faq_links">
          <span id="tickets_faq_links11">
            <a href="" onclick="return Tickets.rateFAQ(11, 1, '1b745bf920b1f67e8d')">Это решает мою проблему</a><span class="divider">|</span><a href="" onclick="return Tickets.rateFAQ(11, -1, '1b745bf920b1f67e8d')">Это не решает мою проблему</a>
          </span>
          <span id="tickets_faq_useful11" class="tickets_faq_rated">
            Мы рады, что смогли Вам помочь&#33;
            <a href="" onclick="return Tickets.cancelRateFAQ(11, -1, '1b745bf920b1f67e8d')">Отмена</a>
          </span>
          <span id="tickets_faq_unuseful11" class="tickets_faq_rated">
            Спасибо за Ваш голос&#33;
            <a href="" onclick="return Tickets.cancelRateFAQ(11, 1, '1b745bf920b1f67e8d')">Отмена</a>
          </span>
        </div>
      </span>
    </div>
  </div>
</div><div class="tickets_faq_row clear_fix" onmouseover="addClass(this, 'over');" onmouseout="removeClass(this, 'over');" onclick="return Tickets.toggleFAQRow(2551, 'cb98cd505638af94d0', this, event);">
  <div class="tickets_faq_img fl_l">
    <img src="/images/support_3.png" />
  </div>
  <div class="tickets_faq_content fl_l">
    <div class="tickets_faq_title">
      Хочу себе id до 50, сколько это стоит?
    </div>
    <div class="tickets_faq_text">
      <span id="tickets_faq_short_text2551">
        Смена id на числа меньше 50 осуществляется бесплатно, д..
      </span>
      <span class="tickets_faq_full_text" id="tickets_faq_full_text2551">
        Смена id на числа меньше 50 осуществляется бесплатно, для этого нужно что б ваша страница была максимально заполнена и интересна также вы
должны быть активным пользователем сайта. Еще короткий id могут дать за заслуги на сайте, например за самое большое количество приглашенных друзей на сайт или создания самой большой группы на сайте.

<br><br>Если вы хотите сменить свой id пишите прямо нам. Мы рассмотрим вашу страницу и сделаем вам короткий id. 
        
        <div class="tickets_faq_links">
          <span id="tickets_faq_links2551">
            <a href="" onclick="return Tickets.rateFAQ(2551, 1, 'cb98cd505638af94d0')">Это решает мою проблему</a><span class="divider">|</span><a href="" onclick="return Tickets.rateFAQ(2551, -1, 'cb98cd505638af94d0')">Это не решает мою проблему</a>
          </span>
          <span id="tickets_faq_useful2551" class="tickets_faq_rated">
            Мы рады, что смогли Вам помочь&#33;
            <a href="" onclick="return Tickets.cancelRateFAQ(2551, -1, 'cb98cd505638af94d0')">Отмена</a>
          </span>
          <span id="tickets_faq_unuseful2551" class="tickets_faq_rated">
            Спасибо за Ваш голос&#33;
            <a href="" onclick="return Tickets.cancelRateFAQ(2551, 1, 'cb98cd505638af94d0')">Отмена</a>
          </span>
        </div>
      </span>
    </div>
  </div>
</div><div class="tickets_faq_row clear_fix" onmouseover="addClass(this, 'over');" onmouseout="removeClass(this, 'over');" onclick="return Tickets.toggleFAQRow(2707, 'be43cb1863a9a6e827', this, event);">
  <div class="tickets_faq_img fl_l">
    <img src="/images/support_1.png" />
  </div>
  <div class="tickets_faq_content fl_l">
    <div class="tickets_faq_title">
      Некоторые функции сайта не работают.
    </div>
    <div class="tickets_faq_text">
      <span id="tickets_faq_short_text2707">
        Да это возможно, сайт только разрабатывается..
      </span>
      <span class="tickets_faq_full_text" id="tickets_faq_full_text2707">
        Да это возможно, сайт только разрабатывается и в скоро все будет работать<br><br>Только не переживайте)
        
        <div class="tickets_faq_links">
          <span id="tickets_faq_links2707">
            <a href="" onclick="return Tickets.rateFAQ(2707, 1, 'be43cb1863a9a6e827')">Это решает мою проблему</a><span class="divider">|</span><a href="" onclick="return Tickets.rateFAQ(2707, -1, 'be43cb1863a9a6e827')">Это не решает мою проблему</a>
          </span>
          <span id="tickets_faq_useful2707" class="tickets_faq_rated">
            Мы рады, что смогли Вам помочь&#33;
            <a href="" onclick="return Tickets.cancelRateFAQ(2707, -1, 'be43cb1863a9a6e827')">Отмена</a>
          </span>
          <span id="tickets_faq_unuseful2707" class="tickets_faq_rated">
            Спасибо за Ваш голос&#33;
            <a href="" onclick="return Tickets.cancelRateFAQ(2707, 1, 'be43cb1863a9a6e827')">Отмена</a>
          </span>
        </div>
      </span>
    </div>
  </div>
</div>
  <div id="tickets_faq_button"><div class="button_blue"><button id="tickets_unuseful" onclick="Tickets.showAverageTime('2 часа');">Ни один из этих вариантов не подходит</button></div></div>
</div><div id="audio_checking" style="display: none"><div class="audio" id="audio{/literal}{$user->user_info.user_id}{literal}_143709187">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr>
      <td>
        <a onclick="playAudioNew('{/literal}{$user->user_info.user_id}{literal}_143709187')"><div class="play_new" id="play{/literal}{$user->user_info.user_id}{literal}_143709187"></div></a>
        <input type="hidden" id="audio_info{/literal}{$user->user_info.user_id}{literal}_143709187" value="http://cs5582.userapi.com/u17724828/audio/c9705caca464.mp3,325" />
        
      </td>
      <td class="info">
        <div class="duration fl_r" onmousedown="if (window.audioPlayer) audioPlayer.switchTimeFormat('{/literal}{$user->user_info.user_id}{literal}_143709187', event);">5:25</div>
        <div class="audio_title_wrap"><b><a href="http://vkontakte.ru">Owsey &amp; CoMa</a></b> &ndash; <span id="title{/literal}{$user->user_info.user_id}{literal}_143709187">Stay With Me</span></div>
      </td>
      
    </tr>
  </table>
  <div class="player_wrap">
    <div id="line{/literal}{$user->user_info.user_id}{literal}_143709187" class="playline"><div></div></div>
    <div id="player{/literal}{$user->user_info.user_id}{literal}_143709187" class="player" ondragstart="return false;" onselectstart="return false;">
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr valign="top" id="audio_tr{/literal}{$user->user_info.user_id}{literal}_143709187">
          <td style="width:100%;padding:0px;position:relative;">
            <div id="audio_white_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="audio_white_line" onmousedown="audioPlayer.prClick(event);"></div>
            <div id="audio_load_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="audio_load_line" onmousedown="audioPlayer.prClick(event);"><!-- --></div>
            <div id="audio_progress_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="audio_progress_line" onmousedown="audioPlayer.prClick(event);">
              <div id="audio_pr_slider{/literal}{$user->user_info.user_id}{literal}_143709187" class="audio_pr_slider"><!-- --></div>
            </div>
          </td>
          <td id="audio_vol{/literal}{$user->user_info.user_id}{literal}_143709187" style="position: relative;"></td>
        </tr>
      </table>
    </div>
  </div>
</div></div>
</div></div>
  </div>
</div></div>
    </div>


    <div class="clear"></div>
  </div>
</div></div></div>
  <div class="progress" id="global_prg"></div><!>
box.hide();
window.document.title = 'ВСети | Помощь';
  if (parent && parent != window && (browser.msie || browser.opera || browser.mozilla || browser.chrome || browser.safari || browser.iphone)) {
      document.getElementsByTagName('body')[0].innerHTML = '';
    } else {
      domReady();
      updateMoney(0);
gSearch.init();
if (window.qArr && qArr[5]) qArr[5] = [5, "по товарам", "", "goods", 0x00000100];
if (browser.iphone || browser.ipad || browser.ipod) {
  setStyle(bodyNode, {webkitTextSizeAdjust: 'none'});
}
if (0) {
  hide('support_link_td');
}
var ts_input = ge('ts_input'), oldFF = browser.mozilla && parseInt(browser.version) < 8;
if (browser.mozilla && !oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
placeholderSetup(ts_input, {back: false, reload: true});
if (browser.opera || browser.msie || oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
if (browser.chrome) {
  setStyle(ts_input, {padding: (vk.rtl ? '4px 23px 3px 2px' : '4px 3px 3px 23px')});
} 
    if (parent && parent != window && (browser.msie || browser.opera || browser.mozilla || browser.chrome || browser.safari || browser.iphone)) {
      document.getElementsByTagName('body')[0].innerHTML = '';
    } else {
      domReady();
      updateMoney(0);
gSearch.init();
if (window.qArr && qArr[5]) qArr[5] = [5, "по товарам", "", "goods", 0x00000100];
if (browser.iphone || browser.ipad || browser.ipod) {
  setStyle(bodyNode, {webkitTextSizeAdjust: 'none'});
}
if (0) {
  hide('support_link_td');
}
var ts_input = ge('ts_input'), oldFF = browser.mozilla && parseInt(browser.version) < 8;
if (browser.mozilla && !oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
placeholderSetup(ts_input, {back: false, reload: true});
if (browser.opera || browser.msie || oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
if (browser.chrome) {
  setStyle(ts_input, {padding: (vk.rtl ? '4px 23px 3px 2px' : '4px 3px 3px 23px')});
}
TopSearch.init();
if (browser.msie8 || browser.msie7) {
  var st = {border: '1px solid #a6b6c6'};
  if (hasClass(ge('ts_wrap'), 'vk')) {
    if (vk.rtl) st.left = '1px';
    else st.right = '0px';
  } else {
    if (vk.rtl) st.right = '146px';
    else st.left = '146px';
  }
  setStyle(ge('ts_cont_wrap'), st);
}
window.tsHintsEnabled = 1;
zNav([], {});
handlePageParams({"id":{/literal}{$user->user_info.user_id}{literal},"leftblocks":"","leftads":"","loc":"support?act=new","wrap_page":1,"width":791,"width_dec":160,"width_dec_footer":130,"no_ads":1});addEvent(document, 'click', onDocumentClick);;stManager.add(["tickets.js","upload.js","notifier.js"], function () {extend(cur, {"section":"new","lang":{"placeholder_default":"Пожалуйста, опишите Вашу проблему в двух словах..","placeholder_title":"Пожалуйста, добавьте заголовок к Вашему вопросу..","support_average_wait_time":"Примерное время ожидания","support_wait_message":"К сожалению, в связи с большим количеством вопросов мы не можем отвечать так быстро, как нам того хотелось бы. Извините.<br><br>Примерное время ожидания сейчас: <b>{time}<\/b>.","support_ask_question":"Задать вопрос","support_back_to_faq":"Вернуться к помощи"}});placeholderSetup(ge('tickets_text'), {back: true});
placeholderSetup(ge('tickets_title'), {back: true});
autosizeSetup(ge('tickets_text'), {minHeight: 94, maxHeight: 500});
cur.uploadData = {"url":"http:\/\/cs11431.vk.com\/upload.php","vars":{"act":"do_add","aid":-13,"gid":0,"mid":{/literal}{$user->user_info.user_id}{literal},"hash":"09005a3228e5fd38e24f832ada097e17","rhash":"7ad95197e9b7ba7b8945bc34392b08fc","from_host":"vk.com"},"options":{"server":"11431","default_error":1,"error_hash":"66f3969a89f678af18820714f25c1cf9","lang":{"max_files_warning":"Вы можете загрузить до 5 изображений с расширением JPG, PNG или GIF.","button_browse":"Выбрать файл"}},"lang":{"support_adding_screen":"Прикрепление снимка экрана","support_screen_you_can":"Вы можете загрузить до 5 изображений с расширением JPG, PNG или GIF.","support_screen_warn":"Файлы размером более 5 MB не загрузятся. В случае возникновения проблем попробуйте загрузить фотографию меньшего размера.","drop_files_here":"Перетащите файлы сюда","dont_attach":"Не прикреплять","support_add_screen":"Прикрепить изображение"}};
cur.lang = extend(cur.lang || {}, cur.uploadData.lang);
ge('tickets_title').focus();

cur.titleShift = [225, -45, 500];
cur.textShift = [265, -114, 500];
var titleEl = ge('tickets_title'), textEl = ge('tickets_text'),
showNewTT = function () {
  showTooltip(titleEl, {
    text: '<div class="tail_wrap"><div class="tail"></div></div><div class="hint_wrap">Например: <b>изменить имя</b> или<br><b>не загружаются фотографии</b></div>',
    slideX: -15,
    className: 'tickets_side_tt title',
    shift: cur.titleShift,
    hasover: 1,
    onCreate: function () {
      var pointer = geByClass1('tail_wrap', titleEl.tt.container),
      h = getSize(titleEl.tt.container)[1], elH = getSize(titleEl)[1], elY = getXY(titleEl)[1];
      setStyle(pointer, {top: (h - 11) / 2 - 1});
      titleEl.tt.opts.shift[1] = cur.titleShift[1] = -intval((h + elH + 3) / 2);
      setStyle(titleEl.tt.container, {top: elY - h - titleEl.tt.opts.shift[1]});
      removeEvent(titleEl, 'mouseout');
    }
  });
},
showTextTT = function () {
  showTooltip(textEl, {
    text: '<div class="tail_wrap"><div class="tail"></div></div>\
    <div class="hint_wrap">Постарайтесь указать <b>все</b> важные сведения. Это могут быть, например:</div>\
    <ul class="tickets_tt_list">\
      <li><b>ссылки</b> на пользователей или группы </li>\
        <li>номер <b>телефона</b>, если проблема с ним </li>\
        <li><b>скриншот</b> страницы с ошибкой </li>\
    </ul>',
    slideX: -15,
    className: 'tickets_side_tt text',
    shift: cur.textShift,
    hasover: 1,
    onCreate: function () {
      var pointer = geByClass1('tail_wrap', textEl.tt.container),
      h = getSize(textEl.tt.container)[1], elH = getSize(textEl)[1], elY = getXY(textEl)[1];
      setStyle(pointer, {top: (h - 11) / 2 - 1});
      textEl.tt.opts.shift[1] = cur.textShift[1] = -intval((h + elH + 3) / 2);
      setStyle(textEl.tt.container, {top: elY - h - textEl.tt.opts.shift[1]});
      removeEvent(textEl, 'mouseout');
    }
  });
};
titleEl.onfocus = showNewTT;
titleEl.onblur = function () {
  if (!titleEl.tt) return;
  titleEl.tt.hide();
}
textEl.onfocus = showTextTT;
textEl.onblur = function () {
  if (!textEl.tt) return;
  textEl.tt.hide();
}
setTimeout(function() {
  var showing = false;
  if (cur.tooltips) {
    each(cur.tooltips, function(i, v) {if (isVisible(v.container)) {
      showing = true;
      return;
    }})
  }
  if (!showing) showNewTT();
}, 1000);
cur.samples = cur.samples || {}; cur.samples.audio = '<div class="z9q2m" id="z9q2m{/literal}{$user->user_info.user_id}{literal}_143709187">\
  <table cellspacing="0" cellpadding="0" width="100%">\
    <tr>\
      <td>\
        <a onclick="playAudioNew(\'{/literal}{$user->user_info.user_id}{literal}_143709187\')"><div class="play_new" id="play{/literal}{$user->user_info.user_id}{literal}_143709187"></div></a>\
        <input type="hidden" id="z9q2m_info{/literal}{$user->user_info.user_id}{literal}_143709187" value="http://cs5582.userapi.com/u17724828/z9q2m/c9705caca464.mp3,325" />\
        \
      </td>\
      <td class="info">\
        <div class="duration fl_r" onmousedown="if (window.z9q2mPlayer) z9q2mPlayer.switchTimeFormat(\'{/literal}{$user->user_info.user_id}{literal}_143709187\', event);">5:25</div>\
        <div class="z9q2m_title_wrap"><b><a href="http://vkontakte.ru">Owsey &amp; CoMa</a></b> &ndash; <span id="title{/literal}{$user->user_info.user_id}{literal}_143709187">Stay With Me</span></div>\
      </td>\
      \
    </tr>\
  </table>\
  <div class="player_wrap">\
    <div id="line{/literal}{$user->user_info.user_id}{literal}_143709187" class="playline"><div></div></div>\
    <div id="player{/literal}{$user->user_info.user_id}{literal}_143709187" class="player" ondragstart="return false;" onselectstart="return false;">\
      <table width="100%" border="0" cellpadding="0" cellspacing="0">\
        <tr valign="top" id="z9q2m_tr{/literal}{$user->user_info.user_id}{literal}_143709187">\
          <td style="width:100%;padding:0px;position:relative;">\
            <div id="z9q2m_white_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="z9q2m_white_line" onmousedown="z9q2mPlayer.prClick(event);"></div>\
            <div id="z9q2m_load_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="z9q2m_load_line" onmousedown="z9q2mPlayer.prClick(event);"><!-- --></div>\
            <div id="z9q2m_progress_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="z9q2m_progress_line" onmousedown="z9q2mPlayer.prClick(event);">\
              <div id="z9q2m_pr_slider{/literal}{$user->user_info.user_id}{literal}_143709187" class="z9q2m_pr_slider"><!-- --></div>\
            </div>\
          </td>\
          <td id="z9q2m_vol{/literal}{$user->user_info.user_id}{literal}_143709187" style="position: relative;"></td>\
        </tr>\
      </table>\
    </div>\
  </div>\
</div>';  ;(function () {
    var cb = function () {Notifier.init({"queue_id":"events_queue{/literal}{$user->user_info.user_id}{literal}","timestamp":"1950649228","key":"jzDPsMGQJ1nsJ6HcseqAaJFzhGhDxQ0XQC9AlP01AIVJUt3aMcu1iKAr","uid":{/literal}{$user->user_info.user_id}{literal},"version":9,"flash_url":"\/swf\/queue_transport.swf","debug":false,"instance_id":"MjgzODUz","server_url":"http:\/\/q83.queue.vk.com\/im618","frame_path":"http:\/\/q83.queue.vk.com\/q_frame.php?6","frame_url":"im618","refresh_url":"http:\/\/vk.com\/notifier.php","fc":{"version":23,"state":{"clist":{"min":true,"x":false,"y":false,"onlines":true},"tabs":[],"version":23}}})}
    if (vk.loaded) cb(); else addEvent(window, 'load', cb);
  })();});;if (browser.msie) stManager.add('pinbar.js', function() {window.initPinBar('/{/literal}id{$user->user_info.user_id}{literal}', '/im');});
    }
TopSearch.init();
if (browser.msie8 || browser.msie7) {
  var st = {border: '1px solid #a6b6c6'};
  if (hasClass(ge('ts_wrap'), 'vk')) {
    if (vk.rtl) st.left = '1px';
    else st.right = '0px';
  } else {
    if (vk.rtl) st.right = '146px';
    else st.left = '146px';
  }
  setStyle(ge('ts_cont_wrap'), st);
}
window.tsHintsEnabled = 1;
handlePageParams({"id":{/literal}{$user->user_info.user_id}{literal},"leftblocks":"","leftads":"","loc":"support","wrap_page":1,"width":791,"width_dec":160,"width_dec_footer":130,"no_ads":1});addEvent(document, 'click', onDocumentClick);;stManager.add(["tickets.js","notifier.js"], function () {extend(cur, {"section":"list"});  ;(function () {
    var cb = function () {Notifier.init({"queue_id":"events_queue{/literal}{$user->user_info.user_id}{literal}","timestamp":"1374818738","key":"dnpx53gr8WbSGY66M_YIwEo788RL_RmMwlNBHEuPLZLxUHZMX1oGPR2h","uid":{/literal}{$user->user_info.user_id}{literal},"version":9,"flash_url":"\/swf\/queue_transport.swf","debug":false,"instance_id":"NjAzNzEw","server_url":"http:\/\/q84.queue.vk.com\/im618","frame_path":"http:\/\/q84.queue.vk.com\/q_frame.php?6","frame_url":"im618","refresh_url":"http:\/\/vk.com\/notifier.php","fc":{"version":23,"state":{"clist":{"min":true,"x":false,"y":false,"onlines":true},"tabs":[],"version":23}}})}
    if (vk.loaded) cb(); else addEvent(window, 'load', cb);
  })();});;if (browser.msie) stManager.add('pinbar.js', function() {window.initPinBar('/{/literal}id{$user->user_info.user_id}{literal}', '/im');});
    }
{/literal}

{/if}
{else}
{if $okay == 'browse'}

{include file='header_sup.tpl'}

<script type="text/javascript" src="/js/al/tickets.js?1862640230"></script>
<link type="text/css" rel="stylesheet" href="/css/al/tickets.css?61"></link>
  {literal} <div id="page_body" class="fl_r">
      <div id="header_wrap2">
        <div id="header_wrap1">
          <div id="header" style="display: none">
            <h1 id="title"></h1>
          </div>
        </div>
      </div>
      <div id="wrap_between"></div>
      <div id="wrap3"><div id="wrap2">
  <div id="wrap1">
    <div id="content"><div class="tickets_tabs t_bar clear_fix">
  <a id="new_link"
  class="fl_r"
  href="support?act=new"
  onclick="return Tickets.switchTab('new', event);"
  style="">
  Новый вопрос
</a>
  <ul id="tickets_tabs" class="t0">
    <li id="list_tab" class="active_link" style=""><a href="support" onclick="return Tickets.switchTab('list', event);">
  <b class="tl1"><b></b></b><b class="tl2"></b>
  <b class="tab_word">Вопросы пользователей</b>
</a></li><li id="new_tab" class="active_link" style="display: none;"><a href="support?act=new" onclick="return Tickets.switchTab('new', event);">
  <b class="tl1"><b></b></b><b class="tl2"></b>
  <b class="tab_word">Новый вопрос</b>
</a></li><li id="show_tab" class="" style="display: none;"><a class="tickets_inactive_tab">
    <b class="tl1"><b></b></b><b class="tl2"></b>
    <b class="tab_word">Просмотр вопроса</b>
  </a>
</li>
  </ul>
  <div id="tickets_progress" class="fl_r">
    <img src="/images/upload.gif"/>
  </div>
</div>
<div id="tickets_content">
  <div id="summary" class="clear_fix">
  <span class="tickets_summary fl_l">
    Пользователи задали {/literal}{$total_supports}{literal} вопросов
  </span>
  <span class="tickets_summary_actions">
  </span>
  <span class="tickets_summary_extra fl_r">
    <div id="tickets_pages" class="fl_r">
      
    </div>
    <div id="pages_loading_top" class="tickets_pages_loading fl_r">
      <img src="/images/upload.gif"/>
    </div>
  </span>
</div>
<div id="tickets_list">

{/literal}
  {section name=support_loop loop=$supports}

    <table cellpadding='0' cellspacing='0' width='100%'>

   <div class="tu_row clear_fix">
{if $supports[support_loop].support_status == '1' ||  $supports[support_loop].support_status == '2' }
  <a class="fl_r tu_last" href="support?act=show&id={$supports[support_loop].support_id}" onclick="return Tickets.gotoTicket({$supports[support_loop].support_id}, this, event);">
    <div class="fl_l tu_thumb"><img class="tu_img" src="/images/support_1.png" /></div>
    <div class="fl_l tu_mem">Агент поддержки</div>
    <div class="fl_l tu_date">ответил {$datetime->cdate("`$setting.setting_dateformat`", $datetime->timezone($supports[support_loop].support_date, $global_timezone))}</div>
  </a>{else}  <a class="fl_r tu_last" href="support?act=show&id={$supports[support_loop].support_id}" onclick="return Tickets.gotoTicket({$supports[support_loop].support_id}, this, event);">
    <div class="fl_l tu_thumb"><img class="tu_img" src="{if $user->user_info.user_photo == '' }/images/camera.gif{else}{$user->user_info.user_photo}{/if}" /></div>
    <div class="fl_l tu_mem">{$user->user_info.user_fio} {$user->user_info.user_fios}</div>
    <div class="fl_l tu_date">ответил {$datetime->cdate("`$setting.setting_dateformat`", $datetime->timezone($supports[support_loop].support_date, $global_timezone))}</div>
  </a>

{/if}
  <div class="tu_info">

    <div class="tu_row_title"><a href="support?act=show&id={$supports[support_loop].support_id}" onclick="return Tickets.gotoTicket({$supports[support_loop].support_id}, this, event);">{$supports[support_loop].support_title}</a></div>
    <div class="tu_row_comment">{if $supports[support_loop].support_status == '1' }Есть ответ.{else}Вопрос ожидает обработки.{/if}</div>

  </div>
</div>
  {/section}
{literal}






</div>

</div></div>
  </div>
</div></div>
    </div>

</div></div></div>
  <div class="progress" id="global_prg"></div>

  <script type="text/javascript">
    if (parent && parent != window && (browser.msie || browser.opera || browser.mozilla || browser.chrome || browser.safari || browser.iphone)) {
      document.getElementsByTagName('body')[0].innerHTML = '';
    } else {
      domReady();
      updateMoney(0);
gSearch.init();
if (window.qArr && qArr[5]) qArr[5] = [5, "по товарам", "", "goods", 0x00000100];
if (browser.iphone || browser.ipad || browser.ipod) {
  setStyle(bodyNode, {webkitTextSizeAdjust: 'none'});
}
if (0) {
  hide('support_link_td');
}
var ts_input = ge('ts_input'), oldFF = browser.mozilla && parseInt(browser.version) < 8;
if (browser.mozilla && !oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
placeholderSetup(ts_input, {back: false, reload: true});
if (browser.opera || browser.msie || oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
if (browser.chrome) {
  setStyle(ts_input, {padding: (vk.rtl ? '4px 23px 3px 2px' : '4px 3px 3px 23px')});
}

  </script>
</body>

</html>{/literal}
{elseif $okay == 'post'}
8524<!><!>0<!>2432<!>0<!><div id="tickets_name">
  <div class="title">
    {$support_title}
    <span id="tickets_browser" class="tickets_browser">
      
    </span>
  </div>
  
  <div class="info clear_fix">
    <div class="fl_l" id="tickets_info_title">
      {if $user->user_info.user_id == '1' }вопрос от id{$support_user_id}{else}{if $support_status == '1' }Есть ответ.{else}Вопрос ожидает обработки.{/if}{/if}
<input id="support_user_id" type="hidden" class="text" value="{$support_user_id}" />
<input id="support_id" type="hidden" class="text" value="{$support}" />
    </div>
    <div class="fl_r" id="tickets_info_links">
      
    </div>
  </div>
</div>
<div id="tickets_reply_rows">
  <div id="reply{$support}"><div class="tickets_reply_row clear_fix first">
    <div class="tickets_image fl_l">
      <a href="id{$user->user_info.user_id}" onclick="return nav.go(this, event);"   ><img  height="50" width="50" src="{$user->user_photo("./images/nophoto.gif")}" /></a>
      
    </div>
    <div class="tickets_reply_content fl_l">
      <div class="tickets_reply_title">
        <span class="tickets_author"><a class="mem_link" href="/id{$user->user_info.user_id}">{$user->user_info.user_fname} {$user->user_info.user_lname}</a></span>
      </div>
      <div class="tickets_reply_text">
        {$support_body}
      </div>
      
      <div class="tickets_reply_actions">
        {$datetime->cdate("`$setting.setting_dateformat`", $datetime->timezone($support_date, $global_timezone))} {$support28} {$datetime->cdate("`$setting.setting_timeformat`", $datetime->timezone($support_date, $global_timezone))}
<span id="reply_actions{$support}"></span><span class="divider">|</span><a href="#" onclick="return Tickets.deleteTicket({$support}, 'd4aa8196f0572eed84')">Удалить вопрос</a>
      </div>
    </div>
  </div>  </div>




{section name=comment_loop loop=$comments}

{if $comments[comment_loop].comment_author->user_info.user_id == '1' ||  $comments[comment_loop].comment_author->user_info.user_id == '2' }
<div id="reply{$comments[comment_loop].comment_id}"><div class="tickets_reply_row clear_fix first">
    <div class="tickets_image fl_l">
      <a onclick="return nav.go(this, event);" ><img height="50" src="{if $comments[comment_loop].comment_author->user_info.user_id == '2' }/images/baddaaa_support.png {else}/images/support_2.png{/if}" width="50" /></a>
      
    </div>
    <div class="tickets_reply_content fl_l">
      <div class="tickets_reply_title">
        <span class="tickets_author"><a class="mem_link" >
{if $comments[comment_loop].comment_author->user_info.user_id == '2' }Сотрудник поддержки #2{else}Агент поддержки{/if}
</a></span>
      </div>
      <div class="tickets_reply_text">
        {$comments[comment_loop].comment_body}
      </div>
      
      <div class="tickets_reply_actions">
  {$datetime->cdate("`$setting.setting_timeformat` `$profile_comments2` `$setting.setting_dateformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}<span id="reply_actions{$comments[comment_loop].comment_id}"></span>
      </div>
    </div>
  </div>
{else}
     <div id="reply{$comments[comment_loop].comment_id}"><div class="tickets_reply_row clear_fix first">
    <div class="tickets_image fl_l">
      <a onclick="return nav.go(this, event);" ><img height="50" src="{$comments[comment_loop].comment_author->user_photo('./images/nophoto.gif', 1)}" width="50" /></a>
      
    </div>
    <div class="tickets_reply_content fl_l">
      <div class="tickets_reply_title">
        <span class="tickets_author"><a class="mem_link" >{$comments[comment_loop].comment_author->user_info.user_fname} {$comments[comment_loop].comment_author->user_info.user_lname}
</a></span>
      </div>
      <div class="tickets_reply_text">
        {$comments[comment_loop].comment_body}
      </div>
      
      <div class="tickets_reply_actions">
        {$datetime->cdate("`$setting.setting_timeformat` `$profile_comments2` `$setting.setting_dateformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}
<span id="reply_actions{$comments[comment_loop].comment_id}"></span>
      </div>
    </div>
  </div>{/if}
</div>
  {/section}
{elseif $okay == 'new'}
{include file='header_sup.tpl'}

<link type="text/css" rel="stylesheet" href="/css/al/tickets.css?61"></link>
<script type="text/javascript" src="/js/al/tickets.js?1862640230"></script>
  {literal}<script type="text/javascript">
    if (parent && parent != window && (browser.msie || browser.opera || browser.mozilla || browser.chrome || browser.safari || browser.iphone)) {
      document.getElementsByTagName('body')[0].innerHTML = '';
    } else {
      domReady();
      updateMoney(0);
gSearch.init();
if (window.qArr && qArr[5]) qArr[5] = [5, "по товарам", "", "goods", 0x00000100];
if (browser.iphone || browser.ipad || browser.ipod) {
  setStyle(bodyNode, {webkitTextSizeAdjust: 'none'});
}
if (0) {
  hide('support_link_td');
}
var ts_input = ge('ts_input'), oldFF = browser.mozilla && parseInt(browser.version) < 8;
if (browser.mozilla && !oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
placeholderSetup(ts_input, {back: false, reload: true});
if (browser.opera || browser.msie || oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
if (browser.chrome) {
  setStyle(ts_input, {padding: (vk.rtl ? '4px 23px 3px 2px' : '4px 3px 3px 23px')});
} </script> <div id="page_body" class="fl_r" >
      <div id="header_wrap2">
        <div id="header_wrap1">
          <div id="header" style="display: none">
            <h1 id="title"></h1>
          </div>
        </div>
      </div>
      <div id="wrap_between"></div>
      <div id="wrap3"><div id="wrap2">
  <div id="wrap1">
    <div id="content"><div class="tickets_tabs t_bar clear_fix">
  <a id="new_link"
  class="fl_r"
  href="support?act=new"
  onclick="return Tickets.switchTab('new', event);"
  style="display: none">
  Новый вопрос
</a>
  <ul id="tickets_tabs" class="t0">
    <li id="list_tab" class="" style=""><a href="support" onclick="return Tickets.switchTab('list', event);">
  <b class="tl1"><b></b></b><b class="tl2"></b>
  <b class="tab_word">Мои вопросы</b>
</a></li><li id="new_tab" class="active_link" style=""><a href="support?act=new" onclick="return Tickets.switchTab('new', event);">
  <b class="tl1"><b></b></b><b class="tl2"></b>
  <b class="tab_word">Новый вопрос</b>
</a></li><li id="show_tab" class="" style="display: none;"><a class="tickets_inactive_tab">
    <b class="tl1"><b></b></b><b class="tl2"></b>
    <b class="tab_word">Просмотр вопроса</b>
  </a>
</li>
  </ul>
  <div id="tickets_progress" class="fl_r">
    <img src="/images/upload.gif"/>
  </div>
</div>
<div id="tickets_content">
  <div id="new_ticket">
  <div class="tickets_new_wrap">
    <div class="tickets_new_title">
      <div class="tickets_title_label">
        Здесь Вы можете сообщить нам о любой проблеме, связанной с <b>сайтом</b>.
      </div>
      <div id="tickets_search" class="clear_fix" onclick="ge('tickets_title').focus();">
        <div class="fl_l">
          <input
            id="tickets_title"
            class="text"
            type="text"
            value=""
            maxlength="100"
            placeholder="Пожалуйста, опишите Вашу проблему в двух словах.."
            onkeypress="onCtrlEnter(event, function() {ge('tickets_text').focus();})"
            onkeyup="Tickets.updateFAQ(event, this);" />
        </div>
        <div class="tickets_search_progress fl_l"></div>
        <div id="tickets_search_reset" class="fl_l" onmouseover="if (isVisible(this)) animate(this, {opacity: 1}, 100)" onmouseout="if (isVisible(this)) animate(this, {opacity: .6}, 100)" onclick="Tickets.clearSearch(this, event)"></div>
      </div>
    </div>
    <div id="tickets_detailed_form" style="">
      <textarea
        id="tickets_text"
        onkeypress="onCtrlEnter(event, Tickets.saveTicket.pbind('0eef219869a562911e'))"
        onkeyup="Tickets.checkTextLength(this, 4096, 'tickets_text_warn')"
        placeholder="Пожалуйста, расскажите о Вашей проблеме чуть подробнее.."></textarea>
      <div id="tickets_text_warn"></div>
      <div id="tis_preview" class="clear_fix"></div>
      <div id="tis_prg_preview"></div>
      <div class="tickets_new_controls clear_fix">
        <div class="button_blue fl_l"><button id="tickets_send" onclick="Tickets.saveTicket('0eef219869a562911e');">Отправить</button></div>
        <a id="tis_cancel_lnk" class="fl_l" onclick="Tickets.toggleDetailedForm()" style="">Отмена</a>
<div >
<a onclick="smileadd('tickets_text', ':smile:');"><img src="/images/sm/smile.gif"></a>
<a onclick="smileadd('tickets_text', ':angel:');"><img src="/images/sm/angel.gif"></a>
<a onclick="smileadd('tickets_text', ':bad:');"><img src="/images/sm/bad.gif"></a>
<a onclick="smileadd('tickets_text', ':biggrin:');"><img src="/images/sm/biggrin.gif"></a>
<a onclick="smileadd('tickets_text', ':blum:');"><img src="/images/sm/blum.gif"></a>
<a onclick="smileadd('tickets_text', ':cray:');"><img src="/images/sm/cray.gif"></a>
<a onclick="smileadd('tickets_text', ':crazy:');"><img src="/images/sm/crazy.gif"></a>
<a onclick="smileadd('tickets_text', ':dance:');"><img src="/images/sm/dance.gif"></a>
<a onclick="smileadd('tickets_text', ':diablo:');"><img src="/images/sm/diablo.gif"></a>
<a onclick="smileadd('tickets_text', ':dirol:');"><img src="/images/sm/dirol.gif"></a>
<a onclick="smileadd('tickets_text', ':good:');"><img src="/images/sm/good.gif"></a>
<a onclick="smileadd('tickets_text', ':in_love:');"><img src="/images/sm/in_love.gif"></a>

<a onclick="smileadd('tickets_text', ':music:');"><img src="/images/sm/music.gif"></a>
<a onclick="smileadd('tickets_text', ':nea:');"><img src="/images/sm/nea.gif"></a>
<a onclick="smileadd('tickets_text', ':pardon:');"><img src="/images/sm/pardon.gif"></a>
<a onclick="smileadd('tickets_text', ':rolleyes:');"><img src="/images/sm/rolleyes.gif"></a>
<a onclick="smileadd('tickets_text', ':scratch:');"><img src="/images/sm/scratch.gif"></a>
<a onclick="smileadd('tickets_text', ':shok:');"><img src="/images/sm/shok.gif"></a>
<a onclick="smileadd('tickets_text', ':shout:');"><img src="/images/sm/shout.gif"></a>
<a onclick="smileadd('tickets_text', ':unknw:');"><img src="/images/sm/unknw.gif"></a>

<a onclick="smileadd('tickets_text', ':wink:');"><img src="/images/sm/wink.gif"></a>
<a onclick="smileadd('tickets_text', ':yahoo:');"><img src="/images/sm/yahoo.gif"></a>
<a onclick="smileadd('tickets_text', ':laugh:');"><img src="/images/sm/laugh.gif"></a>
<a onclick="smileadd('tickets_text', ':wall:');"><img src="/images/sm/wall.gif"></a>
      </div></div>
    </div>
  </div>
</div>
<div id="tickets_advice">
  
</div><div id="tickets_faq_list">
  <div class="tickets_faq_row first clear_fix" onmouseover="addClass(this, 'over');" onmouseout="removeClass(this, 'over');" onclick="return Tickets.toggleFAQRow(11, '1b745bf920b1f67e8d', this, event);">
  <div class="tickets_faq_img fl_l">
    <img src="/images/support_2.png" />
  </div>
  <div class="tickets_faq_content fl_l">
    <div class="tickets_faq_title">
      Кто администратор сайта? Почему он скрывается?
    </div>
    <div class="tickets_faq_text">
      <span id="tickets_faq_short_text11">
        Создатель сайта сидит по ту сторону..
      </span>
      <span class="tickets_faq_full_text" id="tickets_faq_full_text11">
        Создатель сайта сидит по ту сторону монитора и дорабатывает сайт. Он не скрывается, просто не хочет показывать свою личность. Любая информация о нем не доступна. Но он часто бивает в тех поддержке и отвечает на вопросы.
<br><br>Но если вам очень нужно с ним связаться пишите сюда же и сам администратор ответит вам.
        
        <div class="tickets_faq_links">
          <span id="tickets_faq_links11">
            <a href="" onclick="return Tickets.rateFAQ(11, 1, '1b745bf920b1f67e8d')">Это решает мою проблему</a><span class="divider">|</span><a href="" onclick="return Tickets.rateFAQ(11, -1, '1b745bf920b1f67e8d')">Это не решает мою проблему</a>
          </span>
          <span id="tickets_faq_useful11" class="tickets_faq_rated">
            Мы рады, что смогли Вам помочь&#33;
            <a href="" onclick="return Tickets.cancelRateFAQ(11, -1, '1b745bf920b1f67e8d')">Отмена</a>
          </span>
          <span id="tickets_faq_unuseful11" class="tickets_faq_rated">
            Спасибо за Ваш голос&#33;
            <a href="" onclick="return Tickets.cancelRateFAQ(11, 1, '1b745bf920b1f67e8d')">Отмена</a>
          </span>
        </div>
      </span>
    </div>
  </div>
</div><div class="tickets_faq_row clear_fix" onmouseover="addClass(this, 'over');" onmouseout="removeClass(this, 'over');" onclick="return Tickets.toggleFAQRow(2551, 'cb98cd505638af94d0', this, event);">
  <div class="tickets_faq_img fl_l">
    <img src="/images/support_3.png" />
  </div>
  <div class="tickets_faq_content fl_l">
    <div class="tickets_faq_title">
      Хочу себе id до 50, сколько это стоит?
    </div>
    <div class="tickets_faq_text">
      <span id="tickets_faq_short_text2551">
        Смена id на числа меньше 50 осуществляется бесплатно, д..
      </span>
      <span class="tickets_faq_full_text" id="tickets_faq_full_text2551">
        Смена id на числа меньше 50 осуществляется бесплатно, для этого нужно что б ваша страница была максимально заполнена и интересна также вы
должны быть активным пользователем сайта. Еще короткий id могут дать за заслуги на сайте, например за самое большое количество приглашенных друзей на сайт или создания самой большой группы на сайте.

<br><br>Если вы хотите сменить свой id пишите прямо нам. Мы рассмотрим вашу страницу и сделаем вам короткий id. 
        
        <div class="tickets_faq_links">
          <span id="tickets_faq_links2551">
            <a href="" onclick="return Tickets.rateFAQ(2551, 1, 'cb98cd505638af94d0')">Это решает мою проблему</a><span class="divider">|</span><a href="" onclick="return Tickets.rateFAQ(2551, -1, 'cb98cd505638af94d0')">Это не решает мою проблему</a>
          </span>
          <span id="tickets_faq_useful2551" class="tickets_faq_rated">
            Мы рады, что смогли Вам помочь&#33;
            <a href="" onclick="return Tickets.cancelRateFAQ(2551, -1, 'cb98cd505638af94d0')">Отмена</a>
          </span>
          <span id="tickets_faq_unuseful2551" class="tickets_faq_rated">
            Спасибо за Ваш голос&#33;
            <a href="" onclick="return Tickets.cancelRateFAQ(2551, 1, 'cb98cd505638af94d0')">Отмена</a>
          </span>
        </div>
      </span>
    </div>
  </div>
</div><div class="tickets_faq_row clear_fix" onmouseover="addClass(this, 'over');" onmouseout="removeClass(this, 'over');" onclick="return Tickets.toggleFAQRow(2707, 'be43cb1863a9a6e827', this, event);">
  <div class="tickets_faq_img fl_l">
    <img src="/images/support_1.png" />
  </div>
  <div class="tickets_faq_content fl_l">
    <div class="tickets_faq_title">
      Некоторые функции сайта не работают.
    </div>
    <div class="tickets_faq_text">
      <span id="tickets_faq_short_text2707">
        Да это возможно, сайт только разрабатывается..
      </span>
      <span class="tickets_faq_full_text" id="tickets_faq_full_text2707">
        Да это возможно, сайт только разрабатывается и в скоро все будет работать<br><br>Только не переживайте)
        
        <div class="tickets_faq_links">
          <span id="tickets_faq_links2707">
            <a href="" onclick="return Tickets.rateFAQ(2707, 1, 'be43cb1863a9a6e827')">Это решает мою проблему</a><span class="divider">|</span><a href="" onclick="return Tickets.rateFAQ(2707, -1, 'be43cb1863a9a6e827')">Это не решает мою проблему</a>
          </span>
          <span id="tickets_faq_useful2707" class="tickets_faq_rated">
            Мы рады, что смогли Вам помочь&#33;
            <a href="" onclick="return Tickets.cancelRateFAQ(2707, -1, 'be43cb1863a9a6e827')">Отмена</a>
          </span>
          <span id="tickets_faq_unuseful2707" class="tickets_faq_rated">
            Спасибо за Ваш голос&#33;
            <a href="" onclick="return Tickets.cancelRateFAQ(2707, 1, 'be43cb1863a9a6e827')">Отмена</a>
          </span>
        </div>
      </span>
    </div>
  </div>
</div>
  <div id="tickets_faq_button"><div class="button_blue"><button id="tickets_unuseful" onclick="Tickets.showAverageTime('2 часа');">Ни один из этих вариантов не подходит</button></div></div>
</div><div id="audio_checking" style="display: none"><div class="audio" id="audio{/literal}{$user->user_info.user_id}{literal}_143709187">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr>
      <td>
        <a onclick="playAudioNew('{/literal}{$user->user_info.user_id}{literal}_143709187')"><div class="play_new" id="play{/literal}{$user->user_info.user_id}{literal}_143709187"></div></a>
        <input type="hidden" id="audio_info{/literal}{$user->user_info.user_id}{literal}_143709187" value="http://cs5582.userapi.com/u17724828/audio/c9705caca464.mp3,325" />
        
      </td>
      <td class="info">
        <div class="duration fl_r" onmousedown="if (window.audioPlayer) audioPlayer.switchTimeFormat('{/literal}{$user->user_info.user_id}{literal}_143709187', event);">5:25</div>
        <div class="audio_title_wrap"><b><a href="http://vkontakte.ru">Owsey &amp; CoMa</a></b> &ndash; <span id="title{/literal}{$user->user_info.user_id}{literal}_143709187">Stay With Me</span></div>
      </td>
      
    </tr>
  </table>
  <div class="player_wrap">
    <div id="line{/literal}{$user->user_info.user_id}{literal}_143709187" class="playline"><div></div></div>
    <div id="player{/literal}{$user->user_info.user_id}{literal}_143709187" class="player" ondragstart="return false;" onselectstart="return false;">
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr valign="top" id="audio_tr{/literal}{$user->user_info.user_id}{literal}_143709187">
          <td style="width:100%;padding:0px;position:relative;">
            <div id="audio_white_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="audio_white_line" onmousedown="audioPlayer.prClick(event);"></div>
            <div id="audio_load_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="audio_load_line" onmousedown="audioPlayer.prClick(event);"><!-- --></div>
            <div id="audio_progress_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="audio_progress_line" onmousedown="audioPlayer.prClick(event);">
              <div id="audio_pr_slider{/literal}{$user->user_info.user_id}{literal}_143709187" class="audio_pr_slider"><!-- --></div>
            </div>
          </td>
          <td id="audio_vol{/literal}{$user->user_info.user_id}{literal}_143709187" style="position: relative;"></td>
        </tr>
      </table>
    </div>
  </div>
</div></div>
</div></div>
  </div>
</div></div>
    </div>


    <div class="clear"></div>
  </div>
</div></div></div>
  <div class="progress" id="global_prg"></div>
<script type="text/javascript">
function smileadd(name, smile) {
var txt = ge(name).value;
ge(name).value = txt + ' ' + smile;
box.hide();
}
</script>
  <script type="text/javascript">
    if (parent && parent != window && (browser.msie || browser.opera || browser.mozilla || browser.chrome || browser.safari || browser.iphone)) {
      document.getElementsByTagName('body')[0].innerHTML = '';
    } else {
      domReady();
      updateMoney(0);
gSearch.init();
if (window.qArr && qArr[5]) qArr[5] = [5, "по товарам", "", "goods", 0x00000100];
if (browser.iphone || browser.ipad || browser.ipod) {
  setStyle(bodyNode, {webkitTextSizeAdjust: 'none'});
}
if (0) {
  hide('support_link_td');
}
var ts_input = ge('ts_input'), oldFF = browser.mozilla && parseInt(browser.version) < 8;
if (browser.mozilla && !oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
placeholderSetup(ts_input, {back: false, reload: true});
if (browser.opera || browser.msie || oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
if (browser.chrome) {
  setStyle(ts_input, {padding: (vk.rtl ? '4px 23px 3px 2px' : '4px 3px 3px 23px')});
} 
    if (parent && parent != window && (browser.msie || browser.opera || browser.mozilla || browser.chrome || browser.safari || browser.iphone)) {
      document.getElementsByTagName('body')[0].innerHTML = '';
    } else {
      domReady();
      updateMoney(0);
gSearch.init();
if (window.qArr && qArr[5]) qArr[5] = [5, "по товарам", "", "goods", 0x00000100];
if (browser.iphone || browser.ipad || browser.ipod) {
  setStyle(bodyNode, {webkitTextSizeAdjust: 'none'});
}
if (0) {
  hide('support_link_td');
}
var ts_input = ge('ts_input'), oldFF = browser.mozilla && parseInt(browser.version) < 8;
if (browser.mozilla && !oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
placeholderSetup(ts_input, {back: false, reload: true});
if (browser.opera || browser.msie || oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
if (browser.chrome) {
  setStyle(ts_input, {padding: (vk.rtl ? '4px 23px 3px 2px' : '4px 3px 3px 23px')});
}
TopSearch.init();
if (browser.msie8 || browser.msie7) {
  var st = {border: '1px solid #a6b6c6'};
  if (hasClass(ge('ts_wrap'), 'vk')) {
    if (vk.rtl) st.left = '1px';
    else st.right = '0px';
  } else {
    if (vk.rtl) st.right = '146px';
    else st.left = '146px';
  }
  setStyle(ge('ts_cont_wrap'), st);
}
window.tsHintsEnabled = 1;
zNav([], {});
handlePageParams({"id":{/literal}{$user->user_info.user_id}{literal},"leftblocks":"","leftads":"","loc":"support?act=new","wrap_page":1,"width":791,"width_dec":160,"width_dec_footer":130,"no_ads":1});addEvent(document, 'click', onDocumentClick);;stManager.add(["tickets.js","upload.js","notifier.js"], function () {extend(cur, {"section":"new","lang":{"placeholder_default":"Пожалуйста, опишите Вашу проблему в двух словах..","placeholder_title":"Пожалуйста, добавьте заголовок к Вашему вопросу..","support_average_wait_time":"Примерное время ожидания","support_wait_message":"К сожалению, в связи с большим количеством вопросов мы не можем отвечать так быстро, как нам того хотелось бы. Извините.<br><br>Примерное время ожидания сейчас: <b>{time}<\/b>.","support_ask_question":"Задать вопрос","support_back_to_faq":"Вернуться к помощи"}});placeholderSetup(ge('tickets_text'), {back: true});
placeholderSetup(ge('tickets_title'), {back: true});
autosizeSetup(ge('tickets_text'), {minHeight: 94, maxHeight: 500});
cur.uploadData = {"url":"http:\/\/cs11431.vk.com\/upload.php","vars":{"act":"do_add","aid":-13,"gid":0,"mid":{/literal}{$user->user_info.user_id}{literal},"hash":"09005a3228e5fd38e24f832ada097e17","rhash":"7ad95197e9b7ba7b8945bc34392b08fc","from_host":"vk.com"},"options":{"server":"11431","default_error":1,"error_hash":"66f3969a89f678af18820714f25c1cf9","lang":{"max_files_warning":"Вы можете загрузить до 5 изображений с расширением JPG, PNG или GIF.","button_browse":"Выбрать файл"}},"lang":{"support_adding_screen":"Прикрепление снимка экрана","support_screen_you_can":"Вы можете загрузить до 5 изображений с расширением JPG, PNG или GIF.","support_screen_warn":"Файлы размером более 5 MB не загрузятся. В случае возникновения проблем попробуйте загрузить фотографию меньшего размера.","drop_files_here":"Перетащите файлы сюда","dont_attach":"Не прикреплять","support_add_screen":"Прикрепить изображение"}};
cur.lang = extend(cur.lang || {}, cur.uploadData.lang);
ge('tickets_title').focus();

cur.titleShift = [225, -45, 500];
cur.textShift = [265, -114, 500];
var titleEl = ge('tickets_title'), textEl = ge('tickets_text'),
showNewTT = function () {
  showTooltip(titleEl, {
    text: '<div class="tail_wrap"><div class="tail"></div></div><div class="hint_wrap">Например: <b>изменить имя</b> или<br><b>не загружаются фотографии</b></div>',
    slideX: -15,
    className: 'tickets_side_tt title',
    shift: cur.titleShift,
    hasover: 1,
    onCreate: function () {
      var pointer = geByClass1('tail_wrap', titleEl.tt.container),
      h = getSize(titleEl.tt.container)[1], elH = getSize(titleEl)[1], elY = getXY(titleEl)[1];
      setStyle(pointer, {top: (h - 11) / 2 - 1});
      titleEl.tt.opts.shift[1] = cur.titleShift[1] = -intval((h + elH + 3) / 2);
      setStyle(titleEl.tt.container, {top: elY - h - titleEl.tt.opts.shift[1]});
      removeEvent(titleEl, 'mouseout');
    }
  });
},
showTextTT = function () {
  showTooltip(textEl, {
    text: '<div class="tail_wrap"><div class="tail"></div></div>\
    <div class="hint_wrap">Постарайтесь указать <b>все</b> важные сведения. Это могут быть, например:</div>\
    <ul class="tickets_tt_list">\
      <li><b>ссылки</b> на пользователей или группы </li>\
        <li>номер <b>телефона</b>, если проблема с ним </li>\
        <li><b>скриншот</b> страницы с ошибкой </li>\
    </ul>',
    slideX: -15,
    className: 'tickets_side_tt text',
    shift: cur.textShift,
    hasover: 1,
    onCreate: function () {
      var pointer = geByClass1('tail_wrap', textEl.tt.container),
      h = getSize(textEl.tt.container)[1], elH = getSize(textEl)[1], elY = getXY(textEl)[1];
      setStyle(pointer, {top: (h - 11) / 2 - 1});
      textEl.tt.opts.shift[1] = cur.textShift[1] = -intval((h + elH + 3) / 2);
      setStyle(textEl.tt.container, {top: elY - h - textEl.tt.opts.shift[1]});
      removeEvent(textEl, 'mouseout');
    }
  });
};
titleEl.onfocus = showNewTT;
titleEl.onblur = function () {
  if (!titleEl.tt) return;
  titleEl.tt.hide();
}
textEl.onfocus = showTextTT;
textEl.onblur = function () {
  if (!textEl.tt) return;
  textEl.tt.hide();
}
setTimeout(function() {
  var showing = false;
  if (cur.tooltips) {
    each(cur.tooltips, function(i, v) {if (isVisible(v.container)) {
      showing = true;
      return;
    }})
  }
  if (!showing) showNewTT();
}, 1000);
cur.samples = cur.samples || {}; cur.samples.audio = '<div class="z9q2m" id="z9q2m{/literal}{$user->user_info.user_id}{literal}_143709187">\
  <table cellspacing="0" cellpadding="0" width="100%">\
    <tr>\
      <td>\
        <a onclick="playAudioNew(\'{/literal}{$user->user_info.user_id}{literal}_143709187\')"><div class="play_new" id="play{/literal}{$user->user_info.user_id}{literal}_143709187"></div></a>\
        <input type="hidden" id="z9q2m_info{/literal}{$user->user_info.user_id}{literal}_143709187" value="http://cs5582.userapi.com/u17724828/z9q2m/c9705caca464.mp3,325" />\
        \
      </td>\
      <td class="info">\
        <div class="duration fl_r" onmousedown="if (window.z9q2mPlayer) z9q2mPlayer.switchTimeFormat(\'{/literal}{$user->user_info.user_id}{literal}_143709187\', event);">5:25</div>\
        <div class="z9q2m_title_wrap"><b><a href="http://vkontakte.ru">Owsey &amp; CoMa</a></b> &ndash; <span id="title{/literal}{$user->user_info.user_id}{literal}_143709187">Stay With Me</span></div>\
      </td>\
      \
    </tr>\
  </table>\
  <div class="player_wrap">\
    <div id="line{/literal}{$user->user_info.user_id}{literal}_143709187" class="playline"><div></div></div>\
    <div id="player{/literal}{$user->user_info.user_id}{literal}_143709187" class="player" ondragstart="return false;" onselectstart="return false;">\
      <table width="100%" border="0" cellpadding="0" cellspacing="0">\
        <tr valign="top" id="z9q2m_tr{/literal}{$user->user_info.user_id}{literal}_143709187">\
          <td style="width:100%;padding:0px;position:relative;">\
            <div id="z9q2m_white_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="z9q2m_white_line" onmousedown="z9q2mPlayer.prClick(event);"></div>\
            <div id="z9q2m_load_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="z9q2m_load_line" onmousedown="z9q2mPlayer.prClick(event);"><!-- --></div>\
            <div id="z9q2m_progress_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="z9q2m_progress_line" onmousedown="z9q2mPlayer.prClick(event);">\
              <div id="z9q2m_pr_slider{/literal}{$user->user_info.user_id}{literal}_143709187" class="z9q2m_pr_slider"><!-- --></div>\
            </div>\
          </td>\
          <td id="z9q2m_vol{/literal}{$user->user_info.user_id}{literal}_143709187" style="position: relative;"></td>\
        </tr>\
      </table>\
    </div>\
  </div>\
</div>';  ;(function () {
    var cb = function () {Notifier.init({"queue_id":"events_queue{/literal}{$user->user_info.user_id}{literal}","timestamp":"1950649228","key":"jzDPsMGQJ1nsJ6HcseqAaJFzhGhDxQ0XQC9AlP01AIVJUt3aMcu1iKAr","uid":{/literal}{$user->user_info.user_id}{literal},"version":9,"flash_url":"\/swf\/queue_transport.swf","debug":false,"instance_id":"MjgzODUz","server_url":"http:\/\/q83.queue.vk.com\/im618","frame_path":"http:\/\/q83.queue.vk.com\/q_frame.php?6","frame_url":"im618","refresh_url":"http:\/\/vk.com\/notifier.php","fc":{"version":23,"state":{"clist":{"min":true,"x":false,"y":false,"onlines":true},"tabs":[],"version":23}}})}
    if (vk.loaded) cb(); else addEvent(window, 'load', cb);
  })();});;if (browser.msie) stManager.add('pinbar.js', function() {window.initPinBar('/{/literal}id{$user->user_info.user_id}{literal}', '/im');});
    }
TopSearch.init();
if (browser.msie8 || browser.msie7) {
  var st = {border: '1px solid #a6b6c6'};
  if (hasClass(ge('ts_wrap'), 'vk')) {
    if (vk.rtl) st.left = '1px';
    else st.right = '0px';
  } else {
    if (vk.rtl) st.right = '146px';
    else st.left = '146px';
  }
  setStyle(ge('ts_cont_wrap'), st);
}
window.tsHintsEnabled = 1;
handlePageParams({"id":{/literal}{$user->user_info.user_id}{literal},"leftblocks":"","leftads":"","loc":"support","wrap_page":1,"width":791,"width_dec":160,"width_dec_footer":130,"no_ads":1});addEvent(document, 'click', onDocumentClick);;stManager.add(["tickets.js","notifier.js"], function () {extend(cur, {"section":"list"});  ;(function () {
    var cb = function () {Notifier.init({"queue_id":"events_queue{/literal}{$user->user_info.user_id}{literal}","timestamp":"1374818738","key":"dnpx53gr8WbSGY66M_YIwEo788RL_RmMwlNBHEuPLZLxUHZMX1oGPR2h","uid":{/literal}{$user->user_info.user_id}{literal},"version":9,"flash_url":"\/swf\/queue_transport.swf","debug":false,"instance_id":"NjAzNzEw","server_url":"http:\/\/q84.queue.vk.com\/im618","frame_path":"http:\/\/q84.queue.vk.com\/q_frame.php?6","frame_url":"im618","refresh_url":"http:\/\/vk.com\/notifier.php","fc":{"version":23,"state":{"clist":{"min":true,"x":false,"y":false,"onlines":true},"tabs":[],"version":23}}})}
    if (vk.loaded) cb(); else addEvent(window, 'load', cb);
  })();});;if (browser.msie) stManager.add('pinbar.js', function() {window.initPinBar('/{/literal}id{$user->user_info.user_id}{literal}', '/im');});
    }
   </script>
</body>

</html>{/literal}
{elseif $okay == 'show'}

{include file='header_sup.tpl'}

<link type="text/css" rel="stylesheet" href="/css/al/tickets.css?61"></link>
<script type="text/javascript" src="/js/al/tickets.js?1862640230"></script>
<div id="page_body" class="fl_r" >
      <div id="header_wrap2">
        <div id="header_wrap1">
          <div id="header" style="display: none">
            <h1 id="title"></h1>
          </div>
        </div>
      </div>
      <div id="wrap_between"></div>
      <div id="wrap3"><div id="wrap2">
  <div id="wrap1">
    <div id="content"><div class="tickets_tabs t_bar clear_fix">
  <a id="new_link"
  class="fl_r"
  href="support?act=new"
  onclick="return Tickets.switchTab('new', event);"
  style="">
  Новый вопрос
</a>
  <ul id="tickets_tabs" class="t0">
    <li id="list_tab" class="" style=""><a href="support" onclick="return Tickets.switchTab('list', event);">
  <b class="tl1"><b></b></b><b class="tl2"></b>
  <b class="tab_word">Мои вопросы</b>
</a></li><li id="new_tab" class="active_link" style="display: none;"><a href="support?act=new" onclick="return Tickets.switchTab('new', event);">
  <b class="tl1"><b></b></b><b class="tl2"></b>
  <b class="tab_word">Новый вопрос</b>
</a></li><li id="show_tab" class="active_link" style=""><a class="tickets_inactive_tab">
    <b class="tl1"><b></b></b><b class="tl2"></b>
    <b class="tab_word">Просмотр вопроса</b>
  </a>
</li>
  </ul>
  <div id="tickets_progress" class="fl_r">
    <img src="/images/upload.gif"/>
  </div>
</div>
<div id="tickets_content">
  <div id="tickets_name">
  <div class="title">
    {$support_title}
    <span id="tickets_browser" class="tickets_browser">
      
    </span>
  </div>
  
  <div class="info clear_fix">
    <div class="fl_l" id="tickets_info_title">
      {if $user->user_info.user_id == '1' }вопрос от id{$support_user_id}{else}{if $support_status == '1' }Есть ответ.{else}Вопрос ожидает обработки.{/if}{/if}
<input id="support_user_id" type="hidden" class="text" value="{$support_user_id}" />
<input id="support_id" type="hidden" class="text" value="{$support}" />
    </div>
    <div class="fl_r" id="tickets_info_links">
      
    </div>
  </div>
</div>
<div id="tickets_reply_rows">
  <div id="reply{$support}"><div class="tickets_reply_row clear_fix first">
    <div class="tickets_image fl_l">
      <a href="id{$user->user_info.user_id}" onclick="return nav.go(this, event);"   ><img  height="50" width="50" src="{$user->user_photo("./images/nophoto.gif")}" /></a>
      
    </div>
    <div class="tickets_reply_content fl_l">
      <div class="tickets_reply_title">
        <span class="tickets_author"><a class="mem_link" href="/id{$user->user_info.user_id}">{$user->user_info.user_fname} {$user->user_info.user_lname}</a></span>
      </div>
      <div class="tickets_reply_text">
        {$support_body}
      </div>
      
      <div class="tickets_reply_actions">
        {$datetime->cdate("`$setting.setting_dateformat`", $datetime->timezone($support_date, $global_timezone))} {$support28} {$datetime->cdate("`$setting.setting_timeformat`", $datetime->timezone($support_date, $global_timezone))}
<span id="reply_actions{$support}"></span><span class="divider">|</span><a href="#" onclick="return Tickets.deleteTicket({$support}, 'd4aa8196f0572eed84')">Удалить вопрос</a>
      </div>
    </div>
  </div>  </div>




{section name=comment_loop loop=$comments}

{if $comments[comment_loop].comment_author->user_info.user_id == '1' ||  $comments[comment_loop].comment_author->user_info.user_id == '2' }
<div id="reply{$comments[comment_loop].comment_id}"><div class="tickets_reply_row clear_fix first">
    <div class="tickets_image fl_l">
      <a onclick="return nav.go(this, event);" ><img height="50" src="{if $comments[comment_loop].comment_author->user_info.user_id == '2' }/images/baddaaa_support.png {else}/images/support_2.png{/if}" width="50" /></a>
      
    </div>
    <div class="tickets_reply_content fl_l">
      <div class="tickets_reply_title">
        <span class="tickets_author"><a class="mem_link" >
{if $comments[comment_loop].comment_author->user_info.user_id == '2' }Сотрудник поддержки #2{else}Агент поддержки{/if}
</a></span>
      </div>
      <div class="tickets_reply_text">
        {$comments[comment_loop].comment_body}
      </div>
      
      <div class="tickets_reply_actions">
  {$datetime->cdate("`$setting.setting_timeformat` `$profile_comments2` `$setting.setting_dateformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}<span id="reply_actions{$comments[comment_loop].comment_id}"></span>
      </div>
    </div>
  </div>
{else}
     <div id="reply{$comments[comment_loop].comment_id}"><div class="tickets_reply_row clear_fix first">
    <div class="tickets_image fl_l">
      <a onclick="return nav.go(this, event);" ><img height="50" src="{$comments[comment_loop].comment_author->user_photo('./images/nophoto.gif', 1)}" width="50" /></a>
      
    </div>
    <div class="tickets_reply_content fl_l">
      <div class="tickets_reply_title">
        <span class="tickets_author"><a class="mem_link" >{$comments[comment_loop].comment_author->user_info.user_fname} {$comments[comment_loop].comment_author->user_info.user_lname}
</a></span>
      </div>
      <div class="tickets_reply_text">
        {$comments[comment_loop].comment_body}
      </div>
      
      <div class="tickets_reply_actions">
        {$datetime->cdate("`$setting.setting_timeformat` `$profile_comments2` `$setting.setting_dateformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}
<span id="reply_actions{$comments[comment_loop].comment_id}"></span>
      </div>
    </div>
  </div>{/if}
</div>
  {/section}
</div>
</div>

<div id="tickets_post_field_wrap"><div id="tickets_post_field" class="clear_fix">
  <div class="tickets_image fl_l">
    <a href="anton_o_o" onclick="return nav.go(this, event);"><img height="50" width="50"  src="{$user->user_photo("./images/nophoto.gif")}" /></a>
  </div>
  <div id="tickets_post_form" class="fl_l">

    <textarea
      id="tickets_reply"
      placeholder="Комментировать.."
      onkeypress="onCtrlEnter(event, Tickets.addTicketReply.pbind('4a9c629011c29c5610'))"
      onkeyup="Tickets.checkTextLength(this, 4096, 'tickets_reply_warn')"></textarea>
    <div id="tickets_reply_warn"></div>
    <div id="tis_preview" class="clear_fix"></div>
    <div id="tis_prg_preview"></div>
    <div class="tickets_envelope_controls clear_fix">

      <div class="button_blue fl_l"><button id="tickets_send" onclick="Tickets.addTicketReply('4a9c629011c29c5610');">Отправить</button></div>
<!--       -->
<a onclick="smileadd('tickets_reply', ':smile:');"><img src="/images/sm/smile.gif"></a>
<a onclick="smileadd('tickets_reply', ':angel:');"><img src="/images/sm/angel.gif"></a>
<a onclick="smileadd('tickets_reply', ':bad:');"><img src="/images/sm/bad.gif"></a>
<a onclick="smileadd('tickets_reply', ':biggrin:');"><img src="/images/sm/biggrin.gif"></a>
<a onclick="smileadd('tickets_reply', ':blum:');"><img src="/images/sm/blum.gif"></a>
<a onclick="smileadd('tickets_reply', ':cray:');"><img src="/images/sm/cray.gif"></a>
<a onclick="smileadd('tickets_reply', ':crazy:');"><img src="/images/sm/crazy.gif"></a>
<a onclick="smileadd('tickets_reply', ':dance:');"><img src="/images/sm/dance.gif"></a>
<a onclick="smileadd('tickets_reply', ':diablo:');"><img src="/images/sm/diablo.gif"></a>
<a onclick="smileadd('tickets_reply', ':dirol:');"><img src="/images/sm/dirol.gif"></a>
<a onclick="smileadd('tickets_reply', ':good:');"><img src="/images/sm/good.gif"></a>

<a onclick="smileadd('tickets_reply', ':music:');"><img src="/images/sm/music.gif"></a>
<a onclick="smileadd('tickets_reply', ':nea:');"><img src="/images/sm/nea.gif"></a>
<a onclick="smileadd('tickets_reply', ':pardon:');"><img src="/images/sm/pardon.gif"></a>
<a onclick="smileadd('tickets_reply', ':rolleyes:');"><img src="/images/sm/rolleyes.gif"></a>
<a onclick="smileadd('tickets_reply', ':scratch:');"><img src="/images/sm/scratch.gif"></a>
<a onclick="smileadd('tickets_reply', ':shok:');"><img src="/images/sm/shok.gif"></a>


    </div>
    
    
  </div>
</div></div>{literal}<div id="audio_checking" style="display: none"><div class="audio" id="audio166465618_143709187">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr>
      <td>
        <a onclick="playAudioNew('166465618_143709187')"><div class="play_new" id="play166465618_143709187"></div></a>
        <input type="hidden" id="audio_info166465618_143709187" value="http://cs5582.userapi.com/u17724828/audio/c9705caca464.mp3,325" />
        
      </td>
      <td class="info">
        <div class="duration fl_r" onmousedown="if (window.audioPlayer) audioPlayer.switchTimeFormat('166465618_143709187', event);">5:25</div>
        <div class="audio_title_wrap"><b><a href="http://vkontakte.ru">Owsey &amp; CoMa</a></b> &ndash; <span id="title166465618_143709187">Stay With Me</span></div>
      </td>
      
    </tr>
  </table>
  <div class="player_wrap">
    <div id="line166465618_143709187" class="playline"><div></div></div>
    <div id="player166465618_143709187" class="player" ondragstart="return false;" onselectstart="return false;">
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr valign="top" id="audio_tr166465618_143709187">
          <td style="width:100%;padding:0px;position:relative;">
            <div id="audio_white_line166465618_143709187" class="audio_white_line" onmousedown="audioPlayer.prClick(event);"></div>
            <div id="audio_load_line166465618_143709187" class="audio_load_line" onmousedown="audioPlayer.prClick(event);"><!-- --></div>
            <div id="audio_progress_line166465618_143709187" class="audio_progress_line" onmousedown="audioPlayer.prClick(event);">
              <div id="audio_pr_slider166465618_143709187" class="audio_pr_slider"><!-- --></div>
            </div>
          </td>
          <td id="audio_vol166465618_143709187" style="position: relative;"></td>
        </tr>
      </table>
    </div>
  </div>
</div></div>
</div></div>
  </div>
</div></div>
    </div>

</div></div></div>
  <div class="progress" id="global_prg"></div>
<script type="text/javascript">
function smileadd(name, smile) {
var txt = ge(name).value;
ge(name).value = txt + ' ' + smile;
box.hide();
}
</script>
 <script type="text/javascript">
    if (parent && parent != window && (browser.msie || browser.opera || browser.mozilla || browser.chrome || browser.safari || browser.iphone)) {
      document.getElementsByTagName('body')[0].innerHTML = '';
    } else {
      domReady();
      updateMoney(0);
gSearch.init();
if (window.qArr && qArr[5]) qArr[5] = [5, "по товарам", "", "goods", 0x00000100];
if (browser.iphone || browser.ipad || browser.ipod) {
  setStyle(bodyNode, {webkitTextSizeAdjust: 'none'});
}
if (0) {
  hide('support_link_td');
}
var ts_input = ge('ts_input'), oldFF = browser.mozilla && parseInt(browser.version) < 8;
if (browser.mozilla && !oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
placeholderSetup(ts_input, {back: false, reload: true});
if (browser.opera || browser.msie || oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
if (browser.chrome) {
  setStyle(ts_input, {padding: (vk.rtl ? '4px 23px 3px 2px' : '4px 3px 3px 23px')});
}
TopSearch.init();
if (browser.msie8 || browser.msie7) {
  var st = {border: '1px solid #a6b6c6'};
  if (hasClass(ge('ts_wrap'), 'vk')) {
    if (vk.rtl) st.left = '1px';
    else st.right = '0px';
  } else {
    if (vk.rtl) st.right = '146px';
    else st.left = '146px';
  }
  setStyle(ge('ts_cont_wrap'), st);
}
window.tsHintsEnabled = 1;
zNav([], {});
handlePageParams({"id":{/literal}{$user->user_info.user_id}{literal},"leftblocks":"","leftads":"","loc":"support?act=show&id=1400247","wrap_page":1,"width":791,"width_dec":160,"width_dec_footer":130,"no_ads":1});addEvent(document, 'click', onDocumentClick);;stManager.add(["tickets.js","privacy.js","notifier.js"], function () {extend(cur, {"section":"show","ticket_id":1400247,"lang":{"delete_title":"Удаление вопроса","delete_confirm":"Вы действительно хотите удалить вопрос? Это действие нельзя будет отменить.","delete":"Удалить"}});autosizeSetup(ge('tickets_reply'), {minHeight: 42, maxHeight: 500});
placeholderSetup('tickets_reply', {back: false});
cur.uploadData = {"url":"http:\/\/cs11431.vk.com\/upload.php","vars":{"act":"do_add","aid":-13,"gid":0,"mid":{/literal}{$user->user_info.user_id}{literal},"hash":"09005a3228e5fd38e24f832ada097e17","rhash":"7ad95197e9b7ba7b8945bc34392b08fc","from_host":"vk.com"},"options":{"server":"11431","default_error":1,"error_hash":"66f3969a89f678af18820714f25c1cf9","lang":{"max_files_warning":"Вы можете загрузить до 5 изображений с расширением JPG, PNG или GIF.","button_browse":"Выбрать файл"}},"lang":{"support_adding_screen":"Прикрепление снимка экрана","support_screen_you_can":"Вы можете загрузить до 5 изображений с расширением JPG, PNG или GIF.","support_screen_warn":"Файлы размером более 5 MB не загрузятся. В случае возникновения проблем попробуйте загрузить фотографию меньшего размера.","drop_files_here":"Перетащите файлы сюда","dont_attach":"Не прикреплять","support_add_screen":"Прикрепить изображение"}};
cur.lang = extend(cur.lang || {}, cur.uploadData.lang);
cur.pvNoLikes = true;
cur.destroy.push(function() { cur.pvNoLikes = false; });cur.samples = cur.samples || {}; cur.samples.audio = '<div class="z9q2m" id="z9q2m{/literal}{$user->user_info.user_id}{literal}_143709187">\
  <table cellspacing="0" cellpadding="0" width="100%">\
    <tr>\
      <td>\
        <a onclick="playAudioNew(\'{/literal}{$user->user_info.user_id}{literal}_143709187\')"><div class="play_new" id="play{/literal}{$user->user_info.user_id}{literal}_143709187"></div></a>\
        <input type="hidden" id="z9q2m_info{/literal}{$user->user_info.user_id}{literal}_143709187" value="http://cs5582.userapi.com/u17724828/z9q2m/c9705caca464.mp3,325" />\
        \
      </td>\
      <td class="info">\
        <div class="duration fl_r" onmousedown="if (window.z9q2mPlayer) z9q2mPlayer.switchTimeFormat(\'{/literal}{$user->user_info.user_id}{literal}_143709187\', event);">5:25</div>\
        <div class="z9q2m_title_wrap"><b><a href="http://vkontakte.ru">Owsey &amp; CoMa</a></b> &ndash; <span id="title{/literal}{$user->user_info.user_id}{literal}_143709187">Stay With Me</span></div>\
      </td>\
      \
    </tr>\
  </table>\
  <div class="player_wrap">\
    <div id="line{/literal}{$user->user_info.user_id}{literal}_143709187" class="playline"><div></div></div>\
    <div id="player{/literal}{$user->user_info.user_id}{literal}_143709187" class="player" ondragstart="return false;" onselectstart="return false;">\
      <table width="100%" border="0" cellpadding="0" cellspacing="0">\
        <tr valign="top" id="z9q2m_tr{/literal}{$user->user_info.user_id}{literal}_143709187">\
          <td style="width:100%;padding:0px;position:relative;">\
            <div id="z9q2m_white_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="z9q2m_white_line" onmousedown="z9q2mPlayer.prClick(event);"></div>\
            <div id="z9q2m_load_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="z9q2m_load_line" onmousedown="z9q2mPlayer.prClick(event);"><!-- --></div>\
            <div id="z9q2m_progress_line{/literal}{$user->user_info.user_id}{literal}_143709187" class="z9q2m_progress_line" onmousedown="z9q2mPlayer.prClick(event);">\
              <div id="z9q2m_pr_slider{/literal}{$user->user_info.user_id}{literal}_143709187" class="z9q2m_pr_slider"><!-- --></div>\
            </div>\
          </td>\
          <td id="z9q2m_vol{/literal}{$user->user_info.user_id}{literal}_143709187" style="position: relative;"></td>\
        </tr>\
      </table>\
    </div>\
  </div>\
</div>';  ;(function () {
    var cb = function () {Notifier.init({"queue_id":"events_queue{/literal}{$user->user_info.user_id}{literal}","timestamp":"1104667390","key":"y8GuiLt2ZXwgkBa7bnPkFnFrZ_pp8fPmVhS0JrI9kRc40PYBcswbFbqh","uid":{/literal}{$user->user_info.user_id}{literal},"version":9,"flash_url":"\/swf\/queue_transport.swf","debug":false,"instance_id":"NTU4NzI=","server_url":"http:\/\/q66.queue.vk.com\/im618","frame_path":"http:\/\/q66.queue.vk.com\/q_frame.php?6","frame_url":"im618","refresh_url":"http:\/\/vk.com\/notifier.php","fc":{"version":23,"state":{"clist":{"min":true,"x":false,"y":false,"onlines":true},"tabs":[],"version":23}}})}
    if (vk.loaded) cb(); else addEvent(window, 'load', cb);
  })();});;if (browser.msie) stManager.add('pinbar.js', function() {window.initPinBar('/{/literal}id{$user->user_info.user_id}{literal}', '/im');});
    }

  </script>
</body>

</html>{/literal}
{else}

{include file='header_sup.tpl'}

<link type="text/css" rel="stylesheet" href="/css/al/tickets.css?61"></link>

<script type="text/javascript" src="/js/al/tickets.js?1862640230"></script>


  {literal} <div id="page_body" class="fl_r">
      <div id="header_wrap2">
        <div id="header_wrap1">
          <div id="header" style="display: none">
            <h1 id="title"></h1>
          </div>
        </div>
      </div>
      <div id="wrap_between"></div>
      <div id="wrap3"><div id="wrap2">
  <div id="wrap1">
    <div id="content"><div class="tickets_tabs t_bar clear_fix">
  <a id="new_link"
  class="fl_r"
  href="support?act=new"
  onclick="return Tickets.switchTab('new', event);"
  style="">
  Новый вопрос
</a>
  <ul id="tickets_tabs" class="t0">
    <li id="list_tab" class="active_link" style=""><a href="support" onclick="return Tickets.switchTab('list', event);">
  <b class="tl1"><b></b></b><b class="tl2"></b>
  <b class="tab_word">Мои вопросы</b>
</a></li><li id="new_tab" class="active_link" style="display: none;"><a href="support?act=new" onclick="return Tickets.switchTab('new', event);">
  <b class="tl1"><b></b></b><b class="tl2"></b>
  <b class="tab_word">Новый вопрос</b>
</a></li><li id="show_tab" class="" style="display: none;"><a class="tickets_inactive_tab">
    <b class="tl1"><b></b></b><b class="tl2"></b>
    <b class="tab_word">Просмотр вопроса</b>
  </a>
</li>
  </ul>
  <div id="tickets_progress" class="fl_r">
    <img src="/images/upload.gif"/>
  </div>
</div>
<div id="tickets_content">
  <div id="summary" class="clear_fix">
  <span class="tickets_summary fl_l">
    Вы задали {/literal}{$total_supports}{if $total_supports == '0'}<script type="text/javascript">window.location.href='support?act=new';</script>{/if}{literal} вопросов
  </span>
  <span class="tickets_summary_actions">
  </span>
  <span class="tickets_summary_extra fl_r">
    <div id="tickets_pages" class="fl_r">
      
    </div>
    <div id="pages_loading_top" class="tickets_pages_loading fl_r">
      <img src="/images/upload.gif"/>
    </div>
  </span>
</div>
<div id="tickets_list">

{/literal}
  {section name=support_loop loop=$supports}

    <table cellpadding='0' cellspacing='0' width='100%'>

   <div class="tu_row clear_fix">
{if $supports[support_loop].support_status == '1' }
  <a class="fl_r tu_last" href="support?act=show&id={$supports[support_loop].support_id}" onclick="return Tickets.gotoTicket({$supports[support_loop].support_id}, this, event);">
    <div class="fl_l tu_thumb"><img class="tu_img" src="/images/support_1.png" /></div>
    <div class="fl_l tu_mem">Агент поддержки</div>
    <div class="fl_l tu_date">ответил {$datetime->cdate("`$setting.setting_dateformat`", $datetime->timezone($supports[support_loop].support_date, $global_timezone))}</div>
  </a>{else}  <a class="fl_r tu_last" href="support?act=show&id={$supports[support_loop].support_id}" onclick="return Tickets.gotoTicket({$supports[support_loop].support_id}, this, event);">
    <div class="fl_l tu_thumb"><img class="tu_img" src="{$user->user_photo("./images/nophoto.gif")}" /></div>
    <div class="fl_l tu_mem">{$user->user_info.user_lname} {$user->user_info.user_fname}</div>
    <div class="fl_l tu_date">ответил {$datetime->cdate("`$setting.setting_dateformat`", $datetime->timezone($supports[support_loop].support_date, $global_timezone))}</div>
  </a>

{/if}
  <div class="tu_info">

    <div class="tu_row_title"><a href="support?act=show&id={$supports[support_loop].support_id}" onclick="return Tickets.gotoTicket({$supports[support_loop].support_id}, this, event);">{$supports[support_loop].support_title}</a></div>
    <div class="tu_row_comment">{if $supports[support_loop].support_status == '1' }Есть ответ.{else}Вопрос ожидает обработки.{/if}</div>

  </div>
</div>
  {/section}
{literal}






</div>

</div></div>
  </div>
</div></div>
    </div>

</div></div></div>
  <div class="progress" id="global_prg"></div>
  <script type="text/javascript">
function smileadd(name, smile) {
var txt = ge(name).value;
ge(name).value = txt + ' ' + smile;
box.hide();
}
  </script>
  <script type="text/javascript">
    if (parent && parent != window && (browser.msie || browser.opera || browser.mozilla || browser.chrome || browser.safari || browser.iphone)) {
      document.getElementsByTagName('body')[0].innerHTML = '';
    } else {
      domReady();
      updateMoney(0);
gSearch.init();
if (window.qArr && qArr[5]) qArr[5] = [5, "по товарам", "", "goods", 0x00000100];
if (browser.iphone || browser.ipad || browser.ipod) {
  setStyle(bodyNode, {webkitTextSizeAdjust: 'none'});
}
if (0) {
  hide('support_link_td');
}
var ts_input = ge('ts_input'), oldFF = browser.mozilla && parseInt(browser.version) < 8;
if (browser.mozilla && !oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
placeholderSetup(ts_input, {back: false, reload: true});
if (browser.opera || browser.msie || oldFF) {
  setStyle(ts_input, {padding: (vk.rtl ? '3px 22px 4px 4px' : '3px 4px 4px 22px')});
}
if (browser.chrome) {
  setStyle(ts_input, {padding: (vk.rtl ? '4px 23px 3px 2px' : '4px 3px 3px 23px')});
}
TopSearch.init();
if (browser.msie8 || browser.msie7) {
  var st = {border: '1px solid #a6b6c6'};
  if (hasClass(ge('ts_wrap'), 'vk')) {
    if (vk.rtl) st.left = '1px';
    else st.right = '0px';
  } else {
    if (vk.rtl) st.right = '146px';
    else st.left = '146px';
  }
  setStyle(ge('ts_cont_wrap'), st);
}
window.tsHintsEnabled = 1;
handlePageParams({"id":{/literal}{$user->user_info.user_id}{literal},"leftblocks":"","leftads":"","loc":"support","wrap_page":1,"width":791,"width_dec":160,"width_dec_footer":130,"no_ads":1});addEvent(document, 'click', onDocumentClick);;stManager.add(["tickets.js","notifier.js"], function () {extend(cur, {"section":"list"});  ;(function () {
    var cb = function () {Notifier.init({"queue_id":"events_queue{/literal}{$user->user_info.user_id}{literal}","timestamp":"1374818738","key":"dnpx53gr8WbSGY66M_YIwEo788RL_RmMwlNBHEuPLZLxUHZMX1oGPR2h","uid":{/literal}{$user->user_info.user_id}{literal},"version":9,"flash_url":"\/swf\/queue_transport.swf","debug":false,"instance_id":"NjAzNzEw","server_url":"http:\/\/q84.queue.vk.com\/im618","frame_path":"http:\/\/q84.queue.vk.com\/q_frame.php?6","frame_url":"im618","refresh_url":"http:\/\/vk.com\/notifier.php","fc":{"version":23,"state":{"clist":{"min":true,"x":false,"y":false,"onlines":true},"tabs":[],"version":23}}})}
    if (vk.loaded) cb(); else addEvent(window, 'load', cb);
  })();});;if (browser.msie) stManager.add('pinbar.js', function() {window.initPinBar('/anton_o_o', '/im');});
    }
  </script>
</body>

</html>{/literal}
{/if}{/if}