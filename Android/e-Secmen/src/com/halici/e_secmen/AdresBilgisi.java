package com.halici.e_secmen;


import java.util.ArrayList;
import java.util.HashMap;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.SimpleAdapter;


/**
 * @author Abdullah Karacabey
 *
 */
public class AdresBilgisi extends Fragment {

	
	ArrayList<HashMap<String, String>> binaBilgisi;
	
	View view;
	ListView liste;
	
	
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		if (container == null) {
            return null;
        }
		
		view=(LinearLayout)inflater.inflate(R.layout.bina_bilgisi_layout, container, false);
		binaBilgisi=((Sonuclar)getActivity()).adresBilgisi;
		String[] sutunIsim ={"isim","kapiNo"};

		int[] sutunNo = new int[] {R.id.column1, R.id.column2};
		
		liste=(ListView)view.findViewById(R.id.listBina);
		SimpleAdapter adapter=new SimpleAdapter(getActivity(),binaBilgisi, R.layout.bina_listesi,sutunIsim,sutunNo);
		liste.setAdapter(adapter);
		return view;
	}
}