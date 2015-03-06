import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;
ArrayList balls = new ArrayList();
 
//Setup intitializes the canvas area 
void setup()
{
  size(640, 480);
  // always start Minim before you do anything with it
  minim = new Minim(this);
  frameRate( 30 );
  smooth();
  //plays my song with 2048 as buffersize
  song = minim.loadFile("sparks.mp3", 2048);
 
  // senses beats in the songs and plays the fireworks with beats
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(0);
  bl = new BeatListener(beat, song); 
 
 //play music
  song.play();
  noStroke();
}

//draw runs in a loop and keeps drawing throughout the lifetime of the run
void draw()
{
   
  fill( 0, 0, 0, 45 );
  rect(0, 0, width, height);
  // use the mix buffer to draw the waveforms.
  // because these are MONO files, we could have used the left or right buffers and got the same data
  boolean kick = beat.isKick();
  boolean hat = beat.isHat();
  boolean snare = beat.isSnare();
  if( beat.isRange( 5, 15, 2 ) )
  {
    colorMode(HSB);
    color col = color( random(255), 100, random(150,255) );
    // fireworks of different colors but similar saturation and high brightness
    for( int j = 0; j < abs(song.mix.level() * 50); j++ )
    {
      float y = random( height );
      float x = random( width );
      for (int i = 0; i < abs(song.mix.level()*100); i++)
      {
        balls.add( new Ball(x, y, song.mix.get(0)*70, col ));
        // adds various colored balls
      }
    }
  }
  for( int i = 0; i < balls.size(); i++ )
  {
    Ball smallball = (Ball)balls.get(i);
    smallball.update();
    // update method draws the balls with  
    if( !smallball.alive )
    {
      //checks if the ball is alive, if not - we remove it
      balls.remove( smallball );
      i--;
    }
  }
}
 
void stop()
{
  // close Minim audio classes when we dont need them
  song.close();
  minim.stop();
  super.stop();
}
 
