package com.cheeseb.fcm;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.util.Log;

import androidx.core.app.NotificationCompat;

import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;


public class FirebaseInstanceIDService extends FirebaseMessagingService {

    private static final String TAG = "MyFirebase";

    /** 새로운 토큰 생성 (앱 재설치 혹은 유효기간 만료 시 자동으로 새로 생성) **/
    @Override
    public void onNewToken(String token) {
        super.onNewToken(token);
        Log.e(TAG , "Refreshed Token : " + token);
    }

    /** 메세지를 받았을 경우 **/
    @Override
    public void onMessageReceived(RemoteMessage remoteMessage) {

        Log.d(TAG, "From: "+remoteMessage.getFrom());

        if (remoteMessage != null && remoteMessage.getData().size() > 0) {
            Log.d(TAG, "Message data payload: "+remoteMessage.getData());
            sendNotification(remoteMessage);

        }

        if(remoteMessage.getNotification() != null){
            Log.d(TAG, "Message Notification Body: "+remoteMessage.getNotification().getBody());
        }
    }

    /** 받은 메세지가 null이 아니고 메세지에 데이터가 있을 경우 **/
    private void sendNotification(RemoteMessage remoteMessage) {

        Intent intent;

        /* 서버에서 보낸 알림으로부터 타이틀과 메세지 데이터를 얻음 */
        String title = remoteMessage.getData().get("title");
        String message = remoteMessage.getData().get("message");

        /* 상단 알림을 터치했을 때 Noti 액티비티가 뜨도록 인텐트 생성 */
        intent = new Intent(this, Noti.class);
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);

        /* Notification을 통해 앱의 특정 동작을 하려면 PendingIntent를 사용해야 함 */
        PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, intent, PendingIntent.FLAG_ONE_SHOT);

        /** 오레오 이상 **/
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {

            String channel = "channel";
            String channel_nm = "channel_name";

            /* Notification 채널 설정 */
            NotificationManager notichannel = (android.app.NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
            NotificationChannel channelMessage = new NotificationChannel(channel, channel_nm,
                    android.app.NotificationManager.IMPORTANCE_DEFAULT);

            channelMessage.setDescription("channel message");
            channelMessage.enableLights(true);
            channelMessage.enableVibration(true);
            channelMessage.setShowBadge(false);
            channelMessage.setVibrationPattern(new long[]{100, 200, 100, 200});
            notichannel.createNotificationChannel(channelMessage);

            /* 상단 알림 설정 */
            NotificationCompat.Builder notificationBuilder =
                    new NotificationCompat.Builder(this, channel)
                            .setSmallIcon(R.drawable.ic_launcher_background)
                            .setContentTitle(title)
                            .setContentText(message)
                            .setContentIntent(pendingIntent) // 알림 클릭 시 인텐트(Noti 액티비티) 실행
                            .setChannelId(channel)
                            .setAutoCancel(true)
                            .setDefaults(Notification.DEFAULT_SOUND | Notification.DEFAULT_VIBRATE);

            NotificationManager notificationManager =
                    (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);

            notificationManager.notify(9999, notificationBuilder.build());

            /** 오레오 미만 **/
        } else {
            /* 상단 알림 설정 */
            NotificationCompat.Builder notificationBuilder =
                    new NotificationCompat.Builder(this, "")
                            .setSmallIcon(R.drawable.ic_launcher_background)
                            .setContentTitle(title)
                            .setContentText(message)
                            .setContentIntent(pendingIntent) // 알림 클릭 시 인텐트(Noti 액티비티) 실행
                            .setAutoCancel(true)
                            .setDefaults(Notification.DEFAULT_SOUND | Notification.DEFAULT_VIBRATE);

            NotificationManager notificationManager =
                    (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);

            notificationManager.notify(9999, notificationBuilder.build());

        }
    }

}
