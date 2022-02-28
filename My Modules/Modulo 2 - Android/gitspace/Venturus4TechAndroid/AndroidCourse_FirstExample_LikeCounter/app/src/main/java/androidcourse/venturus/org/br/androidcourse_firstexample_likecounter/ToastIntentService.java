package androidcourse.venturus.org.br.androidcourse_firstexample_likecounter;

import android.annotation.TargetApi;
import android.app.IntentService;
import android.app.NotificationManager;
import android.content.Intent;
import static android.os.SystemClock.*;
import android.os.Build;
import android.support.v4.app.NotificationCompat;
import android.app.Notification;

public class ToastIntentService extends IntentService{


    public ToastIntentService() {
        super("WorkerThread");
    }

    @Override
    protected void onHandleIntent(Intent workIntent){

        showNotification("estou aqui");

        sleep(1000);

        showNotification("estou aqui222");

        sleep(1000);

        showNotification("estou aqui3333");
    }


    @TargetApi(Build.VERSION_CODES.JELLY_BEAN)
    private void showNotification(String eventtext) {
        NotificationManager notificationManager = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);

        NotificationCompat.Builder BUILDER = new NotificationCompat.Builder(this)
                .setSmallIcon(R.mipmap.ic_launcher)
                .setContentTitle("My Notification Title")
                .setContentText(eventtext);

        Notification NOTIFICATION = BUILDER.build();

        notificationManager.notify(1, NOTIFICATION);
        sleep(1000);
    }
}
