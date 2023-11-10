/* Function for collision detection of the mouse clicked and the fly x,y coordinates
   Plays the swatted sound, and switches the cursor from swatter to swatted, then 
   updates the fly _counter and fly_alive variable values*/
void mouseClicked(){
  smack.play();
  cursor_switch = true;
  if(dist(mouseX, mouseY,x ,y ) < 65){
    splat_x = x;
    splat_y = y;
    splat_calc();
    fly_counter += 1;
    fly_alive = false;
    
    //Reset the new fly to random x,y coordinates and play new fly spawn sound
    x += random(400) * (y_dir * random(65));
    y += random(400) * (x_dir * random(65));
    y_dir = -1.2;
    x_dir = -1.2; 
    if (fly_counter < 10){
      fly_buzz.play();
    }
  }
}
