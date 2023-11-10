// Function that generates the random movement and speed of the flies on the screen.

void fly_move(){
   x += random(15)*x_dir;
   y += random(15)*y_dir;
  
  // Create the boundaries for the edges of the canvas for the fly to avoid, then draw new fly
  if(x >= width - 40) {
    x -= 1.2*random(10);
    x_dir = -.1;
  }else if(x <= width - width + 10){
    x += 1.2*random(10);
    x_dir = .1;
  }
  if(y >= height - 40){
    y -= 1.2*random(10);
    y_dir = -.1;
  }else if(y <= height - height + 10){
    y += 1.2*random(10);
    y_dir = .1;
  }
    image(fly, x, y, 70, 70);
}
