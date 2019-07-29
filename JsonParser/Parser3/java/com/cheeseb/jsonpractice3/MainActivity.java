package com.cheeseb.jsonpractice3;

import androidx.appcompat.app.AppCompatActivity;

import android.content.ContentValues;
import android.os.AsyncTask;
import android.os.Bundle;
import android.widget.TextView;


public class MainActivity extends AppCompatActivity {

    private TextView tv_parsing;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        tv_parsing = findViewById(R.id.tv_parsing);

        String url = "http://sothecodeapi.cafe24app.com/api/device/cctv/get";

        ContentValues values = new ContentValues();
        values.put("date","2019-07-24");

        NetworkTask networkTask = new NetworkTask(url, values);
        networkTask.execute();

    }

    public class NetworkTask extends AsyncTask<Void, Void, String>{

        private String url;
        private ContentValues values;

        public NetworkTask(String url, ContentValues values){
            this.url = url;
            this.values = values;
        }

        @Override
        protected String doInBackground(Void... params){
            String result;
            RequestHttpURLConnection requestHttpURLConnection = new RequestHttpURLConnection();
            result = requestHttpURLConnection.request(url, values);

            return result;
        }

        @Override
        protected void onPostExecute(String s){
            super.onPostExecute(s);
            tv_parsing.setText(s);
        }

    }

}
