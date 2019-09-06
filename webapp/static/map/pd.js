//var map = new BMap.Map("allmap");
//map.centerAndZoom(new BMap.Point(116.404, 39.915), 15);
var bounds = null;
var linesPoints = null;
var spoi1 = new BMap.Point(116.380967,39.913285);    // 起点1
var spoi2 = new BMap.Point(116.380967,39.953285);    // 起点2
var epoi  = new BMap.Point(116.424374,39.914668);    // 终点
var myIcon = new BMap.Icon("/akl-min/static/img/05231_7.png", new BMap.Size(32, 70), {imageOffset: new BMap.Size(0, 0)});
 var ps=[{start:"无锡桑达园",end:"无锡东亭"},{start:"无锡东亭",end:"无锡赛维拉商业广场"}
 ,{start:"无锡赛维拉商业广场",end:"无锡市市民公园"},{start:"无锡市市民公园",end:"无锡市第二人民医院"}];
 var plength=1;
  
function initLine(){
	plength=1;
    bounds = new Array();
    linesPoints = new Array();
    linesPointArray= new Array();
    map.clearOverlays();  
    var rouCount=0;
    //for(var i=0;i<ps.length;i++){                                                  // 清空覆盖物
        var driving3 = new BMap.DrivingRoute(map,{onSearchComplete:function(res){
        
           drawLineII(res);
           rouCount++;
           if(rouCount<ps.length){
            driving3.search(ps[rouCount].start, ps[rouCount].end); 
           }
           
        }});  // 驾车实例,并设置回调
        driving3.search(ps[rouCount].start, ps[rouCount].end); 
         
      //  }                                      // 搜索一条线路
 //   var driving4 = new BMap.DrivingRoute(map,{onSearchComplete:drawLine});  // 驾车实例,并设置回调
      //  driving4.search(spoi2, epoi);                                       // 搜索一条线路
}
var runf=0;
var pause=false;
var carMk;
function run(){//alert(linesPoints.length);
       //换种方式，把所有起始点合并
       {
       
        var pts = linesPointArray;
        var len = pts.length;
        carMk = new BMap.Marker(pts[0],{icon:myIcon});
        map.addOverlay(carMk);
        resetMkPoint(1,len,pts,carMk);
       
       
       return ;
       }



        if(runf==linesPoints.length)return ;
   // for(var m = 0;m< runf && m < linesPoints.length; m++){
        if(carMk)
        	map.removeOverlay(carMk);
        var pts = linesPoints[runf];
        var len = pts.length;
        carMk = new BMap.Marker(pts[0],{icon:myIcon});
        map.addOverlay(carMk);
        resetMkPoint(1,len,pts,carMk)
   // }
    
    function resetMkPoint(i,len,pts,carMk){
    
        if(pause ){
           return ;
        }
        carMk.setPosition(pts[i]);
        if(i < len){
            setTimeout(function(){
                i++;
                resetMkPoint(i,len,pts,carMk);
            },100);
        }else {
        //多起始节点一个接一个时用
            //runf++;
        	//run();
        }
    }
    
}
var startflg=false;
function drawLineII(results){
    var opacity = 0.45;
    var planObj = results.getPlan(0);
    var b = new Array();
    var addMarkerFun = function(point,imgType,index,title){
        var url;
        var width;
        var height
        var myIcon;
        // imgType:1的场合，为起点和终点的图；2的场合为车的图形
        if(imgType == 1){
            url = "/akl-min/static/img/dest_markers.png";
            width = 42;
            height = 34;
           // if(!startflg)
              // myIcon = new BMap.Icon(url,new BMap.Size(width, height),{offset: new BMap.Size(14, 32),imageOffset: new BMap.Size(0, 0 - index * height)});
            //startflg=true;
        }else{
            url = "/akl-min/static/img/trans_icons.png";
            width = 22;
            height = 25;
            var d = 25;
            var cha = 0;
            var jia = 0
            if(index == 2){
                d = 21;
                cha = 5;
                jia = 1;
            }
           // myIcon = new BMap.Icon(url,new BMap.Size(width, d),{offset: new BMap.Size(10, (11 + jia)),imageOffset: new BMap.Size(0, 0 - index * height - cha)});
        }
        
        var marker = new BMap.Marker(point, {icon: myIcon});
        if(title != null && title != ""){
            marker.setTitle(title);
        }
        // 起点和终点放在最上面
        if(imgType == 1){
            marker.setTop(true);
        }
       // map.addOverlay(marker);
    }
    var addPoints = function(points){
        for(var i = 0; i < points.length; i++){
            bounds.push(points[i]);
            b.push(points[i]);
            linesPointArray.push(points[i]);
        }
    }
    
    // 绘制驾车步行线路
    for (var i = 0; i < planObj.getNumRoutes(); i ++){
        var route = planObj.getRoute(i);
        if (route.getDistance(false) <= 0){continue;}
        addPoints(route.getPath());
        // 驾车线路
        if(route.getRouteType() == BMAP_ROUTE_TYPE_DRIVING){
            map.addOverlay(new BMap.Polyline(route.getPath(), {strokeColor: "#0030ff",strokeOpacity:opacity,strokeWeight:6,enableMassClear:true}));
        }else{
        // 步行线路有可能为0
            map.addOverlay(new BMap.Polyline(route.getPath(), {strokeColor: "#30a208",strokeOpacity:0.75,strokeWeight:4,enableMassClear:true}));
        }
    }
    
    map.setViewport(bounds);
    
    // 终点
    addMarkerFun(results.getEnd().point,1,1);
    // 开始点
    addMarkerFun(results.getStart().point,1,0);
    linesPoints[linesPoints.length] = b;
    plength++;
    if(plength==ps.length){//走动
   		setTimeout(function(){
   		  //runf=0;
		  //run();
		},1000);
    }
}
var linesPointArray=[];
function startRun(){
   if(pause){
      //run();
     // return ;
   }
   runf=0;
   pause=false;
   run();
}
function pauseRun(){
 pause=true;
}
setTimeout(function(){
 //   run();
},3000);
