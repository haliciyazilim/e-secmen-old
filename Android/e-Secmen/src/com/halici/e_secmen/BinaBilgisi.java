package com.halici.e_secmen;


import java.util.ArrayList;
import java.util.HashMap;

import com.halici.e_secmen.siniflar.ListAdapter;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;



/**
 * @author Abdullah Karacabey
 *
 */
public class BinaBilgisi extends Fragment {

	
	ArrayList<HashMap<String, String>> binaBilgisi, adresBilgisi, tumListe;
	
	View view;
	ListView listeBina, listeAdres;
	String listeBilgisi;
	TextView txtListeBilgisi;
	
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		if (container == null) {
            return null;
        }
		
		view=(LinearLayout)inflater.inflate(R.layout.bina_bilgisi_layout, container, false);
		
		tumListe=new ArrayList<HashMap<String,String>>();
		
		HashMap<String,String> adresMap=new HashMap<String, String>();
		adresMap.put("baslik", "adres");
		
		HashMap<String,String> binaMap=new HashMap<String, String>();
		binaMap.put("baslik", "bina");
		
		adresBilgisi=((Sonuclar)getActivity()).adresBilgisi;
		binaBilgisi=((Sonuclar)getActivity()).binaBilgisi;
		
		tumListe.add(adresMap);
		tumListe.addAll(adresBilgisi);
		tumListe.add(binaMap);
		tumListe.addAll(binaBilgisi);
		
		String[] sutunIsimBina ={"isim","kapiNo"};
		int[] sutunNoBina = new int[] {R.id.column1, R.id.column2};
		
		listeBina=(ListView)view.findViewById(R.id.listBina);
		ListAdapter adapterBina=new ListAdapter(getActivity(),tumListe);
		listeBina.setAdapter(adapterBina);
		
		
		Button infoButton=(Button)view.findViewById(R.id.infoBinaBilgisi);
        
        infoButton.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Intent intent= new Intent(getActivity(), Info.class);
				startActivity(intent);
				
			}
		});
		
        listeBilgisi=((Sonuclar)getActivity()).listeBilgisi;
        txtListeBilgisi=(TextView)view.findViewById(R.id.txtListeBilgisi);
		txtListeBilgisi.setText(listeBilgisi+"\nSeçmen Kütüğü Bilgileri Kullanılmaktadır.");
		
		return view;
	}
}