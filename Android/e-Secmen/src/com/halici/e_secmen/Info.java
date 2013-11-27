package com.halici.e_secmen;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class Info extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		setContentView(R.layout.info_layout);
		
		TextView tvTwitter=(TextView)findViewById(R.id.tvTwitter);
		TextView tvFacebook=(TextView)findViewById(R.id.tvFacebook);
		
		tvTwitter.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				try {
					Intent intent = new Intent(Intent.ACTION_VIEW,
					    Uri.parse("twitter://user?screen_name=emrehanhalici"));
					startActivity(intent);

					}catch (Exception e) {
					    startActivity(new Intent(Intent.ACTION_VIEW,
					         Uri.parse("https://twitter.com/#!/emrehanhalici"))); 
					} 
				
			}
		});
		
		tvFacebook.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				
				try {
					Intent intent = new Intent(Intent.ACTION_VIEW,
					    Uri.parse("fb://profile/788029844"));
//					Intent intent = new Intent(Intent.ACTION_VIEW);
//					intent.setClassName("com.facebook.katana", "com.facebook.katana.ProfileTabHostActivity");
//				    intent.putExtra("extra_user_id", 788029844);
					
					
					startActivity(intent);

					}catch (Exception e) {
					    startActivity(new Intent(Intent.ACTION_VIEW,
					         Uri.parse("https://www.facebook.com/emrehan.halici"))); 
					} 
				
			}
		});
	}
}
