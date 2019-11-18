package com.cheeseb.jsonpractice2;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;


public class MainActivity extends AppCompatActivity {

    EditText et_key;
    Button btn_to_client;
    TextView tv_parsing;
    ArrayList<String> valueList = new ArrayList<>();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        et_key = findViewById(R.id.et_key);
        btn_to_client = findViewById(R.id.btn_to_client);
        tv_parsing = findViewById(R.id.tv_parsing);

        btn_to_client.setOnClickListener(myClickListener);
    }

    public String loadJSONfromAsset(){
        String json;
        try{
            InputStream is = getAssets().open("manta.json");
            int size = is.available();
            byte[] buffer = new byte[size];
            is.read(buffer);
            is.close();
            json = new String(buffer, "UTF-8");
        }
        catch(IOException e){
            e.printStackTrace();
            return null;
        }
        return json;
    }

    View.OnClickListener myClickListener = new View.OnClickListener() {

        @Override
        public void onClick(View v) {
            valueList.clear();

            if(et_key.getText()!=null) {
                try {
                    JSONArray jsonArray = new JSONArray(loadJSONfromAsset());
                    for (int i = 0; i < jsonArray.length(); i++) {
                        JSONObject jsonObject = jsonArray.getJSONObject(i);
                        valueList.add(jsonObject.getString(et_key.getText() + ""));
                    }
                    tv_parsing.setText(valueList + "");
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }
    };
}
