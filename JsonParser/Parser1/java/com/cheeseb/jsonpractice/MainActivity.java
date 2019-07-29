package com.cheeseb.jsonpractice;

import androidx.appcompat.app.AppCompatActivity;
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

    EditText et_name;
    EditText et_gender;
    Button btn_to_server;
    Button btn_to_client;
    TextView tv_json;
    TextView tv_parsing;
    StringBuffer sb = new StringBuffer();
    ArrayList<String> nameList = new ArrayList<>();
    ArrayList<String> genderList = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        et_name = findViewById(R.id.et_name);
        et_gender = findViewById(R.id.et_gender);
        btn_to_server = findViewById(R.id.btn_to_server);
        btn_to_client = findViewById(R.id.btn_to_client);
        tv_json = findViewById(R.id.tv_json);
        tv_parsing = findViewById(R.id.tv_parsing);

        btn_to_server.setOnClickListener(myClickListener);
        btn_to_client.setOnClickListener(myClickListener);
    }

    View.OnClickListener myClickListener = new View.OnClickListener() {

        @Override
        public void onClick(View v) {

            switch (v.getId()){
                case R.id.btn_to_server:
                    String startJson = "[";
                    String endJson = "]";

                    if(!sb.toString().equals("")){
                        sb.append(",");
                    }

                    String temp = "{\"name\""+":"+"\""+et_name.getText().toString()+"\""+ ","
                            + "\"gender\""+":" + "\"" + et_gender.getText().toString() + "\"" + "}";
                    sb.append(temp);
                    tv_json.setText(startJson+sb+endJson);
                    break;

                case R.id.btn_to_client:
                    try{
                        JSONArray jsonArray = new JSONArray(tv_json.getText().toString());
                        for(int i = 0; i < jsonArray.length(); i++){
                            JSONObject jsonObject = jsonArray.getJSONObject(i);
                            nameList.add(jsonObject.getString("name"));
                            genderList.add(jsonObject.getString("gender"));
                        }
                        tv_parsing.setText(""+nameList+"\n"+""+genderList);
                    }
                    catch (JSONException e){
                        e.printStackTrace();
                    }
                    break;
            }
        }
    };

}
