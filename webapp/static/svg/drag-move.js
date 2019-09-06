 var DragMove = function (params,draw,did,image) {
    this.draw=draw;  
    this.container= $("#"+did);
    var self=this;
    this.defaultWidth = params.defaultWidth;
    this.defaultHeight = params.defaultHeight;
    this.width = params.width ;//image.attr("width");
    this.height = params.height;//image.attr("height");
     this.container.mousewheel(function(event, delta, deltaX, deltaY) {  
  // alert(deltaY);
      if(deltaY>0)
      self.zoomStep=self.zoomStep+0.1;
      else 
      self.zoomStep=self.zoomStep-0.1;
      self.scale=1+self.zoomStep;
      if(self.scale<0.2){return ;self.scale=0.2;self.zoomStep=0.1;}
    //  alert(self.scale);
      //draw.attr('transform', "scale("+scale+") translate(0,0)");  
     self.applyTransform();
});  
    
    }
   DragMove.prototype = {
    transX: 0,
    transY: 0,
    scale:1.1,
    baseTransX: 0,
    baseTransY: 0,
    baseScale: 1,
    width: 0,
    height: 0,
    
    countries: {},
    countriesColors: {},
    countriesData: {},
    zoomStep: 0.1,
    zoomMaxStep: 4,
    zoomCurStep: 1,
    makeDraggable: function () {
      var mouseDown = false;
      var oldPageX, oldPageY;
      var self = this;

      self.isMoving = false;
      self.isMovingTimeout = false;

      this.container.mousemove(function (e) {

        if (mouseDown) {
          var curTransX = self.transX;
          var curTransY = self.transY;

          self.transX -= (oldPageX - e.pageX) / self.scale;
          self.transY -= (oldPageY - e.pageY) / self.scale;

          self.applyTransform();

          oldPageX = e.pageX;
          oldPageY = e.pageY;

          self.isMoving = true;
          if (self.isMovingTimeout) {
            clearTimeout(self.isMovingTimeout);
          }

          self.container.trigger('drag');
        }

        return false;

      }).mousedown(function (e) {

        mouseDown = true;
        oldPageX = e.pageX;
        oldPageY = e.pageY;

        return false;

      }).mouseup(function () {

        mouseDown = false;

        self.isMovingTimeout = setTimeout(function () {
          self.isMoving = false;
        }, 100);

        return false;

      });
      self.applyTransform();
    },
    applyTransform: function () { 
      var maxTransX, maxTransY, minTransX, minTransY;
      if (this.defaultWidth * this.scale <= this.width) {
        maxTransX = (this.width - this.defaultWidth * this.scale) / (2 * this.scale);
        minTransX = (this.width - this.defaultWidth * this.scale) / (2 * this.scale);
      } else {
        maxTransX = 0;
        minTransX = (this.width - this.defaultWidth * this.scale) / this.scale;
      }
      if (this.defaultHeight * this.scale <= this.height) {
        maxTransY = (this.height - this.defaultHeight * this.scale) / (2 * this.scale);
        minTransY = (this.height - this.defaultHeight * this.scale) / (2 * this.scale);
      } else {
        maxTransY = 0;
        minTransY = (this.height - this.defaultHeight * this.scale) / this.scale;
      }

      if (this.transY > maxTransY) {
        this.transY = maxTransY;
      }
      else if (this.transY < minTransY) {
        this.transY = minTransY;
      }
      if (this.transX > maxTransX) {
        this.transX = maxTransX;
      }
      else if (this.transX < minTransX) {
        this.transX = minTransX;
      }
     // alert("scale("+this.scale+") translate("+this.transX+","+this.transY+")");
     this.draw.attr('transform', "scale("+this.scale+") translate("+this.transX+","+this.transY+")");  
    }, 
    
    }