(function($) {
    var defaults={
                  drawLineColor:"red",
    			  alpha:1,
    			  stroke:2,
    			  clickEvent:null 
    			  
    			  }; 
    
   var  popupcontent=  
			{  
			position: "absolute", 
			border:"1px solid #CCC",     
			backgroundColor:"#F9F9F9",     
			border:"1px solid #333",     
			padding:"5px"  
			};  
    $.fn.drawLine=function(options){
        options = $.extend({}, defaults , options);
		 
        var _hotImg=$(this);
        var left=Number(_hotImg.offset().left); 
	    var top=Number(_hotImg.offset().top); 
	    var xValues=[],yValues=[],xcoords = [],ycoords = [];
	    var id=new Date().getTime();
       _hotImg.click(function(e){
		     var x = e.pageX;
			 var y = e.pageY;
			// alert("x:"+x+",y:"+y);
			 xValues.push(x);
			 yValues.push(y);
			 xcoords.push(Number(x)-left);
			 ycoords.push(Number(y)-top);
			 $("<div id='"+id+"'></div>").appendTo(document.body).drawPolyline( xValues, yValues, 
			 { color:options.drawLineColor, alpha:options.alpha, stroke: options.stroke });
			_hotImg.attr("xcoords",xcoords.join(",")).attr("ycoords",ycoords.join(","));
			 
	   });
    }
     
	$.fn.addHot=function(options){
	    options = $.extend({}, defaults , options);
	    var _hotImg=$(this);
	    var drawtitle=_hotImg.attr("drawtitle");
        var left=Number(_hotImg.offset().left); 
	    var top=Number(_hotImg.offset().top); 
		var xcoords= _hotImg.attr("xcoords");
	    var ycoords= _hotImg.attr("ycoords");
	    var usemap= _hotImg.attr("usemap");
	    if(!xcoords || xcoords=='')return ;
	    xcoords=xcoords.split("_");
	    ycoords=ycoords.split("_");
	    var title =[];
	   if(drawtitle!='')
          title = drawtitle.split("_");
	    var id="#"+new Date().getTime();
        if(!usemap){
            $("<map id =\""+id.substring(1)+"\" name=\""+id.substring(1)+"\"> </map>").appendTo(document.body);
            _hotImg.attr("usemap",id);
           }else {
              id=usemap;
           } 
	    for(var j=0;j<xcoords.length;j++){
	    	xcoordsII=xcoords[j].split(",");
	    	ycoordsII=ycoords[j].split(",");
	    	var fillXvals=[],fillYvals=[];
		    var hotPoints=[];
	        for(var i=0;i < xcoordsII.length;i++){
	           hotPoints.push(xcoordsII[i]);
	           hotPoints.push(ycoordsII[i]);
	           fillXvals.push(Number(xcoordsII[i])+left);
	           fillYvals.push(Number(ycoordsII[i])+top);
	           // <map id ="planetmap" name="planetmap"> </map>
	        }
             $(id).append("<area shape=\"poly\" stitle='"+title[j]+"' drawId='"+id.substring(1)+"_"+j+"'  coords=\""+hotPoints.join(",")+"\">");
             $("<div id='"+id.substring(1)+"_"+j+"' stitle='"+(title[j]?title[j]:"")+"' >").appendTo(document.body).fillPolygon(fillXvals,fillYvals, { color: "green", alpha: 0.5, stroke: 1 }); 
	         $(id+"_"+j).css("cursor","pointer").bind("mouseover",function(e){ 
	            $(this).show();
	             // alert(drawtitle+j);
	             var stitle= $(this).attr("stitle");
                 if(stitle && stitle!=''){
                    var x = e.pageX;
			        var y = e.pageY;
			        var _div=$("#top_popupcontent");
			        if(!_div.get(0))
			           _div= $("<div id='top_popupcontent'></div>").appendTo(document.body);
			        //jQ(this).css("cursor","pointer");
			        _div.css(popupcontent).css({top:y-25,left:x+15}).html(stitle).show();
                 }
	         }).bind("mouseout",function(e){
	            $(this).hide();//find("div").css("opacity",0);
	            $("#top_popupcontent").hide();
	         }).bind("click",function(e){
	             var that=this;
		         if(options.clickEvent)
		              options.clickEvent(e,that);
		         }).hide();
	    
	    }
	    $(id).find("area").bind("mousemove",function(e){
	        $(this).css("cursor","pointer");
	        var drawId=$(this).attr("drawId");
	        $("#"+drawId).show();
	    }).bind("mousemove",function(e){
	    });
	   
	    
        
	}
})(jQuery);