int distance = 150;
int screenSize = 456;
int numberOfNodes = 24;
float maxSpeed = 0.6;
Node[] nodes = new Node[numberOfNodes];
PImage photos;

String[] tags = {
"Interaction Design",
"User Experience Design",
"Product Design",
"Game Design",
"Design Thinking",
"Prototyping",
"iOS Development",
"Swift",
"Arduino",
"Processing",
"Unity",
"HTML/CSS/Javascript",
"Algorithmic Design",
"TEDxZJUT",
"Critical Design",
"Social Innovation",
"Sustainable Design",
"Gamification",
"Machine Learning",
"Artificial Intelligence",
"Dancer",
"Bboy",
"Electronic Music",
"Interactive Installation",
};

var density = window.devicePixelRatio;

void setup() {
size(768*2,456*2);



smooth();
photo = loadImage("tagBackground2@2x.png");

for (int i = 0; i < nodes.length; i ++) {
nodes[i] = new Node(random(100,668), random(50,406), random(maxSpeed), random(-0.5,0.5), random(-0.5,0.5 ));
nodes[i].tag = tags[i];
if (i<6) nodes[i].color = 0;
else if (i<13) nodes[i].color = 1;
else if (i<20) nodes[i].color = 2;
else nodes[i].color = 3;

}
}

void draw() {

scale(2);

background(255, 204, 0);
image(photo,0,0,768,456);

for (int i = 0; i < nodes.length; i ++ ) {
nodes[i].move();
nodes[i].display();
}
}


class Node {
float xpos;
float ypos;
float speed;
float rise;
float run;
int color;
String tag;

Node(float xpos_, float ypos_, float speed_, float rise_, float run_) {
xpos = xpos_;
ypos = ypos_;
speed = speed_;
run = run_;
rise = rise_;

}

void display() {
noStroke();

fill(0,0,0,200);

textSize = 16;
text(tag,xpos + 10,ypos - 5,150,16);

if (color == 0)  fill(#ffff00);
else if (color == 1) fill(#ff00ff);
else if (color == 2) fill(#00ffff);
else fill(#FFA100);

ellipse(xpos, ypos, 10, 10);
for (int i = 0; i < nodes.length; i ++) {
if (abs(xpos - nodes[i].xpos) < distance && abs(ypos - nodes[i].ypos) < distance) {
float strokeWeight = (abs(xpos - nodes[i].xpos) + abs(ypos - nodes[i].ypos)) / 2;
stroke(100, distance - strokeWeight);
line(xpos, ypos, nodes[i].xpos, nodes[i].ypos);
}
}
}

void move() {
xpos = xpos + (speed * run);
ypos = ypos + (speed * rise);
if (xpos > 768) {
xpos = 0;
} else if (ypos > 456) {
ypos = 0;
} else if (xpos < 0) {
xpos = 768;
} else if (ypos < 0) {
ypos = 456;
}

}
}
