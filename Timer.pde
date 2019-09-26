import java.util.Timer;
import java.util.TimerTask;

import java.lang.reflect.Field;

Timer timer = new Timer();
SendOSCTask task = new SendOSCTask();

void initTimer() {
  timer.scheduleAtFixedRate(task, 0, milliseconds);
}

class SendOSCTask extends TimerTask {
  @Override
    public void run() {
    if (byIndex) {
      sendOSC(2);
    } else if (!byIndex) {
      sendOSC(1);
    }
    println("Do @ " + millis());
  }

  public void setPeriod(long period) {  
    setDeclaredField(TimerTask.class, this, "period", period);
  }  

  boolean setDeclaredField(Class<?> clazz, Object obj, String name, Object value) {  
    try {  
      Field field = clazz.getDeclaredField(name);  
      field.setAccessible(true);  
      field.set(obj, value);  
      return true;
    } 
    catch (Exception ex) {  
      ex.printStackTrace();  
      return false;
    }
  }
}
