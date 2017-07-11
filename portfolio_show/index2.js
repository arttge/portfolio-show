/*
 * twisted lines
 *
 * @author aadebdeb
 * @date 2017/02/04
 */

var colors;
var type;

function setup() {
  createCanvas(788, 400);
  
  colors = [
    color(255, 0, 0),
    color(0, 255, 0),
    color(0, 0, 255)
  ];
  
  type = 0;
}

function draw() {
  blendMode(BLEND);
  
  if(type == 0) {
    background(244);
    blendMode(EXCLUSION);
  } else {
    background(0);
    blendMode(SCREEN);
  }
  noFill();
  strokeWeight(3);
  for(var i = 0; i < 3; i++) {
    stroke(colors[i]);
    beginShape();
    for(var w = -20; w < width + 20; w += 5) {
      var h = 100;
      h += 60 * sin(w * 0.03 + frameCount * 0.07 + i * TWO_PI / 3) * pow(abs(sin(w * 0.001 + frameCount * 0.02)), 5);
      curveVertex(w, h);
    }    
    endShape();
  }
  
}

