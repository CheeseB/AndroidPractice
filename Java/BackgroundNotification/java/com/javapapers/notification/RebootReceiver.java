package com.javapapers.notification;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;

public class RebootReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        if(Intent.ACTION_BOOT_COMPLETED.equals(intent.getAction())){

            Intent rebootIntent = new Intent(context, ExampleService.class);

            if(Build.VERSION.SDK_INT >=  Build.VERSION_CODES.O)
            {
                context.startForegroundService(rebootIntent);
            }
        }
    }
}
