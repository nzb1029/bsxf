popTabs.tabList=[];

function popTabs(){};

function popTab(id,height,tablocation,closebutton,refurbish){
	if(!document.getElementById(id)) return false;
	popTabs.tabList.push(this);
	var T=this,W=document.getElementById(id),dl,dt,dd,b,h=height,tabs=[],w,bw,span,_tab;
	var tl=tablocation,close=closebutton, refush=refurbish,displayTabName;
	W.innerHTML='<dl class="poptab"><dt></dt></dl>';
	dl=W.getElementsByTagName("dl")[0];
	dt=dl.getElementsByTagName("dt")[0];
	w=dt.offsetWidth;
	dd=dl.getElementsByTagName("dd");
	b=dt.getElementsByTagName("b");
	span=dt.getElementsByTagName("span");
	T.ifrmaewidth=w/document.body.clientWidth;
	T.add=function(o){
    	if((o.title==null)||(o.iframe==null)) return T;
		if(isExist(o.iframe)) return T;
		var _a,_b;
		_b=document.createElement("b");
		_b.className="popcur";
		_b.dd=document.createElement("dd");
		_b.dd.style.height = h==0? "95%" : h + "px";
		_b.innerHTML="<span>"+o.title+"</span>";
	
		//标志tab上是否有关闭按钮
		if(close)
		{
			_b.innerHTML="<span>"+o.title+"</span><a href='#'></a>";
			_a=_b.getElementsByTagName("a")[0];
			_a.onclick=function(e){
		  		dl.removeChild(_b.dd);
		  		dt.removeChild(_b);
		  		var _i;
		  		Each(tabs,function(t,i){	if(_b===t) {tabs.splice(i,1);_i=i} })
		  		turn(_i);
	  			mesure();
		  		if(!document.all)e.stopPropagation();
		  		_tab=_b;
		  		return false;
			};
		}
		_b.src=o.iframe;
		tabs.push(_b);
		_b.onclick=function()
		{
			displayTabName=o.name;
			if ((refush)||(_b.dd.innerHTML==null)||(_b.dd.innerHTML==""))
			{
				_b.dd.innerHTML='<iframe frameborder="0" name="'+o.name+'" src="'+o.iframe+'"></iframe>';
	//			window.frames[o.name].location=(o.iframe);
				window.parent.document.getElementsByTagName(o.name).location=o.iframe;
			}
			turn(_b);
		};
		dt.appendChild(_b);
	
		//tab标签是在上面还是下面
		if(tl)
		{
			dl.appendChild(_b.dd);
		}
		else
		{
			dl.insertBefore(_b.dd,dt);
		}
		turn(_b);
		mesure();
	
		//是否add的时候打开
		if(o.open)
		{
			_b.onclick();
		}
		return T;
	},
	T.setDisplayTab=function(data)
	{
		tabs[data].onclick();
	},
	T.getDisplayTab=function()
	{
		return displayTabName;
	},
	T.reflash=function(){
	    _tab.dd.getElementsByTagName("iframe")[0].src=_tab.dd.getElementsByTagName("iframe")[0].src;
	},
	T.removeTab=function(){
		var _i;
		Each(tabs,function(t,i){
			if(_tab===t){
				tabs.splice(i,1);
				_i=i;
			}
		});
		dl.removeChild(_tab.dd);
		dt.removeChild(_tab);
		turn(_i);
		mesure();
		if(!document.getElementsByTagName("*"))e.stopPropagation();
		return false;
	},
	T.removeAllTabs=function(){
		Each(tabs,function(o){
	    	dl.removeChild(o.dd);
	    	dt.removeChild(o);
	    });
	  tabs=[];
	},
	T.height=function(_h){
		h=_h;
		resizeH();
		return T;
	},
	T.width=function(_w){
		w=_w;
		dl.style.width=w+"px";
		mesure();
		return T;
	},
	T.ease=function(){
		mesure();
	}

 	var Each=function(arr,fun){
    	for(var i=0,len=arr.length;i<len;i++){fun(arr[i],i)}
	},
	resetDisplay=function(){
		Each(dd,function(o,i){
      		o.style.display="none";
      		b[i].className="";
    	});
	},
	turn=function(o){
    	resetDisplay();
		if(o==null||o=="") o=0;
		if((typeof(o)=="number")||(typeof(o)=="string")){
	  		o=o-0;
	  		if(tabs.length==0) return false;
	  		if(o>=tabs.length){o=tabs.length-1;}
      		else if(o<0-tabs.length){o=0;}
      		else if(o<0){o=tabs.length+o;}
	  		o=tabs[o];
	  		o.onclick();
      	}
		_tab=o;
    	o.className="popcur";
    	o.dd.style.display="";
  	},
  	resizeH=function(){
		Each(dd,function(o){
			o.style.height=h==0?"95%":h+"px";
		});
	},
	isExist=function(src){
		var _x=false;
		Each(tabs,function(o,i){
			if(o.src==src){
				_x=true;
				turn(o);
			}
		});
		return _x;
	},
	mesure=function(){
		return false;//momofiona20091029
		bw=(w-20)/b.length-30;
		if(bw>100) bw = 100;
	    Each(span,function(o){
	    	o.style.width=bw+"px";
	    });
	};
};

/*window.onresize=function()
{
	for(var i=0;i<popTabs.tabList.length;i++){
		popTabs.tabList[i].width(popTabs.tabList[i].ifrmaewidth * document.body.clientWidth - 21).ease();
	}	
}*/