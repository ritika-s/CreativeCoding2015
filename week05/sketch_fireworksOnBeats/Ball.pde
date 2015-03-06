
public class Ball
{
  PVector loc = new PVector(); //location of the ball
  PVector speed = new PVector( random( -2, 2 ), random( -2, 2 ) ); //speed, how fast it bursts 
  color col; //color of the ball
  boolean alive = true; // initially the ball is alive=true, it becomes false once age reaches 255
  int age = 0; // age=0 when ball is born, update keeps updating the ball by 5
 
   // constructor for Ball class
  public Ball( float x, float y, float mag, color col )
  {
    loc.x = x;
    loc.y = y;
    speed.normalize();
    speed.mult( mag );
    this.col = col;
  }
   // updates ball age, speed, life, alpha and draws it
  public void update()
  {
    age += 5;
    speed.y += .1;
    loc.add( speed );
    if( loc.y > height || age >= 255 )
      alive = false;
      // initially the ball is alive=true, it becomes false once age reaches 255
      
    fill( red(col), blue(col), green(col), 255 - age );
    // color remains same, hence same rgb but alpha of a ball fades as age increases.
    ellipse( loc.x, loc.y, 3, 3 );
  }
}
 
