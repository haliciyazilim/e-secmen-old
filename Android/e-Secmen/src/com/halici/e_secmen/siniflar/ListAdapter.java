package com.halici.e_secmen.siniflar;

import com.halici.e_secmen.R;
import java.util.ArrayList;
import java.util.HashMap;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.TextView;

public class ListAdapter extends BaseAdapter {
	
	private ArrayList<HashMap<String, String>> list;
	
	private LayoutInflater mInflater;
	
	private boolean isAdres;
	
	public ListAdapter(Context context, ArrayList<HashMap<String, String>> list) {
        this.list=list;
        
        
        mInflater= (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return this.list.size();
	}

	@Override
	public HashMap<String, String> getItem(int position) {
		return this.list.get(position);
	}

	@Override
	public long getItemId(int arg0) {
		
		return arg0;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		
        View view = convertView;

        HashMap<String, String> item = getItem(position);

        if (item!= null) {
        	
            if(item.containsKey("baslik")){
//            	System.out.println("**"+item.get("baslik"));
            	if(item.get("baslik").equals("adres")){
            		view = this.mInflater.inflate(R.layout.adres_baslik_layout, parent, false);
            		TextView baslikView = (TextView) view.findViewById(R.id.txtBaslikSecmenlerAdres);
            		isAdres=true;
           
            	}
            	else{
            		view = this.mInflater.inflate(R.layout.bina_baslik_layout, parent, false);
            		TextView baslikView = (TextView) view.findViewById(R.id.txtBaslikSecmenlerBina);
            		TextView kapiView = (TextView) view.findViewById(R.id.txtBaslikKapi);
            		isAdres=false;
            		
            	}
            }
            else{
//            	System.out.println("**"+item.get("isim"));System.out.println("**"+item.get("isim"));
            	view = this.mInflater.inflate(R.layout.bina_listesi, parent, false);
            	
            	TextView isimView = (TextView) view.findViewById(R.id.column1);
            	TextView kapiView = (TextView) view.findViewById(R.id.column2);
            	
            	isimView.setText(getItem(position).get("isim"));
            	kapiView.setText(getItem(position).get("kapiNo"));
            	
            	if(isAdres)
            		((LinearLayout)kapiView.getParent()).removeView(kapiView);
            }        	
        }

        return view;
    }
	
	@Override
	public boolean isEnabled(int position) {
		return false;
	}
	
}
