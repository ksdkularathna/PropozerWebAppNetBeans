if (!Array.prototype.indexOf){
  Array.prototype.indexOf = function(elt){
    var len = this.length >>> 0;
    var from = Number(arguments[1]) || 0;
    from = (from < 0) ? Math.ceil(from) : Math.floor(from);
    if (from < 0) from += len;
    for (; from < len; from++){if (from in this && this[from] === elt) return from;}    
    return -1;
  };
}

if (!Array.prototype.forEach) {
  Array.prototype.forEach = function(fun /*, thisp*/){
    var len = this.length;
    if (typeof fun != "function")
      throw new TypeError();
    var thisp = arguments[1];
    for (var i = 0; i < len; i++){
      if (i in this)
        fun.call(thisp, this[i], i, this);
    }
  };
}

var Base64={_keyStr:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",encode:function(e){var t="";var n,r,i,s,o,u,a;var f=0;e=Base64._utf8_encode(e);while(f<e.length){n=e.charCodeAt(f++);r=e.charCodeAt(f++);i=e.charCodeAt(f++);s=n>>2;o=(n&3)<<4|r>>4;u=(r&15)<<2|i>>6;a=i&63;if(isNaN(r)){u=a=64}else if(isNaN(i)){a=64}t=t+this._keyStr.charAt(s)+this._keyStr.charAt(o)+this._keyStr.charAt(u)+this._keyStr.charAt(a)}return t},decode:function(e){var t="";var n,r,i;var s,o,u,a;var f=0;e=e.replace(/[^A-Za-z0-9\+\/\=]/g,"");while(f<e.length){s=this._keyStr.indexOf(e.charAt(f++));o=this._keyStr.indexOf(e.charAt(f++));u=this._keyStr.indexOf(e.charAt(f++));a=this._keyStr.indexOf(e.charAt(f++));n=s<<2|o>>4;r=(o&15)<<4|u>>2;i=(u&3)<<6|a;t=t+String.fromCharCode(n);if(u!=64){t=t+String.fromCharCode(r)}if(a!=64){t=t+String.fromCharCode(i)}}t=Base64._utf8_decode(t);return t},_utf8_encode:function(e){e=e.replace(/\r\n/g,"\n");var t="";for(var n=0;n<e.length;n++){var r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r)}else if(r>127&&r<2048){t+=String.fromCharCode(r>>6|192);t+=String.fromCharCode(r&63|128)}else{t+=String.fromCharCode(r>>12|224);t+=String.fromCharCode(r>>6&63|128);t+=String.fromCharCode(r&63|128)}}return t},_utf8_decode:function(e){var t="";var n=0;var r=c1=c2=0;while(n<e.length){r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r);n++}else if(r>191&&r<224){c2=e.charCodeAt(n+1);t+=String.fromCharCode((r&31)<<6|c2&63);n+=2}else{c2=e.charCodeAt(n+1);c3=e.charCodeAt(n+2);t+=String.fromCharCode((r&15)<<12|(c2&63)<<6|c3&63);n+=3}}return t}}

function supports_html5_storage() {
   return jLocalStorage.isSupport();
}
fb_login = function(){};
if (typeof fb_app_id != 'undefined'){
    function fb_auth_status(){
        if (typeof FB != 'undefined'){
            FB.getLoginStatus(function(response){
                if(response.status === 'connected'){
                    fb_login = fb_auth;
                } else { // If response connected try to get user info and auth
                    fb_login = function(){
                        FB.login(function(r){if(r.status == 'connected') {fb_auth();}}, {scope:'email,user_birthday'});
                    };
                }
            });
        }

        function fb_auth(){
            FB.api('/me', function(response){
                $.ajax({
                    type: "POST", dataType:'json', 
                    data: {"at":FB.getAuthResponse().accessToken}, 
                    url: "/api/registration/facebook_auth/", 
                    success: function(r) {
                        if (r.auth == 1){
                            if (typeof r.redirect_url != 'undefined') window.location = r.redirect_url;
                            else window.location = '/members/';
                        } else {
                            if (r.error == 'age_not_found') {
                                $('.field-sex .'+response.gender).click();
                                $('#name').val(response.first_name);
                                $('#email').val(response.email);
                                $('#password').val('');
                                $('#btn_submit').click();
                                
                                if ($('#open_registration_popup').length > 0) {
                                    $('#open_registration_popup').click();
                                }
                            } else {
                                fb_login = function(){
                                    FB.login(function(r){
                                        if(r.status == 'connected') {fb_auth();}
                                    }, {scope:'email,user_birthday', auth_type: 'rerequest'});
                                };
                            }
                        }
                    }
                });
            });
        }
    }
}

$(function () {
    if (typeof fb_app_id != 'undefined'){
        $.getScript('//connect.facebook.net/en_UK/sdk.js', function(){
            FB.init({appId:fb_app_id,cookie:true,version:'v2.1'});
            
            // Define fb login/register button first action
            fb_auth_status();

            // Define url in user photo gallery.
            if (typeof fb_access_check == 'function') fb_access_check();

            // Initiate facebook albums
            if (typeof draw_fb_photos == 'function') draw_fb_photos();
        });
    }

	/* Plugins */
    $.fn.drags = function (opt) {
        opt = $.extend({
            handle:    '',
            nodragCls: 'nodrag',
            cursor:    'auto'
        }, opt);

        return this.css('cursor', opt.cursor).bind('mousedown', function (e) {
            if (!$(e.target).parents().andSelf().hasClass(opt.nodragCls)) {

                var $draggable = $(this).addClass('draggable'),

                    drg_h = $draggable.outerHeight(),
                    drg_w = $draggable.outerWidth(),
                    pos_y = $draggable.offset().top + drg_h - e.pageY,
                    pos_x = $draggable.offset().left + drg_w - e.pageX;

                $('html').bind('mousemove.drag', function (e) {
                    $draggable.css({
                        top:  e.pageY + pos_y - drg_h,
                        left: e.pageX + pos_x - drg_w
                    });
                });

            }
        }).bind('mouseup', function () {

            $(this).removeClass('draggable');

            $('html').unbind('mousemove.drag');

        });
    };
    /* /Plugins */
    
	$('#video').find('a').click(function (e) {
        e.preventDefault();

        var $trigger = $(this),
            $body = $('body'),
            window_h = $(window).height(),
            yt_video_id = $trigger.attr('href').split('?v=')[1],
            $overlay_mask = $('<div id="overlay_mask"></div>').height(window_h),
            $overlay = $('<div id="overlay"><a class="close">'+lang('sidebar_video_link_close')+'</a></div>'),
            $video = $('<iframe width="853" height="480" src="https://www.youtube.com/embed/'+yt_video_id+'?autoplay=1&rel=0" frameborder="0" allowfullscreen></iframe>');

        $overlay_mask.append($overlay);
        $body.css('overflow', 'hidden').append($overlay_mask);
        $overlay.append($video);
        $.post("/video_stats/count", { yt_video_id: 'abc' });

        $overlay_mask.add($overlay.find('.close')).unbind('click').bind('click', function () {
            $video.hide();
            $overlay_mask.remove();
            $body.css('overflow', 'auto');
        });
    });
	
	// left sidebar  new registered girl/man
    var $nm = $('#new-members');
    if ($nm.length > 0) {
        var json_sex = $nm.attr('data-registered_sex');
        $.ajax({
            url: 'https://travelgirls-newly-registered.s3-eu-west-1.amazonaws.com/newly_'+(json_sex=='men'?'men':'girl')+'.json',
            dataType: 'jsonp',
            jsonp: false,
            jsonpCallback: 'users'
        }).done(function (data) {
            var li = '';
            $.each(data, function(key, val) {
                li += '<li><a href="/member/'+val['mem']+'"><img src="'+val['img']+'" alt="" width="30" height="40" /></a></li>';
            });
            $nm.children('ul').html(li);
        });
	}

    $(document)
        .on("click", "#notifications a.close", function(){
            var id = $(this).attr('id');
            $(this).parent().remove();
            $.post('/api/notifications/close', {'id':id});
            return false;
        })
        .on("click", ".dreams_visit_close", function(){
            $.post('/api/notifications/close', {'id':'alert_dreams_visit'});
            return false;
        })
        .on("click", 'a.clear_local_storage', function(event){
        	var ls_key = $(this).data('ls_key');
        	jLocalStorage.unset(ls_key + '.hash');
        	jLocalStorage.unset(ls_key + '.data');
        })
        .on("click", '#languages span', function(){
            $('.arrow-lang-more').hide();
            $('#languages a').css('display','inline-block');
            $('#languages').addClass('open');
        })
        .on("click", 'body', function(e){
            var target = $(e.target);
            if(!target.parents().hasClass('open')) {
                $('.arrow-lang-more').css('display','inline-block');
                $('#languages a').hide();
                $('#languages').removeClass('open');
            }
        });
});

(function(){
	
	var 
		_is_storage_works = false,
		_storage_object = {},
		_storage_size = 0;
		
	function _init() {
		if("localStorage" in window) {
			try {
				window.localStorage["_test"] = "1";
				_is_storage_works = true;
                window.localStorage.removeItem("_test");
			}
			catch (e) {}
		}
		if (_is_storage_works) {
			try {
				if(window.localStorage) {
					_storage_object = window.localStorage;
				}
			} 
			catch (e) {
				return false;
			}
		}
		
		return _is_storage_works;
	}
	
	function _checkKey(key) {
        if(!key || (typeof key != "string" && typeof key != "number")) {
            throw new TypeError("Key name must be string or numeric");
        }
        return true;
    }
	
	function _bytesToSize(bytes) {
	   var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
	   if (bytes == 0) {
		   return '0 Bytes';
	   }
	   var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
	   return (bytes / Math.pow(1024, i)).toFixed(2) + ' ' + sizes[i];
	}
	
	jLocalStorage = {
			
	    set: function (key, value) {
	    	_checkKey(key);
	    	
	    	if(typeof value == "function"){
                return false;
	    	}
	    	else if(value && typeof value == "object") {
	    		value = JSON.stringify(value);
	    	}
	    	_storage_object[key] = value;
	    },
	    
	    get: function (key) {
	    	_checkKey(key);
	    	
	    	return _storage_object[key];
	    },
	    
	    unset: function (key) {
	    	_checkKey(key);
	    	
	    	if(key in _storage_object) {
	    		delete _storage_object[key];
	    	}
	    },
	    
	    usedSize: function() {
	    	for(k in _storage_object) {
	    		_storage_size += _storage_object[k].length;
	    	}
            return _bytesToSize(_storage_size);
        },
        
        isSupport: function() {
            return _is_storage_works;
        },
	};
	
	_init();
})();

function toggleMore(e){
    
    var $box = $(e).parent(),
        $arrow = $(e);

    if (!$box.hasClass('visible')) {
        $box.addClass('visible');
        $arrow.html("&#9650;");
    } else {
        $box.removeClass('visible');
        $arrow.html("&#9660;");
    }
}

function lang(key){
    if (typeof langs != 'undefined' && typeof langs[key] != 'undefined' ) return langs[key];

    return '['+key+']';
}