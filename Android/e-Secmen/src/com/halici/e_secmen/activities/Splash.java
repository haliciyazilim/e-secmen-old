package com.halici.e_secmen.activities;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import com.halici.e_secmen.R;

public class Splash extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.splash);
        new Thread() {
            public void run() {
                try{

                    sleep(1500);
                } catch (Exception e) {
                }

                Intent sorguyaGec=new Intent(Splash.this, Sorgu.class);
                startActivity(sorguyaGec);
            }
        }.start();
	}

    @Override
    protected void onRestart() {
        super.onRestart();

        Intent sorguyaGec=new Intent(Splash.this, Sorgu.class);
        startActivity(sorguyaGec);
    }
}