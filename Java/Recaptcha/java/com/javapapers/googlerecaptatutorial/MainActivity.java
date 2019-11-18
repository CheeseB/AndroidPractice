package com.javapapers.googlerecaptatutorial;

import android.content.Intent;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.safetynet.SafetyNet;
import com.google.android.gms.safetynet.SafetyNetApi;


public class MainActivity extends AppCompatActivity  implements GoogleApiClient.ConnectionCallbacks,
        GoogleApiClient.OnConnectionFailedListener {
    Button btnRequest;
    public final String SiteKey = "6Ldf46oUAAAAAE_u1RCOqodPD-Nk_sGglfOVKVX5";
    public final String SiteSecretKey = "6Ldf46oUAAAAALasPt-XeTWsSfxJXDmPhwD8In-P";
    private GoogleApiClient mGoogleApiClient;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        btnRequest= findViewById(R.id.button);
        mGoogleApiClient = new GoogleApiClient.Builder(this)
                .addApi(SafetyNet.API)
                .addConnectionCallbacks(MainActivity.this)
                .addOnConnectionFailedListener(MainActivity.this)
                .build();

        mGoogleApiClient.connect();
    }
   public void onClick(View v){
       SafetyNet.SafetyNetApi.verifyWithRecaptcha(mGoogleApiClient, SiteKey)
                    .setResultCallback(new ResultCallback<SafetyNetApi.RecaptchaTokenResult>() {
                        @Override
                        public void onResult(SafetyNetApi.RecaptchaTokenResult result) {
                            Status status = result.getStatus();
                            if ((status != null) && status.isSuccess()) {
                                Toast.makeText(MainActivity.this, "Verification Successful", Toast.LENGTH_SHORT).show();;
                                Intent i =new Intent(MainActivity.this,MainActivity2.class);
                                startActivity(i);
                            } else {
                                Log.e("MY_APP_TAG", "Error occurred " +
                                        "when communicating with the reCAPTCHA service.");}
                        }
                    });
   };

    @Override
    public void onConnected(@Nullable Bundle bundle) {
        Toast.makeText(this, "onConnected()", Toast.LENGTH_LONG).show();
    }

    @Override
    public void onConnectionSuspended(int i) {
        Toast.makeText(this,
                "onConnectionSuspended: " + i,
                Toast.LENGTH_LONG).show();
    }

    @Override
    public void onConnectionFailed(@NonNull ConnectionResult connectionResult) {
        Toast.makeText(this,
                "onConnectionFailed():\n" + connectionResult.getErrorMessage(),
                Toast.LENGTH_LONG).show();
    }
}
