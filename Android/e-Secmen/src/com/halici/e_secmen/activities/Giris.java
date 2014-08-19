package com.halici.e_secmen.activities;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.halici.e_secmen.R;
import com.halici.e_secmen.model.BaglantiKontrolu;
import com.halici.e_secmen.model.Crypto;
import com.halici.e_secmen.model.Sorgulama;

import org.json.JSONException;
import org.json.JSONObject;

public class Giris extends Activity {

	EditText eTuserName;
	EditText eTpassword;
	Button btnSign;
	SharedPreferences shPreferences;
	SharedPreferences.Editor shPrefEditor;
	
	private static final String NAME="name";
	private static final String PASSWORD="password";
	private static final String SEED="secure";
	private static final String IS_BEFORE_STARTED="isBeforeStarted";
	
	private boolean loginDurumu;
	private String tckn;
	
	private String userName;
	private String password;
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		setContentView(R.layout.giris);
		
		eTuserName=(EditText)findViewById(R.id.editKullaniciAdi);
		eTpassword=(EditText)findViewById(R.id.editSifre);
		btnSign=(Button)findViewById(R.id.btnGiris);
		shPreferences=getSharedPreferences("data", MODE_PRIVATE);


		boolean isBeforeStarted= shPreferences.getBoolean(IS_BEFORE_STARTED, false);
		if(!isBeforeStarted){
			shPreferences.edit().putBoolean(IS_BEFORE_STARTED, true);
			AlertDialog.Builder alertDialog = new AlertDialog.Builder(this);
			 
	        // Setting Dialog Title
	        alertDialog.setTitle("Bilgilendirme");
	 
	        // Setting Dialog Message
	        alertDialog.setMessage("Yüksek Seçim Kurulu’nun verdiği karar uyarınca uygulama parti görevlileri dışında kullanıma kapatılmıştır!");
	 
	        // Setting Icon to Dialog
//	        alertDialog.setIcon(R.drawable.delete);

	        alertDialog.setPositiveButton("Tamam", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    dialog.cancel();
                }
            });

	        //alertDialog.show();
			
		}
		getSavedData();
		
		
		btnSign.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				girisYap();
				
			}
		});
		
		
		
	}
	
	
	private void saveData(String name, String pass){
		
		shPrefEditor=shPreferences.edit();
		
		
		try{
			String nameToSave=Crypto.encrypt(SEED, name);
			String passwordToSave=Crypto.encrypt(SEED, pass);
			
			shPrefEditor.putString(NAME, nameToSave).commit();
			shPrefEditor.putString(PASSWORD, passwordToSave).commit();
		}
		catch(Exception e){
			System.out.println("Saved Data Decrypt: "+e);
		}
		
	}
	
	private void getSavedData(){
		try{
		
		String savedName= Crypto.decrypt(SEED, shPreferences.getString(NAME, ""));
		String savedPassword=Crypto.decrypt(SEED, shPreferences.getString(PASSWORD, ""));
		
		eTuserName.setText(savedName);
		eTpassword.setText(savedPassword);
		
//		System.out.println("Datas was become: "+savedName+", "+shPreferences.getString(NAME, ""));
		}
		catch(Exception e){
			System.out.println("getSavedData Error "+e);
		}
	}
	
	
	public void girisYap(){
		
		this.userName=eTuserName.getText().toString().trim();
		this.password=eTpassword.getText().toString().trim();
		
		if(this.userName.startsWith("0")){
			this.userName=this.userName.substring(1, this.userName.length());
			System.out.println("userName: "+this.userName);
		}
		
		if(this.userName.length()<10){
			Toast.makeText(getApplicationContext(), "Lütfen 10 haneli telefon numaranızı ya da 11 haneli kimlik numaranızı giriniz.",  Toast.LENGTH_LONG).show();
			return;
		}
		else if(this.password.length()==0){
			Toast.makeText(getApplicationContext(), "Lütfen baba adınızı giriniz.",  Toast.LENGTH_LONG).show();
			return;
		}
		
		boolean baglanti=new BaglantiKontrolu(Giris.this).kontrolEt();
		
		if(baglanti==true) {
			//new Servis().execute(userName,password);
			function1();
			
		}
		else if(baglanti==false){
			Toast.makeText(getApplicationContext(), "İnternet bağlantınız ile ilgili bir sorun var; lütfen kontrol ediniz.",  Toast.LENGTH_LONG).show();
		}
		
		/*
		try{
			String nameToSave=Crypto.encrypt(SEED, eTuserName.getText().toString().trim());
			String passwordToSave=Crypto.encrypt(SEED, eTpassword.getText().toString().trim());
		
			saveData(nameToSave, passwordToSave);
		}
		catch(Exception e){
			Toast.makeText(getApplicationContext(), "Hata oluştu; lütfen bilgileriniz tekrar giriniz.", Toast.LENGTH_LONG).show();
		}
		*/
	}
	
	public class Servis extends AsyncTask<String, Void, String>{
		private ProgressDialog dialog = new ProgressDialog(Giris.this);
		 EditText editSorgu=(EditText) findViewById(R.id.editSorgu);
		@Override
		protected String doInBackground(String... params) {
			//Sorgulama sorgu=new Sorgulama(params[0],params[1]);
			//String sonuc=sorgu.sifreGonder();
			String sonuc = "";
			
			System.out.println("Sonuclar sonuc: "+sonuc);
			return sonuc;
		}

		@Override
		protected void onPostExecute(String sonuc) {
            Log.i("!!!", sonuc);
			dialog.dismiss();
			
			try {
				JSONObject json= new JSONObject(sonuc);
				tckn= String.valueOf(json.getLong("TCKN"));
				loginDurumu=json.getBoolean("LoginDurumu");
				
				if (loginDurumu){
					saveData(userName, password);
					Intent intent=new Intent(Giris.this, Sorgu.class);
					intent.putExtra("userName", userName);
					intent.putExtra("tckn", tckn);
					intent.putExtra("sifre", password);
					
//					System.out.println("******"+userName+", "+tckn+", "+password);
					
					startActivity(intent);
					
				}
				else if(!loginDurumu)
					Toast.makeText(getApplicationContext(), "Girdiğiniz bilgilerde hata var; lütfen kontrol ediniz.",  Toast.LENGTH_LONG).show();
				else
					Toast.makeText(getApplicationContext(), "Sistemde bir hata oluştu lütfen daha sonra tekrar deneyiniz.",  Toast.LENGTH_LONG).show();
				
			} catch (JSONException e) {
				Toast.makeText(getApplicationContext(), "Sistemde bir hata oluştu lütfen daha sonra tekrar deneyiniz.",  Toast.LENGTH_LONG).show();
				e.printStackTrace();
			}
		
		}

		@Override
		protected void onPreExecute() {
			 //dialog=ProgressDialog.show(SecmenKunye.this, "Baslik", "Mesaj-Calculating",true);
			
			dialog.setMessage("Lütfen bekleyiniz; Giriş yapılıyor.");
			dialog.show();
		}

		@Override
		protected void onProgressUpdate(Void... values) {
			
		}
	}

	private void function1() {
		saveData(userName, password);
		Intent intent=new Intent(Giris.this, Sorgu.class);
		intent.putExtra("userName", userName);
		intent.putExtra("tckn", tckn);
		intent.putExtra("sifre", password);
		
//		System.out.println("******"+userName+", "+tckn+", "+password);
		
		startActivity(intent);
	}
	
	
	@Override
	public void onBackPressed() {
		super.onBackPressed();
		moveTaskToBack(true);
	}
	
}
