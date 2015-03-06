
// Using AudioListener interface and implementing it to detect Beats in the audio
// picked this code from openprocessing 
class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
 
 // constructor
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
 // overloaded the method samples
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
 
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}

