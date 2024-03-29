/**
 * portal - jQuery EasyUI
 * 
 * Licensed under the GPL:
 *   http://www.gnu.org/licenses/gpl.txt
 *
 * Copyright 2010 stworthy [ stworthy@gmail.com ] 
 * 
 * Dependencies:
 *   draggable
 *   panel
 * 
 */
(function($){
	/**
	 * initialize the portal
	 */
	function init(target){
		$(target).addClass('portal');
		//hzj add cellpadding="10"
		var table = $('<table border="0" cellspacing="0" cellpadding="0"><tr></tr></table>').appendTo(target);
		var tr = table.find('tr');
		
		var columnWidths = [];
		var totalWidth = 0;
		$(target).find('>div').each(function(){	// each column panel
			var column = $(this);
			totalWidth += column.outerWidth();
			columnWidths.push(column.outerWidth());
			
			var td = $('<td class="portal-column-td"></td>').appendTo(tr)
			column.addClass('portal-column').appendTo(td);
			column.find('>div').each(function(){	// each portal panel
				var p = $(this).addClass('portal-p').panel({
					doSize:false,
					cls:'portal-panel'
				});
				makeDraggable(target, p);
			});
		});
		for(var i=0; i<columnWidths.length; i++){
			columnWidths[i] /= totalWidth;
		}
		
		$(target).bind('_resize', function(){
			var opts = $.data(target, 'portal').options;
			if (opts.fit == true){
				setSize(target);
			}
			return false;
		});
		
		return columnWidths;
	}
	
	function setSize(target){
		var t = $(target);
		var opts = $.data(target, 'portal').options;
		if (opts.fit){
			var p = t.parent();
			opts.width = p.width()-5;
			opts.height = p.height();
		}
		if (!isNaN(opts.width)){
			if ($.boxModel == true){
				t.width(opts.width - (t.outerWidth() - t.width()));
			} else {
				t.width(opts.width);
			}
		} else {
			t.width('auto');
		}
		if (!isNaN(opts.height)){
			if ($.boxModel == true){
				t.height(opts.height - (t.outerHeight() - t.height()));
			} else {
				t.height(opts.height);
			}
		} else {
			t.height('auto');
		}
		
		var hasScroll = t.find('>table').outerHeight() > t.height();
		var width = t.width();
		var columnWidths = $.data(target, 'portal').columnWidths;
		var leftWidth = 0;
		
		// calculate and set every column size
		for(var i=0; i<columnWidths.length; i++){
			var p = t.find('div.portal-column:eq('+i+')');
			var w = Math.floor(width * columnWidths[i]);
			if (i == columnWidths.length - 1){
			//hzj add 48
				w = width - leftWidth - (hasScroll == true ? 48 : 10);
			}
			if ($.boxModel == true){
				p.width(w - (p.outerWidth()-p.width())-20);
			} else {
				p.width(w);
			}
			leftWidth += p.outerWidth();
			
			// resize every panel of the column
			p.find('div.portal-p').panel('resize', {width:p.width()});
		}
	}
	
	/**
	 * set draggable feature for the specified panel
	 */
	function makeDraggable(target, panel){
		var spacer;
		panel.panel('panel').draggable({
			handle:'>div.panel-header>div.panel-title',
			proxy:function(source){
				var p = $('<div class="portal-proxy">proxy</div>').insertAfter(source);
				p.width($(source).width());
				p.height($(source).height());
				p.html($(source).html());
				p.find('div.portal-p').removeClass('portal-p');
				return p;
			},
			onStartDrag:function(e){
				$(this).hide();
				spacer = $('<div class="portal-spacer"></div>').insertAfter(this);
				setSpacerSize($(this).outerWidth(), $(this).outerHeight());
			},
			onDrag:function(e){
				var p = findPanel(e, this);
				if (p){
					if (p.pos == 'up'){
						spacer.insertBefore(p.target);
					} else {
						spacer.insertAfter(p.target);
					}
					setSpacerSize($(p.target).outerWidth());
				} else {
					var c = findColumn(e);
					if (c){
						if (c.find('div.portal-spacer').length == 0){
							spacer.appendTo(c);
							setSize(target);
							setSpacerSize(c.width());
						}
					}
				}
			},
			onStopDrag:function(e){
				$(this).css('position', 'static');
				$(this).show();
				spacer.hide();
				$(this).insertAfter(spacer);
				spacer.remove();
				setSize(target);
				var opts = $.data(target, 'portal').options;
				opts.onStopDrag.call(); 
			}
		});
		
		/**
		 * find which panel the cursor is over
		 */
		function findPanel(e, source){
			var result = null;
			$(target).find('div.portal-p').each(function(){
				var pal = $(this).panel('panel');
				if (pal[0] != source){
					var pos = pal.offset();
					if (e.pageX > pos.left && e.pageX < pos.left + pal.outerWidth()
							&& e.pageY > pos.top && e.pageY < pos.top + pal.outerHeight()){
						if (e.pageY > pos.top + pal.outerHeight() / 2){
							result = {
								target:pal,
								pos:'down'
							};
						} else {
							result = {
								target:pal,
								pos:'up'
							}
						}
					}
				}
			});
			return result;
		}
		
		/**
		 * find which portal column the cursor is over
		 */
		function findColumn(e){
			var result = null;
			$(target).find('div.portal-column').each(function(){
				var pal = $(this);
				var pos = pal.offset();
				if (e.pageX > pos.left && e.pageX < pos.left + pal.outerWidth()){
					result = pal;
				}
			});
			return result;
		}
		
		/**
		 * set the spacer size
		 */
		function setSpacerSize(width, height){
			if ($.boxModel == true){
				spacer.width(width - (spacer.outerWidth() - spacer.width()));
				if (height){
					spacer.height(height - (spacer.outerHeight() - spacer.height()));
				}
			} else {
				spacer.width(width);
				if (height){
					spacer.height(height);
				}
			}
		}
	}
	
	function json2str(o) {
		 var arr = [];
		 var fmt = function(s) {
			 if (typeof s == 'object' && s != null) return json2str(s);
			return /^(string|number)$/.test(typeof s) ? "'" + s + "'" : s;
		}
		for (var i in o) arr.push("'" + i + "':" + fmt(o[i]));
		return '{' + arr.join(',') + '}';
	}
	
	
	$.fn.portal = function(options, param){
		if (typeof options == 'string'){
			return $.fn.portal.methods[options](this, param);
		}
		
		options = options || {};
		return this.each(function(){
			var state = $.data(this, 'portal');
			if (state){
				$.extend(state.options, options);
			} else {
				state = $.data(this, 'portal', {
					options: $.extend({}, $.fn.portal.defaults, $.fn.portal.parseOptions(this), options),
					columnWidths: init(this)
				});
			}
			if (state.options.border){
				$(this).removeClass('portal-noborder');
			} else {
				$(this).addClass('portal-noborder');
			}
			 
			setSize(this);
		});
	};
	
	$.fn.portal.methods = {
		options: function(jq){
			return $.data(jq[0], 'portal').options;
		},
		resize: function(jq, param){
			return jq.each(function(){
				if (param){
					var opts = $.data(this, 'portal').options;
					if (param.width) opts.width = param.width;
					if (param.height) opts.height = param.height;
				}
				setSize(this);
			});
		},
		getPanels: function(jq, columnIndex){
			var c = jq;	// the panel container
			if (columnIndex){
				c = jq.find('div.portal-column:eq(' + columnIndex + ')');
			}
			var panels = [];
			c.find('div.portal-p').each(function(){
				panels.push($(this));
			});
			return panels;
		},
		add: function(jq, param){	// param: {panel,columnIndex}
			return jq.each(function(){
				var c = $(this).find('div.portal-column:eq(' + param.columnIndex + ')');
				var p = param.panel.addClass('portal-p');
				p.panel('open');
				//hzj add .css("margin-top","15px")
				p.panel('panel').addClass('portal-panel').css("margin-top","15px").appendTo(c);
				makeDraggable(this, p);
				
				p.panel('resize', {width:c.width()});
			});
		},
		remove: function(jq, panel){
			return jq.each(function(){
				var panels = $(this).portal('getPanels');
				for(var i=0; i<panels.length; i++){
					var p = panels[i];
					if (p[0] == $(panel)[0]){
						p.panel('destroy');
					}
				}
			});
		},
		getLayout: function(jq){ 
			 var portal = $(jq).portal('getPanels');
			 var portalColumnTd = $(jq).find('.portal-column-td');
			 var portalLayout="{";
			 var t = 0;
			 for(var i = 0; i < portalColumnTd.length;i++){
				var panel="\""+i+"\":[";
				var colomLength = $(portalColumnTd[i]).find('.portal-panel').length;
				for(var j = 0; j < colomLength;j++){
					panel += json2str(portal[t].panel('options'))+",";
					t++;
				}
				panel = panel.substring(0,panel.length-1)+"]";
				portalLayout += panel+",";
			 }
			 if(portalLayout.substring(0,portalLayout.length-1) == ""){
				portalLayout = portalLayout+"}";
			 }else{
				portalLayout = portalLayout.substring(0,portalLayout.length-1)+"}";
			 }
			 return portalLayout;
		},
		getPanelForTitle:function(jq,title){
			 var portal = $(jq).portal('getPanels');
			 var panel;
			 $.each(portal,function(i,v){
				if(v.panel('options').title == title) {
					panel = v; 
					return;
				}
			 });
			 return panel;
		}
	};
	
	$.fn.portal.parseOptions = function(target){
		var t = $(target);
		return {
			width: (parseInt(target.style.width) || undefined),
			height: (parseInt(target.style.height) || undefined),
			border: (t.attr('border') ? t.attr('border') == 'true' : undefined),
			fit: (t.attr('fit') ? t.attr('fit') == 'true' : undefined)
		};
	};
	
	$.fn.portal.defaults = {
		width:'auto',
		height:'auto',
		border:true,
		fit:false,
		onStopDrag:function(){
			
		}
	};
})(jQuery);