package com.halici.e_secmen;


import java.util.ArrayList;
import java.util.HashMap;

import com.halici.e_secmen.siniflar.ListAdapter;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ListView;



/**
 * @author Abdullah Karacabey
 *
 */
public class BinaBilgisi extends Fragment {

	
	ArrayList<HashMap<String, String>> binaBilgisi, adresBilgisi, tumListe;
	
	View view;
	ListView listeBina, listeAdres;
	
	
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
		
		
		return view;
	}
}