/**
 * @name jQuery imageMaps plugin
 * @license GPL
 * @version 0.0.4
 * @date 11 22, 2010
 * @category jQuery plugin
 * @author Simon Tang (www@yiye.name)
 * @copyright (c) 2010 Simon Tang (http://yiye.name/)
 */
(function($) {
    jQuery.fn.imageMaps = function(setting) {
        var $container = this;
        if ($container.length == 0) return false;
		$container.each(function(){
			var container = $(this);
			var $images = container.find('img[ref=imageMaps]');
			$images.wrap('<div class="image-maps-conrainer" style="position:relative;"></div>').css('border','1px solid #ccc');
			$images.each(function(){
				var _img_conrainer = $(this).parent();
				_img_conrainer.append('<div style="display:none;" class="button-conrainer"><input type="button" value="Add Link" /></div>').append('<div class="link-conrainer" style="display:none;"></div>').append($.browser.msie ? $('<div class="position-conrainer" style=""></div>').css({
					background:'#fff',
					opacity:0
				}) : '<div class="position-conrainer" style="position:absolute"></div>');
				var _img_offset = $(this).offset();
				var _img_conrainer_offset = _img_conrainer.offset();
				_img_conrainer.find('.position-conrainer').css({
					top: _img_offset.top - _img_conrainer_offset.top,
					left: _img_offset.left - _img_conrainer_offset.left,
					width:$(this).width(),
					height:$(this).height(),
					border:'1px solid transparent'
				});
				var map_name = $(this).attr('usemap').replace('#','');
				if(map_name !=''){
					var index = 1;
					var _link_conrainer = _img_conrainer.find('.link-conrainer');
					var _position_conrainer = _img_conrainer.find('.position-conrainer');
					var image_param = $(this).attr('name') == '' ? '' : '['+ $(this).attr('name') + ']';
					container.find('map[name='+map_name+']').find('area[shape=rect]').each(function(){
						var coords = $(this).attr('coords');
						_link_conrainer.append('<p ref="'+index+'" style="display:none;" class="map-link"><span class="link-number-text">Link '+index+'</span>: <input type="text" size="60" name="link'+image_param+'[]" value="'+$(this).attr('href')+'" /><input type="hidden" class="rect-value" name="rect'+image_param+'[]" value="'+coords+'" /></p>');
						coords = coords.split(',');
						if($("div.map-position").size()==0)
						_position_conrainer.append('<div ref="'+index+'" class="map-position" style="left:'+coords[0]+'px;top:'+coords[1]+'px;width:'+(coords[2]-coords[0])+'px;height:'+(coords[3]-coords[1])+'px;"><div class="map-position-bg"></div><span class="link-number-text">move </span><span style="display:none;" class="backgroup-color:none;"></span><span  class="backgroup-color:none;" class="resize"></span></div>');
						index++;
					});
				}
			});
			
		});
		
		$('.button-conrainer input[type=button]').click(function(){
			var _link_conrainer = $(this).parent().parent().find('.link-conrainer');
			var _position_conrainer = $(this).parent().parent().find('.position-conrainer');
			var index = _link_conrainer.find('.map-link').length +1;
			var image = $(this).parent().parent().find('img[ref=imageMaps]').attr('name');
			image = (image == '' ? '' : '['+ image + ']');
			_link_conrainer.append('<p ref="'+index+'" class="map-link"><span class="link-number-text">Link '+index+'</span>: <input type="text" size="60" name="link'+image+'[]" value="" /><input type="hidden" class="rect-value" name="rect'+image+'[]" value="10,10,100,40" /></p>');
			_position_conrainer.append('<div ref="'+index+'" class="map-position" style="left:10px;top:10px;width:90px;height:30px;"><div class="map-position-bg"></div><span class="link-number-text">Link '+index+'</span><span class="delete">X</span><span class="resize"></span></div>');
			bind_map_event();
			define_css();
		});
		
		
		
		//绑定map事件
		function bind_map_event(){
			$('.position-conrainer .map-position .map-position-bg').each(function(){
				var map_position_bg = $(this);
				var conrainer = $(this).parent().parent();
				map_position_bg.unbind('mousedown').mousedown(function(event){
					map_position_bg.data('mousedown', true);
					map_position_bg.data('pageX', event.pageX);
					map_position_bg.data('pageY', event.pageY);
					map_position_bg.css('cursor','move');
					return false;
				}).unbind('mouseup').mouseup(function(event){
					map_position_bg.data('mousedown', false);
					map_position_bg.css('cursor','default');
					return false;
				});
				conrainer.mousemove(function(event){
					if (!map_position_bg.data('mousedown')) return false;
                    var dx = event.pageX - map_position_bg.data('pageX');
                    var dy = event.pageY - map_position_bg.data('pageY');
                    
                    if ((dx == 0) && (dy == 0)){
                        return false;
                    }
					var map_position = map_position_bg.parent();
					var p = map_position.position();
					var left = p.left+dx;
					if(left <0) left = 0;
					var top = p.top+dy;
					if (top < 0) top = 0;
					var bottom = top + map_position.height();
					if(bottom > conrainer.height()){
						top = top-(bottom-conrainer.height());
					}
					var right = left + map_position.width();
					if(right > conrainer.width()){
						left = left-(right-conrainer.width());
					} 
					map_position.css({
						left:left,
						top:top
					});
					map_position_bg.data('pageX', event.pageX);
					map_position_bg.data('pageY', event.pageY);
					
					bottom = top + map_position.height();
					right = left + map_position.width();
					$('.link-conrainer p[ref='+map_position.attr('ref')+'] .rect-value').val(new Array(left,top,right,bottom).join(','));
					return false;
				}).mouseup(function(event){
					map_position_bg.data('mousedown', false);
					map_position_bg.css('cursor','default');
					return false;
				});
			});
			$('.position-conrainer .map-position .resize').each(function(){
				var map_position_resize = $(this);
				var conrainer = $(this).parent().parent();
				map_position_resize.unbind('mousedown').mousedown(function(event){
					map_position_resize.data('mousedown', true);
					map_position_resize.data('pageX', event.pageX);
					map_position_resize.data('pageY', event.pageY);
					return false;
				}).unbind('mouseup').mouseup(function(event){
					map_position_resize.data('mousedown', false);
					return false;
				});
				conrainer.mousemove(function(event){
					if (!map_position_resize.data('mousedown')) return false;
                    var dx = event.pageX - map_position_resize.data('pageX');
                    var dy = event.pageY - map_position_resize.data('pageY');
                    if ((dx == 0) && (dy == 0)){
                        return false;
                    }
					var map_position = map_position_resize.parent();
					var p = map_position.position();
					var left = p.left;
					var top = p.top;
					var height = map_position.height()+dy;
					if((top+height) > conrainer.height()){
						height = height-((top+height)-conrainer.height());
					}
					if (height <20) height = 20;
					var width = map_position.width()+dx;
					if((left+width) > conrainer.width()){
						width = width-((left+width)-conrainer.width());
					}
					if(width <50) width = 50;
					map_position.css({
						width:width,
						height:height
					});
					map_position_resize.data('pageX', event.pageX);
					map_position_resize.data('pageY', event.pageY);
					
					bottom = top + map_position.height();
					right = left + map_position.width();
					$('.link-conrainer p[ref='+map_position.attr('ref')+'] .rect-value').val(new Array(left,top,right,bottom).join(','));
					return false;
				}).mouseup(function(event){
					map_position_resize.data('mousedown', false);
					return false;
				});
			});
			$('.position-conrainer .map-position .delete').unbind('click').click(function(){
				var ref = $(this).parent().attr('ref');
				var _link_conrainer = $(this).parent().parent().parent().find('.link-conrainer');
				var _position_conrainer = $(this).parent().parent().parent().find('.position-conrainer');
				_link_conrainer.find('.map-link[ref='+ref+']').remove();
				_position_conrainer.find('.map-position[ref='+ref+']').remove();
				var index = 1;
				_link_conrainer.find('.map-link').each(function(){
					$(this).attr('ref',index).find('.link-number-text').html('Link '+index);
					index ++;
				});
				index = 1;
				_position_conrainer.find('.map-position').each(function(){
					$(this).attr('ref',index).find('.link-number-text').html('Link '+index);
					index ++;
				});
			});
		}
		
		bind_map_event();
		
		function define_css(){
			//样式定义
			$container.find('.map-position').css({
				position:'absolute',
				border:'1px solid #000',
				'font-weight':'bold'
			});
			$container.find('.map-position .map-position-bg').css({
				position:'absolute',
				background:'#0F0',
				opacity:0.5,
				top:0,
				left:0,
				right:0,
				bottom:0
			});
			$container.find('.map-position .resize').css({
				display:'block',
				position:'absolute',
				right:0,
				bottom:0,
				width:5,
				height:5,
				cursor:'nw-resize',
				background:'#000'
			});
			$container.find('.map-position .delete').css({
				display:'block',
				position:'absolute',
				right:0,
				top:0,
				width:10,
				height:12,
				'line-height':'11px',
				'font-size':12,
				'font-weight':'bold',
				background:'#000',
				color:'#fff',
				'font-family':'Arial',
				'padding-left':'2px',
				cursor:'pointer',
				opactiey : 1
			});
		}
		define_css();
    };
})(jQuery); 