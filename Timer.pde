import java.util.Timer;
import java.util.TimerTask;

import java.lang.reflect.Field;

// Timer
private Timer timer = new Timer();
private SendOSCTask task = new SendOSCTask();

private void initTimer() {
  timer.scheduleAtFixedRate(task, 0, milliseconds);
}

class SendOSCTask extends TimerTask {
  @Override
    public void run() {
    if (byIndex) {
      sendOSC(2);
    } else {
      sendOSC(1);
    }
  }

  void setPeriod(long period) {
    setDeclaredField(this, period);
  }

  void setDeclaredField(Object obj, Object value) {
    try {
      Field field = TimerTask.class.getDeclaredField("period");
      field.setAccessible(true);
      field.set(obj, value);
    }
    catch (Exception ex) {
      ex.printStackTrace();
    }
  }
}
