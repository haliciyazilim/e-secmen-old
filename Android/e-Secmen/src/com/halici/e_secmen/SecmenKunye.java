package com.halici.e_secmen;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.TranslateAnimation;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;


/**
 * @author Abdullah Karacabey
 *
 */
public class SecmenKunye extends Fragment {
	TextView secimBilgisi, txtKimlikNo, txtListeBilgisi;
	TextView txtIsim, txtIl, txtIlce, txtMahalle, txtSandikAlani, txtSandikNo, txtSandikSiraNo;
	String secimYili, eskiListe, kimlikNo, isim,muhtarlik, sandikAlani, sandikNumarasi, sandikSirasi, listeBilgisi;
	View view;
	
	Animation animationAsagi;
	RelativeLayout rlSecimBilgisi;
	ScrollView kunyeListesi;
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		if (container == null) {
            return null;
        }

//		eskiListe=((Sonuclar)getActivity()).eskiListe;
		secimYili=((Sonuclar)getActivity()).secimYili;
		
		isim=((Sonuclar)getActivity()).isim;
		muhtarlik=((Sonuclar)getActivity()).muhtarlik;
		kimlikNo=((Sonuclar)getActivity()).tckn;
		sandikAlani=((Sonuclar)getActivity()).sandikAlani;
		sandikNumarasi=((Sonuclar)getActivity()).sandikNumarasi;
		//sandikSirasi=((Sonuclar)getActivity()).sandikSirasi;
		listeBilgisi=((Sonuclar)getActivity()).listeBilgisi;
//		System.out.println("Seçmen Künye: "+secimYili+", "+eskiListe);
    
		view=(RelativeLayout)inflater.inflate(R.layout.kimlik_bilgileri_layout, container, false);
		rlSecimBilgisi=(RelativeLayout)view.findViewById(R.id.rlSecimBilgisi);
		secimBilgisi=(TextView)view.findViewById(R.id.txtSecimBilgisi);
//		if(!eskiListe.equals(null) && eskiListe.equals("1")){
//			secimBilgisi.setText("Yeni seçmen bilgileri açıklanmadığı için "+secimYili+" seçimlerine dair bilgiler görüntülenmektedir.");
//						
//			DisplayMetrics metrics=getResources().getDisplayMetrics();
//			System.out.println("DPI: "+metrics.density);
//			float dpi=metrics.density;
//			
//			RelativeLayout sayfaBasi=(RelativeLayout)view.findViewById(R.id.rlBaslikKunye);
//			sayfaBasi.bringToFront();
//			
//			animationAsagi = new TranslateAnimation(0,0,0,60*dpi);
//			animationAsagi.setDuration(2000);
//			animationAsagi.setFillAfter(true);
//			rlSecimBilgisi.startAnimation(animationAsagi);
//			
//			int indirmeDegeri;
//			
//			if(dpi==0.75)
//				indirmeDegeri=40;
//			else
//				indirmeDegeri=30;
//			
//			kunyeListesi=(ScrollView)view.findViewById(R.id.svKunyeBilgileri);
//			animationAsagi = new TranslateAnimation(0,0,0,indirmeDegeri*dpi);
//			animationAsagi.setDuration(2000);
//			animationAsagi.setFillAfter(true);
//			animationAsagi.setFillEnabled(true);
//			kunyeListesi.startAnimation(animationAsagi);
//		}
		
		txtIsim=(TextView)view.findViewById(R.id.txtIsim);
		txtIsim.setText(isim);

		
		txtMahalle=(TextView)view.findViewById(R.id.txtMuhtarlik);
		txtMahalle.setText(muhtarlik);
		
		txtListeBilgisi=(TextView)view.findViewById(R.id.txtListeBilgisi);
		txtListeBilgisi.setText(listeBilgisi+"\nSeçmen Kütüğü Bilgileri Kullanılmaktadır.");
		txtSandikAlani=(TextView)view.findViewById(R.id.txtSandikAlani);
		txtSandikAlani.setText(sandikAlani);
		
		txtSandikNo=(TextView)view.findViewById(R.id.txtSandikNumara);
		txtSandikNo.setText(sandikNumarasi);
		
		Button infoButton=(Button)view.findViewById(R.id.infoKimlikBilgisi);
        
        infoButton.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Intent intent= new Intent(getActivity(), Info.class);
				startActivity(intent);
				
			}
		});
		
		
		return view;
	}
}

