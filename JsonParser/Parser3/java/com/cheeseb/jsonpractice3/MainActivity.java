package com.cheeseb.jsonpractice3;

import androidx.appcompat.app.AppCompatActivity;

import android.content.ContentValues;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;


public class MainActivity extends AppCompatActivity {

    private EditText et_key;
    private Button btn_to_client;
    private TextView tv_parsing;
    private ArrayList<String> valueList = new ArrayList<>();
    private String json;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        et_key = findViewById(R.id.et_key);
        btn_to_client = findViewById(R.id.btn_to_client);
        tv_parsing = findViewById(R.id.tv_parsing);

        btn_to_client.setOnClickListener(myClickListener);

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
            json = s;
        }

    }

    View.OnClickListener myClickListener = new View.OnClickListener() {

        @Override
        public void onClick(View v) {
            valueList.clear();

            if(et_key.getText()!=null) {
                try {
                    JSONObject jsonObject = new JSONObject(json);
                    String list = jsonObject.getString("list");
                    JSONArray jsonArray = new JSONArray(list);
                    for (int i = 0; i < jsonArray.length(); i++) {
                        JSONObject subjsonObject = jsonArray.getJSONObject(i);
                        valueList.add(subjsonObject.getString(et_key.getText() + ""));
                    }
                    tv_parsing.setText(valueList + "");
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }
    };

}
