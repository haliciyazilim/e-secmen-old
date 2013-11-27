package com.halici.e_secmen;



import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONException;
import org.json.JSONObject;

import com.halici.e_secmen.siniflar.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.InputFilter;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class Sorgu extends Activity {
	public String secimYili, eskiListe, isim, muhtarlik, sandikAlani, sandikNumarasi, sandikSirasi, listeBilgisi;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.sorgu);
		
		final EditText editSorgu=(EditText) findViewById(R.id.editSorgu);
		InputFilter[] FilterArray = new InputFilter[1];
		FilterArray[0] = new InputFilter.LengthFilter(11);
		editSorgu.setFilters(FilterArray);
		
		final EditText editBabaAdi=(EditText)findViewById(R.id.editBabaAdi);
		
		
		Button btnSorgu=(Button) findViewById(R.id.btnSorgula);
        
        btnSorgu.setOnClickListener(new View.OnClickListener() {
			
			public void onClick(View v) {
				if(editSorgu.getText().length()==0){
					kimlikNoYokUyarisi();
					
				}
				else if(editSorgu.getText().length()!=11){
					kimlikNoHaneUyarisi();
					editSorgu.setText("");
				}
				else if(editBabaAdi.getText().length()==0){
					babaAdiUyarisi();
				}
				else{
					
					String tckn=editSorgu.getText().toString();
					String babaAdi=editBabaAdi.getText().toString();
					boolean baglanti=new BaglantiKontrolu(Sorgu.this).kontrolEt();
					
					if(baglanti==true){
						new Servis().execute(tckn,babaAdi);
					}
					else if(baglanti==false){
						Toast.makeText(getApplicationContext(), "İnternet bağlantınız ile ilgili bir sorun var; lütfen kontrol ediniz.",  Toast.LENGTH_LONG).show();
					}	
				}
			}
		});
        
        Button infoButton=(Button)findViewById(R.id.infoSorgula);
        
        infoButton.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Intent intent= new Intent(Sorgu.this, Info.class);
				startActivity(intent);
				
			}
		});
	}
	
	public void kimlikNoHaneUyarisi(){
    	Toast.makeText(getApplicationContext(), "Kimlik numaranızı 11 hane olarak giriniz!",  Toast.LENGTH_LONG).show();
    }
	
	public void kimlikNoYokUyarisi(){
    	Toast.makeText(getApplicationContext(), "Lütfen Kimlik Numaranızı Giriniz.",  Toast.LENGTH_LONG).show();
    }
	public void babaAdiUyarisi(){
    	Toast.makeText(getApplicationContext(), "Lütfen Baba Adınızı Giriniz.",  Toast.LENGTH_LONG).show();
    }
	
	
	@Override
	public void onBackPressed() {
		super.onBackPressed();
		
	}

	public class Servis extends AsyncTask<String, Void, String>{
		private ProgressDialog dialog = new ProgressDialog(Sorgu.this);
		 EditText editSorgu=(EditText) findViewById(R.id.editSorgu);
		 EditText editBabaAdi=(EditText) findViewById(R.id.editBabaAdi);
		@Override
		protected String doInBackground(String... params) {
			String sonuc="";
			try{
				Sorgulama sorgu=new Sorgulama(params[0],params[1]);
				sonuc=sorgu.bilgileriAl();
			}
			catch (Exception e) {

			}

			return sonuc;
		}

		@Override
		protected void onPostExecute(String string) {
			dialog.dismiss();
			try{

//                System.out.println("Sorgu onPostExecute: "+string);

                JSONObject hataBilgisi=null;

                try{
                hataBilgisi = new JSONObject(string);
                }catch (Exception e){

                }

                if(hataBilgisi!=null && hataBilgisi.optInt("HataKodu")==1){


                    try {
                        hataBilgisi = new JSONObject(string);
                        new AlertDialog.Builder(Sorgu.this)
                            .setTitle("Bilgi")
                            .setMessage(hataBilgisi.getString("HataAciklamasi").toString())
                            .setNeutralButton("Tamam",  new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                editSorgu.setText("");
                                editBabaAdi.setText("");
                           }
                        }).show();

                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
                else{

                    KisiBilgileri bilgiler=new KisiBilgileri(string);
                    HashMap<String, String> kisiBilgisi=bilgiler.veriAl();

                    AyniBinadakiler bilgiler2=new AyniBinadakiler(string);
                    ArrayList<HashMap<String, String>> binaBilgisi=bilgiler2.veriAl();

                    AyniAdrestekiler bilgiler3=new AyniAdrestekiler(string);
                    ArrayList<HashMap<String, String>> ayniAdrestekiler=bilgiler3.veriAl();

                    isim=(kisiBilgisi.get("isim"));
                    muhtarlik=(kisiBilgisi.get("il")+" "+kisiBilgisi.get("ilce")+" "+kisiBilgisi.get("mahalle"));
                    sandikAlani=(kisiBilgisi.get("sandikAlani"));
                    sandikNumarasi=(kisiBilgisi.get("sandikNo"));
                    sandikSirasi=(kisiBilgisi.get("sandikSiraNo"));

                    secimYili=(kisiBilgisi.get("secimYili"));
                    eskiListe=(kisiBilgisi.get("eskiListe"));
                    listeBilgisi=kisiBilgisi.get("listeBilgisi");
                    String[] kunye={isim,muhtarlik,sandikAlani,sandikNumarasi, sandikSirasi, secimYili, eskiListe};

                    Intent intent= new Intent(Sorgu.this, Sonuclar.class);
                    intent.putExtra("kunye", kunye);
                    intent.putExtra("binaBilgisi", binaBilgisi);
                    intent.putExtra("adresBilgisi", ayniAdrestekiler);
                    intent.putExtra("listeBilgisi", listeBilgisi);
                    startActivity(intent);
                    editSorgu.setText("");
                    editBabaAdi.setText("");
                }
                }
                catch (Exception e) {
                    try {
                        new AlertDialog.Builder(Sorgu.this)
                            .setTitle("Hata")
                            .setMessage("Sunucu iletişiminde bir hata oluştu; internet erişiminizden emin olun ve terar deneyin.")
                            .setNeutralButton("Tamam",  new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                editSorgu.setText("");
                                editBabaAdi.setText("");
                           }
                        }).show();

                    } catch (Exception f) {
                        f.printStackTrace();
                    }
                }

		}

		@Override
		protected void onPreExecute() {
			 //dialog=ProgressDialog.show(SecmenKunye.this, "Baslik", "Mesaj-Calculating",true);
			
			dialog.setMessage("Lütfen bekleyiniz; seçmen bilgileriniz yükleniyor.");
			dialog.show();
		}

		@Override
		protected void onProgressUpdate(Void... values) {
			
		}	
	}
}